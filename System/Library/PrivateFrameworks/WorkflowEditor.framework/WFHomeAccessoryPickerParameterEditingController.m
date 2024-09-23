@implementation WFHomeAccessoryPickerParameterEditingController

- (void)createViewControllerWithInitialState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  WFHomeAccessoryPickerParameterEditingController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BEC3DE0], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __106__WFHomeAccessoryPickerParameterEditingController_createViewControllerWithInitialState_completionHandler___block_invoke;
  v11[3] = &unk_24EE259E8;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "ensureHomesAreLoadedWithCompletionHandler:", v11);

}

- (void)actionBuilderEditor:(id)a3 didFinishWithTriggerActionSetBuilder:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v8 = v5;
  if (v5)
  {
    objc_msgSend(v5, "allActionSets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHomeAccessoryPickerParameterEditingController finishWithActionSets:home:](self, "finishWithActionSets:home:", v6, v7);

  }
  else
  {
    -[WFUIKitParameterEditingController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelEditing");
  }

}

- (void)triggerEditor:(id)a3 didFinishWithTriggerBuilder:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = v5;
  if (v5)
  {
    objc_msgSend(v5, "triggerActionSets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allActionSets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHomeAccessoryPickerParameterEditingController finishWithActionSets:home:](self, "finishWithActionSets:home:", v7, v8);

  }
  else
  {
    -[WFUIKitParameterEditingController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelEditing");
  }

}

- (void)finishWithActionSets:(id)a3 home:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (objc_class *)MEMORY[0x24BEC3DA0];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  WFSerializableHomeIdentifier();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v9, "initWithActionSets:homeIdentifier:", v8, v10);
  -[WFUIKitParameterEditingController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishEditingWithParameterState:", v12);

}

void __106__WFHomeAccessoryPickerParameterEditingController_createViewControllerWithInitialState_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  Class HUTriggerSummaryViewControllerClass;
  void *v5;
  void *v6;
  NSObject *v7;
  Class HFPlaceholderTriggerBuilderClass;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "triggerActionSetsBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "hasActions"))
    {
      HUTriggerSummaryViewControllerClass = getHUTriggerSummaryViewControllerClass();
      objc_msgSend(v3, "home");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class createTriggerSummaryViewControllerForHome:withTriggerActionSetBuilder:andTriggerActionBuilderEditorDelegate:](HUTriggerSummaryViewControllerClass, "createTriggerSummaryViewControllerForHome:withTriggerActionSetBuilder:andTriggerActionBuilderEditorDelegate:", v5, v3, *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      HFPlaceholderTriggerBuilderClass = getHFPlaceholderTriggerBuilderClass();
      objc_msgSend(v3, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      getHUTriggerBuilderContextClass();
      v10 = (void *)objc_opt_new();
      -[objc_class createPlaceholderTriggerForHome:withTriggerActionSetBuilder:context:](HFPlaceholderTriggerBuilderClass, "createPlaceholderTriggerForHome:withTriggerActionSetBuilder:context:", v9, v3, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_msgSend(objc_alloc(getHUTriggerActionFlowClass()), "initWithFlowState:", 4);
      -[objc_class triggerActionPickerViewControllerWithTriggerBuilder:flow:delegate:](getHUShortcutsTriggerViewUtilitiesClass(), "triggerActionPickerViewControllerWithTriggerBuilder:flow:delegate:", v5, v11, *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v6, "hu_preloadContent");

    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v14 = 136315138;
      v15 = "-[WFHomeAccessoryPickerParameterEditingController createViewControllerWithInitialState:completionHandler:]_block_invoke";
      _os_log_impl(&dword_226666000, v7, OS_LOG_TYPE_FAULT, "%s Missing trigger action sets builder.", (uint8_t *)&v14, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

@end
