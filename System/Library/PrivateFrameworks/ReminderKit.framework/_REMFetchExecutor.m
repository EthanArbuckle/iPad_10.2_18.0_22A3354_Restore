@implementation _REMFetchExecutor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)resultsFromFetchResult:(id)a3 inStore:(id)a4 error:(id *)a5
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)metadataFromFetchResult:(id)a3 inStore:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a3, "metadata");
}

@end
