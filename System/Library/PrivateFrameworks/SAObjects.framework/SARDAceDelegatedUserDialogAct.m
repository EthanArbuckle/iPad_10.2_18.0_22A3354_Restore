@implementation SARDAceDelegatedUserDialogAct

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.requestdispatch");
}

- (id)encodedClassName
{
  return CFSTR("AceDelegatedUserDialogAct");
}

- (int64_t)asrHypothesisIndex
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("asrHypothesisIndex"));
}

- (void)setAsrHypothesisIndex:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("asrHypothesisIndex"), a3);
}

- (NSString)externalParserId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("externalParserId"));
}

- (void)setExternalParserId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("externalParserId"), a3);
}

- (SARDAceRewriteMessage)rewriteMessage
{
  return (SARDAceRewriteMessage *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("rewriteMessage"));
}

- (void)setRewriteMessage:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("rewriteMessage"), a3);
}

- (NSString)rewrittenUtterance
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("rewrittenUtterance"));
}

- (void)setRewrittenUtterance:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("rewrittenUtterance"), a3);
}

@end
