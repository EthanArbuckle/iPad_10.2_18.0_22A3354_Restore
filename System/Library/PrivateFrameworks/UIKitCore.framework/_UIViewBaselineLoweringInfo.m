@implementation _UIViewBaselineLoweringInfo

- (void)setBaselineView:(id)a3
{
  self->_baselineView = (UIView *)a3;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (UIView)baselineView
{
  return self->_baselineView;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p baselineOffset = %f, baselineView = %@>"), NSStringFromClass(v4), self, *(_QWORD *)&self->_baselineOffset, self->_baselineView);
}

@end
