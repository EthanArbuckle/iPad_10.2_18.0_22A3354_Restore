@implementation REIsCurrentLocaleCJK

void __REIsCurrentLocaleCJK_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("zh"), CFSTR("ja"), CFSTR("ko"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)REIsCurrentLocaleCJK__cjkSet;
  REIsCurrentLocaleCJK__cjkSet = v0;

}

@end
