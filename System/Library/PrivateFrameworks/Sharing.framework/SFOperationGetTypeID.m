@implementation SFOperationGetTypeID

_QWORD *__SFOperationGetTypeID_block_invoke()
{
  _QWORD *result;

  result = malloc_type_calloc(1uLL, 0x60uLL, 0x10D00408820D60FuLL);
  _kSFOperationClass = (uint64_t)result;
  if (result)
  {
    *result = 0;
    result[1] = "SFOperation";
    result[4] = _SFOperationFinalize;
    result[5] = _SFOperationEqual;
    result[6] = _SFOperationHash;
    result[8] = _SFOperationCopyDebugDesc;
    result = (_QWORD *)_CFRuntimeRegisterClass();
    _kSFOperationTypeID = (uint64_t)result;
  }
  return result;
}

@end
