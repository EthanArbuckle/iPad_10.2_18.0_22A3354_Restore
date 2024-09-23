@implementation SASyncChunkDenied

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.sync");
}

- (id)encodedClassName
{
  return CFSTR("ChunkDenied");
}

+ (id)chunkDenied
{
  return objc_alloc_init((Class)a1);
}

+ (id)chunkDeniedWithErrorCode:(int64_t)a3
{
  return -[SASyncChunkDenied initWithErrorCode:]([SASyncChunkDenied alloc], "initWithErrorCode:", a3);
}

- (SASyncChunkDenied)initWithErrorCode:(int64_t)a3
{
  SASyncChunkDenied *v4;
  SASyncChunkDenied *v5;

  v4 = -[AceObject init](self, "init");
  v5 = v4;
  if (v4)
    -[SASyncChunkDenied setErrorCode:](v4, "setErrorCode:", a3);
  return v5;
}

- (SASyncAnchor)current
{
  return (SASyncAnchor *)AceObjectAceObjectForProperty(self, (uint64_t)CFSTR("current"));
}

- (void)setCurrent:(id)a3
{
  AceObjectSetAceObjectForProperty(self, CFSTR("current"), a3);
}

- (int64_t)errorCode
{
  return AceObjectIntegerForProperty(self, (uint64_t)CFSTR("errorCode"));
}

- (void)setErrorCode:(int64_t)a3
{
  AceObjectSetIntegerForProperty(self, CFSTR("errorCode"), a3);
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
