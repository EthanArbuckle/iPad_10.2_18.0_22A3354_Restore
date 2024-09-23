@implementation VinylUpdaterCreate

uint64_t __VinylUpdaterCreate_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kVinylRestoreObjTypeID = result;
  return result;
}

@end
