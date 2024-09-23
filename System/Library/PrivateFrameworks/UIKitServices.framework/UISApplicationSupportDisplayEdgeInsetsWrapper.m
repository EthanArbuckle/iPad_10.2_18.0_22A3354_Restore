@implementation UISApplicationSupportDisplayEdgeInsetsWrapper

- (double)topInset
{
  return self->_topInset;
}

- (double)rightInset
{
  return self->_rightInset;
}

- (double)leftInset
{
  return self->_leftInset;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  double topInset;
  id v5;

  topInset = self->_topInset;
  v5 = a3;
  MEMORY[0x1940103AC](topInset);
  MEMORY[0x1940103AC](v5, "UISApplicationSupportDisplayEdgeInsetsWrapperLeft", self->_leftInset);
  MEMORY[0x1940103AC](v5, "UISApplicationSupportDisplayEdgeInsetsWrapperBottom", self->_bottomInset);
  MEMORY[0x1940103AC](v5, "UISApplicationSupportDisplayEdgeInsetsWrapperRight", self->_rightInset);

}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)initWithXPCDictionary:(id)a3
{
  id v4;
  UISApplicationSupportDisplayEdgeInsetsWrapper *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UISApplicationSupportDisplayEdgeInsetsWrapper;
  v5 = -[UISApplicationSupportDisplayEdgeInsetsWrapper init](&v7, sel_init);
  if (v5)
  {
    v5->_topInset = MEMORY[0x194010328](v4, "UISApplicationSupportDisplayEdgeInsetsWrapperTop");
    v5->_leftInset = MEMORY[0x194010328](v4, "UISApplicationSupportDisplayEdgeInsetsWrapperLeft");
    v5->_bottomInset = MEMORY[0x194010328](v4, "UISApplicationSupportDisplayEdgeInsetsWrapperBottom");
    v5->_rightInset = MEMORY[0x194010328](v4, "UISApplicationSupportDisplayEdgeInsetsWrapperRight");
  }

  return v5;
}

- (UISApplicationSupportDisplayEdgeInsetsWrapper)initWithTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6
{
  UISApplicationSupportDisplayEdgeInsetsWrapper *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UISApplicationSupportDisplayEdgeInsetsWrapper;
  result = -[UISApplicationSupportDisplayEdgeInsetsWrapper init](&v11, sel_init);
  if (result)
  {
    result->_topInset = a3;
    result->_leftInset = a4;
    result->_bottomInset = a5;
    result->_rightInset = a6;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%g, %g, %g, %g}"), *(_QWORD *)&self->_topInset, *(_QWORD *)&self->_leftInset, *(_QWORD *)&self->_bottomInset, *(_QWORD *)&self->_rightInset);
}

- (void)setTopInset:(double)a3
{
  self->_topInset = a3;
}

- (void)setLeftInset:(double)a3
{
  self->_leftInset = a3;
}

- (void)setBottomInset:(double)a3
{
  self->_bottomInset = a3;
}

- (void)setRightInset:(double)a3
{
  self->_rightInset = a3;
}

@end
