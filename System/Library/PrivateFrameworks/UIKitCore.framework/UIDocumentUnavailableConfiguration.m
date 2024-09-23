@implementation UIDocumentUnavailableConfiguration

BOOL __57___UIDocumentUnavailableConfiguration__setSecondaryMenu___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _UIDocumentCreationIntentFromActionIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

uint64_t __57___UIDocumentUnavailableConfiguration__setSecondaryMenu___block_invoke_2()
{
  return MEMORY[0x1E0C9AA60];
}

@end
