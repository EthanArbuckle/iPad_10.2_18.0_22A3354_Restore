@implementation TIKeyboardState

- (BOOL)hardwareKeyboardMode
{
  return (LOBYTE(self->_mask.integerValue) >> 5) & 1;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setAuxiliaryInputModeLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)longPredictionListEnabled
{
  return BYTE1(self->_mask.integerValue) >> 7;
}

- (void)setSupplementalLexiconIdentifier:(unint64_t)a3
{
  self->_supplementalLexiconIdentifier = a3;
}

- (void)setResponseContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setRecipientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSUUID)documentIdentifier
{
  return self->_documentIdentifier;
}

- (void)setTextInputTraits:(id)a3
{
  objc_storeStrong((id *)&self->_textInputTraits, a3);
}

- (TIKeyboardLayoutState)layoutState
{
  return self->_layoutState;
}

- (void)setInputContextHistory:(id)a3
{
  objc_storeStrong((id *)&self->_inputContextHistory, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (int)shiftState
{
  return self->_shiftState;
}

- (void)setAutocapitalizationEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFEFFF | v3);
}

- (unint64_t)autocapitalizationType
{
  void *v2;
  unint64_t v3;

  -[TIKeyboardState textInputTraits](self, "textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "autocapitalizationType");

  return v3;
}

- (BOOL)secureTextEntry
{
  void *v2;
  char v3;

  -[TIKeyboardState textInputTraits](self, "textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "secureTextEntry");

  return v3;
}

- (TITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (void)setWordLearningEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFEFF | v3);
}

- (unint64_t)supplementalLexiconIdentifier
{
  return self->_supplementalLexiconIdentifier;
}

- (unint64_t)autofillMode
{
  return self->_autofillMode;
}

- (void)setInlineCompletionEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFF7FFFFF | v3);
}

- (void)setAutocorrectionEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFDFF | v3);
}

- (void)setShiftState:(int)a3
{
  self->_shiftState = a3;
}

- (BOOL)splitKeyboardMode
{
  return (LOBYTE(self->_mask.integerValue) >> 6) & 1;
}

- (BOOL)landscapeOrientation
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 2) & 1;
}

- (BOOL)floatingKeyboardMode
{
  return LOBYTE(self->_mask.integerValue) >> 7;
}

- (BOOL)autocapitalizationEnabled
{
  return (BYTE1(self->_mask.integerValue) >> 4) & 1;
}

- (void)setAutofillMode:(unint64_t)a3
{
  self->_autofillMode = a3;
}

- (void)setSearchStringForMarkedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setInputForMarkedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setAutofillSubMode:(unint64_t)a3
{
  self->_autofillSubMode = a3;
}

- (BOOL)canSuggestSupplementalItemsForCurrentSelection
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 6) & 1;
}

- (void)setUserSelectedCurrentCandidate:(BOOL)a3
{
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFFE | a3);
}

- (unint64_t)autofillSubMode
{
  return self->_autofillSubMode;
}

- (BOOL)userSelectedCurrentCandidate
{
  return self->_mask.integerValue & 1;
}

- (NSString)responseContext
{
  void *v3;
  int v4;
  void *v5;
  NSString *v6;
  NSString *responseContext;
  NSString *v8;

  -[TIKeyboardState inputContextHistory](self, "inputContextHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mostRecentTextEntryIsByMe");

  -[TIKeyboardState inputContextHistory](self, "inputContextHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mostRecentNonSenderTextEntry");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v4)
      responseContext = 0;
    else
      responseContext = v6;
  }
  else
  {
    responseContext = self->_responseContext;
  }
  v8 = responseContext;

  return v8;
}

- (NSString)recipientIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSString *v8;

  -[TIKeyboardState inputContextHistory](self, "inputContextHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipientIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[TIKeyboardState inputContextHistory](self, "inputContextHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recipientIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = self->_recipientIdentifier;
  }
  return v8;
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TIKeyboardState *v5;
  uint64_t v6;
  NSString *clientIdentifier;
  uint64_t v8;
  NSString *inputMode;
  uint64_t v10;
  NSArray *auxiliaryInputModeLanguages;
  uint64_t v12;
  NSString *recipientIdentifier;
  TIInputContextHistory *v14;
  TIInputContextHistory *inputContextHistory;
  TIKeyboardLayoutState *v16;
  TIKeyboardLayoutState *layoutState;
  TIKeyboardSecureCandidateRenderTraits *v18;
  TIKeyboardSecureCandidateRenderTraits *secureCandidateRenderTraits;
  uint64_t v20;
  BKSHIDEventAuthenticationMessage *eventAuthenticationMessage;
  uint64_t v22;
  NSString *inputForMarkedText;
  uint64_t v24;
  NSString *searchStringForMarkedText;
  TITextInputTraits *v26;
  TITextInputTraits *textInputTraits;
  uint64_t v28;
  NSString *responseContext;
  uint64_t v30;
  NSArray *supportedPayloadIds;
  uint64_t v32;
  NSDictionary *autofillContext;
  TIKeyboardCandidate *v34;
  TIKeyboardCandidate *currentCandidate;
  uint64_t v36;
  NSArray *statisticChanges;

  v5 = -[TIKeyboardState init](+[TIKeyboardState allocWithZone:](TIKeyboardState, "allocWithZone:"), "init");
  objc_storeStrong((id *)&v5->_documentIdentifier, self->_documentIdentifier);
  v6 = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
  clientIdentifier = v5->_clientIdentifier;
  v5->_clientIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_inputMode, "copyWithZone:", a3);
  inputMode = v5->_inputMode;
  v5->_inputMode = (NSString *)v8;

  v10 = -[NSArray copyWithZone:](self->_auxiliaryInputModeLanguages, "copyWithZone:", a3);
  auxiliaryInputModeLanguages = v5->_auxiliaryInputModeLanguages;
  v5->_auxiliaryInputModeLanguages = (NSArray *)v10;

  v12 = -[NSString copyWithZone:](self->_recipientIdentifier, "copyWithZone:", a3);
  recipientIdentifier = v5->_recipientIdentifier;
  v5->_recipientIdentifier = (NSString *)v12;

  v14 = -[TIInputContextHistory copyWithZone:](self->_inputContextHistory, "copyWithZone:", a3);
  inputContextHistory = v5->_inputContextHistory;
  v5->_inputContextHistory = v14;

  objc_storeStrong((id *)&v5->_keyLayout, self->_keyLayout);
  v16 = -[TIKeyboardLayoutState copyWithZone:](self->_layoutState, "copyWithZone:", a3);
  layoutState = v5->_layoutState;
  v5->_layoutState = v16;

  objc_storeStrong((id *)&v5->_documentState, self->_documentState);
  v18 = -[TIKeyboardSecureCandidateRenderTraits copyWithZone:](self->_secureCandidateRenderTraits, "copyWithZone:", a3);
  secureCandidateRenderTraits = v5->_secureCandidateRenderTraits;
  v5->_secureCandidateRenderTraits = v18;

  v20 = -[BKSHIDEventAuthenticationMessage copyWithZone:](self->_eventAuthenticationMessage, "copyWithZone:", a3);
  eventAuthenticationMessage = v5->_eventAuthenticationMessage;
  v5->_eventAuthenticationMessage = (BKSHIDEventAuthenticationMessage *)v20;

  v22 = -[NSString copyWithZone:](self->_inputForMarkedText, "copyWithZone:", a3);
  inputForMarkedText = v5->_inputForMarkedText;
  v5->_inputForMarkedText = (NSString *)v22;

  v24 = -[NSString copyWithZone:](self->_searchStringForMarkedText, "copyWithZone:", a3);
  searchStringForMarkedText = v5->_searchStringForMarkedText;
  v5->_searchStringForMarkedText = (NSString *)v24;

  v26 = -[TITextInputTraits copyWithZone:](self->_textInputTraits, "copyWithZone:", a3);
  textInputTraits = v5->_textInputTraits;
  v5->_textInputTraits = v26;

  v28 = -[NSString copyWithZone:](self->_responseContext, "copyWithZone:", a3);
  responseContext = v5->_responseContext;
  v5->_responseContext = (NSString *)v28;

  v30 = -[NSArray copyWithZone:](self->_supportedPayloadIds, "copyWithZone:", a3);
  supportedPayloadIds = v5->_supportedPayloadIds;
  v5->_supportedPayloadIds = (NSArray *)v30;

  v32 = -[NSDictionary copyWithZone:](self->_autofillContext, "copyWithZone:", a3);
  autofillContext = v5->_autofillContext;
  v5->_autofillContext = (NSDictionary *)v32;

  v34 = -[TIKeyboardCandidate copyWithZone:](self->_currentCandidate, "copyWithZone:", a3);
  currentCandidate = v5->_currentCandidate;
  v5->_currentCandidate = v34;

  v5->_mask.integerValue = self->_mask.integerValue;
  v5->_shiftState = self->_shiftState;
  v5->_autofillMode = self->_autofillMode;
  v5->_autofillSubMode = self->_autofillSubMode;
  v5->_autocorrectionListUIState.integerValue = self->_autocorrectionListUIState.integerValue;
  v36 = -[NSArray copyWithZone:](self->_statisticChanges, "copyWithZone:", a3);
  statisticChanges = v5->_statisticChanges;
  v5->_statisticChanges = (NSArray *)v36;

  v5->_supplementalLexiconIdentifier = self->_supplementalLexiconIdentifier;
  return v5;
}

- (TIKeyboardState)init
{
  TIKeyboardState *v2;
  TIKeyboardState *v3;
  TIKeyboardState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardState;
  v2 = -[TIKeyboardState init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    LODWORD(v2->_mask.integerValue) |= 0x400000u;
    v4 = v2;
  }

  return v3;
}

- (TIKeyboardState)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardState *v5;
  uint64_t v6;
  NSUUID *documentIdentifier;
  uint64_t v8;
  NSString *clientIdentifier;
  uint64_t v10;
  NSString *inputMode;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *auxiliaryInputModeLanguages;
  uint64_t v17;
  NSString *recipientIdentifier;
  uint64_t v19;
  TIInputContextHistory *inputContextHistory;
  uint64_t v21;
  TIKeyboardLayout *keyLayout;
  uint64_t v23;
  TIKeyboardLayoutState *layoutState;
  uint64_t v25;
  TIDocumentState *documentState;
  uint64_t v27;
  TIKeyboardSecureCandidateRenderTraits *secureCandidateRenderTraits;
  uint64_t v29;
  BKSHIDEventAuthenticationMessage *eventAuthenticationMessage;
  uint64_t v31;
  NSString *inputForMarkedText;
  uint64_t v33;
  NSString *searchStringForMarkedText;
  uint64_t v35;
  TITextInputTraits *textInputTraits;
  uint64_t v37;
  NSString *responseContext;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSArray *supportedPayloadIds;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSDictionary *autofillContext;
  uint64_t v49;
  TIKeyboardCandidate *currentCandidate;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSArray *statisticChanges;
  void *v56;
  TIKeyboardState *v57;
  objc_super v59;
  _QWORD v60[3];
  _QWORD v61[5];
  _QWORD v62[2];
  _QWORD v63[3];

  v63[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)TIKeyboardState;
  v5 = -[TIKeyboardState init](&v59, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    documentIdentifier = v5->_documentIdentifier;
    v5->_documentIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputMode"));
    v10 = objc_claimAutoreleasedReturnValue();
    inputMode = v5->_inputMode;
    v5->_inputMode = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v63[0] = objc_opt_class();
    v63[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("inputModeLanguages"));
    v15 = objc_claimAutoreleasedReturnValue();
    auxiliaryInputModeLanguages = v5->_auxiliaryInputModeLanguages;
    v5->_auxiliaryInputModeLanguages = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    recipientIdentifier = v5->_recipientIdentifier;
    v5->_recipientIdentifier = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputContextHistory"));
    v19 = objc_claimAutoreleasedReturnValue();
    inputContextHistory = v5->_inputContextHistory;
    v5->_inputContextHistory = (TIInputContextHistory *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyLayout"));
    v21 = objc_claimAutoreleasedReturnValue();
    keyLayout = v5->_keyLayout;
    v5->_keyLayout = (TIKeyboardLayout *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutState"));
    v23 = objc_claimAutoreleasedReturnValue();
    layoutState = v5->_layoutState;
    v5->_layoutState = (TIKeyboardLayoutState *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentState"));
    v25 = objc_claimAutoreleasedReturnValue();
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureCandidateRenderTraits"));
    v27 = objc_claimAutoreleasedReturnValue();
    secureCandidateRenderTraits = v5->_secureCandidateRenderTraits;
    v5->_secureCandidateRenderTraits = (TIKeyboardSecureCandidateRenderTraits *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventAuthenticationMessage"));
    v29 = objc_claimAutoreleasedReturnValue();
    eventAuthenticationMessage = v5->_eventAuthenticationMessage;
    v5->_eventAuthenticationMessage = (BKSHIDEventAuthenticationMessage *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputForMarkedText"));
    v31 = objc_claimAutoreleasedReturnValue();
    inputForMarkedText = v5->_inputForMarkedText;
    v5->_inputForMarkedText = (NSString *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchStringForMarkedText"));
    v33 = objc_claimAutoreleasedReturnValue();
    searchStringForMarkedText = v5->_searchStringForMarkedText;
    v5->_searchStringForMarkedText = (NSString *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textInputTraits"));
    v35 = objc_claimAutoreleasedReturnValue();
    textInputTraits = v5->_textInputTraits;
    v5->_textInputTraits = (TITextInputTraits *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseContext"));
    v37 = objc_claimAutoreleasedReturnValue();
    responseContext = v5->_responseContext;
    v5->_responseContext = (NSString *)v37;

    v39 = (void *)MEMORY[0x1E0C99E60];
    v62[0] = objc_opt_class();
    v62[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setWithArray:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("supportedPayloadIds"));
    v42 = objc_claimAutoreleasedReturnValue();
    supportedPayloadIds = v5->_supportedPayloadIds;
    v5->_supportedPayloadIds = (NSArray *)v42;

    v44 = (void *)MEMORY[0x1E0C99E60];
    v61[0] = objc_opt_class();
    v61[1] = objc_opt_class();
    v61[2] = objc_opt_class();
    v61[3] = objc_opt_class();
    v61[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setWithArray:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v46, CFSTR("autofillContext"));
    v47 = objc_claimAutoreleasedReturnValue();
    autofillContext = v5->_autofillContext;
    v5->_autofillContext = (NSDictionary *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentCandidate"));
    v49 = objc_claimAutoreleasedReturnValue();
    currentCandidate = v5->_currentCandidate;
    v5->_currentCandidate = (TIKeyboardCandidate *)v49;

    v5->_mask.integerValue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("flags"));
    v5->_shiftState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shiftState"));
    v5->_autofillMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("autofillMode"));
    v5->_autofillSubMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("autofillSubMode"));
    v5->_autocorrectionListUIState.integerValue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("autocorrectionListUIState"));
    v51 = (void *)MEMORY[0x1E0C99E60];
    v60[0] = objc_opt_class();
    v60[1] = objc_opt_class();
    v60[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setWithArray:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v53, CFSTR("statisticChanges"));
    v54 = objc_claimAutoreleasedReturnValue();
    statisticChanges = v5->_statisticChanges;
    v5->_statisticChanges = (NSArray *)v54;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supplementalLexiconIdentifier"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supplementalLexiconIdentifier = objc_msgSend(v56, "unsignedLongLongValue");

    v57 = v5;
  }

  return v5;
}

- (BOOL)wordLearningEnabled
{
  return BYTE1(self->_mask.integerValue) & 1;
}

- (NSArray)statisticChanges
{
  return self->_statisticChanges;
}

- (void)setSupportedPayloadIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setStatisticChanges:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setSecureCandidateRenderTraits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setLayoutState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (TIKeyboardLayout)keyLayout
{
  return self->_keyLayout;
}

- (NSString)inputForMarkedText
{
  return self->_inputForMarkedText;
}

- (void)setDocumentState:(id)a3
{
  objc_storeStrong((id *)&self->_documentState, a3);
}

- (void)setDocumentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_documentIdentifier, a3);
}

- (void)setCurrentCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_currentCandidate, a3);
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setAutofillContext:(id)a3
{
  objc_storeStrong((id *)&self->_autofillContext, a3);
}

- (NSArray)supportedPayloadIds
{
  return self->_supportedPayloadIds;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)autofillContext
{
  return self->_autofillContext;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAutocorrectionListUIDisplayed:(BOOL)a3
{
  LOBYTE(self->_autocorrectionListUIState.integerValue) = self->_autocorrectionListUIState.integerValue & 0xFE | a3;
}

- (BOOL)keyboardEventsLagging
{
  return (LOBYTE(self->_mask.integerValue) >> 4) & 1;
}

- (BOOL)autocorrectionEnabled
{
  return (BYTE1(self->_mask.integerValue) >> 1) & 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *documentIdentifier;
  NSString *clientIdentifier;
  NSString *inputMode;
  NSArray *auxiliaryInputModeLanguages;
  NSString *recipientIdentifier;
  TIInputContextHistory *inputContextHistory;
  TIKeyboardLayout *keyLayout;
  TIKeyboardLayoutState *layoutState;
  TIDocumentState *documentState;
  TIKeyboardSecureCandidateRenderTraits *secureCandidateRenderTraits;
  NSString *inputForMarkedText;
  NSString *searchStringForMarkedText;
  TITextInputTraits *textInputTraits;
  NSString *responseContext;
  NSArray *supportedPayloadIds;
  NSDictionary *autofillContext;
  TIKeyboardCandidate *currentCandidate;
  int64_t integerValue;
  uint64_t shiftState;
  unint64_t autofillMode;
  unint64_t autofillSubMode;
  int64_t v25;
  NSArray *statisticChanges;
  void *v27;
  id v28;

  v28 = a3;
  documentIdentifier = self->_documentIdentifier;
  if (documentIdentifier)
    objc_msgSend(v28, "encodeObject:forKey:", documentIdentifier, CFSTR("documentIdentifier"));
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
    objc_msgSend(v28, "encodeObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
  inputMode = self->_inputMode;
  if (inputMode)
    objc_msgSend(v28, "encodeObject:forKey:", inputMode, CFSTR("inputMode"));
  auxiliaryInputModeLanguages = self->_auxiliaryInputModeLanguages;
  if (auxiliaryInputModeLanguages)
    objc_msgSend(v28, "encodeObject:forKey:", auxiliaryInputModeLanguages, CFSTR("inputModeLanguages"));
  recipientIdentifier = self->_recipientIdentifier;
  if (recipientIdentifier)
    objc_msgSend(v28, "encodeObject:forKey:", recipientIdentifier, CFSTR("recipientIdentifier"));
  inputContextHistory = self->_inputContextHistory;
  if (inputContextHistory)
    objc_msgSend(v28, "encodeObject:forKey:", inputContextHistory, CFSTR("inputContextHistory"));
  keyLayout = self->_keyLayout;
  if (keyLayout)
    objc_msgSend(v28, "encodeObject:forKey:", keyLayout, CFSTR("keyLayout"));
  layoutState = self->_layoutState;
  if (layoutState)
    objc_msgSend(v28, "encodeObject:forKey:", layoutState, CFSTR("layoutState"));
  documentState = self->_documentState;
  if (documentState)
    objc_msgSend(v28, "encodeObject:forKey:", documentState, CFSTR("documentState"));
  secureCandidateRenderTraits = self->_secureCandidateRenderTraits;
  if (secureCandidateRenderTraits)
    objc_msgSend(v28, "encodeObject:forKey:", secureCandidateRenderTraits, CFSTR("secureCandidateRenderTraits"));
  if (self->_eventAuthenticationMessage)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(v28, "encodeObject:forKey:", self->_eventAuthenticationMessage, CFSTR("eventAuthenticationMessage"));
  }
  inputForMarkedText = self->_inputForMarkedText;
  if (inputForMarkedText)
    objc_msgSend(v28, "encodeObject:forKey:", inputForMarkedText, CFSTR("inputForMarkedText"));
  searchStringForMarkedText = self->_searchStringForMarkedText;
  if (searchStringForMarkedText)
    objc_msgSend(v28, "encodeObject:forKey:", searchStringForMarkedText, CFSTR("searchStringForMarkedText"));
  textInputTraits = self->_textInputTraits;
  if (textInputTraits)
    objc_msgSend(v28, "encodeObject:forKey:", textInputTraits, CFSTR("textInputTraits"));
  responseContext = self->_responseContext;
  if (responseContext)
    objc_msgSend(v28, "encodeObject:forKey:", responseContext, CFSTR("responseContext"));
  supportedPayloadIds = self->_supportedPayloadIds;
  if (supportedPayloadIds)
    objc_msgSend(v28, "encodeObject:forKey:", supportedPayloadIds, CFSTR("supportedPayloadIds"));
  autofillContext = self->_autofillContext;
  if (autofillContext)
    objc_msgSend(v28, "encodeObject:forKey:", autofillContext, CFSTR("autofillContext"));
  currentCandidate = self->_currentCandidate;
  if (currentCandidate)
    objc_msgSend(v28, "encodeObject:forKey:", currentCandidate, CFSTR("currentCandidate"));
  integerValue = self->_mask.integerValue;
  if (integerValue)
    objc_msgSend(v28, "encodeInteger:forKey:", integerValue, CFSTR("flags"));
  shiftState = self->_shiftState;
  if ((_DWORD)shiftState)
    objc_msgSend(v28, "encodeInteger:forKey:", shiftState, CFSTR("shiftState"));
  autofillMode = self->_autofillMode;
  if (autofillMode)
    objc_msgSend(v28, "encodeInteger:forKey:", autofillMode, CFSTR("autofillMode"));
  autofillSubMode = self->_autofillSubMode;
  if (autofillSubMode)
    objc_msgSend(v28, "encodeInteger:forKey:", autofillSubMode, CFSTR("autofillSubMode"));
  v25 = self->_autocorrectionListUIState.integerValue;
  if (v25)
    objc_msgSend(v28, "encodeInteger:forKey:", v25, CFSTR("autocorrectionListUIState"));
  statisticChanges = self->_statisticChanges;
  if (statisticChanges)
    objc_msgSend(v28, "encodeObject:forKey:", statisticChanges, CFSTR("statisticChanges"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_supplementalLexiconIdentifier);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v27, CFSTR("supplementalLexiconIdentifier"));

}

- (void)setShortcutConversionEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFBFF | v3);
}

- (void)setOmitEmojiCandidates:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFF7FFFF | v3);
}

- (void)setNeedsCandidateMetadata:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFF7 | v3);
}

- (void)setNeedOneTimeCodeAutofill:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFDFFFF | v3);
}

- (void)setNeedCellularAutofill:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFDFFFFFF | v3);
}

- (void)setNeedAutofill:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFEFFFF | v3);
}

- (void)setLongPredictionListEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFF7FFF | v3);
}

- (void)setLandscapeOrientation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFBFFFF | v3);
}

- (void)setIsScreenLocked:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFBFFF | v3);
}

- (void)setImageSuggestionEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFEFFFFFF | v3);
}

- (void)setFloatingKeyboardMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFF7F | v3);
}

- (void)setEmojiSearchMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFEFFFFF | v3);
}

- (void)setEmojiPopoverMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFDFFFFF | v3);
}

- (void)setCandidateSelectionPredictionEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFF7FF | v3);
}

- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFBFFFFF | v3);
}

- (void)setCanSendCurrentLocation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFDFFF | v3);
}

- (void)setKeyLayout:(id)a3
{
  objc_storeStrong((id *)&self->_keyLayout, a3);
}

- (void)setSplitKeyboardMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFBF | v3);
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFFD | v3);
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFDF | v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticChanges, 0);
  objc_storeStrong((id *)&self->_supportedPayloadIds, 0);
  objc_storeStrong((id *)&self->_autofillContext, 0);
  objc_storeStrong((id *)&self->_responseContext, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_searchStringForMarkedText, 0);
  objc_storeStrong((id *)&self->_inputForMarkedText, 0);
  objc_storeStrong((id *)&self->_eventAuthenticationMessage, 0);
  objc_storeStrong((id *)&self->_secureCandidateRenderTraits, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_layoutState, 0);
  objc_storeStrong((id *)&self->_keyLayout, 0);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
  objc_storeStrong((id *)&self->_auxiliaryInputModeLanguages, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_documentIdentifier, 0);
}

- (BOOL)needContactAutofill
{
  return self->_autofillMode - 4 < 3;
}

- (void)setSuppressingCandidateSelection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFFB | v3);
}

- (BOOL)emojiSearchMode
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 4) & 1;
}

- (BOOL)shouldSkipCandidateSelection
{
  return (LOBYTE(self->_mask.integerValue) >> 1) & 1;
}

- (BOOL)suppressingCandidateSelection
{
  return (LOBYTE(self->_mask.integerValue) >> 2) & 1;
}

- (BOOL)needsCandidateMetadata
{
  return (LOBYTE(self->_mask.integerValue) >> 3) & 1;
}

- (void)setKeyboardEventsLagging:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFEF | v3);
}

- (BOOL)omitEmojiCandidates
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 3) & 1;
}

- (BOOL)emojiPopoverMode
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 5) & 1;
}

- (BOOL)imageSuggestionEnabled
{
  return *((_BYTE *)&self->_mask.fields + 3) & 1;
}

- (BOOL)shortcutConversionEnabled
{
  return (BYTE1(self->_mask.integerValue) >> 2) & 1;
}

- (BOOL)candidateSelectionPredictionEnabled
{
  return (BYTE1(self->_mask.integerValue) >> 3) & 1;
}

- (BOOL)inlineCompletionEnabled
{
  return *((unsigned __int8 *)&self->_mask.fields + 2) >> 7;
}

- (void)_createTextInputTraitsIfNecessary
{
  TITextInputTraits *v3;
  TITextInputTraits *textInputTraits;

  if (!self->_textInputTraits)
  {
    v3 = objc_alloc_init(TITextInputTraits);
    textInputTraits = self->_textInputTraits;
    self->_textInputTraits = v3;

  }
}

- (void)setAutocapitalizationType:(unint64_t)a3
{
  id v5;

  -[TIKeyboardState _createTextInputTraitsIfNecessary](self, "_createTextInputTraitsIfNecessary");
  -[TIKeyboardState textInputTraits](self, "textInputTraits");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutocapitalizationType:", a3);

}

- (unint64_t)keyboardType
{
  void *v2;
  unint64_t v3;

  -[TIKeyboardState textInputTraits](self, "textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardType");

  return v3;
}

- (void)setKeyboardType:(unint64_t)a3
{
  id v5;

  -[TIKeyboardState _createTextInputTraitsIfNecessary](self, "_createTextInputTraitsIfNecessary");
  -[TIKeyboardState textInputTraits](self, "textInputTraits");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardType:", a3);

}

- (void)setSecureTextEntry:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[TIKeyboardState _createTextInputTraitsIfNecessary](self, "_createTextInputTraitsIfNecessary");
  -[TIKeyboardState textInputTraits](self, "textInputTraits");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecureTextEntry:", v3);

}

- (BOOL)autocorrectionListUIDisplayed
{
  return self->_autocorrectionListUIState.integerValue & 1;
}

- (BOOL)autocorrectionListUIAutoDisplayMode
{
  return (LOBYTE(self->_autocorrectionListUIState.integerValue) >> 1) & 1;
}

- (void)setAutocorrectionListUIAutoDisplayMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  LOBYTE(self->_autocorrectionListUIState.integerValue) = self->_autocorrectionListUIState.integerValue & 0xFD | v3;
}

- (BOOL)canSendCurrentLocation
{
  return (BYTE1(self->_mask.integerValue) >> 5) & 1;
}

- (BOOL)isScreenLocked
{
  return (BYTE1(self->_mask.integerValue) >> 6) & 1;
}

- (BOOL)needAutofill
{
  return *((_BYTE *)&self->_mask.fields + 2) & 1;
}

- (BOOL)needOneTimeCodeAutofill
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 1) & 1;
}

- (BOOL)needCellularAutofill
{
  return (*((unsigned __int8 *)&self->_mask.fields + 3) >> 1) & 1;
}

- (BOOL)shouldOutputFullwidthSpace
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  int v10;

  +[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForPreferenceKey:", CFSTR("SmartFullwidthSpace"));

  -[TIKeyboardState documentState](self, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextBeforeInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(v6, "length"))
    {
      v7 = objc_msgSend(v6, "hasSuffix:", CFSTR(" "));
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "longCharacterIsMember:", objc_msgSend(v6, "_lastLongCharacter"));

      v10 = (v9 | objc_msgSend(v6, "_endsWithHalfwidth") ^ 1) & ~v7;
    }
    else
    {
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t shiftState;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  _BOOL4 v31;
  const __CFString *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  const char *v49;
  const char *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  const char *v55;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  shiftState = self->_shiftState;
  if (shiftState > 3)
    v5 = "unknown";
  else
    v5 = off_1E243A578[shiftState];
  -[TIKeyboardState documentIdentifier](self, "documentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; documentIdentifier = %@"), v6);

  -[TIKeyboardState clientIdentifier](self, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; clientIdentifier = %@"), v7);

  -[TIKeyboardState inputMode](self, "inputMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputMode = %@"), v8);

  -[TIKeyboardState auxiliaryInputModeLanguages](self, "auxiliaryInputModeLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; auxiliaryInputModeLanguages = %@"), v9);

  -[TIKeyboardState recipientIdentifier](self, "recipientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; recipientIdentifier = %@"), v10);

  -[TIKeyboardState inputContextHistory](self, "inputContextHistory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputContextHistory = %@"), v11);

  -[TIKeyboardState keyLayout](self, "keyLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; keyLayout = %@"), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR("; shiftState = %s"), v5);
  -[TIKeyboardState layoutState](self, "layoutState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; layoutState = %@"), v13);

  -[TIKeyboardState documentState](self, "documentState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; documentState = %@"), v14);

  -[TIKeyboardState secureCandidateRenderTraits](self, "secureCandidateRenderTraits");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; secureCandidateRenderTraits = %@"), v15);

  -[TIKeyboardState eventAuthenticationMessage](self, "eventAuthenticationMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; eventAuthenticationMessage = %@"), v16);

  -[TIKeyboardState inputForMarkedText](self, "inputForMarkedText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputForMarkedText = %@"), v17);

  -[TIKeyboardState searchStringForMarkedText](self, "searchStringForMarkedText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; searchStringForMarkedText = %@"), v18);

  -[TIKeyboardState currentCandidate](self, "currentCandidate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; currentCandidate = %@"), v19);

  -[TIKeyboardState currentCandidate](self, "currentCandidate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (-[TIKeyboardState userSelectedCurrentCandidate](self, "userSelectedCurrentCandidate"))
      v21 = "YES";
    else
      v21 = "NO";
    objc_msgSend(v3, "appendFormat:", CFSTR("; userSelectedCurrentCandidate = %s"), v21);
  }
  if (-[TIKeyboardState shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection"))
    v22 = "YES";
  else
    v22 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; shouldSkipCandidateSelection = %s"), v22);
  if (-[TIKeyboardState suppressingCandidateSelection](self, "suppressingCandidateSelection"))
    v23 = "YES";
  else
    v23 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; suppressingCandidateSelection = %s"), v23);
  if (-[TIKeyboardState needsCandidateMetadata](self, "needsCandidateMetadata"))
    v24 = "YES";
  else
    v24 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; needsCandidateMetadata = %s"), v24);
  if (-[TIKeyboardState keyboardEventsLagging](self, "keyboardEventsLagging"))
    v25 = "YES";
  else
    v25 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; keyboardEventsLagging = %s"), v25);
  if (-[TIKeyboardState hardwareKeyboardMode](self, "hardwareKeyboardMode"))
    v26 = "YES";
  else
    v26 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; hardwareKeyboardMode = %s"), v26);
  if (-[TIKeyboardState splitKeyboardMode](self, "splitKeyboardMode"))
    v27 = "YES";
  else
    v27 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; splitKeyboardMode = %s"), v27);
  if (-[TIKeyboardState floatingKeyboardMode](self, "floatingKeyboardMode"))
    v28 = "YES";
  else
    v28 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; floatingKeyboardMode = %s"), v28);
  if (-[TIKeyboardState wordLearningEnabled](self, "wordLearningEnabled"))
    v29 = "YES";
  else
    v29 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; wordLearningEnabled = %s"), v29);
  if (-[TIKeyboardState autocorrectionEnabled](self, "autocorrectionEnabled"))
    v30 = "YES";
  else
    v30 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; autocorrectionEnabled = %s"), v30);
  v31 = -[TIKeyboardState imageSuggestionEnabled](self, "imageSuggestionEnabled");
  v32 = CFSTR("NO");
  if (v31)
    v32 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("; imageSuggestionEnabled = %@"), v32);
  if (-[TIKeyboardState shortcutConversionEnabled](self, "shortcutConversionEnabled"))
    v33 = "YES";
  else
    v33 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; shortcutConversionEnabled = %s"), v33);
  if (-[TIKeyboardState omitEmojiCandidates](self, "omitEmojiCandidates"))
    v34 = "YES";
  else
    v34 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; omitEmojiCandidates = %s"), v34);
  if (-[TIKeyboardState emojiSearchMode](self, "emojiSearchMode"))
    v35 = "YES";
  else
    v35 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; emojiSearchMode = %s"), v35);
  if (-[TIKeyboardState emojiPopoverMode](self, "emojiPopoverMode"))
    v36 = "YES";
  else
    v36 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; emojiPopoverMode = %s"), v36);
  if (-[TIKeyboardState autocapitalizationEnabled](self, "autocapitalizationEnabled"))
    v37 = "YES";
  else
    v37 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; autocapitalizationEnabled = %s"), v37);
  if (-[TIKeyboardState inlineCompletionEnabled](self, "inlineCompletionEnabled"))
    v38 = "YES";
  else
    v38 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; inlineCompletionEnabled = %s"), v38);
  -[TIKeyboardState textInputTraits](self, "textInputTraits");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; textInputTraits = %@"), v39);

  -[TIKeyboardState responseContext](self, "responseContext");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; responseContext = %@"), v40);

  -[TIKeyboardState supportedPayloadIds](self, "supportedPayloadIds");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[TIKeyboardState supportedPayloadIds](self, "supportedPayloadIds");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; supportedPayloadIds = %@"), v42);

  }
  if (-[TIKeyboardState autocorrectionListUIDisplayed](self, "autocorrectionListUIDisplayed"))
    v43 = "YES";
  else
    v43 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; autocorrectionListUIDisplayed = %s"), v43);
  if (-[TIKeyboardState autocorrectionListUIAutoDisplayMode](self, "autocorrectionListUIAutoDisplayMode"))
    v44 = "YES";
  else
    v44 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; autocorrectionListUIAutoDisplayMode = %s"), v44);
  if (-[TIKeyboardState canSendCurrentLocation](self, "canSendCurrentLocation"))
    v45 = "YES";
  else
    v45 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; canSendCurrentLocation = %s"), v45);
  if (-[TIKeyboardState isScreenLocked](self, "isScreenLocked"))
    v46 = "YES";
  else
    v46 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; isScreenLocked = %s"), v46);
  if (-[TIKeyboardState longPredictionListEnabled](self, "longPredictionListEnabled"))
    v47 = "YES";
  else
    v47 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; longPredictionListEnabled = %s"), v47);
  if (-[TIKeyboardState needAutofill](self, "needAutofill"))
    v48 = "YES";
  else
    v48 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; needAutofill = %s"), v48);
  objc_msgSend(v3, "appendFormat:", CFSTR("; autofillMode = %ld"),
    -[TIKeyboardState autofillMode](self, "autofillMode"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; autofillSubMode = %ld"),
    -[TIKeyboardState autofillSubMode](self, "autofillSubMode"));
  if (-[TIKeyboardState needOneTimeCodeAutofill](self, "needOneTimeCodeAutofill"))
    v49 = "YES";
  else
    v49 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; needOneTimeCodeAutofill = %s"), v49);
  if (-[TIKeyboardState needCellularAutofill](self, "needCellularAutofill"))
    v50 = "YES";
  else
    v50 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("; needCellularAutofill = %s"), v50);
  -[TIKeyboardState autofillContext](self, "autofillContext");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    -[TIKeyboardState autofillContext](self, "autofillContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; autofillContext = %@"), v52);

  }
  -[TIKeyboardState statisticChanges](self, "statisticChanges");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    -[TIKeyboardState statisticChanges](self, "statisticChanges");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; statisticChanges = %@"), v54);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("; supplementalLexiconIdentifier = %llu"),
    self->_supplementalLexiconIdentifier);
  if (-[TIKeyboardState canSuggestSupplementalItemsForCurrentSelection](self, "canSuggestSupplementalItemsForCurrentSelection"))
  {
    v55 = "YES";
  }
  else
  {
    v55 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("; canSuggestSupplementalItemsForCurrentSelection = %s"), v55);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  int v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  unint64_t v136;
  unint64_t v137;
  int v138;
  int v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143;
  void *v144;
  int v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  int v151;
  _BOOL4 v152;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[TIKeyboardState documentIdentifier](self, "documentIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "documentIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[TIKeyboardState documentIdentifier](self, "documentIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "documentIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_112;
    }
    -[TIKeyboardState clientIdentifier](self, "clientIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      v16 = (void *)MEMORY[0x1E0CB3940];
      -[TIKeyboardState clientIdentifier](self, "clientIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = objc_msgSend(v16, "_string:matchesString:", v17, v18);

      if (!(_DWORD)v16)
        goto LABEL_112;
    }
    -[TIKeyboardState inputMode](self, "inputMode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputMode");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      v22 = (void *)MEMORY[0x1E0CB3940];
      -[TIKeyboardState inputMode](self, "inputMode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inputMode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = objc_msgSend(v22, "_string:matchesString:", v23, v24);

      if (!(_DWORD)v22)
        goto LABEL_112;
    }
    -[TIKeyboardState auxiliaryInputModeLanguages](self, "auxiliaryInputModeLanguages");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "auxiliaryInputModeLanguages");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[TIKeyboardState auxiliaryInputModeLanguages](self, "auxiliaryInputModeLanguages");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "auxiliaryInputModeLanguages");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqual:", v29);

      if (!v30)
        goto LABEL_112;
    }
    -[TIKeyboardState recipientIdentifier](self, "recipientIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipientIdentifier");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      v34 = (void *)MEMORY[0x1E0CB3940];
      -[TIKeyboardState recipientIdentifier](self, "recipientIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recipientIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v34) = objc_msgSend(v34, "_string:matchesString:", v35, v36);

      if (!(_DWORD)v34)
        goto LABEL_112;
    }
    -[TIKeyboardState inputContextHistory](self, "inputContextHistory");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputContextHistory");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v37 == (void *)v38)
    {

    }
    else
    {
      v39 = (void *)v38;
      -[TIKeyboardState inputContextHistory](self, "inputContextHistory");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inputContextHistory");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      if (!v42)
        goto LABEL_112;
    }
    -[TIKeyboardState keyLayout](self, "keyLayout");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyLayout");
    v44 = objc_claimAutoreleasedReturnValue();
    if (v43 == (void *)v44)
    {

    }
    else
    {
      v45 = (void *)v44;
      -[TIKeyboardState keyLayout](self, "keyLayout");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyLayout");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "isEqual:", v47);

      if (!v48)
        goto LABEL_112;
    }
    v49 = -[TIKeyboardState shiftState](self, "shiftState");
    if (v49 == objc_msgSend(v5, "shiftState"))
    {
      -[TIKeyboardState layoutState](self, "layoutState");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "layoutState");
      v51 = objc_claimAutoreleasedReturnValue();
      if (v50 == (void *)v51)
      {

      }
      else
      {
        v52 = (void *)v51;
        -[TIKeyboardState layoutState](self, "layoutState");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "layoutState");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v53, "isEqual:", v54);

        if (!v55)
          goto LABEL_112;
      }
      -[TIKeyboardState documentState](self, "documentState");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "documentState");
      v57 = objc_claimAutoreleasedReturnValue();
      if (v56 == (void *)v57)
      {

      }
      else
      {
        v58 = (void *)v57;
        -[TIKeyboardState documentState](self, "documentState");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "documentState");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v59, "isEqual:", v60);

        if (!v61)
          goto LABEL_112;
      }
      -[TIKeyboardState secureCandidateRenderTraits](self, "secureCandidateRenderTraits");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "secureCandidateRenderTraits");
      v63 = objc_claimAutoreleasedReturnValue();
      if (v62 == (void *)v63)
      {

      }
      else
      {
        v64 = (void *)v63;
        -[TIKeyboardState secureCandidateRenderTraits](self, "secureCandidateRenderTraits");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "secureCandidateRenderTraits");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v65, "isEqual:", v66);

        if (!v67)
          goto LABEL_112;
      }
      -[TIKeyboardState eventAuthenticationMessage](self, "eventAuthenticationMessage");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventAuthenticationMessage");
      v69 = objc_claimAutoreleasedReturnValue();
      if (v68 == (void *)v69)
      {

      }
      else
      {
        v70 = (void *)v69;
        -[TIKeyboardState eventAuthenticationMessage](self, "eventAuthenticationMessage");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "eventAuthenticationMessage");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v71, "isEqual:", v72);

        if (!v73)
          goto LABEL_112;
      }
      -[TIKeyboardState inputForMarkedText](self, "inputForMarkedText");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inputForMarkedText");
      v75 = objc_claimAutoreleasedReturnValue();
      if (v74 == (void *)v75)
      {

      }
      else
      {
        v76 = (void *)v75;
        v77 = (void *)MEMORY[0x1E0CB3940];
        -[TIKeyboardState inputForMarkedText](self, "inputForMarkedText");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "inputForMarkedText");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v77) = objc_msgSend(v77, "_string:matchesString:", v78, v79);

        if (!(_DWORD)v77)
          goto LABEL_112;
      }
      -[TIKeyboardState searchStringForMarkedText](self, "searchStringForMarkedText");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "searchStringForMarkedText");
      v81 = objc_claimAutoreleasedReturnValue();
      if (v80 == (void *)v81)
      {

      }
      else
      {
        v82 = (void *)v81;
        v83 = (void *)MEMORY[0x1E0CB3940];
        -[TIKeyboardState searchStringForMarkedText](self, "searchStringForMarkedText");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "searchStringForMarkedText");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v83) = objc_msgSend(v83, "_string:matchesString:", v84, v85);

        if (!(_DWORD)v83)
          goto LABEL_112;
      }
      -[TIKeyboardState currentCandidate](self, "currentCandidate");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentCandidate");
      v87 = objc_claimAutoreleasedReturnValue();
      if (v86 == (void *)v87)
      {

      }
      else
      {
        v88 = (void *)v87;
        -[TIKeyboardState currentCandidate](self, "currentCandidate");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "currentCandidate");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend(v89, "isEqual:", v90);

        if (!v91)
          goto LABEL_112;
      }
      v92 = -[TIKeyboardState userSelectedCurrentCandidate](self, "userSelectedCurrentCandidate");
      if (v92 != objc_msgSend(v5, "userSelectedCurrentCandidate"))
        goto LABEL_112;
      v93 = -[TIKeyboardState shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection");
      if (v93 != objc_msgSend(v5, "shouldSkipCandidateSelection"))
        goto LABEL_112;
      v94 = -[TIKeyboardState suppressingCandidateSelection](self, "suppressingCandidateSelection");
      if (v94 != objc_msgSend(v5, "suppressingCandidateSelection"))
        goto LABEL_112;
      v95 = -[TIKeyboardState needsCandidateMetadata](self, "needsCandidateMetadata");
      if (v95 != objc_msgSend(v5, "needsCandidateMetadata"))
        goto LABEL_112;
      v96 = -[TIKeyboardState keyboardEventsLagging](self, "keyboardEventsLagging");
      if (v96 != objc_msgSend(v5, "keyboardEventsLagging"))
        goto LABEL_112;
      v97 = -[TIKeyboardState hardwareKeyboardMode](self, "hardwareKeyboardMode");
      if (v97 != objc_msgSend(v5, "hardwareKeyboardMode"))
        goto LABEL_112;
      v98 = -[TIKeyboardState splitKeyboardMode](self, "splitKeyboardMode");
      if (v98 != objc_msgSend(v5, "splitKeyboardMode"))
        goto LABEL_112;
      v99 = -[TIKeyboardState floatingKeyboardMode](self, "floatingKeyboardMode");
      if (v99 != objc_msgSend(v5, "floatingKeyboardMode"))
        goto LABEL_112;
      v100 = -[TIKeyboardState landscapeOrientation](self, "landscapeOrientation");
      if (v100 != objc_msgSend(v5, "landscapeOrientation"))
        goto LABEL_112;
      v101 = -[TIKeyboardState wordLearningEnabled](self, "wordLearningEnabled");
      if (v101 != objc_msgSend(v5, "wordLearningEnabled"))
        goto LABEL_112;
      v102 = -[TIKeyboardState inlineCompletionEnabled](self, "inlineCompletionEnabled");
      if (v102 != objc_msgSend(v5, "inlineCompletionEnabled"))
        goto LABEL_112;
      v103 = -[TIKeyboardState autocorrectionEnabled](self, "autocorrectionEnabled");
      if (v103 != objc_msgSend(v5, "autocorrectionEnabled"))
        goto LABEL_112;
      v104 = -[TIKeyboardState imageSuggestionEnabled](self, "imageSuggestionEnabled");
      if (v104 != objc_msgSend(v5, "imageSuggestionEnabled"))
        goto LABEL_112;
      v105 = -[TIKeyboardState omitEmojiCandidates](self, "omitEmojiCandidates");
      if (v105 != objc_msgSend(v5, "omitEmojiCandidates"))
        goto LABEL_112;
      v106 = -[TIKeyboardState emojiSearchMode](self, "emojiSearchMode");
      if (v106 != objc_msgSend(v5, "emojiSearchMode"))
        goto LABEL_112;
      v107 = -[TIKeyboardState emojiPopoverMode](self, "emojiPopoverMode");
      if (v107 != objc_msgSend(v5, "emojiPopoverMode"))
        goto LABEL_112;
      v108 = -[TIKeyboardState shortcutConversionEnabled](self, "shortcutConversionEnabled");
      if (v108 != objc_msgSend(v5, "shortcutConversionEnabled"))
        goto LABEL_112;
      v109 = -[TIKeyboardState candidateSelectionPredictionEnabled](self, "candidateSelectionPredictionEnabled");
      if (v109 != objc_msgSend(v5, "candidateSelectionPredictionEnabled"))
        goto LABEL_112;
      v110 = -[TIKeyboardState autocapitalizationEnabled](self, "autocapitalizationEnabled");
      if (v110 != objc_msgSend(v5, "autocapitalizationEnabled"))
        goto LABEL_112;
      v111 = -[TIKeyboardState inlineCompletionEnabled](self, "inlineCompletionEnabled");
      if (v111 != objc_msgSend(v5, "inlineCompletionEnabled"))
        goto LABEL_112;
      -[TIKeyboardState textInputTraits](self, "textInputTraits");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textInputTraits");
      v113 = objc_claimAutoreleasedReturnValue();
      if (v112 == (void *)v113)
      {

      }
      else
      {
        v114 = (void *)v113;
        -[TIKeyboardState textInputTraits](self, "textInputTraits");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "textInputTraits");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend(v115, "isEqual:", v116);

        if (!v117)
          goto LABEL_112;
      }
      -[TIKeyboardState responseContext](self, "responseContext");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "responseContext");
      v119 = objc_claimAutoreleasedReturnValue();
      if (v118 == (void *)v119)
      {

      }
      else
      {
        v120 = (void *)v119;
        v121 = (void *)MEMORY[0x1E0CB3940];
        -[TIKeyboardState responseContext](self, "responseContext");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "responseContext");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v121) = objc_msgSend(v121, "_string:matchesString:", v122, v123);

        if (!(_DWORD)v121)
          goto LABEL_112;
      }
      -[TIKeyboardState supportedPayloadIds](self, "supportedPayloadIds");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "supportedPayloadIds");
      v125 = objc_claimAutoreleasedReturnValue();
      if (v124 == (void *)v125)
      {

      }
      else
      {
        v126 = (void *)v125;
        -[TIKeyboardState supportedPayloadIds](self, "supportedPayloadIds");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "supportedPayloadIds");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = objc_msgSend(v127, "isEqual:", v128);

        if (!v129)
          goto LABEL_112;
      }
      v130 = -[TIKeyboardState autocorrectionListUIDisplayed](self, "autocorrectionListUIDisplayed");
      if (v130 != objc_msgSend(v5, "autocorrectionListUIDisplayed"))
        goto LABEL_112;
      v131 = -[TIKeyboardState autocorrectionListUIAutoDisplayMode](self, "autocorrectionListUIAutoDisplayMode");
      if (v131 != objc_msgSend(v5, "autocorrectionListUIAutoDisplayMode"))
        goto LABEL_112;
      v132 = -[TIKeyboardState canSendCurrentLocation](self, "canSendCurrentLocation");
      if (v132 != objc_msgSend(v5, "canSendCurrentLocation"))
        goto LABEL_112;
      v133 = -[TIKeyboardState isScreenLocked](self, "isScreenLocked");
      if (v133 != objc_msgSend(v5, "isScreenLocked"))
        goto LABEL_112;
      v134 = -[TIKeyboardState longPredictionListEnabled](self, "longPredictionListEnabled");
      if (v134 != objc_msgSend(v5, "longPredictionListEnabled"))
        goto LABEL_112;
      v135 = -[TIKeyboardState needAutofill](self, "needAutofill");
      if (v135 != objc_msgSend(v5, "needAutofill"))
        goto LABEL_112;
      v136 = -[TIKeyboardState autofillMode](self, "autofillMode");
      if (v136 != objc_msgSend(v5, "autofillMode"))
        goto LABEL_112;
      v137 = -[TIKeyboardState autofillSubMode](self, "autofillSubMode");
      if (v137 != objc_msgSend(v5, "autofillSubMode"))
        goto LABEL_112;
      v138 = -[TIKeyboardState needOneTimeCodeAutofill](self, "needOneTimeCodeAutofill");
      if (v138 != objc_msgSend(v5, "needOneTimeCodeAutofill"))
        goto LABEL_112;
      v139 = -[TIKeyboardState needCellularAutofill](self, "needCellularAutofill");
      if (v139 != objc_msgSend(v5, "needCellularAutofill"))
        goto LABEL_112;
      -[TIKeyboardState autofillContext](self, "autofillContext");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "autofillContext");
      v141 = objc_claimAutoreleasedReturnValue();
      if (v140 == (void *)v141)
      {

      }
      else
      {
        v142 = (void *)v141;
        -[TIKeyboardState autofillContext](self, "autofillContext");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "autofillContext");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        v145 = objc_msgSend(v143, "isEqualToDictionary:", v144);

        if (!v145)
          goto LABEL_112;
      }
      -[TIKeyboardState statisticChanges](self, "statisticChanges");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statisticChanges");
      v147 = objc_claimAutoreleasedReturnValue();
      if (v146 == (void *)v147)
      {

      }
      else
      {
        v148 = (void *)v147;
        -[TIKeyboardState statisticChanges](self, "statisticChanges");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "statisticChanges");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = objc_msgSend(v149, "isEqual:", v150);

        if (!v151)
          goto LABEL_112;
      }
      if (self->_supplementalLexiconIdentifier == v5[4])
      {
        v152 = -[TIKeyboardState canSuggestSupplementalItemsForCurrentSelection](self, "canSuggestSupplementalItemsForCurrentSelection");
        v12 = v152 ^ objc_msgSend(v5, "canSuggestSupplementalItemsForCurrentSelection") ^ 1;
LABEL_113:

        goto LABEL_114;
      }
    }
LABEL_112:
    LOBYTE(v12) = 0;
    goto LABEL_113;
  }
  LOBYTE(v12) = 0;
LABEL_114:

  return v12;
}

- (NSArray)auxiliaryInputModeLanguages
{
  return self->_auxiliaryInputModeLanguages;
}

- (TIKeyboardSecureCandidateRenderTraits)secureCandidateRenderTraits
{
  return self->_secureCandidateRenderTraits;
}

- (BKSHIDEventAuthenticationMessage)eventAuthenticationMessage
{
  return self->_eventAuthenticationMessage;
}

- (void)setEventAuthenticationMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)searchStringForMarkedText
{
  return self->_searchStringForMarkedText;
}

- (TIKeyboardCandidate)currentCandidate
{
  return self->_currentCandidate;
}

@end
