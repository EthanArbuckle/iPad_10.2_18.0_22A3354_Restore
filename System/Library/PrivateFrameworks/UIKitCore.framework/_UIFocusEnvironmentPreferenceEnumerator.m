@implementation _UIFocusEnvironmentPreferenceEnumerator

- (_UIFocusEnvironmentPreferenceEnumerator)init
{
  return -[_UIFocusEnvironmentPreferenceEnumerator initWithEnumerationMode:](self, "initWithEnumerationMode:", 0);
}

- (_UIFocusEnvironmentPreferenceEnumerator)initWithEnumerationMode:(int64_t)a3
{
  _UIFocusEnvironmentPreferenceEnumerator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFocusEnvironmentPreferenceEnumerator;
  result = -[_UIFocusEnvironmentPreferenceEnumerator init](&v5, sel_init);
  if (result)
  {
    result->_allowsInferringPreferences = 1;
    result->_enumerationMode = a3;
  }
  return result;
}

- (void)enumeratePreferencesForEnvironment:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UIFocusEnvironmentPreferenceEnumerationContext *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEnvironmentPreferenceEnumerator.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusEnvironmentPreferenceEnumerator.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

LABEL_3:
  v10 = -[_UIFocusEnvironmentPreferenceEnumerationContext initWithFocusEnvironment:enumerationMode:]([_UIFocusEnvironmentPreferenceEnumerationContext alloc], "initWithFocusEnvironment:enumerationMode:", v7, -[_UIFocusEnvironmentPreferenceEnumerator enumerationMode](self, "enumerationMode"));
  -[_UIFocusEnvironmentPreferenceEnumerationContext setDelegate:](v10, "setDelegate:", self);
  if (self->_debugLog)
  {
    -[_UIFocusEnvironmentPreferenceEnumerationContext _startLogging](v10, "_startLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDebugLogNode addMessage:](self->_debugLog, "addMessage:", v11);

  }
  v14 = 0;
  _enumeratePreferredFocusEnvironments(self, v10, v9, &v14);
  if (self->_debugLog)
    -[_UIFocusEnvironmentPreferenceEnumerationContext _stopLogging](v10, "_stopLogging");

}

- (BOOL)_shouldInferDefaultPreferenceForEnvironmentInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = v4;
  if (self->_allowsInferringPreferences && objc_msgSend(v4, "isInPreferredSubtree"))
  {
    v6 = _Block_copy(self->_shouldInferPreferenceForEnvironmentHandler);
    v7 = v6;
    if (v6)
      v8 = (*((uint64_t (**)(void *, void *))v6 + 2))(v6, v5);
    else
      v8 = 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)enumerationMode
{
  return self->_enumerationMode;
}

- (id)didVisitAllPreferencesForEnvironmentHandler
{
  return self->_didVisitAllPreferencesForEnvironmentHandler;
}

- (void)setDidVisitAllPreferencesForEnvironmentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)allowsInferringPreferences
{
  return self->_allowsInferringPreferences;
}

- (void)setAllowsInferringPreferences:(BOOL)a3
{
  self->_allowsInferringPreferences = a3;
}

- (id)shouldInferPreferenceForEnvironmentHandler
{
  return self->_shouldInferPreferenceForEnvironmentHandler;
}

- (void)setShouldInferPreferenceForEnvironmentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_UIDebugLogNode)debugLog
{
  return self->_debugLog;
}

- (void)setDebugLog:(id)a3
{
  objc_storeStrong((id *)&self->_debugLog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLog, 0);
  objc_storeStrong(&self->_shouldInferPreferenceForEnvironmentHandler, 0);
  objc_storeStrong(&self->_didVisitAllPreferencesForEnvironmentHandler, 0);
}

@end
