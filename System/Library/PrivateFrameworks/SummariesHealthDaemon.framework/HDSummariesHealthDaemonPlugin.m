@implementation HDSummariesHealthDaemonPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)CFSTR("Summaries");
}

- (id)extensionForProfile:(id)a3
{
  id v3;
  HDSummariesHealthDaemonPluginProfileExtension *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = -[HDSummariesHealthDaemonPluginProfileExtension initWithProfile:]([HDSummariesHealthDaemonPluginProfileExtension alloc], "initWithProfile:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

@end
