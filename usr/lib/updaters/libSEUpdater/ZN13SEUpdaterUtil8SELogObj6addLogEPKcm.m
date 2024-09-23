@implementation ZN13SEUpdaterUtil8SELogObj6addLogEPKcm

_QWORD *___ZN13SEUpdaterUtil8SELogObj6addLogEPKcm_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3[2];

  v1 = a1[5];
  v3[0] = (_QWORD *)(a1[4] + 56);
  v3[1] = 0;
  return boost::circular_buffer<unsigned char,std::allocator<unsigned char>>::insert<char const*>(v3[0], (uint64_t)v3, v1, v1 + a1[6]);
}

@end
