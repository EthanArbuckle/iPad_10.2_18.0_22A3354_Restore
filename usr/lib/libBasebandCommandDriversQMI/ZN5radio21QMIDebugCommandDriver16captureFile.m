@implementation ZN5radio21QMIDebugCommandDriver16captureFile

CFMutableDataRef *___ZN5radio21QMIDebugCommandDriver16captureFile_syncEjjjN8dispatch5blockIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK8__CFDataEEEEE_block_invoke_5(CFMutableDataRef *result, uint64_t a2)
{
  uint64_t v2;
  CFMutableDataRef *v4;
  uint64_t v5;
  UInt8 *v6;

  v2 = *((unsigned int *)result + 11);
  if (*(_QWORD *)(a2 + 8) - *(_QWORD *)a2 == v2)
  {
    v4 = result;
    v5 = (*((_DWORD *)result + 10) * v2);
    v6 = &CFDataGetMutableBytePtr(result[4])[v5];
    return (CFMutableDataRef *)memcpy(v6, *(const void **)a2, *((unsigned int *)v4 + 11));
  }
  return result;
}

@end
