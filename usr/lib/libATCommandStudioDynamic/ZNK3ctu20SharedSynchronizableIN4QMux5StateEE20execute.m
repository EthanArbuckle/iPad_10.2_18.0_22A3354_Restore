@implementation ZNK3ctu20SharedSynchronizableIN4QMux5StateEE20execute

_BYTE *___ZNK3ctu20SharedSynchronizableIN4QMux5StateEE20execute_wrapped_syncIZNS2_18setDriverAndCookieEP13ATCSIPCDriverPvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS9__block_invoke(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _BYTE *result;

  v1 = *(uint64_t **)(a1 + 40);
  v2 = *v1;
  v3 = (_QWORD *)v1[1];
  *(_QWORD *)(v2 + 184) = *v3;
  v4 = (_QWORD *)v1[2];
  *(_QWORD *)(v2 + 208) = *v4;
  (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)*v3 + 40))(*v3, v2, *v4, v2 + 192);
  result = *(_BYTE **)v1[1];
  if (!result[8])
    return (_BYTE *)(*(uint64_t (**)(_BYTE *))(*(_QWORD *)result + 16))(result);
  return result;
}

_QWORD ***___ZNK3ctu20SharedSynchronizableIN4QMux5StateEE20execute_wrapped_syncIZNKS1_16getQMIWakeReasonEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS6__block_invoke@<X0>(_QWORD ***result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  _BYTE *v4;
  _BYTE *v5;
  size_t v6;
  char *v7;
  char *v8;

  v3 = (_QWORD *)**result[5];
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  v5 = (_BYTE *)v3[40];
  v4 = (_BYTE *)v3[41];
  v6 = v4 - v5;
  if (v4 != v5)
  {
    if ((v6 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v7 = (char *)operator new(v4 - v5);
    *a2 = v7;
    v8 = &v7[v6];
    a2[2] = &v7[v6];
    result = (_QWORD ***)memcpy(v7, v5, v6);
    a2[1] = v8;
  }
  a2[3] = v3[43];
  return result;
}

@end
