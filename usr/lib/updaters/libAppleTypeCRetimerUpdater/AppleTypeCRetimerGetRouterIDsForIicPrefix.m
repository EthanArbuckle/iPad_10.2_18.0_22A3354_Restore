@implementation AppleTypeCRetimerGetRouterIDsForIicPrefix

uint64_t __AppleTypeCRetimerGetRouterIDsForIicPrefix_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "unsignedIntValue");
  if (v6 <= objc_msgSend(v5, "unsignedIntValue"))
  {
    v8 = objc_msgSend(v4, "unsignedIntValue");
    if (v8 >= objc_msgSend(v5, "unsignedIntValue"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

@end
