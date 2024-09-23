@implementation TIKeyboardConfiguration

- (TIKeyboardConfiguration)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardConfiguration *v5;
  uint64_t v6;
  TIKeyboardInputManagerState *inputManagerState;
  uint64_t v8;
  TIKeyboardIntermediateText *intermediateText;
  void *v10;
  uint64_t v11;
  NSString *layoutTag;
  void *v13;
  uint64_t v14;
  NSString *accentKeyString;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *multilingualLanguages;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *trialParameters;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSDictionary *contextualDisplayKeys;
  objc_super v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)TIKeyboardConfiguration;
  v5 = -[TIKeyboardConfiguration init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputManagerState"));
    v6 = objc_claimAutoreleasedReturnValue();
    inputManagerState = v5->_inputManagerState;
    v5->_inputManagerState = (TIKeyboardInputManagerState *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intermediateText"));
    v8 = objc_claimAutoreleasedReturnValue();
    intermediateText = v5->_intermediateText;
    v5->_intermediateText = (TIKeyboardIntermediateText *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutTag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    layoutTag = v5->_layoutTag;
    v5->_layoutTag = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accentKeyString"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    accentKeyString = v5->_accentKeyString;
    v5->_accentKeyString = (NSString *)v14;

    v5->_assertDefaultKeyPlane = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("assertDefaultKeyPlane"));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("multilingualLanguages"));
    v19 = objc_claimAutoreleasedReturnValue();
    multilingualLanguages = v5->_multilingualLanguages;
    v5->_multilingualLanguages = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("trialParameters"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    trialParameters = v5->_trialParameters;
    v5->_trialParameters = (NSDictionary *)v25;

    v27 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v27, objc_opt_class(), CFSTR("contextualDisplayKeys"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    contextualDisplayKeys = v5->_contextualDisplayKeys;
    v5->_contextualDisplayKeys = (NSDictionary *)v29;

  }
  return v5;
}

- (NSDictionary)trialParameters
{
  return self->_trialParameters;
}

- (void)setTrialParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setLayoutTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setInputManagerState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAssertDefaultKeyPlane:(BOOL)a3
{
  self->_assertDefaultKeyPlane = a3;
}

- (void)setAccentKeyString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)multilingualLanguages
{
  return self->_multilingualLanguages;
}

- (NSString)layoutTag
{
  return self->_layoutTag;
}

- (TIKeyboardIntermediateText)intermediateText
{
  return self->_intermediateText;
}

- (TIKeyboardInputManagerState)inputManagerState
{
  return self->_inputManagerState;
}

- (BOOL)assertDefaultKeyPlane
{
  return self->_assertDefaultKeyPlane;
}

- (NSString)accentKeyString
{
  return self->_accentKeyString;
}

- (void)setMultilingualLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_multilingualLanguages, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialParameters, 0);
  objc_storeStrong((id *)&self->_multilingualLanguages, 0);
  objc_storeStrong((id *)&self->_contextualDisplayKeys, 0);
  objc_storeStrong((id *)&self->_accentKeyString, 0);
  objc_storeStrong((id *)&self->_layoutTag, 0);
  objc_storeStrong((id *)&self->_intermediateText, 0);
  objc_storeStrong((id *)&self->_inputManagerState, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TIKeyboardInputManagerState *inputManagerState;
  TIKeyboardIntermediateText *intermediateText;
  NSString *layoutTag;
  NSString *accentKeyString;
  NSArray *multilingualLanguages;
  NSDictionary *trialParameters;
  NSDictionary *contextualDisplayKeys;
  id v12;

  v4 = a3;
  inputManagerState = self->_inputManagerState;
  v12 = v4;
  if (inputManagerState)
  {
    objc_msgSend(v4, "encodeObject:forKey:", inputManagerState, CFSTR("inputManagerState"));
    v4 = v12;
  }
  intermediateText = self->_intermediateText;
  if (intermediateText)
  {
    objc_msgSend(v12, "encodeObject:forKey:", intermediateText, CFSTR("intermediateText"));
    v4 = v12;
  }
  layoutTag = self->_layoutTag;
  if (layoutTag)
  {
    objc_msgSend(v12, "encodeObject:forKey:", layoutTag, CFSTR("layoutTag"));
    v4 = v12;
  }
  accentKeyString = self->_accentKeyString;
  if (accentKeyString)
  {
    objc_msgSend(v12, "encodeObject:forKey:", accentKeyString, CFSTR("accentKeyString"));
    v4 = v12;
  }
  if (self->_assertDefaultKeyPlane)
  {
    objc_msgSend(v12, "encodeBool:forKey:", 1, CFSTR("assertDefaultKeyPlane"));
    v4 = v12;
  }
  multilingualLanguages = self->_multilingualLanguages;
  if (multilingualLanguages)
  {
    objc_msgSend(v12, "encodeObject:forKey:", multilingualLanguages, CFSTR("multilingualLanguages"));
    v4 = v12;
  }
  trialParameters = self->_trialParameters;
  if (trialParameters)
  {
    objc_msgSend(v12, "encodeObject:forKey:", trialParameters, CFSTR("trialParameters"));
    v4 = v12;
  }
  contextualDisplayKeys = self->_contextualDisplayKeys;
  if (contextualDisplayKeys)
  {
    objc_msgSend(v12, "encodeObject:forKey:", contextualDisplayKeys, CFSTR("contextualDisplayKeys"));
    v4 = v12;
  }

}

- (void)setIntermediateText:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateText, a3);
}

- (NSDictionary)contextualDisplayKeys
{
  return self->_contextualDisplayKeys;
}

- (void)setContextualDisplayKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
