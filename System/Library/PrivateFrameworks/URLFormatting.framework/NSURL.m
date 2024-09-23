@implementation NSURL

void __57__NSURL_LPPrivate___lp_URLByDeletingCommonIndexPageNames__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24C0A2D58);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[NSURL(LPPrivate) _lp_URLByDeletingCommonIndexPageNames]::commonIndexPageNames;
  -[NSURL(LPPrivate) _lp_URLByDeletingCommonIndexPageNames]::commonIndexPageNames = v0;

}

@end
