@implementation EAAccessory(CarPlaySupport)

- (uint64_t)_vg_supportsCarPlay
{
  if ((objc_msgSend(a1, "supportsCarPlay") & 1) != 0 || (objc_msgSend(a1, "supportsWirelessCarPlay") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "supportsUSBCarPlay");
}

@end
