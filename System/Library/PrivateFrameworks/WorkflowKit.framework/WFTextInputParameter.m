@implementation WFTextInputParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFTextInputParameter)initWithDefinition:(id)a3
{
  id v4;
  WFTextInputParameter *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *prefix;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *keyboardType;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *autocapitalizationType;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  id *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSString *textAlignment;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  char v45;
  char v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  char v53;
  char v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  WFTextInputParameter *v62;
  objc_super v64;

  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)WFTextInputParameter;
  v5 = -[WFParameter initWithDefinition:](&v64, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("Prefix"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    prefix = v5->_prefix;
    v5->_prefix = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("SecureTextInput"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    WFEnforceClass(v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_secureTextEntry = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("KeyboardType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    WFEnforceClass(v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    keyboardType = v5->_keyboardType;
    v5->_keyboardType = (NSString *)v15;

    objc_msgSend(v4, "objectForKey:", CFSTR("AutocapitalizationType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    WFEnforceClass(v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    autocapitalizationType = v5->_autocapitalizationType;
    v5->_autocapitalizationType = (NSString *)v19;

    objc_msgSend(v4, "objectForKey:", CFSTR("DisableAutocorrection"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    WFEnforceClass(v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "BOOLValue");
    v25 = (id *)MEMORY[0x1E0DC8338];
    if (!v24)
      v25 = (id *)MEMORY[0x1E0DC8330];
    objc_storeStrong((id *)&v5->_autocorrectionType, *v25);

    objc_msgSend(v4, "objectForKey:", CFSTR("TextAlignment"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_class();
    WFEnforceClass(v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    textAlignment = v5->_textAlignment;
    v5->_textAlignment = (NSString *)v28;

    objc_msgSend(v4, "objectForKey:", CFSTR("Multiline"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_opt_class();
    WFEnforceClass(v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_multiline = objc_msgSend(v32, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("MonospaceFont"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_opt_class();
    WFEnforceClass(v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_monospace = objc_msgSend(v35, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("ProcessIntoContentItems"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_opt_class();
    WFEnforceClass(v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_processesIntoContentItems = objc_msgSend(v38, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("DisableSmartQuotes"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_opt_class();
    WFEnforceClass(v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("DisableSmartDashes"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_opt_class();
    WFEnforceClass(v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
      v45 = objc_msgSend(v41, "BOOLValue");
    else
      v45 = 1;
    v5->_smartQuotesDisabled = v45;
    if (v44)
      v46 = objc_msgSend(v44, "BOOLValue");
    else
      v46 = 1;
    v5->_smartDashesDisabled = v46;
    objc_msgSend(v4, "objectForKey:", CFSTR("DisableAutoPeriods"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_opt_class();
    WFEnforceClass(v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("DisableTextReplacement"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_opt_class();
    WFEnforceClass(v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
      v53 = objc_msgSend(v49, "BOOLValue");
    else
      v53 = 0;
    v5->_autoPeriodsDisabled = v53;
    if (v52)
      v54 = objc_msgSend(v52, "BOOLValue");
    else
      v54 = 0;
    v5->_textReplacementDisabled = v54;
    objc_msgSend(v4, "objectForKey:", CFSTR("SyntaxHighlightingType"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_opt_class();
    WFEnforceClass(v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_syntaxHighlightingType = objc_msgSend(v57, "isEqualToString:", CFSTR("JavaScript"));
    objc_msgSend(v4, "objectForKey:", CFSTR("HintDisplayMode"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_opt_class();
    WFEnforceClass(v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v60, "isEqualToString:", CFSTR("WhileProcessing")))
    {
      v61 = 1;
    }
    else
    {
      if (!objc_msgSend(v60, "isEqualToString:", CFSTR("Never")))
      {
        v5->_hintDisplayMode = 0;
        goto LABEL_22;
      }
      v61 = 2;
    }
    v5->_hintDisplayMode = v61;
LABEL_22:
    v62 = v5;

  }
  return v5;
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFTextInputParameter;
  -[WFParameter defaultSerializedRepresentation](&v6, sel_defaultSerializedRepresentation);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v2, "localize");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return v4;
}

- (NSString)textContentType
{
  void *v3;
  int v4;
  id *v5;
  id v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  BOOL v10;
  _BOOL4 v11;
  uint64_t v12;
  NSString *v13;
  NSString *textContentType;
  NSString *v15;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldReverseLayoutDirection");
  v5 = (id *)MEMORY[0x1E0DC8380];
  if (!v4)
    v5 = (id *)MEMORY[0x1E0DC8390];
  v6 = *v5;

  if (!self->_textContentType)
  {
    v7 = self->_textAlignment;
    v8 = (NSString *)v6;
    v9 = v8;
    if (v7 == v8)
    {

    }
    else
    {
      if (v8)
        v10 = v7 == 0;
      else
        v10 = 1;
      if (v10)
        goto LABEL_13;
      v11 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

      if (!v11)
        goto LABEL_14;
    }
    -[WFParameter definition](self, "definition");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[NSString objectForKey:](v7, "objectForKey:", CFSTR("TextContentType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    WFEnforceClass(v9, v12);
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    textContentType = self->_textContentType;
    self->_textContentType = v13;

LABEL_13:
  }
LABEL_14:
  v15 = self->_textContentType;

  return v15;
}

- (BOOL)shouldAlignLabels
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  _BOOL4 v9;

  -[WFTextInputParameter textAlignment](self, "textAlignment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0DC8388];
  v5 = v3;
  v6 = v4;
  if (v5 == v6)
  {

  }
  else
  {
    v7 = v6;
    if (!v5 || !v6)
    {

LABEL_9:
      LOBYTE(v9) = 0;
      goto LABEL_10;
    }
    v8 = objc_msgSend(v5, "isEqualToString:", v6);

    if (!v8)
      goto LABEL_9;
  }
  v9 = !-[WFTextInputParameter isMultiline](self, "isMultiline");
LABEL_10:

  return v9;
}

- (id)hintForState:(id)a3
{
  return 0;
}

- (id)defaultSupportedVariableTypes
{
  return (id)objc_msgSend((id)objc_opt_class(), "allInsertableVariableTypes");
}

- (void)setPrefix:(id)a3
{
  NSString *v4;
  NSString *prefix;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  prefix = self->_prefix;
  self->_prefix = v4;

  -[WFParameter attributesDidChange](self, "attributesDidChange");
}

- (void)setLocalizedPlaceholder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFTextInputParameter;
  -[WFParameter setLocalizedPlaceholder:](&v4, sel_setLocalizedPlaceholder_, a3);
  -[WFParameter attributesDidChange](self, "attributesDidChange");
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  objc_msgSend(v10, "variableString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "variables");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v12[2](v12, 0);
  }
  else
  {
    -[WFTextInputParameter createDialogTextFieldConfigurationWithDefaultState:](self, "createDialogTextFieldConfigurationWithDefaultState:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0DC7B98]);
    -[WFParameter key](self, "key");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithTextFieldConfiguration:message:attribution:prompt:parameterKey:", v16, 0, v20, v11, v18);
    ((void (**)(id, void *))v12)[2](v12, v19);

  }
}

- (id)createDialogTextFieldConfigurationWithDefaultState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DC7DC8]);
  objc_msgSend(v4, "variableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByRemovingVariables");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v7);

  -[WFTextInputParameter prefix](self, "prefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrefix:", v8);

  -[WFParameter localizedPlaceholder](self, "localizedPlaceholder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholder:", v9);

  objc_msgSend(v5, "setSecureTextEntry:", -[WFTextInputParameter isSecureTextEntry](self, "isSecureTextEntry"));
  -[WFTextInputParameter keyboardType](self, "keyboardType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardType:", v10);

  -[WFTextInputParameter textContentType](self, "textContentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextContentType:", v11);

  -[WFTextInputParameter autocapitalizationType](self, "autocapitalizationType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutocapitalizationType:", v12);

  -[WFTextInputParameter autocorrectionType](self, "autocorrectionType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutocorrectionType:", v13);

  objc_msgSend(v5, "setSmartQuotesDisabled:", -[WFTextInputParameter smartQuotesDisabled](self, "smartQuotesDisabled"));
  objc_msgSend(v5, "setSmartDashesDisabled:", -[WFTextInputParameter smartDashesDisabled](self, "smartDashesDisabled"));
  objc_msgSend(v5, "setAutoPeriodsDisabled:", -[WFTextInputParameter autoPeriodsDisabled](self, "autoPeriodsDisabled"));
  objc_msgSend(v5, "setTextReplacementDisabled:", -[WFTextInputParameter textReplacementDisabled](self, "textReplacementDisabled"));
  objc_msgSend(v5, "setMultiline:", -[WFTextInputParameter isMultiline](self, "isMultiline"));
  if (v4)
    objc_msgSend(v5, "setInitialInsertionIndex:", objc_msgSend(v4, "userInputInsertionIndex"));
  -[WFTextInputParameter returnKeyType](self, "returnKeyType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReturnKeyType:", v14);

  return v5;
}

- (NSString)returnKeyType
{
  _BOOL4 v2;
  id *v3;

  v2 = -[WFTextInputParameter isMultiline](self, "isMultiline");
  v3 = (id *)MEMORY[0x1E0DC8370];
  if (!v2)
    v3 = (id *)MEMORY[0x1E0DC8378];
  return (NSString *)*v3;
}

- (id)parameterStateFromDialogResponse:(id)a3
{
  id v4;
  WFVariableString *v5;
  void *v6;
  WFVariableString *v7;
  objc_class *v8;
  WFMultipleValueParameterState *v9;
  void *v10;
  WFMultipleValueParameterState *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [WFVariableString alloc];
  objc_msgSend(v4, "inputtedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFVariableString initWithString:](v5, "initWithString:", v6);
  v8 = -[objc_class initWithVariableString:](-[objc_class alloc](-[WFTextInputParameter singleStateClass](self, "singleStateClass"), "alloc"), "initWithVariableString:", v7);
  if (-[WFParameter allowsMultipleValues](self, "allowsMultipleValues"))
  {
    v9 = [WFMultipleValueParameterState alloc];
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WFMultipleValueParameterState initWithParameterStates:](v9, "initWithParameterStates:", v10);

  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (BOOL)isSecureTextEntry
{
  return self->_secureTextEntry;
}

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (NSString)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (NSString)autocorrectionType
{
  return self->_autocorrectionType;
}

- (BOOL)autoPeriodsDisabled
{
  return self->_autoPeriodsDisabled;
}

- (BOOL)smartQuotesDisabled
{
  return self->_smartQuotesDisabled;
}

- (BOOL)smartDashesDisabled
{
  return self->_smartDashesDisabled;
}

- (BOOL)textReplacementDisabled
{
  return self->_textReplacementDisabled;
}

- (NSString)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)isMultiline
{
  return self->_multiline;
}

- (BOOL)isMonospace
{
  return self->_monospace;
}

- (unint64_t)hintDisplayMode
{
  return self->_hintDisplayMode;
}

- (unint64_t)syntaxHighlightingType
{
  return self->_syntaxHighlightingType;
}

- (BOOL)processesIntoContentItems
{
  return self->_processesIntoContentItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textAlignment, 0);
  objc_storeStrong((id *)&self->_autocorrectionType, 0);
  objc_storeStrong((id *)&self->_autocapitalizationType, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
}

@end
