@implementation RTIDocumentTraits

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (int)processId
{
  return self->_processId;
}

- (void)dealloc
{
  objc_super v3;

  -[CAFenceHandle invalidate](self->_fenceHandle, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)RTIDocumentTraits;
  -[RTIDocumentTraits dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardActionButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_additionalLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_textInputModeData, 0);
  objc_storeStrong((id *)&self->_fenceHandle, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_supportedPayloadIds, 0);
  objc_storeStrong((id *)&self->_enabledSupplementalLexiconIdentifiers, 0);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_responseContext, 0);
  objc_storeStrong((id *)&self->_recipientId, 0);
  objc_storeStrong((id *)&self->_passwordRules, 0);
  objc_storeStrong((id *)&self->_autofillContext, 0);
  objc_storeStrong((id *)&self->_PINEntrySeparatorIndexes, 0);
  objc_storeStrong((id *)&self->_textInputContextIdentifier, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_assistantItem, 0);
  objc_storeStrong((id *)&self->_assistantViewInfo, 0);
  objc_storeStrong((id *)&self->_inputViewInfo, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_responderId, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t processId;
  NSString *appId;
  void *v6;
  NSString *bundleId;
  NSString *appName;
  NSString *localizedAppName;
  void *v10;
  void *v11;
  NSCopying *responderId;
  NSString *sceneID;
  unint64_t entityID;
  uint64_t contextID;
  unint64_t layerID;
  unint64_t delegateConformanceType;
  NSString *title;
  NSString *prompt;
  TITextInputTraits *textInputTraits;
  RTITextInputKeyboardActionButtonConfiguration *keyboardActionButtonConfiguration;
  NSString *textInputContextIdentifier;
  NSIndexSet *PINEntrySeparatorIndexes;
  NSUInteger length;
  unint64_t autofillMode;
  unint64_t autofillSubMode;
  NSString *passwordRules;
  RTIInputViewInfo *inputViewInfo;
  void *v29;
  RTIInputViewInfo *assistantViewInfo;
  RTIAssistantItem *assistantItem;
  NSString *recipientId;
  NSString *responseContext;
  TIInputContextHistory *inputContextHistory;
  NSArray *enabledSupplementalLexiconIdentifiers;
  NSArray *supportedPayloadIds;
  NSDictionary *userInfo;
  CAFenceHandle *fenceHandle;
  NSData *textInputModeData;
  NSArray *additionalLocaleIdentifiers;
  uint64_t integerValue;
  id v42;

  v42 = a3;
  if ((objc_msgSend(v42, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  processId = self->_processId;
  if ((_DWORD)processId)
    objc_msgSend(v42, "encodeInt32:forKey:", processId, CFSTR("pId"));
  appId = self->_appId;
  if (appId)
  {
    if (self->_bundleId)
    {
      if (-[NSString hasSuffix:](self->_appId, "hasSuffix:", self->_bundleId))
      {
        objc_msgSend(v42, "encodeBool:forKey:", 1, CFSTR("a2bId"));
        -[NSString substringToIndex:](self->_appId, "substringToIndex:", -[NSString length](self->_appId, "length") - -[NSString length](self->_bundleId, "length"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "encodeObject:forKey:", v6, CFSTR("aId"));

        goto LABEL_11;
      }
      appId = self->_appId;
    }
    objc_msgSend(v42, "encodeObject:forKey:", appId, CFSTR("aId"));
  }
LABEL_11:
  bundleId = self->_bundleId;
  if (bundleId)
    objc_msgSend(v42, "encodeObject:forKey:", bundleId, CFSTR("bId"));
  appName = self->_appName;
  if (appName)
    objc_msgSend(v42, "encodeObject:forKey:", appName, CFSTR("app"));
  localizedAppName = self->_localizedAppName;
  if (localizedAppName)
    objc_msgSend(v42, "encodeObject:forKey:", localizedAppName, CFSTR("locApp"));
  if (-[NSArray count](self->_associatedDomains, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_associatedDomains, "componentsJoinedByString:", CFSTR("\n"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    objc_msgSend(v42, "encodeObject:forKey:", v11, CFSTR("assdDmns"));
  }
  responderId = self->_responderId;
  if (responderId)
    objc_msgSend(v42, "encodeObject:forKey:", responderId, CFSTR("rId"));
  sceneID = self->_sceneID;
  if (sceneID)
    objc_msgSend(v42, "encodeObject:forKey:", sceneID, CFSTR("sceneId"));
  entityID = self->_entityID;
  if (entityID)
    objc_msgSend(v42, "encodeInt64:forKey:", entityID, CFSTR("entityId"));
  contextID = self->_contextID;
  if ((_DWORD)contextID)
    objc_msgSend(v42, "encodeInt32:forKey:", contextID, CFSTR("ctxId"));
  layerID = self->_layerID;
  if (layerID)
    objc_msgSend(v42, "encodeInt64:forKey:", layerID, CFSTR("layerId"));
  delegateConformanceType = self->_delegateConformanceType;
  if (delegateConformanceType)
    objc_msgSend(v42, "encodeInt32:forKey:", delegateConformanceType, CFSTR("cfmType"));
  title = self->_title;
  if (title)
    objc_msgSend(v42, "encodeObject:forKey:", title, CFSTR("title"));
  prompt = self->_prompt;
  if (prompt)
    objc_msgSend(v42, "encodeObject:forKey:", prompt, CFSTR("prompt"));
  textInputTraits = self->_textInputTraits;
  if (textInputTraits)
    objc_msgSend(v42, "encodeObject:forKey:", textInputTraits, CFSTR("tiTraits"));
  keyboardActionButtonConfiguration = self->_keyboardActionButtonConfiguration;
  if (keyboardActionButtonConfiguration)
    objc_msgSend(v42, "encodeObject:forKey:", keyboardActionButtonConfiguration, CFSTR("kABC"));
  textInputContextIdentifier = self->_textInputContextIdentifier;
  if (textInputContextIdentifier)
    objc_msgSend(v42, "encodeObject:forKey:", textInputContextIdentifier, CFSTR("tiCtxId"));
  PINEntrySeparatorIndexes = self->_PINEntrySeparatorIndexes;
  if (PINEntrySeparatorIndexes)
    objc_msgSend(v42, "encodeObject:forKey:", PINEntrySeparatorIndexes, CFSTR("pinIdxs"));
  length = self->_validTextRange.length;
  if (self->_validTextRange.location || length != -1)
    objc_msgSend(v42, "encodeInt32:forKey:", (unsigned __int16)self->_validTextRange.location | ((unsigned __int16)length << 16), CFSTR("validRange"));
  autofillMode = self->_autofillMode;
  if (autofillMode)
    objc_msgSend(v42, "encodeInt32:forKey:", autofillMode, CFSTR("afMode"));
  autofillSubMode = self->_autofillSubMode;
  if (autofillSubMode)
    objc_msgSend(v42, "encodeInt32:forKey:", autofillSubMode, CFSTR("afSubMode"));
  if (-[NSDictionary count](self->_autofillContext, "count"))
    objc_msgSend(v42, "encodeObject:forKey:", self->_autofillContext, CFSTR("afCtx"));
  passwordRules = self->_passwordRules;
  if (passwordRules)
    objc_msgSend(v42, "encodeObject:forKey:", passwordRules, CFSTR("pwRules"));
  inputViewInfo = self->_inputViewInfo;
  v29 = v42;
  if (inputViewInfo)
  {
    objc_msgSend(v42, "encodeObject:forKey:", inputViewInfo, CFSTR("ivInfo"));
    v29 = v42;
  }
  assistantViewInfo = self->_assistantViewInfo;
  if (assistantViewInfo)
  {
    objc_msgSend(v42, "encodeObject:forKey:", assistantViewInfo, CFSTR("avInfo"));
    v29 = v42;
  }
  assistantItem = self->_assistantItem;
  if (assistantItem)
  {
    objc_msgSend(v42, "encodeObject:forKey:", assistantItem, CFSTR("aItem"));
    v29 = v42;
  }
  recipientId = self->_recipientId;
  if (recipientId)
  {
    objc_msgSend(v42, "encodeObject:forKey:", recipientId, CFSTR("recpId"));
    v29 = v42;
  }
  responseContext = self->_responseContext;
  if (responseContext)
  {
    objc_msgSend(v42, "encodeObject:forKey:", responseContext, CFSTR("respCtx"));
    v29 = v42;
  }
  inputContextHistory = self->_inputContextHistory;
  if (inputContextHistory)
  {
    objc_msgSend(v42, "encodeObject:forKey:", inputContextHistory, CFSTR("ctxHistory"));
    v29 = v42;
  }
  enabledSupplementalLexiconIdentifiers = self->_enabledSupplementalLexiconIdentifiers;
  if (enabledSupplementalLexiconIdentifiers)
  {
    objc_msgSend(v42, "encodeObject:forKey:", enabledSupplementalLexiconIdentifiers, CFSTR("aSuppLexIds"));
    v29 = v42;
  }
  supportedPayloadIds = self->_supportedPayloadIds;
  if (supportedPayloadIds)
  {
    objc_msgSend(v42, "encodeObject:forKey:", supportedPayloadIds, CFSTR("payIds"));
    v29 = v42;
  }
  userInfo = self->_userInfo;
  if (userInfo)
  {
    objc_msgSend(v42, "encodeObject:forKey:", userInfo, CFSTR("userInfo"));
    v29 = v42;
  }
  fenceHandle = self->_fenceHandle;
  if (fenceHandle)
  {
    objc_msgSend(v42, "encodeObject:forKey:", fenceHandle, CFSTR("fenceHandle"));
    v29 = v42;
  }
  textInputModeData = self->_textInputModeData;
  if (textInputModeData)
  {
    objc_msgSend(v42, "encodeObject:forKey:", textInputModeData, CFSTR("inputModeData"));
    v29 = v42;
  }
  additionalLocaleIdentifiers = self->_additionalLocaleIdentifiers;
  if (additionalLocaleIdentifiers)
  {
    objc_msgSend(v42, "encodeObject:forKey:", additionalLocaleIdentifiers, CFSTR("addedLocales"));
    v29 = v42;
  }
  integerValue = self->_textInputTraitsMask.integerValue;
  if ((_DWORD)integerValue)
  {
    objc_msgSend(v42, "encodeInt32:forKey:", integerValue, CFSTR("traitsMask"));
    v29 = v42;
  }

}

- (NSString)appId
{
  return self->_appId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setProcessId:(int)a3
{
  self->_processId = a3;
}

- (void)setLocalizedAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setAppId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (RTIDocumentTraits)initWithCoder:(id)a3
{
  id v4;
  RTIDocumentTraits *v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSString *appId;
  void *v10;
  uint64_t v11;
  NSString *bundleId;
  uint64_t v13;
  NSString *v14;
  void *v15;
  uint64_t v16;
  NSString *appName;
  void *v18;
  uint64_t v19;
  NSString *localizedAppName;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *associatedDomains;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSCopying *responderId;
  void *v31;
  uint64_t v32;
  NSString *sceneID;
  void *v34;
  uint64_t v35;
  NSString *title;
  void *v37;
  uint64_t v38;
  NSString *prompt;
  uint64_t v40;
  TITextInputTraits *textInputTraits;
  uint64_t v42;
  RTITextInputKeyboardActionButtonConfiguration *keyboardActionButtonConfiguration;
  uint64_t v44;
  NSString *textInputContextIdentifier;
  uint64_t v46;
  NSIndexSet *PINEntrySeparatorIndexes;
  unsigned int v48;
  NSUInteger v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  NSDictionary *autofillContext;
  uint64_t v61;
  NSString *passwordRules;
  uint64_t v63;
  RTIInputViewInfo *inputViewInfo;
  uint64_t v65;
  RTIInputViewInfo *assistantViewInfo;
  uint64_t v67;
  RTIAssistantItem *assistantItem;
  uint64_t v69;
  NSString *recipientId;
  uint64_t v71;
  NSString *responseContext;
  uint64_t v73;
  TIInputContextHistory *inputContextHistory;
  uint64_t v75;
  NSArray *enabledSupplementalLexiconIdentifiers;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  NSArray *supportedPayloadIds;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  NSDictionary *userInfo;
  uint64_t v89;
  CAFenceHandle *fenceHandle;
  uint64_t v91;
  NSData *textInputModeData;
  void *v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  NSArray *additionalLocaleIdentifiers;
  objc_super v99;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v99.receiver = self;
  v99.super_class = (Class)RTIDocumentTraits;
  v5 = -[RTIDocumentTraits init](&v99, sel_init);
  if (v5)
  {
    v5->_processId = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pId"));
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("a2bId"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    appId = v5->_appId;
    v5->_appId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v11;

    if (v6 && v5->_bundleId)
    {
      -[NSString stringByAppendingString:](v5->_appId, "stringByAppendingString:");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v5->_appId;
      v5->_appId = (NSString *)v13;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("app"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    appName = v5->_appName;
    v5->_appName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locApp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    localizedAppName = v5->_localizedAppName;
    v5->_localizedAppName = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assdDmns"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("\n"));
      v23 = objc_claimAutoreleasedReturnValue();
      associatedDomains = v5->_associatedDomains;
      v5->_associatedDomains = (NSArray *)v23;

    }
    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("rId"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    responderId = v5->_responderId;
    v5->_responderId = (NSCopying *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneId"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    sceneID = v5->_sceneID;
    v5->_sceneID = (NSString *)v32;

    v5->_entityID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("entityId"));
    v5->_contextID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ctxId"));
    v5->_layerID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("layerId"));
    v5->_delegateConformanceType = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("cfmType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prompt"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "copy");
    prompt = v5->_prompt;
    v5->_prompt = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tiTraits"));
    v40 = objc_claimAutoreleasedReturnValue();
    textInputTraits = v5->_textInputTraits;
    v5->_textInputTraits = (TITextInputTraits *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kABC"));
    v42 = objc_claimAutoreleasedReturnValue();
    keyboardActionButtonConfiguration = v5->_keyboardActionButtonConfiguration;
    v5->_keyboardActionButtonConfiguration = (RTITextInputKeyboardActionButtonConfiguration *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tiCtxId"));
    v44 = objc_claimAutoreleasedReturnValue();
    textInputContextIdentifier = v5->_textInputContextIdentifier;
    v5->_textInputContextIdentifier = (NSString *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pinIdxs"));
    v46 = objc_claimAutoreleasedReturnValue();
    PINEntrySeparatorIndexes = v5->_PINEntrySeparatorIndexes;
    v5->_PINEntrySeparatorIndexes = (NSIndexSet *)v46;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("validRange")))
    {
      v48 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("validRange"));
      v49 = (unsigned __int16)v48;
      v50 = HIWORD(v48);
    }
    else
    {
      v49 = 0;
      v50 = -1;
    }
    v5->_validTextRange.location = v49;
    v5->_validTextRange.length = v50;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("afMode")))
      v51 = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("afMode"));
    else
      v51 = 0;
    v5->_autofillMode = v51;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("afSubMode")))
      v52 = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("afSubMode"));
    else
      v52 = 0;
    v5->_autofillSubMode = v52;
    v53 = (void *)MEMORY[0x1E0C99E60];
    v54 = objc_opt_class();
    v55 = objc_opt_class();
    v56 = objc_opt_class();
    v57 = objc_opt_class();
    objc_msgSend(v53, "setWithObjects:", v54, v55, v56, v57, objc_opt_class(), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v58, CFSTR("afCtx"));
    v59 = objc_claimAutoreleasedReturnValue();
    autofillContext = v5->_autofillContext;
    v5->_autofillContext = (NSDictionary *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pwRules"));
    v61 = objc_claimAutoreleasedReturnValue();
    passwordRules = v5->_passwordRules;
    v5->_passwordRules = (NSString *)v61;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ivInfo"));
    v63 = objc_claimAutoreleasedReturnValue();
    inputViewInfo = v5->_inputViewInfo;
    v5->_inputViewInfo = (RTIInputViewInfo *)v63;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("avInfo"));
    v65 = objc_claimAutoreleasedReturnValue();
    assistantViewInfo = v5->_assistantViewInfo;
    v5->_assistantViewInfo = (RTIInputViewInfo *)v65;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("aItem"));
    v67 = objc_claimAutoreleasedReturnValue();
    assistantItem = v5->_assistantItem;
    v5->_assistantItem = (RTIAssistantItem *)v67;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recpId"));
    v69 = objc_claimAutoreleasedReturnValue();
    recipientId = v5->_recipientId;
    v5->_recipientId = (NSString *)v69;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("respCtx"));
    v71 = objc_claimAutoreleasedReturnValue();
    responseContext = v5->_responseContext;
    v5->_responseContext = (NSString *)v71;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ctxHistory"));
    v73 = objc_claimAutoreleasedReturnValue();
    inputContextHistory = v5->_inputContextHistory;
    v5->_inputContextHistory = (TIInputContextHistory *)v73;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("aSuppLexIds"));
    v75 = objc_claimAutoreleasedReturnValue();
    enabledSupplementalLexiconIdentifiers = v5->_enabledSupplementalLexiconIdentifiers;
    v5->_enabledSupplementalLexiconIdentifiers = (NSArray *)v75;

    v77 = (void *)MEMORY[0x1E0C99E60];
    v78 = objc_opt_class();
    objc_msgSend(v77, "setWithObjects:", v78, objc_opt_class(), 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v79, CFSTR("payIds"));
    v80 = objc_claimAutoreleasedReturnValue();
    supportedPayloadIds = v5->_supportedPayloadIds;
    v5->_supportedPayloadIds = (NSArray *)v80;

    v82 = (void *)MEMORY[0x1E0C99E60];
    v83 = objc_opt_class();
    v84 = objc_opt_class();
    v85 = objc_opt_class();
    objc_msgSend(v82, "setWithObjects:", v83, v84, v85, objc_opt_class(), 0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v86, CFSTR("userInfo"));
    v87 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v87;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fenceHandle"));
    v89 = objc_claimAutoreleasedReturnValue();
    fenceHandle = v5->_fenceHandle;
    v5->_fenceHandle = (CAFenceHandle *)v89;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputModeData"));
    v91 = objc_claimAutoreleasedReturnValue();
    textInputModeData = v5->_textInputModeData;
    v5->_textInputModeData = (NSData *)v91;

    v93 = (void *)MEMORY[0x1E0C99E60];
    v94 = objc_opt_class();
    objc_msgSend(v93, "setWithObjects:", v94, objc_opt_class(), 0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v95, CFSTR("addedLocales"));
    v96 = objc_claimAutoreleasedReturnValue();
    additionalLocaleIdentifiers = v5->_additionalLocaleIdentifiers;
    v5->_additionalLocaleIdentifiers = (NSArray *)v96;

    v5->_textInputTraitsMask.integerValue = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("traitsMask"));
  }

  return v5;
}

- (unint64_t)autofillMode
{
  return self->_autofillMode;
}

- (BOOL)isExplicitAutoFillMode
{
  return HIBYTE(LOWORD(self->_textInputTraitsMask.integerValue)) & 1;
}

- (void)setTextInputContextIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setSupportedPayloadIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setSceneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setResponseContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setRecipientId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setPasswordRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setLayerID:(unint64_t)a3
{
  self->_layerID = a3;
}

- (void)setEnabledSupplementalLexiconIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setDelegateConformanceType:(unint64_t)a3
{
  self->_delegateConformanceType = a3;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (void)setAutofillSubMode:(unint64_t)a3
{
  self->_autofillSubMode = a3;
}

- (void)setAutofillMode:(unint64_t)a3
{
  self->_autofillMode = a3;
}

- (CAFenceHandle)fenceHandle
{
  return self->_fenceHandle;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (NSString)appName
{
  return self->_appName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void)setTextInputTraits:(id)a3
{
  objc_storeStrong((id *)&self->_textInputTraits, a3);
}

- (void)setInputContextHistory:(id)a3
{
  objc_storeStrong((id *)&self->_inputContextHistory, a3);
}

- (void)setAutofillContext:(id)a3
{
  objc_storeStrong((id *)&self->_autofillContext, a3);
}

- (void)setShouldLoadAutofillSignUp:(BOOL)a3
{
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFFE | a3;
}

- (void)setSupportsImagePaste:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFFD | v3;
}

- (void)setSingleLineDocument:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFDFF | v3;
}

- (void)setShouldReverseLayoutDirection:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFF7F | v3;
}

- (void)setHidePrediction:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFDF | v3;
}

- (void)setDisablePrediction:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFEF | v3;
}

- (void)setDisableInputBars:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFF7 | v3;
}

- (void)setDevicePasscodeEntry:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFFB | v3;
}

- (void)setDisableAutomaticKeyboardUI:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFBF | v3;
}

- (RTIDocumentTraits)init
{
  RTIDocumentTraits *v2;
  TITextInputTraits *v3;
  TITextInputTraits *textInputTraits;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTIDocumentTraits;
  v2 = -[RTIDocumentTraits init](&v6, sel_init);
  if (v2)
  {
    v3 = (TITextInputTraits *)objc_alloc_init(MEMORY[0x1E0DBDD20]);
    textInputTraits = v2->_textInputTraits;
    v2->_textInputTraits = v3;

    v2->_validTextRange.location = 0;
    v2->_validTextRange.length = -1;
    v2->_autofillMode = 0;
    v2->_autofillSubMode = 0;
    v2->_delegateConformanceType = 23;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  RTIDocumentTraits *v4;
  RTIDocumentTraits *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unsigned int v36;
  unint64_t v37;
  unint64_t v38;
  _BOOL4 v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  _BOOL4 v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  int v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;
  _BOOL4 v126;
  _BOOL4 v127;
  _BOOL4 v128;
  _BOOL4 v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  int v135;
  _BOOL4 v136;
  _BOOL4 v137;
  _BOOL4 v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  int v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  int v150;
  _BOOL4 v151;
  _BOOL4 v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;

  v4 = (RTIDocumentTraits *)a3;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[RTIDocumentTraits processId](self, "processId");
      if (v6 == -[RTIDocumentTraits processId](v5, "processId"))
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        -[RTIDocumentTraits appId](self, "appId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentTraits appId](v5, "appId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "_string:matchesString:", v8, v9);

        if (!v10)
          goto LABEL_25;
        v11 = (void *)MEMORY[0x1E0CB3940];
        -[RTIDocumentTraits bundleId](self, "bundleId");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentTraits bundleId](v5, "bundleId");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v11, "_string:matchesString:", v12, v13);

        if (!v10)
          goto LABEL_25;
        v14 = (void *)MEMORY[0x1E0CB3940];
        -[RTIDocumentTraits appName](self, "appName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentTraits appName](v5, "appName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v14, "_string:matchesString:", v15, v16);

        if (!v10)
          goto LABEL_25;
        v17 = (void *)MEMORY[0x1E0CB3940];
        -[RTIDocumentTraits localizedAppName](self, "localizedAppName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentTraits localizedAppName](v5, "localizedAppName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v17, "_string:matchesString:", v18, v19);

        if (!v10)
          goto LABEL_25;
        -[RTIDocumentTraits associatedDomains](self, "associatedDomains");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentTraits associatedDomains](v5, "associatedDomains");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v20 == (void *)v21)
        {

        }
        else
        {
          v22 = (void *)v21;
          -[RTIDocumentTraits associatedDomains](self, "associatedDomains");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTIDocumentTraits associatedDomains](v5, "associatedDomains");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "isEqualToArray:", v24);

          if (!v25)
            goto LABEL_24;
        }
        -[RTIDocumentTraits responderId](self, "responderId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentTraits responderId](v5, "responderId");
        v27 = objc_claimAutoreleasedReturnValue();
        if (v26 == (void *)v27)
        {

        }
        else
        {
          v28 = (void *)v27;
          -[RTIDocumentTraits responderId](self, "responderId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTIDocumentTraits responderId](v5, "responderId");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v29, "isEqual:", v30);

          if (!v31)
            goto LABEL_24;
        }
        v32 = (void *)MEMORY[0x1E0CB3940];
        -[RTIDocumentTraits sceneID](self, "sceneID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentTraits sceneID](v5, "sceneID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v32, "_string:matchesString:", v33, v34);

        if (!v10)
        {
LABEL_25:

          goto LABEL_26;
        }
        v35 = -[RTIDocumentTraits entityID](self, "entityID");
        if (v35 == -[RTIDocumentTraits entityID](v5, "entityID"))
        {
          v36 = -[RTIDocumentTraits contextID](self, "contextID");
          if (v36 == -[RTIDocumentTraits contextID](v5, "contextID"))
          {
            v37 = -[RTIDocumentTraits layerID](self, "layerID");
            if (v37 == -[RTIDocumentTraits layerID](v5, "layerID"))
            {
              v38 = -[RTIDocumentTraits delegateConformanceType](self, "delegateConformanceType");
              if (v38 == -[RTIDocumentTraits delegateConformanceType](v5, "delegateConformanceType"))
              {
                v39 = -[RTIDocumentTraits disableAutomaticKeyboardUI](self, "disableAutomaticKeyboardUI");
                if (v39 == -[RTIDocumentTraits disableAutomaticKeyboardUI](v5, "disableAutomaticKeyboardUI"))
                {
                  v41 = (void *)MEMORY[0x1E0CB3940];
                  -[RTIDocumentTraits title](self, "title");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTIDocumentTraits title](v5, "title");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v10 = objc_msgSend(v41, "_string:matchesString:", v42, v43);

                  if (!v10)
                    goto LABEL_25;
                  v44 = (void *)MEMORY[0x1E0CB3940];
                  -[RTIDocumentTraits prompt](self, "prompt");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTIDocumentTraits prompt](v5, "prompt");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v10 = objc_msgSend(v44, "_string:matchesString:", v45, v46);

                  if (!v10)
                    goto LABEL_25;
                  -[RTIDocumentTraits textInputTraits](self, "textInputTraits");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTIDocumentTraits textInputTraits](v5, "textInputTraits");
                  v48 = objc_claimAutoreleasedReturnValue();
                  if (v47 == (void *)v48)
                  {

                  }
                  else
                  {
                    v49 = (void *)v48;
                    -[RTIDocumentTraits textInputTraits](self, "textInputTraits");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits textInputTraits](v5, "textInputTraits");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = objc_msgSend(v50, "isEqual:", v51);

                    if (!v52)
                      goto LABEL_24;
                  }
                  -[RTIDocumentTraits textInputContextIdentifier](self, "textInputContextIdentifier");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTIDocumentTraits textInputContextIdentifier](v5, "textInputContextIdentifier");
                  v54 = objc_claimAutoreleasedReturnValue();
                  if (v53 == (void *)v54)
                  {

                  }
                  else
                  {
                    v55 = (void *)v54;
                    -[RTIDocumentTraits textInputContextIdentifier](self, "textInputContextIdentifier");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits textInputContextIdentifier](v5, "textInputContextIdentifier");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    v58 = objc_msgSend(v56, "isEqual:", v57);

                    if (!v58)
                      goto LABEL_24;
                  }
                  -[RTIDocumentTraits PINEntrySeparatorIndexes](self, "PINEntrySeparatorIndexes");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTIDocumentTraits PINEntrySeparatorIndexes](v5, "PINEntrySeparatorIndexes");
                  v60 = objc_claimAutoreleasedReturnValue();
                  if (v59 == (void *)v60)
                  {

                  }
                  else
                  {
                    v61 = (void *)v60;
                    -[RTIDocumentTraits PINEntrySeparatorIndexes](self, "PINEntrySeparatorIndexes");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits PINEntrySeparatorIndexes](v5, "PINEntrySeparatorIndexes");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = objc_msgSend(v62, "isEqual:", v63);

                    if (!v64)
                      goto LABEL_24;
                  }
                  v65 = -[RTIDocumentTraits validTextRange](self, "validTextRange");
                  v67 = v66;
                  LOBYTE(v10) = 0;
                  if (v65 != -[RTIDocumentTraits validTextRange](v5, "validTextRange") || v67 != v68)
                    goto LABEL_25;
                  v69 = -[RTIDocumentTraits autofillMode](self, "autofillMode");
                  if (v69 != -[RTIDocumentTraits autofillMode](v5, "autofillMode"))
                    goto LABEL_24;
                  v70 = -[RTIDocumentTraits autofillSubMode](self, "autofillSubMode");
                  if (v70 != -[RTIDocumentTraits autofillSubMode](v5, "autofillSubMode"))
                    goto LABEL_24;
                  -[RTIDocumentTraits autofillContext](self, "autofillContext");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTIDocumentTraits autofillContext](v5, "autofillContext");
                  v72 = objc_claimAutoreleasedReturnValue();
                  if (v71 == (void *)v72)
                  {

                  }
                  else
                  {
                    v73 = (void *)v72;
                    -[RTIDocumentTraits autofillContext](self, "autofillContext");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits autofillContext](v5, "autofillContext");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    v76 = objc_msgSend(v74, "isEqualToDictionary:", v75);

                    if (!v76)
                      goto LABEL_24;
                  }
                  v77 = -[RTIDocumentTraits shouldLoadAutofillSignUp](self, "shouldLoadAutofillSignUp");
                  if (v77 == -[RTIDocumentTraits shouldLoadAutofillSignUp](v5, "shouldLoadAutofillSignUp"))
                  {
                    -[RTIDocumentTraits passwordRules](self, "passwordRules");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits passwordRules](v5, "passwordRules");
                    v79 = objc_claimAutoreleasedReturnValue();
                    if (v78 == (void *)v79)
                    {

                    }
                    else
                    {
                      v80 = (void *)v79;
                      -[RTIDocumentTraits passwordRules](self, "passwordRules");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RTIDocumentTraits passwordRules](v5, "passwordRules");
                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                      v83 = objc_msgSend(v81, "isEqual:", v82);

                      if (!v83)
                        goto LABEL_24;
                    }
                    -[RTIDocumentTraits inputViewInfo](self, "inputViewInfo");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits inputViewInfo](v5, "inputViewInfo");
                    v85 = objc_claimAutoreleasedReturnValue();
                    if (v84 == (void *)v85)
                    {

                    }
                    else
                    {
                      v86 = (void *)v85;
                      -[RTIDocumentTraits inputViewInfo](self, "inputViewInfo");
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RTIDocumentTraits inputViewInfo](v5, "inputViewInfo");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      v89 = objc_msgSend(v87, "isEqual:", v88);

                      if (!v89)
                        goto LABEL_24;
                    }
                    -[RTIDocumentTraits assistantViewInfo](self, "assistantViewInfo");
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits assistantViewInfo](v5, "assistantViewInfo");
                    v91 = objc_claimAutoreleasedReturnValue();
                    if (v90 == (void *)v91)
                    {

                    }
                    else
                    {
                      v92 = (void *)v91;
                      -[RTIDocumentTraits assistantViewInfo](self, "assistantViewInfo");
                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RTIDocumentTraits assistantViewInfo](v5, "assistantViewInfo");
                      v94 = (void *)objc_claimAutoreleasedReturnValue();
                      v95 = objc_msgSend(v93, "isEqual:", v94);

                      if (!v95)
                        goto LABEL_24;
                    }
                    -[RTIDocumentTraits assistantItem](self, "assistantItem");
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits assistantItem](v5, "assistantItem");
                    v97 = objc_claimAutoreleasedReturnValue();
                    if (v96 == (void *)v97)
                    {

                    }
                    else
                    {
                      v98 = (void *)v97;
                      -[RTIDocumentTraits assistantItem](self, "assistantItem");
                      v99 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RTIDocumentTraits assistantItem](v5, "assistantItem");
                      v100 = (void *)objc_claimAutoreleasedReturnValue();
                      v101 = objc_msgSend(v99, "isEqual:", v100);

                      if (!v101)
                        goto LABEL_24;
                    }
                    v102 = (void *)MEMORY[0x1E0CB3940];
                    -[RTIDocumentTraits recipientId](self, "recipientId");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits recipientId](v5, "recipientId");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    v10 = objc_msgSend(v102, "_string:matchesString:", v103, v104);

                    if (!v10)
                      goto LABEL_25;
                    v105 = (void *)MEMORY[0x1E0CB3940];
                    -[RTIDocumentTraits responseContext](self, "responseContext");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits responseContext](v5, "responseContext");
                    v107 = (void *)objc_claimAutoreleasedReturnValue();
                    v10 = objc_msgSend(v105, "_string:matchesString:", v106, v107);

                    if (!v10)
                      goto LABEL_25;
                    -[RTIDocumentTraits inputContextHistory](self, "inputContextHistory");
                    v108 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits inputContextHistory](v5, "inputContextHistory");
                    v109 = objc_claimAutoreleasedReturnValue();
                    if (v108 == (void *)v109)
                    {

                    }
                    else
                    {
                      v110 = (void *)v109;
                      -[RTIDocumentTraits inputContextHistory](self, "inputContextHistory");
                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RTIDocumentTraits inputContextHistory](v5, "inputContextHistory");
                      v112 = (void *)objc_claimAutoreleasedReturnValue();
                      v113 = objc_msgSend(v111, "isEqual:", v112);

                      if (!v113)
                        goto LABEL_24;
                    }
                    -[RTIDocumentTraits enabledSupplementalLexiconIdentifiers](self, "enabledSupplementalLexiconIdentifiers");
                    v114 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits enabledSupplementalLexiconIdentifiers](v5, "enabledSupplementalLexiconIdentifiers");
                    v115 = objc_claimAutoreleasedReturnValue();
                    if (v114 == (void *)v115)
                    {

                    }
                    else
                    {
                      v116 = (void *)v115;
                      -[RTIDocumentTraits enabledSupplementalLexiconIdentifiers](self, "enabledSupplementalLexiconIdentifiers");
                      v117 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RTIDocumentTraits enabledSupplementalLexiconIdentifiers](v5, "enabledSupplementalLexiconIdentifiers");
                      v118 = (void *)objc_claimAutoreleasedReturnValue();
                      v119 = objc_msgSend(v117, "isEqualToArray:", v118);

                      if (!v119)
                        goto LABEL_24;
                    }
                    -[RTIDocumentTraits supportedPayloadIds](self, "supportedPayloadIds");
                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits supportedPayloadIds](v5, "supportedPayloadIds");
                    v121 = objc_claimAutoreleasedReturnValue();
                    if (v120 == (void *)v121)
                    {

                    }
                    else
                    {
                      v122 = (void *)v121;
                      -[RTIDocumentTraits supportedPayloadIds](self, "supportedPayloadIds");
                      v123 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RTIDocumentTraits supportedPayloadIds](v5, "supportedPayloadIds");
                      v124 = (void *)objc_claimAutoreleasedReturnValue();
                      v125 = objc_msgSend(v123, "isEqualToArray:", v124);

                      if (!v125)
                        goto LABEL_24;
                    }
                    v126 = -[RTIDocumentTraits supportsImagePaste](self, "supportsImagePaste");
                    if (v126 != -[RTIDocumentTraits supportsImagePaste](v5, "supportsImagePaste"))
                      goto LABEL_24;
                    v127 = -[RTIDocumentTraits supportsAdaptiveImageGlyph](self, "supportsAdaptiveImageGlyph");
                    if (v127 != -[RTIDocumentTraits supportsAdaptiveImageGlyph](v5, "supportsAdaptiveImageGlyph"))
                      goto LABEL_24;
                    v128 = -[RTIDocumentTraits devicePasscodeEntry](self, "devicePasscodeEntry");
                    if (v128 != -[RTIDocumentTraits devicePasscodeEntry](v5, "devicePasscodeEntry"))
                      goto LABEL_24;
                    v129 = -[RTIDocumentTraits disableInputBars](self, "disableInputBars");
                    if (v129 != -[RTIDocumentTraits disableInputBars](v5, "disableInputBars"))
                      goto LABEL_24;
                    -[RTIDocumentTraits userInfo](self, "userInfo");
                    v130 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits userInfo](v5, "userInfo");
                    v131 = objc_claimAutoreleasedReturnValue();
                    if (v130 == (void *)v131)
                    {

                    }
                    else
                    {
                      v132 = (void *)v131;
                      -[RTIDocumentTraits userInfo](self, "userInfo");
                      v133 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RTIDocumentTraits userInfo](v5, "userInfo");
                      v134 = (void *)objc_claimAutoreleasedReturnValue();
                      v135 = objc_msgSend(v133, "isEqualToDictionary:", v134);

                      if (!v135)
                        goto LABEL_24;
                    }
                    v136 = -[RTIDocumentTraits disablePrediction](self, "disablePrediction");
                    if (v136 != -[RTIDocumentTraits disablePrediction](v5, "disablePrediction"))
                      goto LABEL_24;
                    v137 = -[RTIDocumentTraits hidePrediction](self, "hidePrediction");
                    if (v137 != -[RTIDocumentTraits hidePrediction](v5, "hidePrediction"))
                      goto LABEL_24;
                    v138 = -[RTIDocumentTraits shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection");
                    if (v138 != -[RTIDocumentTraits shouldReverseLayoutDirection](v5, "shouldReverseLayoutDirection"))
                      goto LABEL_24;
                    -[RTIDocumentTraits textInputModeData](self, "textInputModeData");
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits textInputModeData](v5, "textInputModeData");
                    v140 = objc_claimAutoreleasedReturnValue();
                    if (v139 == (void *)v140)
                    {

                    }
                    else
                    {
                      v141 = (void *)v140;
                      -[RTIDocumentTraits textInputModeData](self, "textInputModeData");
                      v142 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RTIDocumentTraits textInputModeData](v5, "textInputModeData");
                      v143 = (void *)objc_claimAutoreleasedReturnValue();
                      v144 = objc_msgSend(v142, "isEqual:", v143);

                      if (!v144)
                        goto LABEL_24;
                    }
                    -[RTIDocumentTraits additionalLocaleIdentifiers](self, "additionalLocaleIdentifiers");
                    v145 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTIDocumentTraits additionalLocaleIdentifiers](v5, "additionalLocaleIdentifiers");
                    v146 = objc_claimAutoreleasedReturnValue();
                    if (v145 == (void *)v146)
                    {

                    }
                    else
                    {
                      v147 = (void *)v146;
                      -[RTIDocumentTraits additionalLocaleIdentifiers](self, "additionalLocaleIdentifiers");
                      v148 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RTIDocumentTraits additionalLocaleIdentifiers](v5, "additionalLocaleIdentifiers");
                      v149 = (void *)objc_claimAutoreleasedReturnValue();
                      v150 = objc_msgSend(v148, "isEqualToArray:", v149);

                      if (!v150)
                        goto LABEL_24;
                    }
                    v151 = -[RTIDocumentTraits isExplicitAutoFillMode](self, "isExplicitAutoFillMode");
                    if (v151 == -[RTIDocumentTraits isExplicitAutoFillMode](v5, "isExplicitAutoFillMode"))
                    {
                      v152 = -[RTIDocumentTraits isSingleLineDocument](self, "isSingleLineDocument");
                      if (v152 == -[RTIDocumentTraits isSingleLineDocument](v5, "isSingleLineDocument"))
                      {
                        -[RTIDocumentTraits keyboardActionButtonConfiguration](self, "keyboardActionButtonConfiguration");
                        v153 = (void *)objc_claimAutoreleasedReturnValue();
                        -[RTIDocumentTraits keyboardActionButtonConfiguration](v5, "keyboardActionButtonConfiguration");
                        v154 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v153 == v154)
                        {
                          LOBYTE(v10) = 1;
                        }
                        else
                        {
                          -[RTIDocumentTraits keyboardActionButtonConfiguration](self, "keyboardActionButtonConfiguration");
                          v155 = (void *)objc_claimAutoreleasedReturnValue();
                          -[RTIDocumentTraits keyboardActionButtonConfiguration](v5, "keyboardActionButtonConfiguration");
                          v156 = (void *)objc_claimAutoreleasedReturnValue();
                          LOBYTE(v10) = objc_msgSend(v155, "isEqual:", v156);

                        }
                        goto LABEL_25;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_24:
      LOBYTE(v10) = 0;
      goto LABEL_25;
    }
    LOBYTE(v10) = 0;
  }
LABEL_26:

  return v10;
}

- (BOOL)devicePasscodeEntry
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 2) & 1;
}

- (BOOL)shouldLoadAutofillSignUp
{
  return self->_textInputTraitsMask.integerValue & 1;
}

- (BOOL)supportsImagePaste
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 1) & 1;
}

- (BOOL)supportsEmojiImageTextAttachments
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 10) & 1;
}

- (void)setSupportsEmojiImageTextAttachments:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFBFF | v3;
}

- (BOOL)supportsAdaptiveImageGlyph
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 10) & 1;
}

- (void)setSupportsAdaptiveImageGlyph:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFBFF | v3;
}

- (BOOL)disableInputBars
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 3) & 1;
}

- (BOOL)disablePrediction
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 4) & 1;
}

- (BOOL)hidePrediction
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 5) & 1;
}

- (BOOL)disableAutomaticKeyboardUI
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 6) & 1;
}

- (BOOL)shouldReverseLayoutDirection
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 7) & 1;
}

- (void)setExplicitAutoFillMode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFEFF | v3;
}

- (BOOL)isSingleLineDocument
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 9) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RTIDocumentTraits *v5;
  uint64_t v6;
  NSString *appId;
  uint64_t v8;
  NSString *bundleId;
  uint64_t v10;
  NSString *appName;
  uint64_t v12;
  NSString *localizedAppName;
  uint64_t v14;
  NSArray *associatedDomains;
  uint64_t v16;
  NSCopying *responderId;
  uint64_t v18;
  NSString *sceneID;
  uint64_t v20;
  NSString *title;
  uint64_t v22;
  NSString *prompt;
  uint64_t v24;
  TITextInputTraits *textInputTraits;
  RTITextInputKeyboardActionButtonConfiguration *v26;
  RTITextInputKeyboardActionButtonConfiguration *keyboardActionButtonConfiguration;
  uint64_t v28;
  NSString *textInputContextIdentifier;
  uint64_t v30;
  NSIndexSet *PINEntrySeparatorIndexes;
  uint64_t v32;
  NSDictionary *autofillContext;
  uint64_t v34;
  NSString *passwordRules;
  RTIInputViewInfo *v36;
  RTIInputViewInfo *inputViewInfo;
  RTIInputViewInfo *v38;
  RTIInputViewInfo *assistantViewInfo;
  RTIAssistantItem *v40;
  RTIAssistantItem *assistantItem;
  uint64_t v42;
  NSString *recipientId;
  uint64_t v44;
  NSString *responseContext;
  uint64_t v46;
  TIInputContextHistory *inputContextHistory;
  uint64_t v48;
  NSArray *enabledSupplementalLexiconIdentifiers;
  uint64_t v50;
  NSArray *supportedPayloadIds;
  uint64_t v52;
  NSDictionary *userInfo;
  CAFenceHandle *fenceHandle;
  uint64_t v55;
  NSData *textInputModeData;
  uint64_t v57;
  NSArray *additionalLocaleIdentifiers;

  v5 = -[RTIDocumentTraits init](+[RTIDocumentTraits allocWithZone:](RTIDocumentTraits, "allocWithZone:"), "init");
  v5->_processId = self->_processId;
  v6 = -[NSString copyWithZone:](self->_appId, "copyWithZone:", a3);
  appId = v5->_appId;
  v5->_appId = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_bundleId, "copyWithZone:", a3);
  bundleId = v5->_bundleId;
  v5->_bundleId = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_appName, "copyWithZone:", a3);
  appName = v5->_appName;
  v5->_appName = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_localizedAppName, "copyWithZone:", a3);
  localizedAppName = v5->_localizedAppName;
  v5->_localizedAppName = (NSString *)v12;

  v14 = -[NSArray copyWithZone:](self->_associatedDomains, "copyWithZone:", a3);
  associatedDomains = v5->_associatedDomains;
  v5->_associatedDomains = (NSArray *)v14;

  v16 = -[NSCopying copyWithZone:](self->_responderId, "copyWithZone:", a3);
  responderId = v5->_responderId;
  v5->_responderId = (NSCopying *)v16;

  v18 = -[NSString copyWithZone:](self->_sceneID, "copyWithZone:", a3);
  sceneID = v5->_sceneID;
  v5->_sceneID = (NSString *)v18;

  v5->_entityID = self->_entityID;
  v5->_contextID = self->_contextID;
  v5->_layerID = self->_layerID;
  v5->_delegateConformanceType = self->_delegateConformanceType;
  v20 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v20;

  v22 = -[NSString copyWithZone:](self->_prompt, "copyWithZone:", a3);
  prompt = v5->_prompt;
  v5->_prompt = (NSString *)v22;

  v24 = -[TITextInputTraits copyWithZone:](self->_textInputTraits, "copyWithZone:", a3);
  textInputTraits = v5->_textInputTraits;
  v5->_textInputTraits = (TITextInputTraits *)v24;

  v26 = -[RTITextInputKeyboardActionButtonConfiguration copyWithZone:](self->_keyboardActionButtonConfiguration, "copyWithZone:", a3);
  keyboardActionButtonConfiguration = v5->_keyboardActionButtonConfiguration;
  v5->_keyboardActionButtonConfiguration = v26;

  v28 = -[NSString copyWithZone:](self->_textInputContextIdentifier, "copyWithZone:", a3);
  textInputContextIdentifier = v5->_textInputContextIdentifier;
  v5->_textInputContextIdentifier = (NSString *)v28;

  v30 = -[NSIndexSet copyWithZone:](self->_PINEntrySeparatorIndexes, "copyWithZone:", a3);
  PINEntrySeparatorIndexes = v5->_PINEntrySeparatorIndexes;
  v5->_PINEntrySeparatorIndexes = (NSIndexSet *)v30;

  v5->_validTextRange = self->_validTextRange;
  v5->_autofillMode = self->_autofillMode;
  v5->_autofillSubMode = self->_autofillSubMode;
  v32 = -[NSDictionary copyWithZone:](self->_autofillContext, "copyWithZone:", a3);
  autofillContext = v5->_autofillContext;
  v5->_autofillContext = (NSDictionary *)v32;

  v34 = -[NSString copyWithZone:](self->_passwordRules, "copyWithZone:", a3);
  passwordRules = v5->_passwordRules;
  v5->_passwordRules = (NSString *)v34;

  v36 = -[RTIInputViewInfo copyWithZone:](self->_inputViewInfo, "copyWithZone:", a3);
  inputViewInfo = v5->_inputViewInfo;
  v5->_inputViewInfo = v36;

  v38 = -[RTIInputViewInfo copyWithZone:](self->_assistantViewInfo, "copyWithZone:", a3);
  assistantViewInfo = v5->_assistantViewInfo;
  v5->_assistantViewInfo = v38;

  v40 = -[RTIAssistantItem copyWithZone:](self->_assistantItem, "copyWithZone:", a3);
  assistantItem = v5->_assistantItem;
  v5->_assistantItem = v40;

  v42 = -[NSString copyWithZone:](self->_recipientId, "copyWithZone:", a3);
  recipientId = v5->_recipientId;
  v5->_recipientId = (NSString *)v42;

  v44 = -[NSString copyWithZone:](self->_responseContext, "copyWithZone:", a3);
  responseContext = v5->_responseContext;
  v5->_responseContext = (NSString *)v44;

  v46 = -[TIInputContextHistory copyWithZone:](self->_inputContextHistory, "copyWithZone:", a3);
  inputContextHistory = v5->_inputContextHistory;
  v5->_inputContextHistory = (TIInputContextHistory *)v46;

  v48 = -[NSArray copyWithZone:](self->_enabledSupplementalLexiconIdentifiers, "copyWithZone:", a3);
  enabledSupplementalLexiconIdentifiers = v5->_enabledSupplementalLexiconIdentifiers;
  v5->_enabledSupplementalLexiconIdentifiers = (NSArray *)v48;

  v50 = -[NSArray copyWithZone:](self->_supportedPayloadIds, "copyWithZone:", a3);
  supportedPayloadIds = v5->_supportedPayloadIds;
  v5->_supportedPayloadIds = (NSArray *)v50;

  v52 = -[NSDictionary copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  userInfo = v5->_userInfo;
  v5->_userInfo = (NSDictionary *)v52;

  fenceHandle = self->_fenceHandle;
  if (fenceHandle)
    objc_storeStrong((id *)&v5->_fenceHandle, fenceHandle);
  v55 = -[NSData copyWithZone:](self->_textInputModeData, "copyWithZone:", a3);
  textInputModeData = v5->_textInputModeData;
  v5->_textInputModeData = (NSData *)v55;

  v57 = -[NSArray copyWithZone:](self->_additionalLocaleIdentifiers, "copyWithZone:", a3);
  additionalLocaleIdentifiers = v5->_additionalLocaleIdentifiers;
  v5->_additionalLocaleIdentifiers = (NSArray *)v57;

  v5->_textInputTraitsMask.integerValue = self->_textInputTraitsMask.integerValue;
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  if (-[RTIDocumentTraits processId](self, "processId"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; processId = %d"), -[RTIDocumentTraits processId](self, "processId"));
  -[RTIDocumentTraits appId](self, "appId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTIDocumentTraits appId](self, "appId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; appId = %@"), v5);

  }
  -[RTIDocumentTraits bundleId](self, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RTIDocumentTraits bundleId](self, "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; bundleId = %@"), v7);

  }
  -[RTIDocumentTraits appName](self, "appName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[RTIDocumentTraits appName](self, "appName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; appName = %@"), v9);

  }
  -[RTIDocumentTraits localizedAppName](self, "localizedAppName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[RTIDocumentTraits localizedAppName](self, "localizedAppName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; localizedAppName = %@"), v11);

  }
  -[RTIDocumentTraits associatedDomains](self, "associatedDomains");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[RTIDocumentTraits associatedDomains](self, "associatedDomains");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; associatedDomains = %@"), v13);

  }
  -[RTIDocumentTraits responderId](self, "responderId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[RTIDocumentTraits responderId](self, "responderId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; responderId = %@"), v15);

  }
  -[RTIDocumentTraits sceneID](self, "sceneID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[RTIDocumentTraits sceneID](self, "sceneID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; sceneID = %@"), v17);

  }
  if (-[RTIDocumentTraits entityID](self, "entityID"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; entityID = %llu"), -[RTIDocumentTraits entityID](self, "entityID"));
  if (-[RTIDocumentTraits contextID](self, "contextID"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; contextID = %x"), -[RTIDocumentTraits contextID](self, "contextID"));
  if (-[RTIDocumentTraits layerID](self, "layerID"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; layerID = %llx"), -[RTIDocumentTraits layerID](self, "layerID"));
  if (-[RTIDocumentTraits delegateConformanceType](self, "delegateConformanceType"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; delegateConformanceType = %d"),
      -[RTIDocumentTraits delegateConformanceType](self, "delegateConformanceType"));
  if (-[RTIDocumentTraits disableAutomaticKeyboardUI](self, "disableAutomaticKeyboardUI"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; disableAutomaticKeyboardUI = %d"),
      -[RTIDocumentTraits disableAutomaticKeyboardUI](self, "disableAutomaticKeyboardUI"));
  -[RTIDocumentTraits title](self, "title");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[RTIDocumentTraits title](self, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; title = %@"), v19);

  }
  -[RTIDocumentTraits prompt](self, "prompt");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[RTIDocumentTraits prompt](self, "prompt");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; prompt = %@"), v21);

  }
  -[RTIDocumentTraits textInputTraits](self, "textInputTraits");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; textInputTraits = %@"), v22);

  -[RTIDocumentTraits textInputContextIdentifier](self, "textInputContextIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[RTIDocumentTraits textInputContextIdentifier](self, "textInputContextIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; textInputContextIdentifier = %@"), v24);

  }
  if (-[RTIDocumentTraits autofillMode](self, "autofillMode"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; autofillMode = %d"),
      -[RTIDocumentTraits autofillMode](self, "autofillMode"));
  if (-[RTIDocumentTraits autofillSubMode](self, "autofillSubMode"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; autofillSubMode = %d"),
      -[RTIDocumentTraits autofillSubMode](self, "autofillSubMode"));
  -[RTIDocumentTraits autofillContext](self, "autofillContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[RTIDocumentTraits autofillContext](self, "autofillContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; autofillContext = %@"), v26);

  }
  if (-[RTIDocumentTraits shouldLoadAutofillSignUp](self, "shouldLoadAutofillSignUp"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; shouldLoadAutofillSignUp = YES"));
  -[RTIDocumentTraits passwordRules](self, "passwordRules");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[RTIDocumentTraits passwordRules](self, "passwordRules");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; passwordRules = %@"), v28);

  }
  -[RTIDocumentTraits inputViewInfo](self, "inputViewInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[RTIDocumentTraits inputViewInfo](self, "inputViewInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; inputViewInfo = %@"), v30);

  }
  -[RTIDocumentTraits assistantViewInfo](self, "assistantViewInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[RTIDocumentTraits assistantViewInfo](self, "assistantViewInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; assistantViewInfo = %@"), v32);

  }
  -[RTIDocumentTraits assistantItem](self, "assistantItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[RTIDocumentTraits assistantItem](self, "assistantItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; assistantItem = %@"), v34);

  }
  -[RTIDocumentTraits recipientId](self, "recipientId");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[RTIDocumentTraits recipientId](self, "recipientId");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; recipientId = %@"), v36);

  }
  -[RTIDocumentTraits responseContext](self, "responseContext");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[RTIDocumentTraits responseContext](self, "responseContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; responseContext = %@"), v38);

  }
  -[RTIDocumentTraits inputContextHistory](self, "inputContextHistory");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[RTIDocumentTraits inputContextHistory](self, "inputContextHistory");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; inputContextHistory = %@"), v40);

  }
  -[RTIDocumentTraits enabledSupplementalLexiconIdentifiers](self, "enabledSupplementalLexiconIdentifiers");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    -[RTIDocumentTraits enabledSupplementalLexiconIdentifiers](self, "enabledSupplementalLexiconIdentifiers");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; enabledSupplementalLexiconIdentifiers = %@"), v42);

  }
  -[RTIDocumentTraits supportedPayloadIds](self, "supportedPayloadIds");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    -[RTIDocumentTraits supportedPayloadIds](self, "supportedPayloadIds");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; supportedPayloadIds = %@"), v44);

  }
  if (-[RTIDocumentTraits supportsImagePaste](self, "supportsImagePaste"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; supportsImagePaste = YES"));
  if (-[RTIDocumentTraits supportsAdaptiveImageGlyph](self, "supportsAdaptiveImageGlyph"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; supportsAdaptiveImageGlyph = YES"));
  if (-[RTIDocumentTraits devicePasscodeEntry](self, "devicePasscodeEntry"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; devicePasscodeEntry = YES"));
  if (-[RTIDocumentTraits disableInputBars](self, "disableInputBars"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; disableInputBars = YES"));
  -[RTIDocumentTraits userInfo](self, "userInfo");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[RTIDocumentTraits userInfo](self, "userInfo");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "allKeys");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; userInfo.keys = %@"), v47);

  }
  if (-[RTIDocumentTraits disablePrediction](self, "disablePrediction"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; disablePrediction = YES"));
  if (-[RTIDocumentTraits hidePrediction](self, "hidePrediction"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; hidePrediction = YES"));
  if (-[RTIDocumentTraits shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection"))
  {
    v48 = -[RTIDocumentTraits shouldReverseLayoutDirection](self, "shouldReverseLayoutDirection");
    v49 = CFSTR("N");
    if (v48)
      v49 = CFSTR("Y");
    objc_msgSend(v3, "appendFormat:", CFSTR("; shouldReverseLayoutDirection = %@"), v49);
  }
  -[RTIDocumentTraits fenceHandle](self, "fenceHandle");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[RTIDocumentTraits fenceHandle](self, "fenceHandle");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; fenceHandle = %@"), v51);

  }
  -[RTIDocumentTraits textInputModeData](self, "textInputModeData");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[RTIDocumentTraits textInputModeData](self, "textInputModeData");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; has %lu bytes of textInputModeData"), objc_msgSend(v53, "length"));

  }
  -[RTIDocumentTraits additionalLocaleIdentifiers](self, "additionalLocaleIdentifiers");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    -[RTIDocumentTraits additionalLocaleIdentifiers](self, "additionalLocaleIdentifiers");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; addedLocales = %@"), v55);

  }
  if (-[RTIDocumentTraits isExplicitAutoFillMode](self, "isExplicitAutoFillMode"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; explicitAutoFillMode = YES"));
  if (-[RTIDocumentTraits isSingleLineDocument](self, "isSingleLineDocument"))
    objc_msgSend(v3, "appendFormat:", CFSTR("; singleLineDocument = YES"));
  -[RTIDocumentTraits keyboardActionButtonConfiguration](self, "keyboardActionButtonConfiguration");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[RTIDocumentTraits keyboardActionButtonConfiguration](self, "keyboardActionButtonConfiguration");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "description");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; keyboardActionButtonConfiguration = %@"), v58);

  }
  v59 = v3;

  return v59;
}

- (void)copyContextualPropertiesFromDocumentTraits:(id)a3
{
  NSCopying *v4;
  NSCopying *responderId;
  NSString *v6;
  NSString *sceneID;
  NSString *v8;
  NSString *title;
  NSString *v10;
  NSString *prompt;
  TITextInputTraits *v12;
  TITextInputTraits *textInputTraits;
  RTITextInputKeyboardActionButtonConfiguration *v14;
  RTITextInputKeyboardActionButtonConfiguration *keyboardActionButtonConfiguration;
  NSString *v16;
  NSString *textInputContextIdentifier;
  NSIndexSet *v18;
  NSIndexSet *PINEntrySeparatorIndexes;
  NSDictionary *v20;
  NSDictionary *autofillContext;
  NSString *v22;
  NSString *passwordRules;
  NSArray *v24;
  NSArray *associatedDomains;
  RTIInputViewInfo *v26;
  RTIInputViewInfo *inputViewInfo;
  RTIInputViewInfo *v28;
  RTIInputViewInfo *assistantViewInfo;
  RTIAssistantItem *v30;
  RTIAssistantItem *assistantItem;
  NSString *v32;
  NSString *recipientId;
  NSString *v34;
  NSString *responseContext;
  TIInputContextHistory *v36;
  TIInputContextHistory *inputContextHistory;
  NSArray *v38;
  NSArray *enabledSupplementalLexiconIdentifiers;
  NSArray *v40;
  NSArray *supportedPayloadIds;
  NSDictionary *v42;
  NSDictionary *userInfo;
  id *v44;
  CAFenceHandle *v45;
  CAFenceHandle *fenceHandle;
  void *v47;
  NSData *v48;
  NSData *textInputModeData;
  NSArray *v50;
  NSArray *additionalLocaleIdentifiers;
  char *v52;

  v52 = (char *)a3;
  v4 = (NSCopying *)objc_msgSend(*((id *)v52 + 8), "copy");
  responderId = self->_responderId;
  self->_responderId = v4;

  v6 = (NSString *)objc_msgSend(*((id *)v52 + 9), "copy");
  sceneID = self->_sceneID;
  self->_sceneID = v6;

  self->_entityID = *((_QWORD *)v52 + 10);
  self->_contextID = *((_DWORD *)v52 + 4);
  self->_layerID = *((_QWORD *)v52 + 11);
  self->_delegateConformanceType = *((_QWORD *)v52 + 12);
  v8 = (NSString *)objc_msgSend(*((id *)v52 + 13), "copy");
  title = self->_title;
  self->_title = v8;

  v10 = (NSString *)objc_msgSend(*((id *)v52 + 14), "copy");
  prompt = self->_prompt;
  self->_prompt = v10;

  v12 = (TITextInputTraits *)objc_msgSend(*((id *)v52 + 18), "copy");
  textInputTraits = self->_textInputTraits;
  self->_textInputTraits = v12;

  v14 = (RTITextInputKeyboardActionButtonConfiguration *)objc_msgSend(*((id *)v52 + 34), "copy");
  keyboardActionButtonConfiguration = self->_keyboardActionButtonConfiguration;
  self->_keyboardActionButtonConfiguration = v14;

  v16 = (NSString *)objc_msgSend(*((id *)v52 + 19), "copy");
  textInputContextIdentifier = self->_textInputContextIdentifier;
  self->_textInputContextIdentifier = v16;

  v18 = (NSIndexSet *)objc_msgSend(*((id *)v52 + 20), "copy");
  PINEntrySeparatorIndexes = self->_PINEntrySeparatorIndexes;
  self->_PINEntrySeparatorIndexes = v18;

  self->_validTextRange = *(_NSRange *)(v52 + 280);
  self->_autofillMode = *((_QWORD *)v52 + 21);
  self->_autofillSubMode = *((_QWORD *)v52 + 22);
  v20 = (NSDictionary *)objc_msgSend(*((id *)v52 + 23), "copy");
  autofillContext = self->_autofillContext;
  self->_autofillContext = v20;

  v22 = (NSString *)objc_msgSend(*((id *)v52 + 24), "copy");
  passwordRules = self->_passwordRules;
  self->_passwordRules = v22;

  v24 = (NSArray *)objc_msgSend(*((id *)v52 + 7), "copy");
  associatedDomains = self->_associatedDomains;
  self->_associatedDomains = v24;

  v26 = (RTIInputViewInfo *)objc_msgSend(*((id *)v52 + 15), "copy");
  inputViewInfo = self->_inputViewInfo;
  self->_inputViewInfo = v26;

  v28 = (RTIInputViewInfo *)objc_msgSend(*((id *)v52 + 16), "copy");
  assistantViewInfo = self->_assistantViewInfo;
  self->_assistantViewInfo = v28;

  v30 = (RTIAssistantItem *)objc_msgSend(*((id *)v52 + 17), "copy");
  assistantItem = self->_assistantItem;
  self->_assistantItem = v30;

  v32 = (NSString *)objc_msgSend(*((id *)v52 + 25), "copy");
  recipientId = self->_recipientId;
  self->_recipientId = v32;

  v34 = (NSString *)objc_msgSend(*((id *)v52 + 26), "copy");
  responseContext = self->_responseContext;
  self->_responseContext = v34;

  v36 = (TIInputContextHistory *)objc_msgSend(*((id *)v52 + 27), "copy");
  inputContextHistory = self->_inputContextHistory;
  self->_inputContextHistory = v36;

  v38 = (NSArray *)objc_msgSend(*((id *)v52 + 28), "copy");
  enabledSupplementalLexiconIdentifiers = self->_enabledSupplementalLexiconIdentifiers;
  self->_enabledSupplementalLexiconIdentifiers = v38;

  v40 = (NSArray *)objc_msgSend(*((id *)v52 + 29), "copy");
  supportedPayloadIds = self->_supportedPayloadIds;
  self->_supportedPayloadIds = v40;

  v42 = (NSDictionary *)objc_msgSend(*((id *)v52 + 30), "copy");
  userInfo = self->_userInfo;
  self->_userInfo = v42;

  v44 = (id *)v52;
  v45 = (CAFenceHandle *)*((_QWORD *)v52 + 31);
  if (v45)
  {
    fenceHandle = self->_fenceHandle;
    if (fenceHandle != v45 && (-[CAFenceHandle isInvalidated](fenceHandle, "isInvalidated") & 1) == 0)
      -[CAFenceHandle invalidate](self->_fenceHandle, "invalidate");
    objc_storeStrong((id *)&self->_fenceHandle, *((id *)v52 + 31));
    v47 = (void *)*((_QWORD *)v52 + 31);
    *((_QWORD *)v52 + 31) = 0;

    v44 = (id *)v52;
  }
  v48 = (NSData *)objc_msgSend(v44[32], "copy");
  textInputModeData = self->_textInputModeData;
  self->_textInputModeData = v48;

  v50 = (NSArray *)objc_msgSend(*((id *)v52 + 33), "copy");
  additionalLocaleIdentifiers = self->_additionalLocaleIdentifiers;
  self->_additionalLocaleIdentifiers = v50;

  self->_textInputTraitsMask.integerValue = *((_DWORD *)v52 + 2);
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
  objc_storeStrong((id *)&self->_associatedDomains, a3);
}

- (NSCopying)responderId
{
  return self->_responderId;
}

- (void)setResponderId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (unint64_t)entityID
{
  return self->_entityID;
}

- (void)setEntityID:(unint64_t)a3
{
  self->_entityID = a3;
}

- (unint64_t)layerID
{
  return self->_layerID;
}

- (unint64_t)delegateConformanceType
{
  return self->_delegateConformanceType;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (RTIInputViewInfo)inputViewInfo
{
  return self->_inputViewInfo;
}

- (void)setInputViewInfo:(id)a3
{
  objc_storeStrong((id *)&self->_inputViewInfo, a3);
}

- (RTIInputViewInfo)assistantViewInfo
{
  return self->_assistantViewInfo;
}

- (void)setAssistantViewInfo:(id)a3
{
  objc_storeStrong((id *)&self->_assistantViewInfo, a3);
}

- (RTIAssistantItem)assistantItem
{
  return self->_assistantItem;
}

- (void)setAssistantItem:(id)a3
{
  objc_storeStrong((id *)&self->_assistantItem, a3);
}

- (TITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (NSString)textInputContextIdentifier
{
  return self->_textInputContextIdentifier;
}

- (NSIndexSet)PINEntrySeparatorIndexes
{
  return self->_PINEntrySeparatorIndexes;
}

- (void)setPINEntrySeparatorIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_PINEntrySeparatorIndexes, a3);
}

- (_NSRange)validTextRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_validTextRange.length;
  location = self->_validTextRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setValidTextRange:(_NSRange)a3
{
  self->_validTextRange = a3;
}

- (unint64_t)autofillSubMode
{
  return self->_autofillSubMode;
}

- (NSDictionary)autofillContext
{
  return self->_autofillContext;
}

- (NSString)passwordRules
{
  return self->_passwordRules;
}

- (NSString)recipientId
{
  return self->_recipientId;
}

- (NSString)responseContext
{
  return self->_responseContext;
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (NSArray)enabledSupplementalLexiconIdentifiers
{
  return self->_enabledSupplementalLexiconIdentifiers;
}

- (NSArray)supportedPayloadIds
{
  return self->_supportedPayloadIds;
}

- (void)setFenceHandle:(id)a3
{
  objc_storeStrong((id *)&self->_fenceHandle, a3);
}

- (NSData)textInputModeData
{
  return self->_textInputModeData;
}

- (void)setTextInputModeData:(id)a3
{
  objc_storeStrong((id *)&self->_textInputModeData, a3);
}

- (NSArray)additionalLocaleIdentifiers
{
  return self->_additionalLocaleIdentifiers;
}

- (void)setAdditionalLocaleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (RTITextInputKeyboardActionButtonConfiguration)keyboardActionButtonConfiguration
{
  return self->_keyboardActionButtonConfiguration;
}

- (void)setKeyboardActionButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardActionButtonConfiguration, a3);
}

@end
