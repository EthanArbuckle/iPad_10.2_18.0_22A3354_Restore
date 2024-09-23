@implementation WFEnumerationParameter(WFVariableMenuProvider)

- (id)clearButtonMenuItemWithVariable:()WFVariableMenuProvider parameterState:setVariableHandler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(a1, "hideClearButton") & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&off_2558EC338;
    objc_msgSendSuper2(&v13, sel_clearButtonMenuItemWithVariable_parameterState_setVariableHandler_, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

@end
