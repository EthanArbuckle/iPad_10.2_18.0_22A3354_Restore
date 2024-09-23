@implementation KTLBspIceAtString

uint64_t __KTLBspIceAtString_block_invoke(uint64_t a1, AriMsg *a2, unsigned int a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  size_t v18;
  size_t v19;
  _QWORD __dst[2];
  _DWORD __b[773];

  *(_QWORD *)&__b[771] = *MEMORY[0x24BDAC8D0];
  memset(__b, 170, 0xC0CuLL);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = ARI_CsiIceAtExtRsp_Extract();
  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (!(_DWORD)result)
  {
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      return 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
    v12 = __b[768];
    if (__b[768])
    {
      v13 = 0;
      do
      {
        if (!*((_BYTE *)__b + v13))
        {
          _KTLDebugPrint((uint64_t)"KTLBspIceAtString_block_invoke", (uint64_t)"Embedded null found in AT response at buffer offset %u\n", v12, v7, v8, v9, v10, v11, v13);
          *((_BYTE *)__b + v13) = 32;
          v12 = __b[768];
        }
        ++v13;
      }
      while (v13 < v12);
    }
    else
    {
      v12 = 0;
    }
    fwrite(__b, 1uLL, v12, *(FILE **)(a1 + 64));
    fflush(*(FILE **)(a1 + 64));
    __dst[0] = 0;
    __dst[1] = 0;
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = (char *)(v14 + 40);
    v16 = *(unsigned int *)(v14 + 3112);
    if (v16 <= 7)
    {
      memcpy(__dst, v15, *(unsigned int *)(v14 + 3112));
    }
    else
    {
      __dst[0] = *(_QWORD *)&v15[v16 - 8];
      v16 = 8;
    }
    v17 = (char *)__dst + v16;
    v18 = __b[768];
    if (__b[768] >= 8u)
      v19 = 8;
    else
      v19 = __b[768];
    memcpy(v17, __b, v19);
    if (strnstr((const char *)__b, "\r\nOK\r\n", v18))
      goto LABEL_21;
    if (!strnstr((const char *)__b, "\r\nERROR\r\n", __b[768]))
    {
      if (strnstr((const char *)__dst, "\r\nOK\r\n", 0x10uLL))
        goto LABEL_21;
      if (!strnstr((const char *)__dst, "\r\nERROR\r\n", 0x10uLL))
        goto LABEL_22;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -1;
LABEL_21:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
LABEL_22:
    memcpy((void *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), __b, 0xC0CuLL);
    return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  return result;
}

@end
