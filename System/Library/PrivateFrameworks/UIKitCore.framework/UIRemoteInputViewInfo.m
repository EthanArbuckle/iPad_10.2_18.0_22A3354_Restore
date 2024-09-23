@implementation UIRemoteInputViewInfo

- (RTIInputViewInfo)rtiInputViewInfo
{
  void *v3;
  objc_class *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getRTIInputViewInfoClass_softClass;
  v11 = getRTIInputViewInfoClass_softClass;
  if (!getRTIInputViewInfoClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getRTIInputViewInfoClass_block_invoke;
    v7[3] = &unk_1E16B14C0;
    v7[4] = &v8;
    __getRTIInputViewInfoClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "setContextId:", -[UIRemoteInputViewInfo contextId](self, "contextId"));
  -[UIRemoteInputViewInfo size](self, "size");
  objc_msgSend(v5, "setSize:");
  -[UIRemoteInputViewInfo insets](self, "insets");
  objc_msgSend(v5, "setInsets:");
  return (RTIInputViewInfo *)v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[UIRemoteInputViewInfo processId](self, "processId");
  -[UIRemoteInputViewInfo rtiInputViewInfo](self, "rtiInputViewInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; processId = %d; info = %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  NSEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInsets:(NSEdgeInsets)a3
{
  self->_insets = a3;
}

- (int)processId
{
  return self->_processId;
}

- (void)setProcessId:(int)a3
{
  self->_processId = a3;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void)setContextId:(unsigned int)a3
{
  self->_contextId = a3;
}

- (BOOL)shouldShowDockView
{
  return self->_shouldShowDockView;
}

- (void)setShouldShowDockView:(BOOL)a3
{
  self->_shouldShowDockView = a3;
}

@end
