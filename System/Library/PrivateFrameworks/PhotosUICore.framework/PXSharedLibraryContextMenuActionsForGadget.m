@implementation PXSharedLibraryContextMenuActionsForGadget

void __PXSharedLibraryContextMenuActionsForGadget_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationEnvironmentForGadget:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  PXSharedLibraryDeclineInvitation(*(void **)(a1 + 40), v3, CFSTR("Invitation Gadget"), 0);
}

@end
