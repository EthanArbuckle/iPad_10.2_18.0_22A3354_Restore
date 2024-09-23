@implementation SARDExecuteNLOnServer

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("ExecuteNLOnServer");
}

- (NSArray)aceDelegatedUserDialogActList
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("aceDelegatedUserDialogActList"), v3);
}

- (void)setAceDelegatedUserDialogActList:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("aceDelegatedUserDialogActList"), (uint64_t)a3);
}

- (NSString)directAction
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("directAction"));
}

- (void)setDirectAction:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("directAction"), a3);
}

- (NSDictionary)preITNRecognitionSausageMap
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("preITNRecognitionSausageMap"), v3);
}

- (void)setPreITNRecognitionSausageMap:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("preITNRecognitionSausageMap"), (uint64_t)a3);
}

- (SASRecognition)recognitionSausage
{
  return (SASRecognition *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("recognitionSausage"));
}

- (void)setRecognitionSausage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("recognitionSausage"), a3);
}

- (NSDictionary)recognitionSausageMap
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSDictionary *)AceObjectClassDictionaryForProperty(self, (uint64_t)CFSTR("recognitionSausageMap"), v3);
}

- (void)setRecognitionSausageMap:(id)a3
{
  AceObjectSetAceObjectDictionaryForProperty(self, CFSTR("recognitionSausageMap"), (uint64_t)a3);
}

- (NSDictionary)requestExecutionParameters
{
  return (NSDictionary *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestExecutionParameters"));
}

- (void)setRequestExecutionParameters:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestExecutionParameters"), a3);
}

- (NSString)requestType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("requestType"));
}

- (void)setRequestType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("requestType"), a3);
}

- (NSString)resultCandidateId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultCandidateId"));
}

- (void)setResultCandidateId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultCandidateId"), a3);
}

- (NSString)utterance
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("utterance"));
}

- (void)setUtterance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("utterance"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end
