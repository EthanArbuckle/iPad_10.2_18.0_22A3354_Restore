@implementation SBSetAlertSuppressionContextsArrayBySectionIdentifierDictionaryForApplicationSceneHandles

void ___SBSetAlertSuppressionContextsArrayBySectionIdentifierDictionaryForApplicationSceneHandles_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a2;
  objc_msgSend(v5, "setWithArray:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

@end
