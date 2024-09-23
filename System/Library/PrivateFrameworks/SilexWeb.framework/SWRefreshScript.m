@implementation SWRefreshScript

- (NSString)identifier
{
  return (NSString *)CFSTR("refresh");
}

- (BOOL)queueable
{
  return 0;
}

- (NSString)executableScript
{
  return (NSString *)CFSTR("var event = new Event('ANRefresh'); document.dispatchEvent(event);");
}

- (WKUserScript)userScript
{
  return self->userScript;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->userScript, 0);
}

@end
