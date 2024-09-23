@implementation UITableViewCellUsesLayoutMarginBasedContentPadding

void ___UITableViewCellUsesLayoutMarginBasedContentPadding_block_invoke()
{
  id v0;

  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    _UIMainBundleIdentifier();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_49_1 = objc_msgSend(&unk_1E1A94BE0, "containsObject:", v0) ^ 1;

  }
  else
  {
    _MergedGlobals_49_1 = 0;
  }
}

@end
