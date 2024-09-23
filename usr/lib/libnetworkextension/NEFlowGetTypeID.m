@implementation NEFlowGetTypeID

uint64_t __NEFlowGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kNEFlowTypeID = result;
  return result;
}

@end
