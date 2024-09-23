@implementation ZZNK3awd19QMIAwdCommandDriver20sendAddConfigurationENSt3

_QWORD *___ZZNK3awd19QMIAwdCommandDriver20sendAddConfigurationENSt3__110shared_ptrINS_10AppContextEEENS_11PayloadTypeERKNS1_6vectorIhNS1_9allocatorIhEEEEN8dispatch5blockIU13block_pointerFvbEEEENK3__0clEv_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  char *v5;

  *(_DWORD *)a2 = awd::AppContext::getAppID(*(awd::AppContext **)(a1 + 32));
  *(_DWORD *)(a2 + 4) = 0;
  v4 = *(_DWORD *)(a1 + 76);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 72);
  v5 = *(char **)(a1 + 56);
  *(_BYTE *)(a2 + 12) = *(_QWORD *)(a1 + 48);
  *(_BYTE *)(a2 + 13) = v4;
  return std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((_QWORD *)(a2 + 16), v5, *(char **)(a1 + 64), *(_QWORD *)(a1 + 64) - (_QWORD)v5);
}

@end
