@implementation VSRecognitionAction

- (id)_session
{
  return self->_session;
}

- (void)_setSession:(id)a3
{
  self->_session = (VSRecognitionSession *)a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSRecognitionAction;
  -[VSRecognitionAction dealloc](&v3, sel_dealloc);
}

- (id)resultDisplayString
{
  return self->_resultString;
}

- (void)setResultDisplayString:(id)a3
{
  NSString *resultString;

  resultString = self->_resultString;
  if (resultString != a3)
  {

    self->_resultString = (NSString *)a3;
  }
}

- (id)statusDisplayString
{
  return self->_statusString;
}

- (void)setStatusDisplayString:(id)a3
{
  NSString *statusString;

  statusString = self->_statusString;
  if (statusString != a3)
  {

    self->_statusString = (NSString *)a3;
  }
}

- (id)spokenFeedbackString
{
  char v2;
  id result;

  v2 = *((_BYTE *)self + 40);
  result = self->_spokenString.stringValue;
  if ((v2 & 1) != 0)
    return (id)objc_msgSend(result, "string");
  return result;
}

- (void)setSpokenFeedbackString:(id)a3
{
  NSString *stringValue;

  stringValue = self->_spokenString.stringValue;
  if ((*((_BYTE *)self + 40) & 1) != 0 || stringValue != a3)
  {

    self->_spokenString.stringValue = (NSString *)a3;
    *((_BYTE *)self + 40) &= ~1u;
  }
}

- (id)spokenFeedbackAttributedString
{
  if ((*((_BYTE *)self + 40) & 1) != 0)
    return self->_spokenString.stringValue;
  else
    return 0;
}

- (void)setSpokenFeedbackAttributedString:(id)a3
{
  NSString *stringValue;

  stringValue = self->_spokenString.stringValue;
  if ((*((_BYTE *)self + 40) & 1) == 0 || stringValue != a3)
  {

    self->_spokenString.stringValue = (NSString *)a3;
    *((_BYTE *)self + 40) |= 1u;
  }
}

- (int)completionType
{
  return 0;
}

- (id)perform
{
  const __CFAllocator *v2;
  void *v3;
  void *userInfoValues;
  void *userInfoKeys[2];

  userInfoKeys[1] = *(void **)MEMORY[0x1E0C80C00];
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = (void *)*MEMORY[0x1E0C9AFB0];
  userInfoValues = CFSTR("recognition action not implemented");
  userInfoKeys[0] = v3;
  return CFErrorCreateWithUserInfoKeysAndValues(v2, CFSTR("VSErrorDomain"), -4009, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 1);
}

- (id)cancel
{
  return 0;
}

- (void)completeWithNextAction:(id)a3 error:(id)a4
{
  -[VSRecognitionSession _actionCompleted:nextAction:error:](self->_session, "_actionCompleted:nextAction:error:", self, a3, a4);
}

- (BOOL)_hasDeferredStartCallback
{
  return 0;
}

- (BOOL)sensitiveActionsEnabled
{
  return -[VSRecognitionSession sensitiveActionsEnabled](self->_session, "sensitiveActionsEnabled");
}

@end
