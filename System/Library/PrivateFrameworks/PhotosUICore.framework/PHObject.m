@implementation PHObject

void __68__PHObject_PhotosUICore___px_initializeUserInterfaceIdentifierCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PXUserInterfaceIdentifierCache;
  _PXUserInterfaceIdentifierCache = v0;

  _PXUserInterfaceIdentifierCacheLock = 0;
}

@end
