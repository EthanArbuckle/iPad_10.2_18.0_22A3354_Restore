@implementation SAMPMediaEntityList

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.media");
}

- (id)encodedClassName
{
  return CFSTR("MediaEntityList");
}

+ (id)mediaEntityList
{
  return objc_alloc_init((Class)a1);
}

- (int)mediaType
{
  void *v2;
  int v3;

  -[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("mediaType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAMPTypeForString(v2);

  return v3;
}

- (void)setMediaType:(int)a3
{
  id v4;

  stringForSAMPType(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, CFSTR("mediaType"), v4);

}

- (SAMPCollection)parentCollection
{
  return (SAMPCollection *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("parentCollection"));
}

- (void)setParentCollection:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("parentCollection"), a3);
}

@end
