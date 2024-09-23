@implementation PXDragAndDropFileProviderDomain

void ___PXDragAndDropFileProviderDomain_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0CAAD00]);
  PXLocalizedStringFromTable(CFSTR("DRAG_AND_DROP_FILE_PROVIDER_DOMAIN_TITLE"), CFSTR("PhotosUICore"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithIdentifier:displayName:pathRelativeToDocumentStorage:hidden:", CFSTR("draganddrop"), v3, CFSTR("draganddrop"), 1);
  v2 = (void *)_PXDragAndDropFileProviderDomain_domain;
  _PXDragAndDropFileProviderDomain_domain = v1;

}

@end
