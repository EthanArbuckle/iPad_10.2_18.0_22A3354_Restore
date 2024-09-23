@implementation LogKCData

const char *___LogKCData_block_invoke()
{
  const char *result;

  result = getenv("SA_PRINT_STACKSHOTS");
  if (result || (result = getenv("SA_DEBUG_KCDATA_STACKSHOT_PRINT_ALL")) != 0)
  {
    result = (const char *)strcmp(result, "0");
    if ((_DWORD)result)
      byte_1ED1DD559 = 1;
  }
  return result;
}

@end
