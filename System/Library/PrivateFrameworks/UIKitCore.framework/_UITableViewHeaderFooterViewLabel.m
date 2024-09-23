@implementation _UITableViewHeaderFooterViewLabel

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD *ContextStack;
  CGContext *v10;
  void *v11;
  objc_super v12;
  CGSize v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_patternPhase.width != *MEMORY[0x1E0C9D820]
    || self->_patternPhase.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v10 = 0;
    else
      v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    -[_UITableViewHeaderFooterViewLabel patternPhase](self, "patternPhase");
    CGContextSetPatternPhase(v10, v13);
    -[UIView backgroundColor](self, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "set");

    UIRectFillUsingOperation(1, x, y, width, height);
  }
  v12.receiver = self;
  v12.super_class = (Class)_UITableViewHeaderFooterViewLabel;
  -[UILabel drawRect:](&v12, sel_drawRect_, x, y, width, height);
}

- (_UITableViewHeaderFooterViewLabel)init
{
  _UITableViewHeaderFooterViewLabel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITableViewHeaderFooterViewLabel;
  result = -[UIView init](&v3, sel_init);
  if (result)
    result->_patternPhase = (CGSize)*MEMORY[0x1E0C9D820];
  return result;
}

- (CGSize)patternPhase
{
  double width;
  double height;
  CGSize result;

  width = self->_patternPhase.width;
  height = self->_patternPhase.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPatternPhase:(CGSize)a3
{
  if (self->_patternPhase.width != a3.width || self->_patternPhase.height != a3.height)
  {
    self->_patternPhase = a3;
    -[UILabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

@end
