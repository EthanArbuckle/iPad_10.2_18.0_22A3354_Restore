@implementation WFParameter

uint64_t __105__WFParameter_WFVariableMenuProvider__clearButtonMenuItemWithVariable_parameterState_setVariableHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", *MEMORY[0x24BEC4778]);
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_2;
  v5[3] = &unk_24EE25020;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v3, "showActionOutputPickerAllowingShortcutInput:variableProvider:completionHandler:", v2, v4, v5);

}

uint64_t __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

@end
