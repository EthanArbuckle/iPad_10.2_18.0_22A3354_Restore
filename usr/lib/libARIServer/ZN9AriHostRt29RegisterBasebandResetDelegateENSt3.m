@implementation ZN9AriHostRt29RegisterBasebandResetDelegateENSt3

_QWORD *___ZN9AriHostRt29RegisterBasebandResetDelegateENSt3__18functionIFvNS_20ARI_CLIENT_ERROR_EVTENS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEijEEE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *result;
  uint64_t v13;
  _QWORD v14[3];
  _QWORD *v15;
  _QWORD v16[3];
  _QWORD *v17;
  _BYTE v18[24];
  _BYTE *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100]((uint64_t)v14, a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (uint64_t)v15;
  if (!v15)
    goto LABEL_4;
  if (v15 != v14)
  {
    v3 = (*(uint64_t (**)(void))(*v15 + 16))();
LABEL_4:
    v17 = (_QWORD *)v3;
    goto LABEL_6;
  }
  v17 = v16;
  (*(void (**)(_QWORD *, _QWORD *))(v14[0] + 24))(v14, v16);
LABEL_6:
  v4 = operator new(0x28uLL);
  *v4 = &off_24EB79308;
  v5 = v4 + 1;
  v6 = (uint64_t)v17;
  if (!v17)
  {
LABEL_9:
    v4[4] = v6;
    goto LABEL_11;
  }
  if (v17 != v16)
  {
    v6 = (*(uint64_t (**)(void))(*v17 + 16))();
    goto LABEL_9;
  }
  v4[4] = v5;
  (*(void (**)(_QWORD *))(v16[0] + 24))(v16);
LABEL_11:
  v7 = v2 + 33488;
  v19 = v4;
  if ((_BYTE *)v7 == v18)
  {
    v9 = 5;
    goto LABEL_19;
  }
  v8 = *(_BYTE **)(v7 + 24);
  if (v8 == (_BYTE *)v7)
  {
    v4 = v18;
    (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v7 + 24))(v7, v18);
    (*(void (**)(_QWORD))(**(_QWORD **)(v7 + 24) + 32))(*(_QWORD *)(v7 + 24));
    *(_QWORD *)(v7 + 24) = v19;
    v19 = v18;
    goto LABEL_18;
  }
  v19 = *(_BYTE **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v4;
  v4 = v18;
  if (v8 == v18)
  {
LABEL_18:
    v9 = 4;
    goto LABEL_19;
  }
  if (!v8)
    goto LABEL_20;
  v9 = 5;
  v4 = v8;
LABEL_19:
  (*(void (**)(_QWORD *, _QWORD *))(*v4 + 8 * v9))(v4, v5);
LABEL_20:
  v10 = v17;
  if (v17 == v16)
  {
    v11 = 4;
    v10 = v16;
  }
  else
  {
    if (!v17)
      goto LABEL_25;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_25:
  result = v15;
  if (v15 == v14)
  {
    v13 = 4;
    result = v14;
  }
  else
  {
    if (!v15)
      return result;
    v13 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v13))();
}

@end
