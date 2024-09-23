@implementation PLBackgroundJobEditRenderingImageWorker

- (id)_predicateToFetchDeferredAdjustmentNeededAssets
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d && %K == %d"), CFSTR("deferredProcessingNeeded"), 2, CFSTR("kind"), 0);
}

@end
