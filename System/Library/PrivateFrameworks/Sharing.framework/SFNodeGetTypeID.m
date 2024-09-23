@implementation SFNodeGetTypeID

_QWORD *__SFNodeGetTypeID_block_invoke()
{
  _QWORD *result;

  result = malloc_type_calloc(1uLL, 0x60uLL, 0x10D00408820D60FuLL);
  _kSFNodeClass = (uint64_t)result;
  if (result)
  {
    *result = 0;
    result[1] = "SFNode";
    result[3] = _SFNodeCopy;
    result[4] = _SFNodeFinalize;
    result[5] = _SFNodeEqual;
    result[6] = _SFNodeHash;
    result[8] = _SFNodeCopyDebugDesc;
    result = (_QWORD *)_CFRuntimeRegisterClass();
    _kSFNodeTypeID = (uint64_t)result;
  }
  return result;
}

@end
