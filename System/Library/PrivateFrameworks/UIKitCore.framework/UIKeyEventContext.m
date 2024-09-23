@implementation UIKeyEventContext

- (UIKeyEventContext)initWithKeyEvent:(id)a3
{
  id v5;
  UIKeyEventContext *v6;
  UIKeyEventContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKeyEventContext;
  v6 = -[UIKeyEventContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_keyEvent, a3);

  return v7;
}

- (UIKeyEventContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyEventContext.m"), 21, CFSTR("%s is not available. Use a designated initializer instead."), "-[UIKeyEventContext init]");

  return 0;
}

- (UIKeyEvent)keyEvent
{
  return self->_keyEvent;
}

- (BOOL)documentIsEditable
{
  return self->_documentIsEditable;
}

- (void)setDocumentIsEditable:(BOOL)a3
{
  self->_documentIsEditable = a3;
}

- (BOOL)shouldInsertChar
{
  return self->_shouldInsertChar;
}

- (void)setShouldInsertChar:(BOOL)a3
{
  self->_shouldInsertChar = a3;
}

- (BOOL)shouldEvaluateForInputSystemHandling
{
  return self->_shouldEvaluateForInputSystemHandling;
}

- (void)setShouldEvaluateForInputSystemHandling:(BOOL)a3
{
  self->_shouldEvaluateForInputSystemHandling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyEvent, 0);
}

@end
