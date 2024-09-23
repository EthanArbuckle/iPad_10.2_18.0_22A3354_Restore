@implementation SSEnableVellumExport

uint64_t ___SSEnableVellumExport_block_invoke()
{
  uint64_t result;

  result = _SSUserDefaultsBooleanForKeyWithNODefault(CFSTR("SSEnableVellumExport"));
  if ((_DWORD)result)
    result = MGGetBoolAnswer();
  _SSEnableVellumExport___SSEnableVellumExport = result;
  return result;
}

@end
