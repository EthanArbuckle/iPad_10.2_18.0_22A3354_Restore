@implementation EEEENK3

_QWORD *___ZZN5radio19QMICommandDriverM2018getRFSelfTestNonceEN8dispatch8callbackIU13block_pointerFvN3xpc6objectES4_EEEENK3__0clEv_block_invoke_116(uint64_t a1, char **a2)
{
  return std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *a2, a2[1], a2[1] - *a2);
}

_QWORD *___ZZN5radio20QMICommandDriverBase16getFirmwareNonceEN8dispatch8callbackIU13block_pointerFvN3xpc6objectES4_EEEENK3__0clEv_block_invoke_180(uint64_t a1, char **a2)
{
  return std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *a2, a2[1], a2[1] - *a2);
}

_QWORD *___ZZN5radio20QMICommandDriverBase9getPkHashEN8dispatch8callbackIU13block_pointerFvN3xpc6objectES4_EEEENK3__0clEv_block_invoke_2(uint64_t a1, char **a2)
{
  return std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *a2, a2[1], a2[1] - *a2);
}

_QWORD *___ZZN5radio20QMICommandDriverBase17getManifestStatusEN8dispatch8callbackIU13block_pointerFvN3xpc6objectES4_EEEENK3__0clEv_block_invoke_4(_QWORD *result, char **a2)
{
  _QWORD *v2;

  v2 = result;
  if (*(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) != 2)
    result = std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>((_QWORD *)(*(_QWORD *)(result[5] + 8) + 40), *a2, a2[1], a2[1] - *a2);
  *(_BYTE *)(*(_QWORD *)(v2[6] + 8) + 24) = 1;
  return result;
}

_QWORD *___ZZN5radio20QMICommandDriverBase17getManifestStatusEN8dispatch8callbackIU13block_pointerFvN3xpc6objectES4_EEEENK3__0clEv_block_invoke_5(_QWORD *result, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;

  if (*(_WORD *)a2 == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*(_WORD *)a2)
    v3 = v2;
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) = v3;
  if (*(_WORD *)(a2 + 2) == 1)
    v4 = 1;
  else
    v4 = 2;
  if (*(_WORD *)(a2 + 2))
    v5 = v4;
  else
    v5 = 0;
  *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = v5;
  if (*(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) != 2)
    return std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>((_QWORD *)(*(_QWORD *)(result[6] + 8) + 40), *(char **)(a2 + 8), (char *)(*(_QWORD *)(a2 + 8) + 20), 0x14uLL);
  return result;
}

_QWORD *___ZZN5radio20QMICommandDriverBase11getManifestEN8dispatch8callbackIU13block_pointerFvN3xpc6objectES4_EEEENK3__0clEv_block_invoke_2(_QWORD *result, _WORD *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;

  if (*a2 == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*a2)
    v3 = v2;
  else
    v3 = 0;
  *(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) = v3;
  if (a2[1] == 1)
    v4 = 1;
  else
    v4 = 2;
  if (a2[1])
    v5 = v4;
  else
    v5 = 0;
  *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = v5;
  if (a2[3] == 1)
    v6 = 1;
  else
    v6 = 2;
  if (a2[3])
    v7 = v6;
  else
    v7 = 0;
  *(_DWORD *)(*(_QWORD *)(result[6] + 8) + 24) = v7;
  return result;
}

_QWORD *___ZZN5radio20QMICommandDriverBase11getManifestEN8dispatch8callbackIU13block_pointerFvN3xpc6objectES4_EEEENK3__0clEv_block_invoke_3(uint64_t a1, char **a2)
{
  return std::vector<unsigned char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *a2, a2[1], a2[1] - *a2);
}

char *___ZZN5radio20QMICommandDriverBase11getManifestEN8dispatch8callbackIU13block_pointerFvN3xpc6objectES4_EEEENK3__0clEv_block_invoke_213(uint64_t a1, char **a2)
{
  return std::vector<char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>((char *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *a2, a2[1], a2[1] - *a2);
}

char *___ZZN5radio20QMICommandDriverBase11getManifestEN8dispatch8callbackIU13block_pointerFvN3xpc6objectES4_EEEENK3__0clEv_block_invoke_2_215(uint64_t a1, char **a2)
{
  return std::vector<char>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>((char *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *a2, a2[1], a2[1] - *a2);
}

@end
