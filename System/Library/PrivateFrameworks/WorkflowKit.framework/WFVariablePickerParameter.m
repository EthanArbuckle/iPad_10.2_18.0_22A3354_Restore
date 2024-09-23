@implementation WFVariablePickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (BOOL)alwaysShowsButton
{
  return 1;
}

- (id)possibleStates
{
  return 0;
}

- (id)defaultSupportedVariableTypes
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "allInsertableVariableTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObject:", CFSTR("Ask"));
  return v3;
}

- (id)importQuestionBehavior
{
  __CFString *v2;

  v2 = CFSTR("NotSupported");
  return CFSTR("NotSupported");
}

- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a4;
  v5 = objc_alloc(MEMORY[0x1E0CBDA10]);
  v6 = (void *)objc_msgSend(v5, "initWithItems:", MEMORY[0x1E0C9AA60]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__WFVariablePickerParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke;
  v9[3] = &unk_1E7AF76F0;
  v10 = v6;
  v11 = v4;
  v7 = v6;
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __94__WFVariablePickerParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0);
}

@end
