@implementation Z14gBBULogMaskGetv

_QWORD *___Z14gBBULogMaskGetv_block_invoke()
{
  _QWORD *result;

  result = operator new(8uLL);
  *result = sLogInternalMask;
  gBBULogMaskGet(void)::sBBULogMask = (uint64_t)result;
  return result;
}

@end
