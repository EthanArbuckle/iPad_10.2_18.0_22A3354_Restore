@implementation RCUndoTarget

- (RCUndoTarget)initWithUndoTargetType:(int64_t)a3
{
  RCUndoTarget *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCUndoTarget;
  result = -[RCUndoTarget init](&v5, "init");
  if (result)
    result->_targetType = a3;
  return result;
}

- (int64_t)sizeOfUndoStack
{
  return self->_sizeOfUndoStack;
}

- (void)setSizeOfUndoStack:(int64_t)a3
{
  self->_sizeOfUndoStack = a3;
}

- (int64_t)targetType
{
  return self->_targetType;
}

- (void)setTargetType:(int64_t)a3
{
  self->_targetType = a3;
}

- (BOOL)shouldEnableSave
{
  return self->_shouldEnableSave;
}

- (void)setShouldEnableSave:(BOOL)a3
{
  self->_shouldEnableSave = a3;
}

@end
