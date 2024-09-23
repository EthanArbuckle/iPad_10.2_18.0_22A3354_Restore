@implementation NSMutableSet(TCMessageEntryAdditions)

- (void)tc_addMessageEntry:()TCMessageEntryAdditions
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "member:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "mergeEntries:", v6);
  }
  else
  {
    objc_msgSend(a1, "addObject:", v6);
    objc_msgSend(v6, "setTimeStamp:", objc_msgSend(a1, "count"));
  }

}

@end
