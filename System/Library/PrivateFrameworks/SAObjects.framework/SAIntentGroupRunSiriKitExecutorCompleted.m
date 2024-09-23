@implementation SAIntentGroupRunSiriKitExecutorCompleted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("RunSiriKitExecutorCompleted");
}

+ (id)runSiriKitExecutorCompleted
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)needsServerExecution
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("needsServerExecution"));
}

- (void)setNeedsServerExecution:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("needsServerExecution"), a3);
}

- (BOOL)needsUserInput
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("needsUserInput"));
}

- (void)setNeedsUserInput:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("needsUserInput"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
