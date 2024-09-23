@implementation _UITabSidebarContent

+ (id)contentForTab:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = (void *)v4[1];
  v4[1] = v3;

  return v4;
}

+ (id)contentForAction:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  v5 = (void *)v4[2];
  v4[2] = v3;

  return v4;
}

- (UITab)tab
{
  return self->_tab;
}

- (UIAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_tab, 0);
}

@end
