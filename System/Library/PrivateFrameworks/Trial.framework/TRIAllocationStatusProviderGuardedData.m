@implementation TRIAllocationStatusProviderGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->callbackTokens, 0);
}

@end
