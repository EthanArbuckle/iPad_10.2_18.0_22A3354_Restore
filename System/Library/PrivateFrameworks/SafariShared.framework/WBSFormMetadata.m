@implementation WBSFormMetadata

- (BOOL)isEqual:(id)a3
{
  id v4;
  WBSFormMetadata *v5;
  WBSFormMetadata *v6;
  NSDictionary *annotations;
  NSString *confirmPasswordElementUniqueID;
  NSString *firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
  NSURL *action;
  NSArray *controls;
  NSString *oldPasswordElementUniqueID;
  NSString *passwordElementUniqueID;
  NSString *textSample;
  NSString *userNameElementUniqueID;
  char v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (WBSFormMetadata *)v4;
    v6 = v5;
    if (self != v5)
    {
      if (self->_uniqueID != v5->_uniqueID)
        goto LABEL_35;
      if (self->_allowsAutocomplete != v5->_allowsAutocomplete)
        goto LABEL_35;
      if (self->_type != v5->_type)
        goto LABEL_35;
      if (self->_containsActiveElement != v5->_containsActiveElement)
        goto LABEL_35;
      if (!WBSIsEqual())
        goto LABEL_35;
      if (self->_bestForPageLevelAutoFill != v6->_bestForPageLevelAutoFill)
        goto LABEL_35;
      if (self->_bestForStreamlinedLogin != v6->_bestForStreamlinedLogin)
        goto LABEL_35;
      if (self->_eligibleForAutomaticLogin != v6->_eligibleForAutomaticLogin)
        goto LABEL_35;
      if (self->_visible != v6->_visible)
        goto LABEL_35;
      if (self->_usesRelAsync != v6->_usesRelAsync)
        goto LABEL_35;
      if (self->_usesGeneratedPassword != v6->_usesGeneratedPassword)
        goto LABEL_35;
      if (self->_requestType != v6->_requestType)
        goto LABEL_35;
      if (self->_isSearchForm != v6->_isSearchForm)
        goto LABEL_35;
      annotations = self->_annotations;
      if (annotations != v6->_annotations && !-[NSDictionary isEqualToDictionary:](annotations, "isEqualToDictionary:"))
        goto LABEL_35;
      if ((confirmPasswordElementUniqueID = self->_confirmPasswordElementUniqueID,
            confirmPasswordElementUniqueID != v6->_confirmPasswordElementUniqueID)
        && !-[NSString isEqualToString:](confirmPasswordElementUniqueID, "isEqualToString:")
        || (firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = self->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID,
            firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID != v6->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID)
        && !-[NSString isEqualToString:](firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID, "isEqualToString:")|| (action = self->_action, action != v6->_action) && !-[NSURL isEqual:](action, "isEqual:")|| (controls = self->_controls, controls != v6->_controls)&& !-[NSArray isEqualToArray:](controls, "isEqualToArray:")|| (oldPasswordElementUniqueID = self->_oldPasswordElementUniqueID, oldPasswordElementUniqueID != v6->_oldPasswordElementUniqueID)&& !-[NSString isEqualToString:](oldPasswordElementUniqueID, "isEqualToString:")|| (passwordElementUniqueID = self->_passwordElementUniqueID, passwordElementUniqueID != v6->_passwordElementUniqueID)&& !-[NSString isEqualToString:](passwordElementUniqueID, "isEqualToString:")|| (textSample = self->_textSample, textSample != v6->_textSample)&& !-[NSString isEqualToString:](textSample, "isEqualToString:"))
      {
LABEL_35:
        v16 = 0;
        goto LABEL_37;
      }
      userNameElementUniqueID = self->_userNameElementUniqueID;
      if (userNameElementUniqueID != v6->_userNameElementUniqueID)
      {
        v16 = -[NSString isEqualToString:](userNameElementUniqueID, "isEqualToString:");
LABEL_37:

        goto LABEL_38;
      }
    }
    v16 = 1;
    goto LABEL_37;
  }
  v16 = 0;
LABEL_38:

  return v16;
}

- (NSArray)controls
{
  return self->_controls;
}

- (unint64_t)hash
{
  return self->_uniqueID;
}

- (WBSFormMetadata)initWithJSValue:(id)a3
{
  id v4;
  WBSFormMetadata *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *annotations;
  void *v10;
  uint64_t v11;
  NSString *confirmPasswordElementUniqueID;
  void *v13;
  uint64_t v14;
  NSString *firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
  void *v16;
  void *v17;
  uint64_t v18;
  NSURL *action;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *controls;
  void *v24;
  double v25;
  uint64_t v26;
  NSString *logicalFormElementSelector;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *oldPasswordElementUniqueID;
  uint64_t v35;
  NSString *passwordElementUniqueID;
  uint64_t v37;
  NSString *textSample;
  uint64_t v39;
  NSString *userNameElementUniqueID;
  void *v41;
  void *v42;
  void *v43;
  WBSFormMetadata *v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)WBSFormMetadata;
  v5 = -[WBSFormMetadata init](&v46, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DisallowsAutocomplete"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_allowsAutocomplete = objc_msgSend(v6, "toBool") ^ 1;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Annotations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toDictionary");
  v8 = objc_claimAutoreleasedReturnValue();
  annotations = v5->_annotations;
  v5->_annotations = (NSDictionary *)v8;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AutoFillFormType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_type = (int)objc_msgSend(v10, "toInt32");

  if (v5->_type > 5)
    goto LABEL_5;
  stringForKey(v4, (uint64_t)CFSTR("ConfirmPasswordElementUniqueID"));
  v11 = objc_claimAutoreleasedReturnValue();
  confirmPasswordElementUniqueID = v5->_confirmPasswordElementUniqueID;
  v5->_confirmPasswordElementUniqueID = (NSString *)v11;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ContainsActiveElement"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_containsActiveElement = objc_msgSend(v13, "toBool");

  stringForKey(v4, (uint64_t)CFSTR("FirstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID"));
  v14 = objc_claimAutoreleasedReturnValue();
  firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = v5->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
  v5->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = (NSString *)v14;

  v16 = (void *)MEMORY[0x1E0C99E98];
  stringForKey(v4, (uint64_t)CFSTR("FormAction"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safari_URLWithDataAsString:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  action = v5->_action;
  v5->_action = (NSURL *)v18;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FormControls"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "toArray");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "safari_mapObjectsUsingBlock:", &__block_literal_global_49);
  v22 = objc_claimAutoreleasedReturnValue();
  controls = v5->_controls;
  v5->_controls = (NSArray *)v22;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FormID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "toDouble");
  v5->_uniqueID = (uint64_t)v25;

  stringForKey(v4, (uint64_t)CFSTR("LogicalFormElementSelector"));
  v26 = objc_claimAutoreleasedReturnValue();
  logicalFormElementSelector = v5->_logicalFormElementSelector;
  v5->_logicalFormElementSelector = (NSString *)v26;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FormIsBestForPageLevelAutoFill"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_bestForPageLevelAutoFill = objc_msgSend(v28, "toBool");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FormIsBestForStreamlinedLogin"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_bestForStreamlinedLogin = objc_msgSend(v29, "toBool");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FormIsEligibleForAutomaticLogin"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_eligibleForAutomaticLogin = objc_msgSend(v30, "toBool");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsVisible"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_visible = objc_msgSend(v31, "toBool");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FormUsesRelAsync"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_usesRelAsync = objc_msgSend(v32, "toBool");

  stringForKey(v4, (uint64_t)CFSTR("OldPasswordElementUniqueID"));
  v33 = objc_claimAutoreleasedReturnValue();
  oldPasswordElementUniqueID = v5->_oldPasswordElementUniqueID;
  v5->_oldPasswordElementUniqueID = (NSString *)v33;

  stringForKey(v4, (uint64_t)CFSTR("PasswordElementUniqueID"));
  v35 = objc_claimAutoreleasedReturnValue();
  passwordElementUniqueID = v5->_passwordElementUniqueID;
  v5->_passwordElementUniqueID = (NSString *)v35;

  stringForKey(v4, (uint64_t)CFSTR("TextSample"));
  v37 = objc_claimAutoreleasedReturnValue();
  textSample = v5->_textSample;
  v5->_textSample = (NSString *)v37;

  stringForKey(v4, (uint64_t)CFSTR("UsernameElementUniqueID"));
  v39 = objc_claimAutoreleasedReturnValue();
  userNameElementUniqueID = v5->_userNameElementUniqueID;
  v5->_userNameElementUniqueID = (NSString *)v39;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UsesGeneratedPassword"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_usesGeneratedPassword = objc_msgSend(v41, "toBool");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestType"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_requestType = (int)objc_msgSend(v42, "toInt32");

  if (v5->_requestType <= 4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FormIsSearchForm"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isSearchForm = objc_msgSend(v43, "toBool");

    v44 = v5;
  }
  else
  {
LABEL_5:
    v44 = 0;
  }

  return v44;
}

WBSFormControlMetadata *__35__WBSFormMetadata_initWithJSValue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSFormControlMetadata *v3;

  v2 = a2;
  v3 = -[WBSFormControlMetadata initWithDictionary:]([WBSFormControlMetadata alloc], "initWithDictionary:", v2);

  return v3;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WBSFormMetadata;
  return -[WBSFormMetadata init](&v3, sel_init);
}

- (id)formMetadataByReplacingControlsWith:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v4 = a3;
  v5 = -[WBSFormMetadata _init]([WBSFormMetadata alloc], "_init");
  *((_BYTE *)v5 + 24) = self->_allowsAutocomplete;
  *((_QWORD *)v5 + 6) = self->_type;
  *((_BYTE *)v5 + 25) = self->_containsActiveElement;
  *((_QWORD *)v5 + 10) = self->_uniqueID;
  objc_storeStrong((id *)v5 + 11, self->_logicalFormElementSelector);
  *((_BYTE *)v5 + 26) = self->_bestForPageLevelAutoFill;
  *((_BYTE *)v5 + 27) = self->_bestForStreamlinedLogin;
  *((_BYTE *)v5 + 28) = self->_eligibleForAutomaticLogin;
  *((_BYTE *)v5 + 29) = self->_visible;
  *((_BYTE *)v5 + 30) = self->_usesRelAsync;
  *((_BYTE *)v5 + 31) = self->_usesGeneratedPassword;
  *((_QWORD *)v5 + 16) = self->_requestType;
  *((_BYTE *)v5 + 32) = self->_isSearchForm;
  v6 = -[NSDictionary copy](self->_annotations, "copy");
  v7 = (void *)*((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v6;

  v8 = -[NSString copy](self->_confirmPasswordElementUniqueID, "copy");
  v9 = (void *)*((_QWORD *)v5 + 7);
  *((_QWORD *)v5 + 7) = v8;

  v10 = -[NSString copy](self->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID, "copy");
  v11 = (void *)*((_QWORD *)v5 + 8);
  *((_QWORD *)v5 + 8) = v10;

  objc_storeStrong((id *)v5 + 9, self->_action);
  v12 = objc_msgSend(v4, "mutableCopy");

  v13 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v12;

  v14 = -[NSString copy](self->_oldPasswordElementUniqueID, "copy");
  v15 = (void *)*((_QWORD *)v5 + 12);
  *((_QWORD *)v5 + 12) = v14;

  v16 = -[NSString copy](self->_passwordElementUniqueID, "copy");
  v17 = (void *)*((_QWORD *)v5 + 13);
  *((_QWORD *)v5 + 13) = v16;

  v18 = -[NSString copy](self->_textSample, "copy");
  v19 = (void *)*((_QWORD *)v5 + 14);
  *((_QWORD *)v5 + 14) = v18;

  v20 = -[NSString copy](self->_userNameElementUniqueID, "copy");
  v21 = (void *)*((_QWORD *)v5 + 15);
  *((_QWORD *)v5 + 15) = v20;

  v22 = -[NSDictionary copy](self->_passwordRequirements, "copy");
  v23 = (void *)*((_QWORD *)v5 + 17);
  *((_QWORD *)v5 + 17) = v22;

  return v5;
}

- (id)dictionaryRepresentationRedactingSensitiveValues:(BOOL)a3 withKnownSensitiveValues:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *confirmPasswordElementUniqueID;
  NSString *firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
  NSURL *action;
  void *v14;
  NSArray *controls;
  void *v16;
  NSString *oldPasswordElementUniqueID;
  NSString *passwordElementUniqueID;
  void *v19;
  NSString *userNameElementUniqueID;
  unint64_t requestType;
  void *v22;
  NSDictionary *passwordRequirements;
  NSString *logicalFormElementSelector;
  void *v26;
  _BOOL4 v27;
  id v28;
  _QWORD v29[4];
  BOOL v30;

  v27 = a3;
  v28 = a4;
  v26 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_containsActiveElement);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)self->_uniqueID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_visible);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_usesGeneratedPassword);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v5, CFSTR("AutoFillFormType"), v6, CFSTR("ContainsActiveElement"), v7, CFSTR("FormID"), v8, CFSTR("IsVisible"), v9, CFSTR("UsesGeneratedPassword"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_allowsAutocomplete)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("DisallowsAutocomplete"));
  if (self->_annotations && !v27)
    objc_msgSend(v10, "setObject:forKeyedSubscript:");
  confirmPasswordElementUniqueID = self->_confirmPasswordElementUniqueID;
  if (confirmPasswordElementUniqueID)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", confirmPasswordElementUniqueID, CFSTR("ConfirmPasswordElementUniqueID"));
  firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = self->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
  if (firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID, CFSTR("FirstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID"));
  action = self->_action;
  if (action && !v27)
  {
    -[NSURL safari_originalDataAsString](action, "safari_originalDataAsString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("FormAction"));

  }
  controls = self->_controls;
  if (controls)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __93__WBSFormMetadata_dictionaryRepresentationRedactingSensitiveValues_withKnownSensitiveValues___block_invoke;
    v29[3] = &__block_descriptor_33_e46___NSDictionary_16__0__WBSFormControlMetadata_8l;
    v30 = v27;
    -[NSArray safari_mapObjectsUsingBlock:](controls, "safari_mapObjectsUsingBlock:", v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("FormControls"));

  }
  oldPasswordElementUniqueID = self->_oldPasswordElementUniqueID;
  if (oldPasswordElementUniqueID)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", oldPasswordElementUniqueID, CFSTR("OldPasswordElementUniqueID"));
  passwordElementUniqueID = self->_passwordElementUniqueID;
  if (passwordElementUniqueID)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", passwordElementUniqueID, CFSTR("PasswordElementUniqueID"));
  if (self->_textSample)
  {
    if (v28 && v27)
    {
      -[NSString safari_stringByRedactingStrings:withReplacement:](self->_textSample, "safari_stringByRedactingStrings:withReplacement:", v28, CFSTR("<redacted>"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("TextSample"));

    }
    else
    {
      objc_msgSend(v10, "setObject:forKeyedSubscript:");
    }
  }
  userNameElementUniqueID = self->_userNameElementUniqueID;
  if (userNameElementUniqueID)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", userNameElementUniqueID, CFSTR("UsernameElementUniqueID"));
  if (self->_usesRelAsync)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("FormUsesRelAsync"));
  if (self->_bestForPageLevelAutoFill)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("FormIsBestForPageLevelAutoFill"));
  if (self->_bestForStreamlinedLogin)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("FormIsBestForStreamlinedLogin"));
  if (self->_eligibleForAutomaticLogin)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("FormIsEligibleForAutomaticLogin"));
  requestType = self->_requestType;
  if (requestType <= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)requestType);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("RequestType"));

  }
  if (self->_isSearchForm)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("FormIsSearchForm"));
  passwordRequirements = self->_passwordRequirements;
  if (passwordRequirements)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", passwordRequirements, CFSTR("PasswordRequirements"));
  logicalFormElementSelector = self->_logicalFormElementSelector;
  if (logicalFormElementSelector && -[NSString length](logicalFormElementSelector, "length"))
    objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_logicalFormElementSelector, CFSTR("LogicalFormElementSelector"));

  return v10;
}

uint64_t __93__WBSFormMetadata_dictionaryRepresentationRedactingSensitiveValues_withKnownSensitiveValues___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentationRedactingSensitiveValues:", *(unsigned __int8 *)(a1 + 32));
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)-[WBSFormMetadata dictionaryRepresentationRedactingSensitiveValues:withKnownSensitiveValues:](self, "dictionaryRepresentationRedactingSensitiveValues:withKnownSensitiveValues:", 0, 0);
}

- (NSData)serializedData
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[WBSFormMetadata serializedData].cold.1(v4, v3);
  }

  return (NSData *)v2;
}

+ (id)formMetadataFromSerializedData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v18;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "_strictlyUnarchivedObjectOfClasses:fromData:error:", v12, v3, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    if (v14)
    {
      v15 = WBS_LOG_CHANNEL_PREFIXKeyedArchiver();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[WBSFormMetadata formMetadataFromSerializedData:].cold.1(v15, v14);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v13;
LABEL_9:

        goto LABEL_10;
      }
    }
    v16 = 0;
    goto LABEL_9;
  }
  v16 = 0;
LABEL_10:

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  NSDictionary *annotations;
  NSString *confirmPasswordElementUniqueID;
  NSString *firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
  NSURL *action;
  NSArray *controls;
  NSString *oldPasswordElementUniqueID;
  NSString *passwordElementUniqueID;
  NSString *textSample;
  NSString *userNameElementUniqueID;
  NSDictionary *passwordRequirements;
  NSString *logicalFormElementSelector;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "encodeInteger:forKey:", self->_type, CFSTR("AutoFillFormType"));
  objc_msgSend(v16, "encodeInteger:forKey:", self->_uniqueID, CFSTR("FormID"));
  if (!self->_allowsAutocomplete)
    objc_msgSend(v16, "encodeBool:forKey:", 1, CFSTR("DisallowsAutocomplete"));
  if (self->_containsActiveElement)
    objc_msgSend(v16, "encodeBool:forKey:", 1, CFSTR("ContainsActiveElement"));
  v4 = v16;
  if (self->_visible)
  {
    objc_msgSend(v16, "encodeBool:forKey:", 1, CFSTR("IsVisible"));
    v4 = v16;
  }
  if (self->_usesGeneratedPassword)
  {
    objc_msgSend(v16, "encodeBool:forKey:", 1, CFSTR("UsesGeneratedPassword"));
    v4 = v16;
  }
  annotations = self->_annotations;
  if (annotations)
  {
    objc_msgSend(v16, "encodeObject:forKey:", annotations, CFSTR("Annotations"));
    v4 = v16;
  }
  confirmPasswordElementUniqueID = self->_confirmPasswordElementUniqueID;
  if (confirmPasswordElementUniqueID)
  {
    objc_msgSend(v16, "encodeObject:forKey:", confirmPasswordElementUniqueID, CFSTR("ConfirmPasswordElementUniqueID"));
    v4 = v16;
  }
  firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = self->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
  if (firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID)
  {
    objc_msgSend(v16, "encodeObject:forKey:", firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID, CFSTR("FirstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID"));
    v4 = v16;
  }
  action = self->_action;
  if (action)
  {
    objc_msgSend(v16, "encodeObject:forKey:", action, CFSTR("FormAction"));
    v4 = v16;
  }
  controls = self->_controls;
  if (controls)
  {
    objc_msgSend(v16, "encodeObject:forKey:", controls, CFSTR("FormControls"));
    v4 = v16;
  }
  oldPasswordElementUniqueID = self->_oldPasswordElementUniqueID;
  if (oldPasswordElementUniqueID)
  {
    objc_msgSend(v16, "encodeObject:forKey:", oldPasswordElementUniqueID, CFSTR("OldPasswordElementUniqueID"));
    v4 = v16;
  }
  passwordElementUniqueID = self->_passwordElementUniqueID;
  if (passwordElementUniqueID)
  {
    objc_msgSend(v16, "encodeObject:forKey:", passwordElementUniqueID, CFSTR("PasswordElementUniqueID"));
    v4 = v16;
  }
  textSample = self->_textSample;
  if (textSample)
  {
    objc_msgSend(v16, "encodeObject:forKey:", textSample, CFSTR("TextSample"));
    v4 = v16;
  }
  userNameElementUniqueID = self->_userNameElementUniqueID;
  if (userNameElementUniqueID)
  {
    objc_msgSend(v16, "encodeObject:forKey:", userNameElementUniqueID, CFSTR("UsernameElementUniqueID"));
    v4 = v16;
  }
  if (self->_usesRelAsync)
  {
    objc_msgSend(v16, "encodeBool:forKey:", 1, CFSTR("FormUsesRelAsync"));
    v4 = v16;
  }
  if (self->_bestForPageLevelAutoFill)
  {
    objc_msgSend(v16, "encodeBool:forKey:", 1, CFSTR("FormIsBestForPageLevelAutoFill"));
    v4 = v16;
  }
  if (self->_bestForStreamlinedLogin)
  {
    objc_msgSend(v16, "encodeBool:forKey:", 1, CFSTR("FormIsBestForStreamlinedLogin"));
    v4 = v16;
  }
  if (self->_eligibleForAutomaticLogin)
  {
    objc_msgSend(v16, "encodeBool:forKey:", 1, CFSTR("FormIsEligibleForAutomaticLogin"));
    v4 = v16;
  }
  if (self->_requestType <= 4)
  {
    objc_msgSend(v16, "encodeInteger:forKey:");
    v4 = v16;
  }
  if (self->_isSearchForm)
  {
    objc_msgSend(v16, "encodeBool:forKey:", 1, CFSTR("FormIsSearchForm"));
    v4 = v16;
  }
  passwordRequirements = self->_passwordRequirements;
  if (passwordRequirements)
  {
    objc_msgSend(v16, "encodeObject:forKey:", passwordRequirements, CFSTR("PasswordRequirements"));
    v4 = v16;
  }
  logicalFormElementSelector = self->_logicalFormElementSelector;
  if (logicalFormElementSelector)
  {
    objc_msgSend(v16, "encodeObject:forKey:", logicalFormElementSelector, CFSTR("LogicalFormElementSelector"));
    v4 = v16;
  }

}

- (WBSFormMetadata)initWithCoder:(id)a3
{
  id v4;
  WBSFormMetadata *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSString *logicalFormElementSelector;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *annotations;
  uint64_t v16;
  NSString *confirmPasswordElementUniqueID;
  uint64_t v18;
  NSString *firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
  uint64_t v20;
  NSURL *action;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *controls;
  char isKindOfClass;
  NSArray *v29;
  uint64_t v30;
  NSArray *v31;
  uint64_t v32;
  NSString *oldPasswordElementUniqueID;
  uint64_t v34;
  NSString *passwordElementUniqueID;
  uint64_t v36;
  NSString *textSample;
  uint64_t v38;
  NSString *userNameElementUniqueID;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSDictionary *passwordRequirements;
  WBSFormMetadata *v50;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)WBSFormMetadata;
  v5 = -[WBSFormMetadata init](&v52, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AutoFillFormType"));
    v5->_type = v7;
    if (v7 >= 6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C10], CFSTR("Form type is invalid: %lu"), v7);
    v5->_uniqueID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FormID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("LogicalFormElementSelector"));
    v8 = objc_claimAutoreleasedReturnValue();
    logicalFormElementSelector = v5->_logicalFormElementSelector;
    v5->_logicalFormElementSelector = (NSString *)v8;

    v5->_allowsAutocomplete = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisallowsAutocomplete")) ^ 1;
    v5->_containsActiveElement = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ContainsActiveElement"));
    v5->_visible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsVisible"));
    v5->_usesGeneratedPassword = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UsesGeneratedPassword"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v6, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("Annotations"));
    v14 = objc_claimAutoreleasedReturnValue();
    annotations = v5->_annotations;
    v5->_annotations = (NSDictionary *)v14;

    if (v5->_annotations)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C10], CFSTR("Annotations is not a dictionary: %@"), v5->_annotations);
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("ConfirmPasswordElementUniqueID"));
    v16 = objc_claimAutoreleasedReturnValue();
    confirmPasswordElementUniqueID = v5->_confirmPasswordElementUniqueID;
    v5->_confirmPasswordElementUniqueID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("FirstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID"));
    v18 = objc_claimAutoreleasedReturnValue();
    firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = v5->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
    v5->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FormAction"));
    v20 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (NSURL *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("FormControls"));
    v26 = objc_claimAutoreleasedReturnValue();
    controls = v5->_controls;
    v5->_controls = (NSArray *)v26;

    if (v5->_controls)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v29 = v5->_controls;
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C10], CFSTR("Controls is not an array: %@"), v5->_controls);
        v29 = v5->_controls;
      }
    }
    else
    {
      v29 = 0;
    }
    -[NSArray safari_mapObjectsUsingBlock:](v29, "safari_mapObjectsUsingBlock:", &__block_literal_global_24_1);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v5->_controls;
    v5->_controls = (NSArray *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("OldPasswordElementUniqueID"));
    v32 = objc_claimAutoreleasedReturnValue();
    oldPasswordElementUniqueID = v5->_oldPasswordElementUniqueID;
    v5->_oldPasswordElementUniqueID = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("PasswordElementUniqueID"));
    v34 = objc_claimAutoreleasedReturnValue();
    passwordElementUniqueID = v5->_passwordElementUniqueID;
    v5->_passwordElementUniqueID = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("TextSample"));
    v36 = objc_claimAutoreleasedReturnValue();
    textSample = v5->_textSample;
    v5->_textSample = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("UsernameElementUniqueID"));
    v38 = objc_claimAutoreleasedReturnValue();
    userNameElementUniqueID = v5->_userNameElementUniqueID;
    v5->_userNameElementUniqueID = (NSString *)v38;

    v5->_usesRelAsync = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FormUsesRelAsync"));
    v5->_bestForPageLevelAutoFill = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FormIsBestForPageLevelAutoFill"));
    v5->_bestForStreamlinedLogin = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FormIsBestForStreamlinedLogin"));
    v5->_eligibleForAutomaticLogin = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FormIsEligibleForAutomaticLogin"));
    v40 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RequestType"));
    v5->_requestType = v40;
    if (v40 >= 5)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C10], CFSTR("Request type is invalid: %lu"), v40);
    v5->_isSearchForm = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FormIsSearchForm"));
    v41 = (void *)MEMORY[0x1E0C99E60];
    v42 = objc_opt_class();
    v43 = objc_opt_class();
    v44 = objc_opt_class();
    v45 = objc_opt_class();
    v46 = objc_opt_class();
    objc_msgSend(v41, "setWithObjects:", v42, v43, v44, v45, v46, v6, objc_opt_class(), 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("PasswordRequirements"));
    v48 = objc_claimAutoreleasedReturnValue();
    passwordRequirements = v5->_passwordRequirements;
    v5->_passwordRequirements = (NSDictionary *)v48;

    v50 = v5;
  }

  return v5;
}

id __33__WBSFormMetadata_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "mutableCopy");
}

- (BOOL)containsAtLeastOneSecureTextField
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSNumber *containsAtLeastOneSecureTextField;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_containsAtLeastOneSecureTextField)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = self->_controls;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isSecureTextField", (_QWORD)v10))
          {
            containsAtLeastOneSecureTextField = self->_containsAtLeastOneSecureTextField;
            self->_containsAtLeastOneSecureTextField = (NSNumber *)MEMORY[0x1E0C9AAB0];

            goto LABEL_12;
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return -[NSNumber BOOLValue](self->_containsAtLeastOneSecureTextField, "BOOLValue", (_QWORD)v10);
}

- (BOOL)containsClassifications
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_controls;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "classification", (_QWORD)v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)userNameFieldValue
{
  return (NSString *)-[WBSFormMetadata _valueOfControlWithUniqueID:](self, "_valueOfControlWithUniqueID:", self->_userNameElementUniqueID);
}

- (NSString)passwordFieldValue
{
  return (NSString *)-[WBSFormMetadata _valueOfControlWithUniqueID:](self, "_valueOfControlWithUniqueID:", self->_passwordElementUniqueID);
}

- (id)_valueOfControlWithUniqueID:(id)a3
{
  id v4;
  NSArray *controls;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    controls = self->_controls;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __47__WBSFormMetadata__valueOfControlWithUniqueID___block_invoke;
    v9[3] = &unk_1E4B39D38;
    v10 = v4;
    -[NSArray safari_firstObjectPassingTest:](controls, "safari_firstObjectPassingTest:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __47__WBSFormMetadata__valueOfControlWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)allowsAutocomplete
{
  return self->_allowsAutocomplete;
}

- (NSDictionary)annotations
{
  return self->_annotations;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)confirmPasswordElementUniqueID
{
  return self->_confirmPasswordElementUniqueID;
}

- (BOOL)containsActiveElement
{
  return self->_containsActiveElement;
}

- (NSString)firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID
{
  return self->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID;
}

- (NSURL)action
{
  return self->_action;
}

- (int64_t)uniqueID
{
  return self->_uniqueID;
}

- (NSString)logicalFormElementSelector
{
  return self->_logicalFormElementSelector;
}

- (BOOL)isBestForPageLevelAutoFill
{
  return self->_bestForPageLevelAutoFill;
}

- (BOOL)isBestForStreamlinedLogin
{
  return self->_bestForStreamlinedLogin;
}

- (BOOL)isEligibleForAutomaticLogin
{
  return self->_eligibleForAutomaticLogin;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (BOOL)usesRelAsync
{
  return self->_usesRelAsync;
}

- (NSString)oldPasswordElementUniqueID
{
  return self->_oldPasswordElementUniqueID;
}

- (NSString)passwordElementUniqueID
{
  return self->_passwordElementUniqueID;
}

- (NSString)textSample
{
  return self->_textSample;
}

- (NSString)userNameElementUniqueID
{
  return self->_userNameElementUniqueID;
}

- (BOOL)usesGeneratedPassword
{
  return self->_usesGeneratedPassword;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (BOOL)isSearchForm
{
  return self->_isSearchForm;
}

- (NSDictionary)passwordRequirements
{
  return self->_passwordRequirements;
}

- (void)setPasswordRequirements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordRequirements, 0);
  objc_storeStrong((id *)&self->_userNameElementUniqueID, 0);
  objc_storeStrong((id *)&self->_textSample, 0);
  objc_storeStrong((id *)&self->_passwordElementUniqueID, 0);
  objc_storeStrong((id *)&self->_oldPasswordElementUniqueID, 0);
  objc_storeStrong((id *)&self->_logicalFormElementSelector, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_firstCreditCardCardholderFieldOrCreditCardNumberFieldUniqueID, 0);
  objc_storeStrong((id *)&self->_confirmPasswordElementUniqueID, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_containsAtLeastOneSecureTextField, 0);
}

- (void)serializedData
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to archive WBSFormMetadata: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

+ (void)formMetadataFromSerializedData:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0(&dword_1A3D90000, v5, v6, "Failed to read from WBSFormMetadata data with exception: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

@end
