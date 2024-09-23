@implementation TUIAnalyticsSession

- (void)beginSession
{
  self->_sessionActive = 1;
}

- (void)endSession
{
  self->_sessionActive = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[TUIAnalyticsSession endSession](self, "endSession");
  v3.receiver = self;
  v3.super_class = (Class)TUIAnalyticsSession;
  -[TUIAnalyticsSession dealloc](&v3, sel_dealloc);
}

- (BOOL)isSessionActive
{
  return self->_sessionActive;
}

+ (id)preferredEventName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("UIKBAnalytics"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)currentInputModeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifierWithLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
