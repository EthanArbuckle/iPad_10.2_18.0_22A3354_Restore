@implementation SBWaitForSceneContentAvailableTransaction

- (SBWaitForSceneContentAvailableTransaction)initWithSceneHandle:(id)a3 manualListener:(BOOL)a4
{
  id v8;
  SBWaitForSceneContentAvailableTransaction *v9;
  SBWaitForSceneContentAvailableTransaction *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWaitForSceneContentAvailableTransaction.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneHandle"));

  }
  v13.receiver = self;
  v13.super_class = (Class)SBWaitForSceneContentAvailableTransaction;
  v9 = -[SBTransaction init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sceneHandle, a3);
    v10->_manualListener = a4;
    v10->_isContentStateReady = objc_msgSend(v8, "isContentReady");
    if (!v10->_manualListener)
      -[SBSceneHandle addObserver:](v10->_sceneHandle, "addObserver:", v10);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSceneHandle removeObserver:](self->_sceneHandle, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBWaitForSceneContentAvailableTransaction;
  -[SBWaitForSceneContentAvailableTransaction dealloc](&v3, sel_dealloc);
}

- (void)noteSceneContentIsReady:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_manualListener)
  {
    v3 = a3;
    if ((-[SBWaitForSceneContentAvailableTransaction isComplete](self, "isComplete") & 1) == 0)
      -[SBWaitForSceneContentAvailableTransaction _noteSceneContentReadinessDidChange:](self, "_noteSceneContentReadinessDidChange:", v3);
  }
}

- (void)_begin
{
  objc_super v3;

  if (!self->_isContentStateReady)
    -[SBWaitForSceneContentAvailableTransaction addMilestone:](self, "addMilestone:", CFSTR("SBWaitForSceneContentAvailableMilestone"));
  v3.receiver = self;
  v3.super_class = (Class)SBWaitForSceneContentAvailableTransaction;
  -[SBWaitForSceneContentAvailableTransaction _begin](&v3, sel__begin);
}

- (void)_didComplete
{
  objc_super v3;

  -[SBSceneHandle removeObserver:](self->_sceneHandle, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBWaitForSceneContentAvailableTransaction;
  -[SBWaitForSceneContentAvailableTransaction _didComplete](&v3, sel__didComplete);
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  -[SBWaitForSceneContentAvailableTransaction _noteSceneContentReadinessDidChange:](self, "_noteSceneContentReadinessDidChange:", a4 == 2);
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  -[SBWaitForSceneContentAvailableTransaction failWithReason:](self, "failWithReason:", CFSTR("Scene was destroyed."), a4);
}

- (void)_noteSceneContentReadinessDidChange:(BOOL)a3
{
  if (self->_isContentStateReady != a3)
  {
    self->_isContentStateReady = a3;
    if (a3)
      -[SBWaitForSceneContentAvailableTransaction evaluateMilestone:withEvaluator:](self, "evaluateMilestone:withEvaluator:", CFSTR("SBWaitForSceneContentAvailableMilestone"), &__block_literal_global_197);
  }
}

uint64_t __81__SBWaitForSceneContentAvailableTransaction__noteSceneContentReadinessDidChange___block_invoke()
{
  return 1;
}

- (SBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (void)setSceneHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

@end
