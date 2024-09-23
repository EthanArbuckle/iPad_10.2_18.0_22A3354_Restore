@implementation SAStructuredDictationPlaceResult

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("StructuredDictationPlaceResult");
}

+ (id)structuredDictationPlaceResult
{
  return objc_alloc_init((Class)a1);
}

- (NSString)placeResultType
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("placeResultType"));
}

- (void)setPlaceResultType:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("placeResultType"), a3);
}

- (NSData)resultData
{
  return (NSData *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("resultData"));
}

- (void)setResultData:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("resultData"), a3);
}

@end
