@implementation UIWriteArchiveToData

uint64_t __UIWriteArchiveToData_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 0 && a2 == 0)
    result = -1;
  else
    result = 1;
  if ((a2 != 0) == (a3 != 0))
    return objc_msgSend(a2, "compare:");
  return result;
}

uint64_t __UIWriteArchiveToData_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end
