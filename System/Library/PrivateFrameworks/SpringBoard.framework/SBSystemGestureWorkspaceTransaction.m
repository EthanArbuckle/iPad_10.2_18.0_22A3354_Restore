@implementation SBSystemGestureWorkspaceTransaction

- (SBSystemGestureWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  SBSystemGestureWorkspaceTransaction *v3;
  SBSystemGestureWorkspaceTransaction *v4;
  id v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  NSString *suppressionReason;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBSystemGestureWorkspaceTransaction;
  v3 = -[SBMainWorkspaceTransaction initWithTransitionRequest:](&v11, sel_initWithTransitionRequest_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_completionType = 1;
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "initWithFormat:", CFSTR("%@-%p"), v7, v4);
    suppressionReason = v4->_suppressionReason;
    v4->_suppressionReason = (NSString *)v8;

  }
  return v4;
}

- (void)finishWithCompletionType:(int64_t)a3
{
  self->_completionType = a3;
  -[SBSystemGestureWorkspaceTransaction _finishWithCompletionType:](self, "_finishWithCompletionType:");
}

- (int64_t)completionType
{
  return self->_completionType;
}

- (void)_begin
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  NSString *suppressionReason;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemGestureWorkspaceTransaction.m"), 53, CFSTR("Trying to _begin but I'm not tracking a system gesture"));

  }
  if (-[SBSystemGestureWorkspaceTransaction shouldSuppressMedusaKeyboardDuringGesture](self, "shouldSuppressMedusaKeyboardDuringGesture"))
  {
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "previousApplicationSceneEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {

    }
    else
    {
      objc_msgSend(v6, "applicationSceneEntities");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9 < 2)
        goto LABEL_9;
    }
    +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    suppressionReason = self->_suppressionReason;
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startSuppressingKeyboardWithReason:predicate:displayIdentity:", suppressionReason, 0, v13);

LABEL_9:
  }
  -[SBSystemGestureWorkspaceTransaction _setupAnimation](self, "_setupAnimation");
  v15.receiver = self;
  v15.super_class = (Class)SBSystemGestureWorkspaceTransaction;
  -[SBSystemGestureWorkspaceTransaction _begin](&v15, sel__begin);
  -[SBSystemGestureWorkspaceTransaction _beginAnimation](self, "_beginAnimation");
}

- (void)_didComplete
{
  void *v3;
  objc_super v4;

  +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopSuppressingKeyboardWithReason:", self->_suppressionReason);

  v4.receiver = self;
  v4.super_class = (Class)SBSystemGestureWorkspaceTransaction;
  -[SBMainWorkspaceTransaction _didComplete](&v4, sel__didComplete);
}

- (BOOL)shouldSuppressMedusaKeyboardDuringGesture
{
  return 1;
}

- (UIGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_suppressionReason, 0);
}

@end
