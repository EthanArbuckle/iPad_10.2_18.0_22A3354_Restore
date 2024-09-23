@implementation SESEndPointTSMDictionary

BOOL __SESEndPointTSMDictionary_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "endPointType") != 3 && objc_msgSend(v2, "endPointType") != 4;

  return v3;
}

uint64_t __SESEndPointTSMDictionary_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "appletAID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asHexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("A00000085801010100000001")) ^ 1;

  return v4;
}

@end
