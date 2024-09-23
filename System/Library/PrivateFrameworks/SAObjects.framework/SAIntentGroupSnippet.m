@implementation SAIntentGroupSnippet

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.command.assistant.intent");
}

- (id)encodedClassName
{
  return CFSTR("Snippet");
}

+ (id)snippet
{
  return objc_alloc_init((Class)a1);
}

- (NSString)appId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("appId"));
}

- (void)setAppId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("appId"), a3);
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, (uint64_t)CFSTR("commands"), &unk_1EE77C568);
}

- (void)setCommands:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("commands"), (uint64_t)a3);
}

- (SAIntentGroupProtobufMessage)intent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("intent"));
}

- (void)setIntent:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("intent"), a3);
}

- (SAIntentGroupProtobufMessage)intentResponse
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("intentResponse"));
}

- (void)setIntentResponse:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("intentResponse"), a3);
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedIntent"));
}

- (void)setJsonEncodedIntent:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedIntent"), a3);
}

- (NSString)jsonEncodedIntentResponse
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("jsonEncodedIntentResponse"));
}

- (void)setJsonEncodedIntentResponse:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("jsonEncodedIntentResponse"), a3);
}

- (SAServerBoundCommand)processSynapseFlowCommand
{
  return (SAServerBoundCommand *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("processSynapseFlowCommand"));
}

- (void)setProcessSynapseFlowCommand:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("processSynapseFlowCommand"), a3);
}

- (NSArray)snippetTemplates
{
  uint64_t v3;

  v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, (uint64_t)CFSTR("snippetTemplates"), v3);
}

- (void)setSnippetTemplates:(id)a3
{
  AceObjectSetArrayForProperty(self, CFSTR("snippetTemplates"), (uint64_t)a3);
}

- (BOOL)widgetAllowed
{
  return AceObjectBoolForProperty(self, (uint64_t)CFSTR("widgetAllowed"));
}

- (void)setWidgetAllowed:(BOOL)a3
{
  AceObjectSetBoolForProperty(self, CFSTR("widgetAllowed"), a3);
}

- (NSNumber)widgetIndex
{
  return (NSNumber *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("widgetIndex"));
}

- (void)setWidgetIndex:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("widgetIndex"), a3);
}

@end
