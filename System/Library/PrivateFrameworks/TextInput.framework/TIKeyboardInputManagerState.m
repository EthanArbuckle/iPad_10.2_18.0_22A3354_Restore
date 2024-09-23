@implementation TIKeyboardInputManagerState

- (TIKeyboardBehaviors)keyboardBehaviors
{
  return self->_keyboardBehaviors;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TIKeyboardInputManagerState *v5;
  TIKeyboardInputManagerState *v6;
  uint64_t v7;
  NSString *replacementForDoubleSpace;
  uint64_t v9;
  NSString *wordSeparator;
  TICharacterSetDescription *v11;
  TICharacterSetDescription *wordCharacters;
  TICharacterSetDescription *v13;
  TICharacterSetDescription *supplementalLexiconWordExtraCharacters;
  TICharacterSetDescription *v15;
  TICharacterSetDescription *shortcutCompletions;
  TICharacterSetDescription *v17;
  TICharacterSetDescription *inputsPreventingAcceptSelectedCandidate;
  TICharacterSetDescription *v19;
  TICharacterSetDescription *inputsToReject;
  TICharacterSetDescription *v21;
  TICharacterSetDescription *terminatorsPreventingAutocorrection;
  TICharacterSetDescription *v23;
  TICharacterSetDescription *terminatorsDeletingAutospace;
  uint64_t v25;
  NSString *inputString;
  uint64_t v27;
  NSString *shadowTyping;

  v5 = -[TIKeyboardInputManagerState init](+[TIKeyboardInputManagerState allocWithZone:](TIKeyboardInputManagerState, "allocWithZone:"), "init");
  v6 = v5;
  if (v5)
  {
    v5->_mask.integerValue = self->_mask.integerValue;
    v7 = -[NSString copyWithZone:](self->_replacementForDoubleSpace, "copyWithZone:", a3);
    replacementForDoubleSpace = v6->_replacementForDoubleSpace;
    v6->_replacementForDoubleSpace = (NSString *)v7;

    v9 = -[NSString copyWithZone:](self->_wordSeparator, "copyWithZone:", a3);
    wordSeparator = v6->_wordSeparator;
    v6->_wordSeparator = (NSString *)v9;

    v6->_initialCandidateBatchCount = self->_initialCandidateBatchCount;
    v6->_shouldAddModifierSymbolsToWordCharacters = self->_shouldAddModifierSymbolsToWordCharacters;
    v11 = -[TICharacterSetDescription copyWithZone:](self->_wordCharacters, "copyWithZone:", a3);
    wordCharacters = v6->_wordCharacters;
    v6->_wordCharacters = v11;

    v13 = -[TICharacterSetDescription copyWithZone:](self->_supplementalLexiconWordExtraCharacters, "copyWithZone:", a3);
    supplementalLexiconWordExtraCharacters = v6->_supplementalLexiconWordExtraCharacters;
    v6->_supplementalLexiconWordExtraCharacters = v13;

    v15 = -[TICharacterSetDescription copyWithZone:](self->_shortcutCompletions, "copyWithZone:", a3);
    shortcutCompletions = v6->_shortcutCompletions;
    v6->_shortcutCompletions = v15;

    v17 = -[TICharacterSetDescription copyWithZone:](self->_inputsPreventingAcceptSelectedCandidate, "copyWithZone:", a3);
    inputsPreventingAcceptSelectedCandidate = v6->_inputsPreventingAcceptSelectedCandidate;
    v6->_inputsPreventingAcceptSelectedCandidate = v17;

    v19 = -[TICharacterSetDescription copyWithZone:](self->_inputsToReject, "copyWithZone:", a3);
    inputsToReject = v6->_inputsToReject;
    v6->_inputsToReject = v19;

    v21 = -[TICharacterSetDescription copyWithZone:](self->_terminatorsPreventingAutocorrection, "copyWithZone:", a3);
    terminatorsPreventingAutocorrection = v6->_terminatorsPreventingAutocorrection;
    v6->_terminatorsPreventingAutocorrection = v21;

    v23 = -[TICharacterSetDescription copyWithZone:](self->_terminatorsDeletingAutospace, "copyWithZone:", a3);
    terminatorsDeletingAutospace = v6->_terminatorsDeletingAutospace;
    v6->_terminatorsDeletingAutospace = v23;

    objc_storeStrong((id *)&v6->_keyboardBehaviors, self->_keyboardBehaviors);
    v25 = -[NSString copyWithZone:](self->_inputString, "copyWithZone:", a3);
    inputString = v6->_inputString;
    v6->_inputString = (NSString *)v25;

    v6->_hasSupplementalPrefix = self->_hasSupplementalPrefix;
    v6->_inputIndex = self->_inputIndex;
    v6->_inputCount = self->_inputCount;
    v27 = -[NSString copyWithZone:](self->_shadowTyping, "copyWithZone:", a3);
    shadowTyping = v6->_shadowTyping;
    v6->_shadowTyping = (NSString *)v27;

    objc_storeStrong((id *)&v6->_autocorrectionRecordForInputString, self->_autocorrectionRecordForInputString);
    objc_storeStrong((id *)&v6->_keyEventMap, self->_keyEventMap);
    v6->_learningFlagsMaskForLastAcceptedCandidate = self->_learningFlagsMaskForLastAcceptedCandidate;
  }
  return v6;
}

- (TIKeyboardInputManagerState)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardInputManagerState *v5;
  void *v6;
  uint64_t v7;
  NSString *wordSeparator;
  void *v9;
  uint64_t v10;
  TICharacterSetDescription *wordCharacters;
  void *v12;
  uint64_t v13;
  TICharacterSetDescription *supplementalLexiconWordExtraCharacters;
  void *v15;
  uint64_t v16;
  TICharacterSetDescription *shortcutCompletions;
  void *v18;
  uint64_t v19;
  TICharacterSetDescription *inputsPreventingAcceptSelectedCandidate;
  void *v21;
  uint64_t v22;
  TICharacterSetDescription *inputsToReject;
  void *v24;
  uint64_t v25;
  TICharacterSetDescription *terminatorsPreventingAutocorrection;
  void *v27;
  uint64_t v28;
  TICharacterSetDescription *terminatorsDeletingAutospace;
  uint64_t v30;
  TIKeyboardBehaviors *keyboardBehaviors;
  void *v32;
  uint64_t v33;
  NSString *inputString;
  void *v35;
  uint64_t v36;
  NSString *shadowTyping;
  uint64_t v38;
  TIKeyboardCandidate *autocorrectionRecordForInputString;
  uint64_t v40;
  TIKeyEventMap *keyEventMap;
  void *v42;
  uint64_t v43;
  NSString *replacementForDoubleSpace;
  void *v45;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)TIKeyboardInputManagerState;
  v5 = -[TIKeyboardInputManagerState init](&v47, sel_init);
  if (v5)
  {
    v5->_mask.integerValue = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("mask"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wordSeparator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    wordSeparator = v5->_wordSeparator;
    v5->_wordSeparator = (NSString *)v7;

    v5->_shouldAddModifierSymbolsToWordCharacters = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAddModifierSymbolsToWordCharacters"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wordCharacters"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    wordCharacters = v5->_wordCharacters;
    v5->_wordCharacters = (TICharacterSetDescription *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("supplementalLexiconWordExtraCharacters"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    supplementalLexiconWordExtraCharacters = v5->_supplementalLexiconWordExtraCharacters;
    v5->_supplementalLexiconWordExtraCharacters = (TICharacterSetDescription *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutCompletions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    shortcutCompletions = v5->_shortcutCompletions;
    v5->_shortcutCompletions = (TICharacterSetDescription *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputsPreventingAcceptSelectedCandidate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    inputsPreventingAcceptSelectedCandidate = v5->_inputsPreventingAcceptSelectedCandidate;
    v5->_inputsPreventingAcceptSelectedCandidate = (TICharacterSetDescription *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputsToReject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    inputsToReject = v5->_inputsToReject;
    v5->_inputsToReject = (TICharacterSetDescription *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("terminatorsPreventingAutocorrection"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    terminatorsPreventingAutocorrection = v5->_terminatorsPreventingAutocorrection;
    v5->_terminatorsPreventingAutocorrection = (TICharacterSetDescription *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("terminatorsDeletingAutospace"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    terminatorsDeletingAutospace = v5->_terminatorsDeletingAutospace;
    v5->_terminatorsDeletingAutospace = (TICharacterSetDescription *)v28;

    v5->_initialCandidateBatchCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("initialCandidateBatchCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyboardBehaviors"));
    v30 = objc_claimAutoreleasedReturnValue();
    keyboardBehaviors = v5->_keyboardBehaviors;
    v5->_keyboardBehaviors = (TIKeyboardBehaviors *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputString"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    inputString = v5->_inputString;
    v5->_inputString = (NSString *)v33;

    v5->_hasSupplementalPrefix = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSupplementalPrefix"));
    v5->_inputIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inputIndex"));
    v5->_inputCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inputCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shadowTyping"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    shadowTyping = v5->_shadowTyping;
    v5->_shadowTyping = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autocorrectionRecordForInputString"));
    v38 = objc_claimAutoreleasedReturnValue();
    autocorrectionRecordForInputString = v5->_autocorrectionRecordForInputString;
    v5->_autocorrectionRecordForInputString = (TIKeyboardCandidate *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyEventMap"));
    v40 = objc_claimAutoreleasedReturnValue();
    keyEventMap = v5->_keyEventMap;
    v5->_keyEventMap = (TIKeyEventMap *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replacementForDoubleSpace"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "copy");
    replacementForDoubleSpace = v5->_replacementForDoubleSpace;
    v5->_replacementForDoubleSpace = (NSString *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("learningFlagsMaskForLastAcceptedCandidate"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_learningFlagsMaskForLastAcceptedCandidate = objc_msgSend(v45, "unsignedIntValue");

  }
  return v5;
}

- (void)setShortcutCompletions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setShadowTyping:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setReplacementForDoubleSpace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setLearningFlagsMaskForLastAcceptedCandidate:(unint64_t)a3
{
  self->_learningFlagsMaskForLastAcceptedCandidate = a3;
}

- (void)setInputsToReject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setInputString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setInputIndex:(unint64_t)a3
{
  self->_inputIndex = a3;
}

- (void)setInputCount:(unint64_t)a3
{
  self->_inputCount = a3;
}

- (void)setHasSupplementalPrefix:(BOOL)a3
{
  self->_hasSupplementalPrefix = a3;
}

- (NSString)inputString
{
  return self->_inputString;
}

- (BOOL)usesContinuousPath
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 1) & 1;
}

- (BOOL)usesCandidateSelection
{
  return BYTE1(self->_mask.integerValue) & 1;
}

- (BOOL)supportsSetPhraseBoundary
{
  return (LOBYTE(self->_mask.integerValue) >> 5) & 1;
}

- (void)setKeyEventMap:(id)a3
{
  objc_storeStrong((id *)&self->_keyEventMap, a3);
}

- (void)setAutocorrectionRecordForInputString:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrectionRecordForInputString, a3);
}

- (unint64_t)autoquoteType
{
  return ((unint64_t)LODWORD(self->_mask.integerValue) >> 15) & 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t integerValue;
  NSString *replacementForDoubleSpace;
  NSString *wordSeparator;
  unint64_t initialCandidateBatchCount;
  TICharacterSetDescription *wordCharacters;
  TICharacterSetDescription *supplementalLexiconWordExtraCharacters;
  TICharacterSetDescription *shortcutCompletions;
  TICharacterSetDescription *inputsPreventingAcceptSelectedCandidate;
  TICharacterSetDescription *inputsToReject;
  TICharacterSetDescription *terminatorsPreventingAutocorrection;
  TICharacterSetDescription *terminatorsDeletingAutospace;
  TIKeyboardBehaviors *keyboardBehaviors;
  NSString *inputString;
  unint64_t inputIndex;
  unint64_t inputCount;
  NSString *shadowTyping;
  TIKeyboardCandidate *autocorrectionRecordForInputString;
  TIKeyEventMap *keyEventMap;
  void *v23;
  id v24;

  v4 = a3;
  integerValue = self->_mask.integerValue;
  v24 = v4;
  if (integerValue)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", integerValue, CFSTR("mask"));
    v4 = v24;
  }
  replacementForDoubleSpace = self->_replacementForDoubleSpace;
  if (replacementForDoubleSpace)
  {
    objc_msgSend(v24, "encodeObject:forKey:", replacementForDoubleSpace, CFSTR("replacementForDoubleSpace"));
    v4 = v24;
  }
  wordSeparator = self->_wordSeparator;
  if (wordSeparator)
  {
    objc_msgSend(v24, "encodeObject:forKey:", wordSeparator, CFSTR("wordSeparator"));
    v4 = v24;
  }
  initialCandidateBatchCount = self->_initialCandidateBatchCount;
  if (initialCandidateBatchCount)
  {
    objc_msgSend(v24, "encodeInteger:forKey:", initialCandidateBatchCount, CFSTR("initialCandidateBatchCount"));
    v4 = v24;
  }
  if (self->_shouldAddModifierSymbolsToWordCharacters)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("shouldAddModifierSymbolsToWordCharacters"));
    v4 = v24;
  }
  wordCharacters = self->_wordCharacters;
  if (wordCharacters)
  {
    objc_msgSend(v24, "encodeObject:forKey:", wordCharacters, CFSTR("wordCharacters"));
    v4 = v24;
  }
  supplementalLexiconWordExtraCharacters = self->_supplementalLexiconWordExtraCharacters;
  if (supplementalLexiconWordExtraCharacters)
  {
    objc_msgSend(v24, "encodeObject:forKey:", supplementalLexiconWordExtraCharacters, CFSTR("supplementalLexiconWordExtraCharacters"));
    v4 = v24;
  }
  shortcutCompletions = self->_shortcutCompletions;
  if (shortcutCompletions)
  {
    objc_msgSend(v24, "encodeObject:forKey:", shortcutCompletions, CFSTR("shortcutCompletions"));
    v4 = v24;
  }
  inputsPreventingAcceptSelectedCandidate = self->_inputsPreventingAcceptSelectedCandidate;
  if (inputsPreventingAcceptSelectedCandidate)
  {
    objc_msgSend(v24, "encodeObject:forKey:", inputsPreventingAcceptSelectedCandidate, CFSTR("inputsPreventingAcceptSelectedCandidate"));
    v4 = v24;
  }
  inputsToReject = self->_inputsToReject;
  if (inputsToReject)
  {
    objc_msgSend(v24, "encodeObject:forKey:", inputsToReject, CFSTR("inputsToReject"));
    v4 = v24;
  }
  terminatorsPreventingAutocorrection = self->_terminatorsPreventingAutocorrection;
  if (terminatorsPreventingAutocorrection)
  {
    objc_msgSend(v24, "encodeObject:forKey:", terminatorsPreventingAutocorrection, CFSTR("terminatorsPreventingAutocorrection"));
    v4 = v24;
  }
  terminatorsDeletingAutospace = self->_terminatorsDeletingAutospace;
  if (terminatorsDeletingAutospace)
  {
    objc_msgSend(v24, "encodeObject:forKey:", terminatorsDeletingAutospace, CFSTR("terminatorsDeletingAutospace"));
    v4 = v24;
  }
  keyboardBehaviors = self->_keyboardBehaviors;
  if (keyboardBehaviors)
  {
    objc_msgSend(v24, "encodeObject:forKey:", keyboardBehaviors, CFSTR("keyboardBehaviors"));
    v4 = v24;
  }
  inputString = self->_inputString;
  if (inputString)
  {
    objc_msgSend(v24, "encodeObject:forKey:", inputString, CFSTR("inputString"));
    v4 = v24;
  }
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasSupplementalPrefix, CFSTR("hasSupplementalPrefix"));
  inputIndex = self->_inputIndex;
  if (inputIndex)
    objc_msgSend(v24, "encodeInteger:forKey:", inputIndex, CFSTR("inputIndex"));
  inputCount = self->_inputCount;
  if (inputCount)
    objc_msgSend(v24, "encodeInteger:forKey:", inputCount, CFSTR("inputCount"));
  shadowTyping = self->_shadowTyping;
  if (shadowTyping)
    objc_msgSend(v24, "encodeObject:forKey:", shadowTyping, CFSTR("shadowTyping"));
  autocorrectionRecordForInputString = self->_autocorrectionRecordForInputString;
  if (autocorrectionRecordForInputString)
    objc_msgSend(v24, "encodeObject:forKey:", autocorrectionRecordForInputString, CFSTR("autocorrectionRecordForInputString"));
  keyEventMap = self->_keyEventMap;
  if (keyEventMap)
    objc_msgSend(v24, "encodeObject:forKey:", keyEventMap, CFSTR("keyEventMap"));
  if (self->_learningFlagsMaskForLastAcceptedCandidate)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "encodeObject:forKey:", v23, CFSTR("learningFlagsMaskForLastAcceptedCandidate"));

  }
}

- (void)setUsesPunctuationKeysForRowNavigation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFF7FFFF | v3);
}

- (void)setUsesLiveConversion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFF7FFFFF | v3);
}

- (void)setUsesContinuousPath:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFDFFFF | v3);
}

- (void)setSuppressPlaceholderCandidate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFDFFF | v3);
}

- (void)setSupportsNumberKeySelection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFEF | v3);
}

- (void)setShouldFixupIncompleteRomaji:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFDFFFFF | v3);
}

- (void)setNextInputWouldStartSentence:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFF7FF | v3);
}

- (void)setInputStringIsExemptFromChecker:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFEFFF | v3);
}

- (void)setIgnoreContinuousPathRequirements:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFDFFFFFF | v3);
}

- (void)setDelayedCandidateList:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFEFFFFFF | v3);
}

- (void)setAcceptAutocorrectionCommitsInline:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFBFFFFF | v3);
}

- (BOOL)shouldExtendPriorWord
{
  return (LOBYTE(self->_mask.integerValue) >> 2) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchStringForMarkedText, 0);
  objc_storeStrong((id *)&self->_terminatorsDeletingAutospace, 0);
  objc_storeStrong((id *)&self->_terminatorsPreventingAutocorrection, 0);
  objc_storeStrong((id *)&self->_inputsToReject, 0);
  objc_storeStrong((id *)&self->_inputsPreventingAcceptSelectedCandidate, 0);
  objc_storeStrong((id *)&self->_shortcutCompletions, 0);
  objc_storeStrong((id *)&self->_supplementalLexiconWordExtraCharacters, 0);
  objc_storeStrong((id *)&self->_wordCharacters, 0);
  objc_storeStrong((id *)&self->_shadowTyping, 0);
  objc_storeStrong((id *)&self->_replacementForDoubleSpace, 0);
  objc_storeStrong((id *)&self->_keyEventMap, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
  objc_storeStrong((id *)&self->_wordSeparator, 0);
  objc_storeStrong((id *)&self->_autocorrectionRecordForInputString, 0);
  objc_storeStrong((id *)&self->_keyboardBehaviors, 0);
}

- (BOOL)shouldFixupIncompleteRomaji
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 5) & 1;
}

- (NSNumber)learningFlagsForLastAcceptedCandidate
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(self->_learningFlagsMaskForLastAcceptedCandidate));
}

- (void)setLearningFlagsForLastAcceptedCandidate:(id)a3
{
  self->_learningFlagsMaskForLastAcceptedCandidate = objc_msgSend(a3, "unsignedIntValue");
}

- (BOOL)canHandleKeyHitTest
{
  return self->_mask.integerValue & 1;
}

- (void)setCanHandleKeyHitTest:(BOOL)a3
{
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFFE | a3);
}

- (BOOL)commitsAcceptedCandidate
{
  return (BYTE1(self->_mask.integerValue) >> 1) & 1;
}

- (void)setCommitsAcceptedCandidate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFDFF | v3);
}

- (BOOL)newInputAcceptsUserSelectedCandidate
{
  return (BYTE1(self->_mask.integerValue) >> 2) & 1;
}

- (void)setNewInputAcceptsUserSelectedCandidate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFBFF | v3);
}

- (BOOL)ignoresDeadKeys
{
  return (LOBYTE(self->_mask.integerValue) >> 1) & 1;
}

- (void)setIgnoresDeadKeys:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFFD | v3);
}

- (BOOL)inputStringIsExemptFromChecker
{
  return (BYTE1(self->_mask.integerValue) >> 4) & 1;
}

- (BOOL)nextInputWouldStartSentence
{
  return (BYTE1(self->_mask.integerValue) >> 3) & 1;
}

- (void)setShouldExtendPriorWord:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFFB | v3);
}

- (BOOL)supportsReversionUI
{
  return (*((unsigned __int8 *)&self->_mask.fields + 3) >> 2) & 1;
}

- (void)setSupportsReversionUI:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFBFFFFFF | v3);
}

- (BOOL)suppliesCompletions
{
  return (LOBYTE(self->_mask.integerValue) >> 3) & 1;
}

- (void)setSuppliesCompletions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFF7 | v3);
}

- (BOOL)supportsNumberKeySelection
{
  return (LOBYTE(self->_mask.integerValue) >> 4) & 1;
}

- (BOOL)usesPunctuationKeysForRowNavigation
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 3) & 1;
}

- (void)setSupportsSetPhraseBoundary:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFDF | v3);
}

- (BOOL)suppressCompletionsForFieldEditor
{
  return (LOBYTE(self->_mask.integerValue) >> 6) & 1;
}

- (void)setSuppressCompletionsForFieldEditor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFFBF | v3);
}

- (BOOL)usesAutoDeleteWord
{
  return LOBYTE(self->_mask.integerValue) >> 7;
}

- (void)setUsesAutoDeleteWord:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFF7F | v3);
}

- (void)setUsesCandidateSelection:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFFEFF | v3);
}

- (BOOL)usesAutocorrectionLists
{
  return (BYTE1(self->_mask.integerValue) >> 6) & 1;
}

- (void)setUsesAutocorrectionLists:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFFBFFF | v3);
}

- (BOOL)suppressPlaceholderCandidate
{
  return (BYTE1(self->_mask.integerValue) >> 5) & 1;
}

- (void)setAutoquoteType:(unint64_t)a3
{
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFE7FFF | ((a3 & 3) << 15));
}

- (BOOL)ignoreContinuousPathRequirements
{
  return (*((unsigned __int8 *)&self->_mask.fields + 3) >> 1) & 1;
}

- (BOOL)usesLiveConversion
{
  return *((unsigned __int8 *)&self->_mask.fields + 2) >> 7;
}

- (BOOL)delayedCandidateList
{
  return *((_BYTE *)&self->_mask.fields + 3) & 1;
}

- (BOOL)usesContinuousPathProgressiveCandidates
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 2) & 1;
}

- (void)setUsesContinuousPathProgressiveCandidates:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFFBFFFF | v3);
}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 4) & 1;
}

- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_mask.fields = ($9BCC2A72D31EC22C1C4274BD6AECA767)(self->_mask.integerValue & 0xFFEFFFFF | v3);
}

- (BOOL)acceptAutocorrectionCommitsInline
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 6) & 1;
}

- (BOOL)acceptInputString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  if (v4
    && (-[TIKeyboardInputManagerState inputsToReject](self, "inputsToReject"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[TIKeyboardInputManagerState inputsToReject](self, "inputsToReject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v7);

    v9 = v8 != 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)inputStringAcceptsCurrentCandidateIfSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  if (v4)
  {
    -[TIKeyboardInputManagerState inputsPreventingAcceptSelectedCandidate](self, "inputsPreventingAcceptSelectedCandidate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TIKeyboardInputManagerState inputsPreventingAcceptSelectedCandidate](self, "inputsPreventingAcceptSelectedCandidate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "characterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v7);

      v9 = v8 != 0;
    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldSuppressAutocorrectionWithTerminator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  if (!v4)
    goto LABEL_4;
  -[TIKeyboardInputManagerState terminatorsPreventingAutocorrection](self, "terminatorsPreventingAutocorrection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_4;
  -[TIKeyboardInputManagerState terminatorsPreventingAutocorrection](self, "terminatorsPreventingAutocorrection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "characterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v7);
  v10 = v9;

  if (!v8)
    v11 = v10 == objc_msgSend(v4, "length");
  else
LABEL_4:
    v11 = 0;

  return v11;
}

- (BOOL)shouldDeleteAutospaceBeforeTerminator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  if (!v4)
    goto LABEL_4;
  -[TIKeyboardInputManagerState terminatorsDeletingAutospace](self, "terminatorsDeletingAutospace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_4;
  -[TIKeyboardInputManagerState terminatorsDeletingAutospace](self, "terminatorsDeletingAutospace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "characterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v7);
  v10 = v9;

  if (!v8)
    v11 = v10 == objc_msgSend(v4, "length");
  else
LABEL_4:
    v11 = 0;

  return v11;
}

- (BOOL)stringEndsWord:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if ((objc_msgSend(v4, "_isSingleEmoji") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "_firstLongCharacter");
    -[TIKeyboardInputManagerState wordCharacters](self, "wordCharacters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "characterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longCharacterIsMember:", v6);

    if ((v9 & 1) == 0)
    {
      if (!-[TIKeyboardInputManagerState hasSupplementalPrefix](self, "hasSupplementalPrefix")
        || (-[TIKeyboardInputManagerState supplementalLexiconWordExtraCharacters](self, "supplementalLexiconWordExtraCharacters"), v11 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v11, "characterSet"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v13 = objc_msgSend(v12, "longCharacterIsMember:", v6), v12, v11, (v13 & 1) == 0))
      {
        if (!-[TIKeyboardInputManagerState shouldAddModifierSymbolsToWordCharacters](self, "shouldAddModifierSymbolsToWordCharacters")|| (objc_msgSend(v4, "_isModifierSymbol") & 1) == 0)
        {
          -[TIKeyboardInputManagerState shortcutCompletions](self, "shortcutCompletions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "characterSet");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "longCharacterIsMember:", v6);

          v5 = v16 ^ 1;
          goto LABEL_6;
        }
      }
    }
    goto LABEL_5;
  }
  v5 = 1;
LABEL_6:

  return v5;
}

- (TIKeyboardCandidate)autocorrectionRecordForInputString
{
  return self->_autocorrectionRecordForInputString;
}

- (NSString)wordSeparator
{
  return self->_wordSeparator;
}

- (void)setWordSeparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)inputCount
{
  return self->_inputCount;
}

- (unint64_t)inputIndex
{
  return self->_inputIndex;
}

- (void)setKeyboardBehaviors:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardBehaviors, a3);
}

- (TIKeyEventMap)keyEventMap
{
  return self->_keyEventMap;
}

- (NSString)replacementForDoubleSpace
{
  return self->_replacementForDoubleSpace;
}

- (NSString)shadowTyping
{
  return self->_shadowTyping;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return self->_shouldAddModifierSymbolsToWordCharacters;
}

- (void)setShouldAddModifierSymbolsToWordCharacters:(BOOL)a3
{
  self->_shouldAddModifierSymbolsToWordCharacters = a3;
}

- (unint64_t)initialCandidateBatchCount
{
  return self->_initialCandidateBatchCount;
}

- (void)setInitialCandidateBatchCount:(unint64_t)a3
{
  self->_initialCandidateBatchCount = a3;
}

- (TICharacterSetDescription)wordCharacters
{
  return self->_wordCharacters;
}

- (void)setWordCharacters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (TICharacterSetDescription)supplementalLexiconWordExtraCharacters
{
  return self->_supplementalLexiconWordExtraCharacters;
}

- (void)setSupplementalLexiconWordExtraCharacters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (TICharacterSetDescription)shortcutCompletions
{
  return self->_shortcutCompletions;
}

- (TICharacterSetDescription)inputsPreventingAcceptSelectedCandidate
{
  return self->_inputsPreventingAcceptSelectedCandidate;
}

- (void)setInputsPreventingAcceptSelectedCandidate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (TICharacterSetDescription)inputsToReject
{
  return self->_inputsToReject;
}

- (TICharacterSetDescription)terminatorsPreventingAutocorrection
{
  return self->_terminatorsPreventingAutocorrection;
}

- (void)setTerminatorsPreventingAutocorrection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (TICharacterSetDescription)terminatorsDeletingAutospace
{
  return self->_terminatorsDeletingAutospace;
}

- (void)setTerminatorsDeletingAutospace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)hasSupplementalPrefix
{
  return self->_hasSupplementalPrefix;
}

- (unint64_t)learningFlagsMaskForLastAcceptedCandidate
{
  return self->_learningFlagsMaskForLastAcceptedCandidate;
}

- (NSString)searchStringForMarkedText
{
  return self->_searchStringForMarkedText;
}

- (void)setSearchStringForMarkedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

@end
