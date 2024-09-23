@implementation ZL16getResourcePoolsv

_QWORD *___ZL16getResourcePoolsv_block_invoke()
{
  uint64_t v0;
  _QWORD *result;
  uint64_t v2;
  _QWORD v3[3];
  _QWORD *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = operator new();
  v3[0] = &off_1E6E3E1C8;
  v4 = v3;
  SIResourcePools::SIResourcePools(v0, 6, 1, 10, v3);
  getResourcePools(void)::pools = v0;
  result = v4;
  if (v4 == v3)
  {
    v2 = 4;
    result = v3;
  }
  else
  {
    if (!v4)
      return result;
    v2 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v2))();
}

@end
