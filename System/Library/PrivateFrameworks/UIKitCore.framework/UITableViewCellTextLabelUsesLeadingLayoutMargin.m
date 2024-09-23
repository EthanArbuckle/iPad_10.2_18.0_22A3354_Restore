@implementation UITableViewCellTextLabelUsesLeadingLayoutMargin

void ___UITableViewCellTextLabelUsesLeadingLayoutMargin_block_invoke()
{
  id v0;

  if (qword_1ECD7A418 != -1)
    dispatch_once(&qword_1ECD7A418, &__block_literal_global_515);
  if (_MergedGlobals_49_1)
  {
    byte_1ECD7A411 = 1;
  }
  else
  {
    _UIMainBundleIdentifier();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    byte_1ECD7A411 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Preferences"));

  }
}

@end
