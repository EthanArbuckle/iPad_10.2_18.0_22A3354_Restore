@implementation PXSetSharedAlbumsActivityLastSeenDateAfterDelay

void __PXSetSharedAlbumsActivityLastSeenDateAfterDelay_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  PXSetSharedAlbumsActivityLastSeenDateToDate(v0);

}

@end
