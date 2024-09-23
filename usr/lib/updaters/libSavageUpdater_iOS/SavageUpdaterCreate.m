@implementation SavageUpdaterCreate

uint64_t __SavageUpdaterCreate_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  SavageUpdaterTypeID = result;
  return result;
}

@end
