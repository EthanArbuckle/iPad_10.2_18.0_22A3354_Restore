@implementation SBSApplicationTerminationAssertionGetTypeID

uint64_t __SBSApplicationTerminationAssertionGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  SBSApplicationTerminationAssertionGetTypeID_typeID = result;
  return result;
}

@end
