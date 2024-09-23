@implementation SBFPasscodeLockTrackerForTransientAssertions

- (id)mkbAssertionOptions
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("SBTransient"), CFSTR("MKBAssertionKey"), 0);
}

- (BOOL)isAssertionValid:(id)a3
{
  _BOOL4 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFPasscodeLockTrackerForTransientAssertions;
  v4 = -[SBFAuthenticationAssertionTracker isAssertionValid:](&v6, sel_isAssertionValid_, a3);
  if (v4)
    LOBYTE(v4) = self->super._mkbAssertion != 0;
  return v4;
}

@end
