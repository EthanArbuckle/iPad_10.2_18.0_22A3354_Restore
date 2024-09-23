@implementation PBGetSetupCompletedDevicesWeShouldList

uint64_t __PBGetSetupCompletedDevicesWeShouldList_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char v3;
  int v4;
  uint64_t v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "isAltAccount");
  v4 = objc_msgSend(v2, "isSetup");
  if ((v3 & 1) != 0)
  {
    if ((v4 & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v2, "isArchived");
  }
  else if (v4)
  {
    v5 = objc_msgSend(v2, "isArchived") ^ 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
