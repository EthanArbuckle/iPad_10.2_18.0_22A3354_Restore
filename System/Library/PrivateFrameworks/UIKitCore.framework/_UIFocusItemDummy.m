@implementation _UIFocusItemDummy

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (UIFocusItemContainer)focusItemContainer
{
  return 0;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  return (UIFocusEnvironment *)objc_loadWeakRetained((id *)&self->_parentFocusEnvironment);
}

- (void)setParentFocusEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_parentFocusEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentFocusEnvironment);
}

@end
