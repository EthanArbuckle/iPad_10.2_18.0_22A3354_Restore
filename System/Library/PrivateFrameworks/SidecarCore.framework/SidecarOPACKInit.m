@implementation SidecarOPACKInit

uint64_t (*___SidecarOPACKInit_block_invoke())(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  void *v0;
  uint64_t (*v1)(uint64_t, uint64_t, _DWORD *);
  uint64_t (*v2)(uint64_t, uint64_t, _DWORD *);
  uint64_t (*result)(uint64_t, uint64_t, _DWORD *);
  uint64_t (*v4)(uint64_t, uint64_t, _DWORD *);

  v0 = dlopen("/System/Library/PrivateFrameworks/CoreUtils.framework/CoreUtils", 1);
  v1 = (uint64_t (*)(uint64_t, uint64_t, _DWORD *))dlsym(v0, "OPACKEncoderCreateData");
  if (v1)
    v2 = v1;
  else
    v2 = _SidecarOPACKStub;
  _SidecarOPACKEncode = (uint64_t (*)(_QWORD, _QWORD, _QWORD))v2;
  result = (uint64_t (*)(uint64_t, uint64_t, _DWORD *))dlsym(v0, "OPACKDecodeData");
  if (result)
    v4 = result;
  else
    v4 = _SidecarOPACKStub;
  _SidecarOPACKDecode = (uint64_t (*)(_QWORD, _QWORD, _QWORD))v4;
  return result;
}

@end
