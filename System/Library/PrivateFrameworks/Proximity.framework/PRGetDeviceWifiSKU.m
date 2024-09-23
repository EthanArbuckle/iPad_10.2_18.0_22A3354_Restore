@implementation PRGetDeviceWifiSKU

void __PRGetDeviceWifiSKU_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  unint64_t i;
  void *v5;
  id v6;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "length");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v0);
  v3 = objc_msgSend(v6, "bytes");
  for (i = 0; i < objc_msgSend(v6, "length"); ++i)
    objc_msgSend(v2, "appendFormat:", CFSTR("%02lX"), *(unsigned __int8 *)(v3 + i));
  if (!v2)
    __assert_rtn("PRGetDeviceWifiSKU_block_invoke", "PRUtilities.m", 104, "mutableString");
  v5 = (void *)PRGetDeviceWifiSKU::result;
  PRGetDeviceWifiSKU::result = (uint64_t)v2;

}

@end
