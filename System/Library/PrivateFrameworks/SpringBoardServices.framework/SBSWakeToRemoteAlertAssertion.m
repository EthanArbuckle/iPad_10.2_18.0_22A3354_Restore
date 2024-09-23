@implementation SBSWakeToRemoteAlertAssertion

+ (id)acquireWakeToRemoteAlertAssertionWithDefinition:(id)a3 errorHandler:(id)a4
{
  return (id)objc_msgSend(a1, "acquireContentProviderAssertionForType:slot:identifier:configurationObject:errorHandler:", 2, CFSTR("RemoteAlert"), CFSTR("RemoteAlert"), a3, a4);
}

@end
