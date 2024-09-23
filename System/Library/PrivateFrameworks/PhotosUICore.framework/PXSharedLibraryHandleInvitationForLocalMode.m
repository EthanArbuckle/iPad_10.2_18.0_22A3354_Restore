@implementation PXSharedLibraryHandleInvitationForLocalMode

void __PXSharedLibraryHandleInvitationForLocalMode_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setTitle:", CFSTR("Local Mode"));
  objc_msgSend(v2, "setMessage:", CFSTR("This Shared Library is “local only”. No invitations will be sent to participants."));
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addActionWithTitle:style:action:", v3, 0, 0);

}

@end
