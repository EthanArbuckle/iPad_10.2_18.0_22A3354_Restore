@implementation ZN4gnss15GnssAdaptDevice26Ga05

_QWORD *___ZN4gnss15GnssAdaptDevice26Ga05_01HandleGnsXoCallbackEN7GnssHal14ExtensionsOlaf11LtlInfoTypeE_block_invoke(uint64_t a1)
{
  gnss::GnssAdaptDevice *v1;
  void *HalExtensions;
  _QWORD *result;
  uint64_t v4;
  int v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = *(gnss::GnssAdaptDevice **)(a1 + 32);
  v5 = *(_DWORD *)(a1 + 40);
  HalExtensions = gnss::GnssAdaptDevice::getHalExtensions(v1);
  v6[0] = &off_24E2B2F18;
  v6[1] = gnss::GnssAdaptDevice::Ga05_04RequestLtlInfoCB;
  v7 = v6;
  (*(void (**)(void *, int *, _QWORD *))(*(_QWORD *)HalExtensions + 88))(HalExtensions, &v5, v6);
  result = v7;
  if (v7 == v6)
  {
    v4 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v4 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v4))();
}

@end
