@implementation WFRunShortcutEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

+ (id)serializablePropertyTransformers
{
  WFEventSignificantFigureValueTransformer *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("actionCount");
  v2 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)shortcutSource
{
  return self->_shortcutSource;
}

- (void)setShortcutSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)runSource
{
  return self->_runSource;
}

- (void)setRunSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setAutomationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)automationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier;
}

- (void)setAutomationSuggestionsTrialIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unsigned)actionCount
{
  return self->_actionCount;
}

- (void)setActionCount:(unsigned int)a3
{
  self->_actionCount = a3;
}

- (unsigned)numberOfDialogsPresented
{
  return self->_numberOfDialogsPresented;
}

- (void)setNumberOfDialogsPresented:(unsigned int)a3
{
  self->_numberOfDialogsPresented = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)didRunRemotely
{
  return self->_didRunRemotely;
}

- (void)setDidRunRemotely:(BOOL)a3
{
  self->_didRunRemotely = a3;
}

- (BOOL)isFromAutomationSuggestion
{
  return self->_isFromAutomationSuggestion;
}

- (void)setIsFromAutomationSuggestion:(BOOL)a3
{
  self->_isFromAutomationSuggestion = a3;
}

- (NSString)scriptingRunBundleIdentifier
{
  return self->_scriptingRunBundleIdentifier;
}

- (void)setScriptingRunBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptingRunBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
