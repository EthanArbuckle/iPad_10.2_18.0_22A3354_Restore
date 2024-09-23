@implementation _UIFocusTest

- (_UIFocusTest)initWithIdentifier:(id)a3
{
  id v5;
  _UIFocusTest *v6;
  uint64_t v7;
  NSString *identifier;
  void *v10;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusTest.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  if (objc_msgSend(v5, "isEqualToString:", &stru_1E16EDF20))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusTest.m"), 27, CFSTR("Focus tests require a non-empty identifier."));

  }
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusTest;
  v6 = -[_UIFocusTest init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v6->_state = 0;
    v6->_isApplicationTest = 1;
  }

  return v6;
}

+ (_UIFocusTest)currentTest
{
  return (_UIFocusTest *)(id)__currentTest;
}

+ (void)_setCurrentTest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__currentTest != v4)
  {
    v5 = v4;
    objc_msgSend((id)__currentTest, "cancel");
    objc_storeStrong((id *)&__currentTest, a3);
    v4 = v5;
  }

}

- (void)runWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  if (-[_UIFocusTest state](self, "state"))
    -[_UIFocusTest reset](self, "reset");
  +[_UIFocusTest _setCurrentTest:](_UIFocusTest, "_setCurrentTest:", self);
  -[_UIFocusTest setState:](self, "setState:", 1);
  -[_UIFocusTest setRunCompletionHandler:](self, "setRunCompletionHandler:", v4);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41___UIFocusTest_runWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E16B1B28;
  v5[4] = self;
  -[_UIFocusTest prepareWithCompletionHandler:](self, "prepareWithCompletionHandler:", v5);
}

- (void)prepareWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)_start
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[_UIFocusTest state](self, "state") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusTest.m"), 82, CFSTR("Cannot start a test that has already been started."));

  }
  -[_UIFocusTest delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "_focusTestWillStart:", self);
  -[_UIFocusTest setState:](self, "setState:", 2);
  if (-[_UIFocusTest _isApplicationTest](self, "_isApplicationTest"))
  {
    v4 = (void *)UIApp;
    -[_UIFocusTest identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startedTest:", v5);

  }
  -[_UIFocusTest main](self, "main");

}

- (void)stop
{
  -[_UIFocusTest _finish:](self, "_finish:", 0);
}

- (void)cancel
{
  -[_UIFocusTest _finish:](self, "_finish:", 1);
}

- (void)reset
{
  -[_UIFocusTest cancel](self, "cancel");
  -[_UIFocusTest setState:](self, "setState:", 0);
}

- (void)_finish:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  _UIFocusTest *v10;

  v3 = a3;
  v10 = self;
  if (-[_UIFocusTest state](v10, "state") == 1 || -[_UIFocusTest state](v10, "state") == 2)
  {
    if (-[_UIFocusTest _isApplicationTest](v10, "_isApplicationTest"))
    {
      v4 = (void *)UIApp;
      -[_UIFocusTest identifier](v10, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "finishedTest:", v5);

    }
    if (v3)
      v6 = 4;
    else
      v6 = 3;
    -[_UIFocusTest setState:](v10, "setState:", v6);
    +[_UIFocusTest _setCurrentTest:](_UIFocusTest, "_setCurrentTest:", 0);
    -[_UIFocusTest delegate](v10, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "_focusTestDidFinish:", v10);
    -[_UIFocusTest runCompletionHandler](v10, "runCompletionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[_UIFocusTest runCompletionHandler](v10, "runCompletionHandler");
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v9[2]();

      -[_UIFocusTest setRunCompletionHandler:](v10, "setRunCompletionHandler:", 0);
    }

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (_UIFocusTestDelegate)delegate
{
  return (_UIFocusTestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)runCompletionHandler
{
  return self->_runCompletionHandler;
}

- (void)setRunCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)_isApplicationTest
{
  return self->_isApplicationTest;
}

- (void)setIsApplicationTest:(BOOL)a3
{
  self->_isApplicationTest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_runCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
