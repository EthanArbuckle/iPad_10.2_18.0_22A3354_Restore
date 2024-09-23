@implementation ZN19ATCSRouterIPCDriver15setErrorHandlerENSt3

_QWORD *___ZN19ATCSRouterIPCDriver15setErrorHandlerENSt3__18functionIFvNS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *result;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    v3 = a1 + 40;
    if (v2 == v3)
    {
      v11 = v10;
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v3 + 24))(v3, v10);
    }
    else
    {
      v11 = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
    }
  }
  else
  {
    v11 = 0;
  }
  v4 = (_QWORD *)(v1 + 88);
  if ((_QWORD *)(v1 + 88) == v10)
  {
LABEL_15:
    result = v11;
    if (v11 != v10)
      goto LABEL_16;
    goto LABEL_19;
  }
  v5 = v11;
  v6 = *(_QWORD **)(v1 + 112);
  if (v11 == v10)
  {
    if (v6 != v4)
    {
      (*(void (**)(_QWORD *, uint64_t))(v10[0] + 24))(v10, v1 + 88);
      (*(void (**)(_QWORD *))(*v11 + 32))(v11);
      v11 = *(_QWORD **)(v1 + 112);
      v8 = v11;
      *(_QWORD *)(v1 + 112) = v4;
      result = v8;
      if (v8 == v10)
        goto LABEL_19;
      goto LABEL_16;
    }
    memset(v12, 170, 24);
    (*(void (**)(_QWORD *, _QWORD *))(v10[0] + 24))(v10, v12);
    (*(void (**)(_QWORD *))(*v11 + 32))(v11);
    v11 = 0;
    (*(void (**)(_QWORD, _QWORD *))(**(_QWORD **)(v1 + 112) + 24))(*(_QWORD *)(v1 + 112), v10);
    (*(void (**)(_QWORD))(**(_QWORD **)(v1 + 112) + 32))(*(_QWORD *)(v1 + 112));
    *(_QWORD *)(v1 + 112) = 0;
    v11 = v10;
    (*(void (**)(_QWORD *, uint64_t))(v12[0] + 24))(v12, v1 + 88);
    (*(void (**)(_QWORD *))(v12[0] + 32))(v12);
    *(_QWORD *)(v1 + 112) = v4;
    result = v11;
    if (v11 != v10)
      goto LABEL_16;
LABEL_19:
    v9 = 4;
    result = v10;
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v9))();
  }
  if (v6 == v4)
  {
    (*(void (**)(uint64_t, _QWORD *))(*v4 + 24))(v1 + 88, v10);
    (*(void (**)(_QWORD))(**(_QWORD **)(v1 + 112) + 32))(*(_QWORD *)(v1 + 112));
    *(_QWORD *)(v1 + 112) = v11;
    v11 = v10;
    goto LABEL_15;
  }
  v11 = *(_QWORD **)(v1 + 112);
  *(_QWORD *)(v1 + 112) = v5;
  result = v6;
  if (v6 == v10)
    goto LABEL_19;
LABEL_16:
  if (!result)
    return result;
  v9 = 5;
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v9))();
}

@end
