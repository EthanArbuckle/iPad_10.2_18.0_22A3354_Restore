@implementation PXBoopFileProviderDomain

void ___PXBoopFileProviderDomain_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0CAAD00]);
  PXLocalizedStringFromTable(CFSTR("BOOP_FILE_PROVIDER_DOMAIN_TITLE"), CFSTR("PhotosUICore"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithIdentifier:displayName:pathRelativeToDocumentStorage:hidden:", CFSTR("boop"), v3, CFSTR("boop"), 1);
  v2 = (void *)_PXBoopFileProviderDomain_domain;
  _PXBoopFileProviderDomain_domain = v1;

}

@end
