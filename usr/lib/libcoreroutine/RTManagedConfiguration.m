@implementation RTManagedConfiguration

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return +[RTManagedConfiguration allocWithZone:](RTManagedConfiguration_Embedded, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___RTManagedConfiguration;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (BOOL)effectiveBoolValueForSetting:(id)a3
{
  return 0;
}

- (BOOL)isDiagnosticsAndUsageAllowed
{
  return 0;
}

- (BOOL)isFindMyCarAllowed
{
  return 0;
}

- (BOOL)isHealthDataSubmissionAllowed
{
  return 0;
}

- (RTManagedConfigurationObserver)delegate
{
  return (RTManagedConfigurationObserver *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
