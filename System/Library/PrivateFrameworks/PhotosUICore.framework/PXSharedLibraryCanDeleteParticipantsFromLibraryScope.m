@implementation PXSharedLibraryCanDeleteParticipantsFromLibraryScope

BOOL __PXSharedLibraryCanDeleteParticipantsFromLibraryScope_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "role") == 1 || objc_msgSend(v2, "exitState") != 0;

  return v3;
}

@end
