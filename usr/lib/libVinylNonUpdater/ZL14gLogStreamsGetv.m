@implementation ZL14gLogStreamsGetv

FILE *___ZL14gLogStreamsGetv_block_invoke()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  FILE *result;
  uint64_t v4;

  v0 = operator new(0x48uLL);
  v1 = (_QWORD *)MEMORY[0x24BDAC8E8];
  v2 = *MEMORY[0x24BDAC8E8];
  *v0 = *MEMORY[0x24BDAC8E8];
  v0[1] = v2;
  v0[2] = v2;
  v0[6] = v2;
  v0[7] = v2;
  v0[5] = v2;
  result = fopen("/dev/null", "w");
  v0[8] = result;
  v4 = *MEMORY[0x24BDAC8D8];
  v0[3] = *v1;
  v0[4] = v4;
  gLogStreamsGet(void)::sLogStreams = (uint64_t)v0;
  return result;
}

@end
