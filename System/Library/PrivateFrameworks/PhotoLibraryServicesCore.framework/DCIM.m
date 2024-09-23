@implementation DCIM

void __DCIM_IS_PAD_block_invoke()
{
  void *v0;
  uint64_t v1;

  if (NSClassFromString((NSString *)CFSTR("UIDevice")))
  {
    -[objc_class currentDevice](NSClassFromString((NSString *)CFSTR("UIDevice")), "currentDevice");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "userInterfaceIdiom");

    DCIM_IS_PAD_retval = v1 == 1;
  }
}

@end
