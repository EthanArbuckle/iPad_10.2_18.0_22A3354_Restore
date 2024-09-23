@implementation SASyncChunkAccepted

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("ChunkAccepted");
}

+ (id)chunkAccepted
{
  return objc_alloc_init((Class)a1);
}

- (SASyncAnchor)current
{
  return (SASyncAnchor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("current"));
}

- (void)setCurrent:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("current"), a3);
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end
