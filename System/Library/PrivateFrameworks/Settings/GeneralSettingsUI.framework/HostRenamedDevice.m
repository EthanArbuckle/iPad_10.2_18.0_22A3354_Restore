@implementation HostRenamedDevice

uint64_t __HostRenamedDevice_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSpecifierWithID:", CFSTR("NAME_CELL_ID"));
}

@end
