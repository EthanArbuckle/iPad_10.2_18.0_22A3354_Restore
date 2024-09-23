@implementation WFDynamicResolveParameter

- (WFDynamicResolveParameter)initWithDefinition:(id)a3
{
  WFDynamicResolveParameter *v3;
  WFDynamicResolveParameter *v4;
  WFDynamicResolveParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFDynamicResolveParameter;
  v3 = -[WFParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)localizedLabelForState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDynamicResolveParameter stringLocalizer](self, "stringLocalizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "_intents_readableTitleWithLocalizer:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_intents_readableTitleWithLocalizer:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)resolveOptionsForUserInput:(id)a3 completionBlock:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  -[WFDynamicResolveParameter dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDynamicResolveParameter.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.dataSource"));

  }
  -[WFDynamicResolveParameter dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WFDynamicResolveParameter dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resolveOptionsForUserInput:forDynamicResolveParameter:completion:", v13, self, v7);

  }
}

- (void)endResolutionSession
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[WFDynamicResolveParameter delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDynamicResolveParameter.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.delegate"));

  }
  -[WFDynamicResolveParameter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFDynamicResolveParameter delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dynamicResolveParameterDidEndResolutionSession:", self);

  }
}

- (void)localizedDisambiguationPromptForItems:(id)a3 intent:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  -[WFDynamicResolveParameter dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDynamicResolveParameter.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.dataSource"));

  }
  -[WFDynamicResolveParameter dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    -[WFDynamicResolveParameter dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedDisambiguationPromptForItems:intent:dynamicResolveParameter:completion:", v16, v9, self, v10);

  }
}

- (INCodableAttribute)codableAttribute
{
  return self->_codableAttribute;
}

- (void)setCodableAttribute:(id)a3
{
  objc_storeStrong((id *)&self->_codableAttribute, a3);
}

- (INStringLocalizer)stringLocalizer
{
  return self->_stringLocalizer;
}

- (void)setStringLocalizer:(id)a3
{
  objc_storeStrong((id *)&self->_stringLocalizer, a3);
}

- (WFDynamicResolveParameterDataSource)dataSource
{
  return (WFDynamicResolveParameterDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (WFDynamicResolveParameterDelegate)delegate
{
  return (WFDynamicResolveParameterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_stringLocalizer, 0);
  objc_storeStrong((id *)&self->_codableAttribute, 0);
}

- (BOOL)wf_supportsSearch
{
  return 1;
}

- (BOOL)wf_allowsMultipleSelection
{
  return 0;
}

- (BOOL)wf_usesTogglesForSelection
{
  return 0;
}

- (BOOL)wf_usesGroupTableViewStyle
{
  return 0;
}

- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged
{
  return 1;
}

- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke;
  v8[3] = &unk_1E7AF7768;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[WFDynamicResolveParameter resolveOptionsForUserInput:completionBlock:](self, "resolveOptionsForUserInput:completionBlock:", a3, v8);

}

- (id)wf_pickerLocalizedTitleForState:(id)a3
{
  return (id)objc_msgSend(a3, "readableTitle");
}

- (id)wf_pickerLocalizedSubtitleForState:(id)a3
{
  return (id)objc_msgSend(a3, "readableSubtitle");
}

- (id)wf_pickerLocalizedImageForState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDynamicResolveParameter stringLocalizer](self, "stringLocalizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "_intents_displayImageWithLocalizer:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wf_image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  return v8;
}

- (void)wf_reloadFromAttributesDidChangeWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))a3 + 2))(a3, 0, 0, 0);
}

- (BOOL)wf_alwaysScaleIconImage
{
  return 0;
}

void __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t v22;
  id v23;

  v9 = a2;
  v10 = a4;
  if (a5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2;
    aBlock[3] = &unk_1E7AF7740;
    v12 = v9;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v21 = v12;
    v22 = v13;
    v23 = v14;
    v15 = _Block_copy(aBlock);
    v16 = v15;
    if (a3 == 2)
    {
      v17 = *(void **)(a1 + 32);
      v18[0] = v11;
      v18[1] = 3221225472;
      v18[2] = __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_3;
      v18[3] = &unk_1E7AF96D8;
      v19 = v15;
      objc_msgSend(v17, "localizedDisambiguationPromptForItems:intent:completion:", v12, v10, v18);

    }
    else
    {
      (*((void (**)(void *, _QWORD))v15 + 2))(v15, 0);
    }

  }
}

void __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFActionsLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315651;
    v19 = "-[WFDynamicResolveParameter(WFParameterPicker) wf_loadStatesWithSearchTerm:completionHandler:]_block_invoke_2";
    v20 = 2113;
    v21 = v5;
    v22 = 2113;
    v23 = v3;
    _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_INFO, "%s Updating dynamic resolution results with: %{private}@, prompt: %{private}@", buf, 0x20u);
  }

  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_182;
  v17[3] = &unk_1E7AF7718;
  v7 = *(void **)(a1 + 32);
  v17[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "if_map:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDA10]), "initWithItems:", v8);
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2_185;
  v13[3] = &unk_1E7AF8378;
  v10 = *(id *)(a1 + 48);
  v15 = v3;
  v16 = v10;
  v14 = v9;
  v11 = v3;
  v12 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

WFCodableAttributeBackedSubstitutableState *__94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_182(uint64_t a1, void *a2)
{
  id v3;
  WFCodableAttributeBackedSubstitutableState *v4;
  void *v5;
  void *v6;
  WFCodableAttributeBackedSubstitutableState *v7;

  v3 = a2;
  v4 = [WFCodableAttributeBackedSubstitutableState alloc];
  objc_msgSend(*(id *)(a1 + 32), "codableAttribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "stringLocalizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFCodableAttributeBackedSubstitutableState initWithValue:codableAttribute:stringLocalizer:](v4, "initWithValue:codableAttribute:stringLocalizer:", v3, v5, v6);

  return v7;
}

uint64_t __94__WFDynamicResolveParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2_185(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

@end
