@implementation UITabCustomizationStore

void __72___UITabCustomizationStore_customizationStoreWithPersistenceIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1117;
  _MergedGlobals_1117 = v0;

}

uint64_t __63___UITabCustomizationStore__saveCustomizationForTab_recursive___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

@end
