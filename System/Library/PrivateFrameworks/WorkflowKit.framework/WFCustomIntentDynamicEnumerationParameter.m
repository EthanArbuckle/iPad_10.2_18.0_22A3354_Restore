@implementation WFCustomIntentDynamicEnumerationParameter

- (NSString)localizedConfigurationPromptDialog
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedConfigurationPromptDialogForPamameter:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)accessoryImageForPossibleState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCustomIntentDynamicEnumerationParameter stringLocalizer](self, "stringLocalizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "_intents_displayImageWithLocalizer:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_intents_displayImageWithLocalizer:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "wf_image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)localizedSubtitleLabelForPossibleState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCustomIntentDynamicEnumerationParameter stringLocalizer](self, "stringLocalizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CBDC38], "localizerForLanguage:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WFCustomIntentDynamicEnumerationParameter codableAttribute](self, "codableAttribute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_intents_readableSubtitleWithLocalizer:metadata:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  return v9;
}

- (BOOL)hidesSubtitleInEditor
{
  return 1;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  -[WFCustomIntentDynamicEnumerationParameter codableAttribute](self, "codableAttribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsSearch");

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFCustomIntentDynamicEnumerationParameter;
    v7 = -[WFDynamicEnumerationParameter parameterStateIsValid:](&v9, sel_parameterStateIsValid_, v4);
  }

  return v7;
}

- (BOOL)displaysMultipleValueEditor
{
  void *v3;
  BOOL v4;

  -[WFCustomIntentDynamicEnumerationParameter codableAttribute](self, "codableAttribute");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "supportsSearch") & 1) != 0 || -[WFParameter isRangedSizeArray](self, "isRangedSizeArray");

  return v4;
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (void)getStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__WFCustomIntentDynamicEnumerationParameter_getStatesWithSearchTerm_completionHandler___block_invoke;
  v10[3] = &unk_1E7AF7790;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "loadPossibleStatesForEnumeration:searchTerm:completionHandler:", self, v7, v10);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringLocalizer, 0);
  objc_storeStrong((id *)&self->_codableAttribute, 0);
}

void __87__WFCustomIntentDynamicEnumerationParameter_getStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__WFCustomIntentDynamicEnumerationParameter_getStatesWithSearchTerm_completionHandler___block_invoke_2;
  block[3] = &unk_1E7AF8378;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __87__WFCustomIntentDynamicEnumerationParameter_getStatesWithSearchTerm_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)wf_supportsSearch
{
  void *v2;
  char v3;

  -[WFCustomIntentDynamicEnumerationParameter codableAttribute](self, "codableAttribute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsSearch");

  return v3;
}

- (NSString)wf_displayLocalizedPrompt
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFCustomIntentDynamicEnumerationParameter localizedConfigurationPromptDialog](self, "localizedConfigurationPromptDialog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFParameter localizedLabel](self, "localizedLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (BOOL)wf_allowsMultipleSelection
{
  _BOOL4 v3;

  v3 = -[WFDynamicEnumerationParameter allowsMultipleValues](self, "allowsMultipleValues");
  if (v3)
  {
    if (-[WFCustomIntentDynamicEnumerationParameter wf_supportsSearch](self, "wf_supportsSearch"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[WFParameter isRangedSizeArray](self, "isRangedSizeArray");
  }
  return v3;
}

- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged
{
  return 1;
}

- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[WFDynamicEnumerationParameter dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __110__WFCustomIntentDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke;
  v10[3] = &unk_1E7AF7790;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "loadPossibleStatesForEnumeration:searchTerm:completionHandler:", self, v7, v10);

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
  -[WFCustomIntentDynamicEnumerationParameter stringLocalizer](self, "stringLocalizer");
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

void __110__WFCustomIntentDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__WFCustomIntentDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2;
  block[3] = &unk_1E7AF8378;
  v7 = *(id *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __110__WFCustomIntentDynamicEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

@end
