@implementation TITextCheckerExemptions

- (void)setAssertsObservers:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  if (self->_assertsObservers != a3)
  {
    v3 = a3;
    self->_assertsObservers = a3;
    +[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl](TITextCheckerExemptionsImpl, "sharedTextCheckerExemptionsImpl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "addObserverAssertion");
    else
      objc_msgSend(v4, "removeObserverAssertion");

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_assertsObservers)
  {
    +[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl](TITextCheckerExemptionsImpl, "sharedTextCheckerExemptionsImpl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserverAssertion");

  }
  v4.receiver = self;
  v4.super_class = (Class)TITextCheckerExemptions;
  -[TITextCheckerExemptions dealloc](&v4, sel_dealloc);
}

- (BOOL)assertsObservers
{
  return self->_assertsObservers;
}

- (BOOL)stringIsExemptFromChecker:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl](TITextCheckerExemptionsImpl, "sharedTextCheckerExemptionsImpl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stringIsExemptFromChecker:", v3);

  return v5;
}

@end
