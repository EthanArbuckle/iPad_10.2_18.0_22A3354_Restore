@implementation RoseUpdaterCreate

uint64_t __RoseUpdaterCreate_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kRoseRestoreObjTypeID = result;
  return result;
}

@end
