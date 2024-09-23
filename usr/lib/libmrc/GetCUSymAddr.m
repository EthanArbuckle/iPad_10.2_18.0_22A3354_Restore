@implementation GetCUSymAddr

void *___GetCUSymAddr_SNPrintF_block_invoke()
{
  void *result;

  if (_GetCULibHandle_sOnce != -1)
    dispatch_once(&_GetCULibHandle_sOnce, &__block_literal_global_210);
  result = (void *)_GetCULibHandle_sHandle;
  if (_GetCULibHandle_sHandle)
  {
    result = dlsym((void *)_GetCULibHandle_sHandle, "SNPrintF");
    _GetCUSymAddr_SNPrintF_sAddr = (uint64_t (*)(_QWORD, _QWORD, const char *, ...))result;
  }
  return result;
}

@end
