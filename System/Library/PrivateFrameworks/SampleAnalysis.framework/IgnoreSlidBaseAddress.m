@implementation IgnoreSlidBaseAddress

const char *__IgnoreSlidBaseAddress_block_invoke()
{
  const char *result;

  result = getenv("SA_WORKAROUND_73965546");
  if (result)
  {
    result = (const char *)strcmp(result, "0");
    if ((_DWORD)result)
      byte_1ED1DD55A = 1;
  }
  return result;
}

@end
