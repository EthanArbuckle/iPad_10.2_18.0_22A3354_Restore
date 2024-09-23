@implementation SFBrowserGetTypeID

_QWORD *__SFBrowserGetTypeID_block_invoke()
{
  _QWORD *result;

  result = malloc_type_calloc(1uLL, 0x60uLL, 0x10D00408820D60FuLL);
  _kSFBrowserClass = (uint64_t)result;
  if (result)
  {
    *result = 0;
    result[1] = "SFBrowser";
    result[4] = _SFBrowserFinalize;
    result[5] = _SFBrowserEqual;
    result[6] = _SFBrowserHash;
    result[8] = _SFBrowserCopyDebugDesc;
    result = (_QWORD *)_CFRuntimeRegisterClass();
    _kSFBrowserTypeID = (uint64_t)result;
  }
  return result;
}

@end
