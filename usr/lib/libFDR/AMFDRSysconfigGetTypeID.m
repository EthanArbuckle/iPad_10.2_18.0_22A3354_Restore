@implementation AMFDRSysconfigGetTypeID

uint64_t __AMFDRSysconfigGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  AMFDRSysconfigGetTypeID__AMFDRSysconfigTypeID = result;
  return result;
}

@end
