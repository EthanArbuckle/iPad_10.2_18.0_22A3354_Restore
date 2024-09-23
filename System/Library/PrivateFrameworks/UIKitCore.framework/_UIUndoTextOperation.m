@implementation _UIUndoTextOperation

- (_UIUndoTextOperation)initWithAffectedRange:(_NSRange)a3 inputController:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  _UIUndoTextOperation *v8;
  _UIUndoTextOperation *v9;
  _UIUndoTextOperation *v10;
  objc_super v12;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIUndoTextOperation;
  v8 = -[_UIUndoTextOperation init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_affectedRange.location = location;
    v8->_affectedRange.length = length;
    objc_storeWeak((id *)&v8->_inputController, v7);
    v10 = v9;
  }

  return v9;
}

- (BOOL)supportsCoalescing
{
  return 0;
}

- (_NSRange)affectedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_affectedRange.length;
  location = self->_affectedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setAffectedRange:(_NSRange)a3
{
  self->_affectedRange = a3;
}

- (UITextInputController)inputController
{
  return (UITextInputController *)objc_loadWeakRetained((id *)&self->_inputController);
}

- (void)setInputController:(id)a3
{
  objc_storeWeak((id *)&self->_inputController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputController);
}

@end
