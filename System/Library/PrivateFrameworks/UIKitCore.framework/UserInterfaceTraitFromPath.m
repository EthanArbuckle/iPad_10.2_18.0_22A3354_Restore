@implementation UserInterfaceTraitFromPath

void ___UserInterfaceTraitFromPath_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "setUserInterfaceIdiom:");
    v3 = v4;
  }
  objc_msgSend(v3, "setDisplayScale:", (double)*(unint64_t *)(a1 + 40));

}

@end
