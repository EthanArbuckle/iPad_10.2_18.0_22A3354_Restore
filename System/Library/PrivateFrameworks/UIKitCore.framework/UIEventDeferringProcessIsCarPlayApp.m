@implementation UIEventDeferringProcessIsCarPlayApp

void ___UIEventDeferringProcessIsCarPlayApp_block_invoke(uint64_t a1)
{
  id v2;

  _UIMainBundleIdentifier();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1185 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 32));

}

@end
