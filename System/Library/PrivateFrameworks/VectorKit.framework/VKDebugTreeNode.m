@implementation VKDebugTreeNode

- (VKDebugTreeNode)initWithParent:(id)a3
{
  id v4;
  VKDebugTreeNode *v5;
  VKDebugTreeNode *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKDebugTreeNode;
  v5 = -[VKDebugTreeNode init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_parent, v4);

  return v6;
}

- (BOOL)isExpandable
{
  return 0;
}

- (NSString)name
{
  return (NSString *)CFSTR("unknown");
}

- (id)propertyColumn
{
  return CFSTR("error");
}

- (id)valueColumn
{
  return CFSTR("error");
}

- (id)tagsColumn
{
  return CFSTR("error");
}

- (VKDebugTreeNode)parent
{
  return (VKDebugTreeNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (NSArray)children
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setChildren:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
