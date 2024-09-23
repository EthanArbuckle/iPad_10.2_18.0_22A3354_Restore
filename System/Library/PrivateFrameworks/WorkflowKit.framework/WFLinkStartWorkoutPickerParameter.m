@implementation WFLinkStartWorkoutPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFLinkStartWorkoutPickerParameter)initWithDefinition:(id)a3
{
  WFLinkStartWorkoutPickerParameter *v3;
  WFLinkStartWorkoutPickerParameter *v4;
  WFLinkStartWorkoutPickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFLinkStartWorkoutPickerParameter;
  v3 = -[WFEnumerationParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFDynamicEnumerationParameter setDataSource:](v3, "setDataSource:", v3);
    v5 = v4;
  }

  return v4;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  return (id)objc_msgSend(a4, "localizedTitle", a3);
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[WFLinkStartWorkoutPickerParameter action](self, "action");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkStartWorkoutPickerParameter action](self, "action");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "processedParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__WFLinkStartWorkoutPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v15[3] = &unk_1E7AEEA28;
  v14 = v10;
  v16 = v14;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v11, "getLinkActionWithProcessedParameters:completionHandler:", v13, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)objc_msgSend(a3, "localizedTitle");
}

- (WFLinkAction)action
{
  return (WFLinkAction *)objc_loadWeakRetained((id *)&self->_action);
}

- (void)setAction:(id)a3
{
  objc_storeWeak((id *)&self->_action, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
}

void __99__WFLinkStartWorkoutPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __99__WFLinkStartWorkoutPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2;
    v7[3] = &unk_1E7AF6C78;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v6, "fetchSuggestedActionsForStartWorkoutAction:completionHandler:", v3, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __99__WFLinkStartWorkoutPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "if_map:", &__block_literal_global_19685);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA10]), "initWithItems:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

WFLinkStartWorkoutParameterState *__99__WFLinkStartWorkoutPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  WFLinkStartWorkoutParameterState *v3;

  v2 = a2;
  v3 = -[WFLinkStartWorkoutParameterState initWithLinkAction:]([WFLinkStartWorkoutParameterState alloc], "initWithLinkAction:", v2);

  return v3;
}

@end
