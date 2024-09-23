@implementation ZL13sLogBufferGetv

_QWORD *___ZL13sLogBufferGetv_block_invoke()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = 0;
  result[1] = 0;
  sLogBufferGet(void)::sLogBuffer = (uint64_t)result;
  return result;
}

@end
