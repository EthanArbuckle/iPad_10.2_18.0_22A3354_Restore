@implementation SidebarOutlineCellRegistration

+ (id)registrationWithCellClass:(Class)a3 configurationHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___SidebarOutlineCellRegistration;
  v5 = a4;
  v6 = objc_msgSendSuper2(&v11, "registrationWithCellClass:configurationHandler:", a3, &stru_1011E22A0);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_retainBlock(v5);

  v9 = (void *)v7[1];
  v7[1] = v8;

  return v7;
}

- (id)viewModelConfigurationHandler
{
  return self->_viewModelConfigurationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewModelConfigurationHandler, 0);
}

@end
