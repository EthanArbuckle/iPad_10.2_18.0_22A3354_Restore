@implementation ZN4gnss15GnssAdaptDevice23stopTimeTransferSessionENSt3

_QWORD *___ZN4gnss15GnssAdaptDevice23stopTimeTransferSessionENSt3__18functionIFvNS_6ResultEEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *result;
  uint64_t v3;
  _BYTE v4[24];
  _BYTE *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v1 + 92) = 0;
  std::__function::__value_func<void ()(gnss::Result)>::__value_func[abi:ne180100]((uint64_t)v4, a1 + 40);
  gnss::GnssAdaptDevice::Ga07_07AdaptResponse(v1, 1, (uint64_t)v4, (uint64_t)"stopTimeTransferSession_block_invoke");
  result = v5;
  if (v5 == v4)
  {
    v3 = 4;
    result = v4;
  }
  else
  {
    if (!v5)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

@end
