@implementation SetLastSeenUnreadToYesterday

uint64_t ___SetLastSeenUnreadToYesterday_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dateByAddingUnit:value:toDate:options:", 16, -1, v0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXSetSharedAlbumsActivityLastSeenDateToDate(v2);

  return 1;
}

@end
