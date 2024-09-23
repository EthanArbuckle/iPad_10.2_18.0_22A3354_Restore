@implementation UIDebuggingInformationHierarchyDataContainer

- (UIDebuggingInformationHierarchyDataContainer)initWithView:(id)a3 atLevel:(int64_t)a4
{
  id v6;
  UIDebuggingInformationHierarchyDataContainer *v7;
  UIDebuggingInformationHierarchyDataContainer *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingInformationHierarchyDataContainer;
  v7 = -[UIDebuggingInformationHierarchyDataContainer init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[UIDebuggingInformationHierarchyDataContainer setView:](v7, "setView:", v6);
    -[UIDebuggingInformationHierarchyDataContainer setLevel:](v8, "setLevel:", a4);
  }

  return v8;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (BOOL)collapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
}

@end
