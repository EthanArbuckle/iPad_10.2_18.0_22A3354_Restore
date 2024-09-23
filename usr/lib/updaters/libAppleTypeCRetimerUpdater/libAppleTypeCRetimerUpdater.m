void sub_24BC9BF20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_24BC9C090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t UARPSuperBinarySetupHeader(uint64_t a1, uint64_t a2, unsigned int a3, _OWORD *a4, int a5)
{
  _QWORD *v9;
  uint64_t result;
  uint64_t v11;
  _OWORD v12[2];
  uint64_t v13;
  _OWORD v14[3];

  v9 = (_QWORD *)uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  result = 30;
  if (a3 >= 2)
  {
    if (v9)
    {
      memset(v14, 0, 44);
      uarpZero(v14, 0x2CuLL);
      *(_QWORD *)&v14[0] = 0x2C00000002;
      *(_OWORD *)((char *)v14 + 12) = *a4;
      DWORD1(v14[2]) = 44;
      DWORD2(v14[2]) = 40 * a5;
      HIDWORD(v14[1]) = 40 * a5 + 44;
      DWORD2(v14[0]) = HIDWORD(v14[1]);
      result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v9, (uint64_t)v14, 44, 0);
      if (!(_DWORD)result)
      {
        if (a5)
        {
          v11 = 44;
          while (1)
          {
            v13 = 0;
            memset(v12, 0, sizeof(v12));
            uarpZero(v12, 0x28uLL);
            LODWORD(v12[0]) = 40;
            result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v9, (uint64_t)v12, 40, v11);
            if ((_DWORD)result)
              break;
            v11 = (v11 + 40);
            if (!--a5)
              return 0;
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t UARPSuperBinaryAddMetaData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  uint64_t v9;
  _QWORD *v10;
  uint64_t result;
  int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int __dst;
  _DWORD v16[3];
  unsigned __int16 v17;
  _OWORD v18[3];

  v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9)
    return 30;
  v10 = (_QWORD *)v9;
  __dst = 0;
  LOWORD(v18[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v9, &__dst, 4, 0, (unsigned __int16 *)v18);
  v12 = result;
  if (LOWORD(v18[0]) == 4)
    v13 = 0;
  else
    v13 = 11;
  if ((_DWORD)result)
    result = result;
  else
    result = v13;
  if (v12 || LOWORD(v18[0]) != 4)
    return result;
  if (__dst < 2)
    return 30;
  memset(v18, 0, 44);
  v17 = 0;
  result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v18, 44, 0, &v17);
  if (!(_DWORD)result)
  {
    if (v17 == 44)
    {
      v14 = (LODWORD(v18[2]) + HIDWORD(v18[1]));
      v16[0] = uarpHtonl(a3);
      v16[1] = uarpHtonl(a4);
      result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v16, 8, v14);
      if (!(_DWORD)result)
      {
        LODWORD(v18[2]) += 8;
        DWORD2(v18[0]) += 8;
        result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, a5, (unsigned __int16)a4, (HIDWORD(v18[1]) + LODWORD(v18[2])));
        if (!(_DWORD)result)
        {
          LODWORD(v18[2]) += (unsigned __int16)a4;
          DWORD2(v18[0]) += (unsigned __int16)a4;
          return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v18, 44, 0);
        }
      }
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t UARPSuperBinaryPreparePayload(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, _OWORD *a5)
{
  uint64_t v9;
  _QWORD *v10;
  uint64_t result;
  int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int __dst;
  _OWORD v16[3];
  _OWORD v17[2];
  uint64_t v18;
  unsigned __int16 v19;

  v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9)
    return 30;
  v10 = (_QWORD *)v9;
  __dst = 0;
  LOWORD(v16[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v9, &__dst, 4, 0, (unsigned __int16 *)v16);
  v12 = result;
  if (LOWORD(v16[0]) == 4)
    v13 = 0;
  else
    v13 = 11;
  if ((_DWORD)result)
    result = result;
  else
    result = v13;
  if (v12 || LOWORD(v16[0]) != 4)
    return result;
  if (__dst < 2)
    return 30;
  v19 = 0;
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  memset(v16, 0, 44);
  result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v16, 44, 0, &v19);
  if (!(_DWORD)result)
  {
    if (v19 != 44)
      return 11;
    v14 = (DWORD1(v16[2]) + 40 * a3);
    result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v17, 40, v14, &v19);
    if (!(_DWORD)result)
    {
      if (v19 == 40)
      {
        DWORD1(v17[0]) = uarpTagStructPack32(a4);
        *(_OWORD *)((char *)v17 + 8) = *a5;
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v17, 40, v14);
      }
      return 11;
    }
  }
  return result;
}

uint64_t UARPSuperBinaryAddPayloadMetaData(uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11;
  _QWORD *v12;
  uint64_t result;
  int v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unsigned int __dst;
  _DWORD v20[2];
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  unsigned __int16 v25;

  v11 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v11)
    return 30;
  v12 = (_QWORD *)v11;
  __dst = 0;
  LOWORD(v21[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v11, &__dst, 4, 0, (unsigned __int16 *)v21);
  v14 = result;
  if (LOWORD(v21[0]) == 4)
    v15 = 0;
  else
    v15 = 11;
  if ((_DWORD)result)
    result = result;
  else
    result = v15;
  if (v14 || LOWORD(v21[0]) != 4)
    return result;
  if (__dst < 2)
    return 30;
  v25 = 0;
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  memset(v21, 0, 44);
  result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v12, v21, 44, 0, &v25);
  if ((_DWORD)result)
    return result;
  if (v25 != 44)
    return 11;
  v16 = (DWORD1(v21[2]) + 40 * a3);
  result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v12, &v22, 40, v16, &v25);
  if ((_DWORD)result)
    return result;
  if (v25 != 40)
    return 11;
  v17 = DWORD2(v23);
  if (!DWORD2(v23))
  {
    v17 = DWORD2(v21[0]);
    DWORD2(v23) = DWORD2(v21[0]);
  }
  v18 = (HIDWORD(v23) + v17);
  v20[0] = uarpHtonl(a4);
  v20[1] = uarpHtonl(a5);
  result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, (uint64_t)v20, 8, v18);
  if (!(_DWORD)result)
  {
    HIDWORD(v23) += 8;
    DWORD2(v21[0]) += 8;
    result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, a6, (unsigned __int16)a5, (DWORD2(v23) + HIDWORD(v23)));
    if (!(_DWORD)result)
    {
      HIDWORD(v23) += (unsigned __int16)a5;
      DWORD2(v21[0]) += (unsigned __int16)a5;
      result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, (uint64_t)&v22, 40, v16);
      if (!(_DWORD)result)
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, (uint64_t)v21, 44, 0);
    }
  }
  return result;
}

uint64_t UARPSuperBinaryAddPayloadDataLarge(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  unsigned int v10;
  unsigned int v11;
  uint64_t result;

  v10 = 0;
  while (a5)
  {
    if (a5 >= 0xFFFF)
      v11 = 0xFFFF;
    else
      v11 = a5;
    result = UARPSuperBinaryAddPayloadData(a1, a2, a3, a4 + v10, v11);
    v10 += v11;
    a5 -= v11;
    if ((_DWORD)result)
      return result;
  }
  return 0;
}

uint64_t UARPSuperBinaryAddPayloadData(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  uint64_t v9;
  _QWORD *v10;
  uint64_t result;
  int v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  unsigned int __dst;
  _OWORD v17[3];
  _OWORD v18[2];
  uint64_t v19;
  unsigned __int16 v20;

  if (HIWORD(a5))
    return 39;
  v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9)
    return 30;
  v10 = (_QWORD *)v9;
  __dst = 0;
  LOWORD(v17[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v9, &__dst, 4, 0, (unsigned __int16 *)v17);
  v12 = result;
  if (LOWORD(v17[0]) == 4)
    v13 = 0;
  else
    v13 = 11;
  if ((_DWORD)result)
    result = result;
  else
    result = v13;
  if (v12 || LOWORD(v17[0]) != 4)
    return result;
  if (__dst < 2)
    return 30;
  v20 = 0;
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  memset(v17, 0, 44);
  result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v17, 44, 0, &v20);
  if ((_DWORD)result)
    return result;
  if (v20 != 44)
    return 11;
  v14 = (DWORD1(v17[2]) + 40 * a3);
  result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v18, 40, v14, &v20);
  if ((_DWORD)result)
    return result;
  if (v20 != 40)
    return 11;
  v15 = v19;
  if (!(_DWORD)v19)
  {
    v15 = DWORD2(v17[0]);
    LODWORD(v19) = DWORD2(v17[0]);
  }
  result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, a4, (unsigned __int16)a5, (HIDWORD(v19) + v15));
  if (!(_DWORD)result)
  {
    HIDWORD(v19) += a5;
    DWORD2(v17[0]) += a5;
    result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v18, 40, v14);
    if (!(_DWORD)result)
      return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v17, 44, 0);
  }
  return result;
}

uint64_t UARPSuperBinaryFinalizeHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  __int128 v6;
  __int128 v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int __dst;
  unsigned __int16 v12;
  _OWORD v13[3];
  _OWORD v14[2];
  uint64_t v15;
  unsigned __int16 v16;

  v3 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v3)
    return 30;
  v4 = v3;
  v12 = 0;
  __dst = 0;
  result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v3, &__dst, 4, 0, &v12);
  if ((_DWORD)result)
    return result;
  if (v12 != 4)
    return 11;
  if (__dst < 2)
    return 30;
  v16 = 0;
  v15 = 0;
  memset(v14, 0, sizeof(v14));
  memset(v13, 0, 44);
  result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v4, v13, 44, 0, &v16);
  if ((_DWORD)result)
    return result;
  if (v16 != 44)
    return 11;
  v6 = v13[0];
  v7 = v13[1];
  *(_OWORD *)(v4 + 28) = *(_OWORD *)((char *)&v13[1] + 12);
  *(_OWORD *)v4 = v6;
  *(_OWORD *)(v4 + 16) = v7;
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)v13, v13);
  result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (_QWORD *)v4, (uint64_t)v13, 44, 0);
  if (!(_DWORD)result)
  {
    v8 = *(_DWORD *)(v4 + 40);
    if (v8 >= 0x28)
    {
      v9 = v8 / 0x28;
      v10 = *(unsigned int *)(v4 + 36);
      do
      {
        result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v4, v14, 40, v10, &v16);
        if ((_DWORD)result)
          break;
        if (v16 != 40)
          return 11;
        uarpPayloadHeaderEndianSwap((unsigned int *)v14, v14);
        result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (_QWORD *)v4, (uint64_t)v14, 40, v10);
        if ((_DWORD)result)
          break;
        v10 = (v10 + 40);
        --v9;
      }
      while (v9);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpSuperBinaryHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  uint64_t result;

  *a2 = uarpHtonl(*a1);
  a2[1] = uarpHtonl(a1[1]);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  a2[9] = uarpHtonl(a1[9]);
  result = uarpHtonl(a1[10]);
  a2[10] = result;
  return result;
}

uint64_t uarpPayloadHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  uint64_t result;

  *a2 = uarpHtonl(*a1);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t uarpPayloadHeader2EndianSwap(unsigned int *a1, _DWORD *a2)
{
  uint64_t result;

  *a2 = uarpHtonl(*a1);
  uarpVersionEndianSwap(a1 + 2, a2 + 2);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t UARPSuperBinaryQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;
  unsigned __int16 v5;
  _OWORD __dst[3];

  memset(__dst, 0, 44);
  v5 = 0;
  result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, a2, __dst, 44, 0, &v5);
  if (!(_DWORD)result)
  {
    if (v5 == 44)
    {
      uarpSuperBinaryHeaderEndianSwap((unsigned int *)__dst, __dst);
      result = 0;
      *a3 = DWORD2(__dst[0]);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t UARPSuperBinaryGetInternalSuperBinaryMetaData(int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  int v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  uint64_t v11;
  BOOL v12;
  unsigned __int16 v13;
  uint64_t result;
  unsigned __int16 v15;

  v7 = *(_DWORD *)(a2 + 32);
  if (v7
    && ((v8 = *(_DWORD *)(a2 + 28), v9 = v7 + v8, v10 = a5 >= v8, v11 = a5 - v8, v10) ? (v12 = v9 > a5) : (v12 = 0), v12))
  {
    v15 = v7 - v11;
    if (a4 >= v15)
      v13 = v15;
    else
      v13 = a4;
    memcpy(__dst, (const void *)(*(_QWORD *)(a2 + 672) + v11), v13);
    result = 0;
  }
  else
  {
    v13 = 0;
    result = 40;
  }
  *a6 = v13;
  return result;
}

uint64_t UARPSuperBinaryGetInternalPayloadMetaData(int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;
  unsigned __int16 v14;
  uint64_t result;
  unsigned __int16 v16;

  v7 = *(_QWORD *)(a2 + 632);
  if (!v7)
  {
LABEL_9:
    v14 = 0;
    result = 40;
    goto LABEL_14;
  }
  while (1)
  {
    v8 = *(_DWORD *)(v7 + 28);
    if (v8)
      break;
LABEL_8:
    if (!v7)
      goto LABEL_9;
  }
  v9 = *(_DWORD *)(v7 + 24);
  v10 = v8 + v9;
  v11 = a5 >= v9;
  v12 = a5 - v9;
  if (!v11 || v10 <= a5)
  {
    v7 = *(_QWORD *)(v7 + 176);
    goto LABEL_8;
  }
  v16 = v8 - v12;
  if (a4 >= v16)
    v14 = v16;
  else
    v14 = a4;
  memcpy(__dst, (const void *)(*(_QWORD *)(v7 + 152) + v12), v14);
  result = 0;
LABEL_14:
  *a6 = v14;
  return result;
}

_QWORD *uarpAllocateTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6;
  _QWORD *result;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;

  v12 = 0;
  v6 = UARPLayer2RequestBuffer(a1, &v12, 0x28u);
  result = 0;
  if (!v6)
  {
    v8 = *(_DWORD *)a2 + *(unsigned __int16 *)(a2 + 30) + 26;
    if (v8 <= a3)
      v8 = a3;
    v11 = v8;
    if (UARPLayer2RequestTransmitMsgBuffer(a1, a2, v12, &v11))
    {
      UARPLayer2ReturnBuffer(a1, v12);
      return 0;
    }
    else
    {
      v9 = v11;
      result = v12;
      *((_DWORD *)v12 + 2) = v11;
      v10 = *(unsigned __int16 *)(a2 + 30);
      result[2] = *result + v10;
      *((_DWORD *)result + 6) = v9 - v10;
      *((_WORD *)result + 14) = 0;
    }
  }
  return result;
}

_QWORD *uarpAllocPrepareTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, char a5)
{
  _QWORD *v10;
  size_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  unsigned int v15;
  unsigned __int16 v16;
  uint64_t v17;
  _QWORD *TransmitBuffer2;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v10 = uarpAvailableTransmitBuffer(a1, a2, a4);
  if (v10)
    goto LABEL_2;
  v14 = *(_WORD *)(a2 + 96);
  v23 = 0;
  v15 = 16 * (v14 & 0x7FFF);
  if (UARPLayer2RequestBuffer(a1, &v23, v15))
    return 0;
  v16 = 2 * v14;
  v17 = *(unsigned __int16 *)(a2 + 96);
  if (v17 < v16)
  {
    do
    {
      TransmitBuffer2 = uarpAllocateTransmitBuffer2(a1, a2, 0);
      *(_QWORD *)(v23 + 8 * v17++) = TransmitBuffer2;
    }
    while (v16 != v17);
  }
  *(_WORD *)(a2 + 96) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 104));
  *(_QWORD *)(a2 + 104) = v23;
  v22 = 0;
  if (UARPLayer2RequestBuffer(a1, &v22, v15))
    return 0;
  if (*(_WORD *)(a2 + 112))
  {
    v20 = 0;
    v21 = 8 * *(unsigned __int16 *)(a2 + 112);
    do
    {
      *(_QWORD *)(v22 + v20) = *(_QWORD *)(*(_QWORD *)(a2 + 120) + v20);
      v20 += 8;
    }
    while (v21 != v20);
  }
  *(_WORD *)(a2 + 112) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 120));
  *(_QWORD *)(a2 + 120) = v22;
  v10 = uarpAvailableTransmitBuffer(a1, a2, a4);
  if (v10)
  {
LABEL_2:
    v11 = *((unsigned int *)v10 + 6);
    if (v11 >= a4)
    {
      *((_WORD *)v10 + 14) = a4;
      *((_BYTE *)v10 + 31) = a5;
      bzero((void *)v10[2], v11);
      *(_WORD *)v10[2] = uarpHtons(a3);
      v12 = uarpHtons((unsigned __int16)(a4 - 6));
      v13 = v10[2];
      *(_WORD *)(v13 + 2) = v12;
      *(_WORD *)(v13 + 4) = 0;
      return v10;
    }
    return 0;
  }
  return v10;
}

uint64_t uarpTransmitBuffer2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *i;

  v3 = *(unsigned __int16 *)(a2 + 112);
  if (v3 >= 2)
  {
    v4 = 0;
    do
    {
      v5 = *(_QWORD *)(a2 + 120);
      if (!*(_QWORD *)(v5 + v4))
      {
        *(_QWORD *)(v5 + v4) = *(_QWORD *)(v5 + v4 + 8);
        *(_QWORD *)(*(_QWORD *)(a2 + 120) + v4 + 8) = 0;
      }
      v4 += 8;
    }
    while (8 * (v3 - 1) != v4);
  }
  if (!(_DWORD)v3)
    return 11;
  for (i = *(_QWORD **)(a2 + 120); *i; ++i)
  {
    if (!--v3)
      return 11;
  }
  *i = a3;
  uarpTransmitQueueService(a1, a2);
  return 0;
}

uint64_t uarpTransmitQueueService(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t active;

  v2 = *(unsigned __int16 *)(a2 + 112);
  if (!*(_WORD *)(a2 + 112))
    return 0;
  v4 = a1;
  while (1)
  {
    v5 = 0;
    while (1)
    {
      while (1)
      {
        v6 = *(_QWORD *)(*(_QWORD *)(a2 + 120) + 8 * v5);
        if (v6)
          break;
        if (++v5 == v2)
          return 0;
      }
      if (*(_BYTE *)(v6 + 32) != 1)
        break;
      ++v5;
      if (*(_QWORD *)(v4 + 296))
        v7 = 1;
      else
        v7 = v5 == v2;
      if (v7)
        return 0;
    }
    if (*(_BYTE *)(v6 + 33) == 1)
      goto LABEL_21;
    v8 = uarpNtohs(**(unsigned __int16 **)(v6 + 16));
    if (v8 != 0xFFFF)
      break;
    a1 = UARPLayer2VendorSpecificCheckValidToSend(v4, a2);
    if ((_DWORD)a1)
      goto LABEL_23;
LABEL_21:
    a1 = uarpTransmitQueuePendingEntryComplete(a1, a2, v6);
    v9 = 0;
    v2 = *(unsigned __int16 *)(a2 + 112);
    if (!*(_WORD *)(a2 + 112))
      return v9;
  }
  if (v8 == 3
    && uarpNtohl(*(_DWORD *)(*(_QWORD *)(v6 + 16) + 6)) == 9
    && *(unsigned __int16 *)(a2 + 48) <= 2u)
  {
    a1 = UARPLayer2FriendlyNameResponse(v4, a2);
    goto LABEL_21;
  }
LABEL_23:
  if (*(_BYTE *)(a2 + 50) == 1)
    return 0;
  v10 = *(unsigned __int8 *)(v6 + 30);
  if (*(unsigned __int16 *)(a2 + 18) >= v10)
  {
    *(_BYTE *)(v6 + 30) = v10 + 1;
    *(_BYTE *)(v6 + 32) = 1;
    if (*(_BYTE *)(v6 + 31) == 1)
      UARPLayer2WatchdogSet(v4, a2);
    *(_WORD *)(*(_QWORD *)(v6 + 16) + 4) = uarpHtons(*(unsigned __int16 *)(a2 + 58));
    ++*(_WORD *)(a2 + 58);
    v9 = UARPLayer2SendMessage(v4, a2);
    UARPLayer2LogPacket(v4, a2);
    if ((_DWORD)v9)
    {
      *(_BYTE *)(v6 + 32) = 0;
      uarpPlatformEndpointSendMessageCompleteInternal(v4, a2, *(_QWORD *)(v6 + 16));
    }
  }
  else
  {
    active = uarpNtohs(**(unsigned __int16 **)(v6 + 16));
    switch((_DWORD)active)
    {
      case 0xFFFF:
        active = UARPLayer2VendorSpecificExceededRetries(v4, a2);
        break;
      case 3:
        active = uarpNtohl(*(_DWORD *)(*(_QWORD *)(v6 + 16) + 6));
        switch((int)active)
        {
          case 1:
            active = UARPLayer2ManufacturerNameResponse(v4, a2);
            break;
          case 2:
            active = UARPLayer2ModelNameResponse(v4, a2);
            break;
          case 3:
            active = UARPLayer2SerialNumberResponse(v4, a2);
            break;
          case 4:
            active = UARPLayer2HardwareVersionResponse(v4, a2);
            break;
          case 5:
            active = UARPLayer2ActiveFirmwareVersionResponse(v4, a2);
            break;
          case 6:
            active = UARPLayer2StagedFirmwareVersionResponse(v4, a2);
            break;
          case 7:
            active = UARPLayer2StatisticsResponse(v4, a2);
            break;
          case 8:
            active = UARPLayer2LastErrorResponse(v4, a2);
            break;
          case 9:
            active = UARPLayer2FriendlyNameResponse(v4, a2);
            break;
          default:
            goto LABEL_34;
        }
        break;
      case 1:
        *(_WORD *)(a2 + 48) = 0;
        active = UARPLayer2ProtocolVersion(v4, a2);
        break;
    }
LABEL_34:
    uarpTransmitQueuePendingEntryComplete(active, a2, v6);
    uarpTransmitQueueService(v4, a2);
    return 0;
  }
  return v9;
}

uint64_t uarpTransmitQueuePendingEntryComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(unsigned __int16 *)(a2 + 112);
  if (*(_WORD *)(a2 + 112))
  {
    v4 = *(_QWORD **)(a2 + 120);
    v5 = *(unsigned __int16 *)(a2 + 112);
    while (!*v4 || *v4 != a3)
    {
      ++v4;
      if (!--v5)
        goto LABEL_15;
    }
    *v4 = 0;
    *(_WORD *)(a3 + 32) = 0;
    *(_DWORD *)(a3 + 28) = 0;
    v7 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      v8 = *(_QWORD **)(a2 + 104);
      while (*v8)
      {
        ++v8;
        if (!--v7)
          goto LABEL_15;
      }
      *v8 = a3;
    }
LABEL_15:
    if (v3 >= 2)
    {
      v9 = 0;
      v10 = 8 * (v3 - 1);
      do
      {
        v11 = *(_QWORD *)(a2 + 120);
        if (!*(_QWORD *)(v11 + v9))
        {
          *(_QWORD *)(v11 + v9) = *(_QWORD *)(v11 + v9 + 8);
          *(_QWORD *)(*(_QWORD *)(a2 + 120) + v9 + 8) = 0;
        }
        v9 += 8;
      }
      while (v10 != v9);
    }
  }
  return 0;
}

uint64_t uarpTransmitQueueProcessRecv(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned __int16 a4)
{
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v18;
  int v19;
  int v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  uint64_t v23;
  int v25;

  if (*(_WORD *)(a2 + 112))
  {
    v8 = 0;
    v9 = (unsigned __int8 *)(a3 + 3);
    v10 = (unsigned __int8 *)(a3 + 5);
    v25 = a4 & 0xFFF8;
    v11 = a4 & 0xFFF0;
    while (1)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a2 + 120) + 8 * v8);
      if (!v12)
        goto LABEL_38;
      v13 = uarpNtohs(*a3);
      v14 = uarpNtohs(**(unsigned __int16 **)(v12 + 16));
      if (v13 == 4 && v14 == 3)
      {
        if (!v11)
          goto LABEL_38;
        v19 = *((_DWORD *)a3 + 2);
        v20 = *(_DWORD *)(*(_QWORD *)(v12 + 16) + 6);
        goto LABEL_37;
      }
      if (v13 == 7 && v14 == 6)
      {
        if (a4 < 0x12u)
          goto LABEL_38;
        v18 = *(_QWORD *)(v12 + 16);
        if (a3[4] != *(unsigned __int16 *)(v18 + 6) || *(_DWORD *)v10 != *(_DWORD *)(v18 + 8))
          goto LABEL_38;
        v19 = a3[7];
        goto LABEL_26;
      }
      if (v13 == 11 && v14 == 10)
      {
LABEL_53:
        v23 = UARPLayer2WatchdogCancel(a1, a2);
        uarpTransmitQueuePendingEntryComplete(v23, a2, v12);
        return 0;
      }
      if (v13 == 13 && v14 == 5)
      {
        if (a4 < 0x24u)
          goto LABEL_38;
        v18 = *(_QWORD *)(v12 + 16);
        v19 = a3[6];
LABEL_26:
        v20 = *(unsigned __int16 *)(v18 + 12);
        goto LABEL_37;
      }
      if (v13 == 14 && v14 == 8)
        goto LABEL_53;
      if (v13 == 15 && v14 == 9)
      {
        if (a4 < 0xAu)
          goto LABEL_38;
        goto LABEL_36;
      }
      if (v13 == 16 && v14 == 12)
      {
        if (!v25)
          goto LABEL_38;
LABEL_36:
        v19 = *(unsigned __int16 *)v9;
        v20 = *(unsigned __int16 *)(*(_QWORD *)(v12 + 16) + 6);
LABEL_37:
        if (v19 == v20)
          goto LABEL_53;
        goto LABEL_38;
      }
      if (v13 == 18 && v14 == 17)
        break;
      if (v13 == 20 && v14 == 19)
      {
        if (a4 < 0xCu)
          goto LABEL_38;
        v21 = (unsigned __int8 *)(*(_QWORD *)(v12 + 16) + 6);
        v22 = v9;
LABEL_48:
        if (uarpAssetTagCompare(v22, v21))
          goto LABEL_53;
        goto LABEL_38;
      }
      if (v13 == 0xFFFF && v14 == 0xFFFF && UARPLayer2VendorSpecificCheckExpectedResponse(a1, a2) == 1)
        goto LABEL_53;
LABEL_38:
      if (++v8 >= (unint64_t)*(unsigned __int16 *)(a2 + 112))
        return 0;
    }
    if (a4 < 0xEu)
      goto LABEL_38;
    v21 = (unsigned __int8 *)(*(_QWORD *)(v12 + 16) + 6);
    v22 = v10;
    goto LABEL_48;
  }
  return 0;
}

void uarpTransmitQueuesCleanup(uint64_t a1, uint64_t a2)
{
  void *v4;
  unsigned int v5;
  unint64_t v6;
  void **v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  void **v11;

  UARPLayer2WatchdogCancel(a1, a2);
  v4 = *(void **)(a2 + 104);
  if (v4)
  {
    v5 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      v6 = 0;
      do
      {
        v7 = *(void ***)(*(_QWORD *)(a2 + 104) + 8 * v6);
        if (v7)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v7);
          UARPLayer2ReturnBuffer(a1, v7);
          *(_QWORD *)(*(_QWORD *)(a2 + 104) + 8 * v6) = 0;
          v5 = *(unsigned __int16 *)(a2 + 96);
        }
        ++v6;
      }
      while (v6 < v5);
      v4 = *(void **)(a2 + 104);
    }
    UARPLayer2ReturnBuffer(a1, v4);
    *(_QWORD *)(a2 + 104) = 0;
    *(_WORD *)(a2 + 96) = 0;
  }
  v8 = *(void **)(a2 + 120);
  if (v8)
  {
    v9 = *(unsigned __int16 *)(a2 + 112);
    if (*(_WORD *)(a2 + 112))
    {
      v10 = 0;
      do
      {
        v11 = *(void ***)(*(_QWORD *)(a2 + 120) + 8 * v10);
        if (v11)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v11);
          UARPLayer2ReturnBuffer(a1, v11);
          *(_QWORD *)(*(_QWORD *)(a2 + 120) + 8 * v10) = 0;
          v9 = *(unsigned __int16 *)(a2 + 112);
        }
        ++v10;
      }
      while (v10 < v9);
      v8 = *(void **)(a2 + 120);
    }
    UARPLayer2ReturnBuffer(a1, v8);
    *(_QWORD *)(a2 + 120) = 0;
    *(_WORD *)(a2 + 112) = 0;
  }
}

uint64_t uarpPlatformEndpointIsMessageTypePending(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;

  if (!*(_WORD *)(a2 + 112))
    return 0;
  v5 = 0;
  while (1)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a2 + 120) + 8 * v5);
    if (v6)
    {
      if (uarpNtohs(**(unsigned __int16 **)(v6 + 16)) == a3
        && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a2 + 120) + 8 * v5) + 33) != 1)
      {
        break;
      }
    }
    if (++v5 >= (unint64_t)*(unsigned __int16 *)(a2 + 112))
      return 0;
  }
  return 1;
}

void uarpTransmitQueueAssetRescinded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  int v7;

  if (a2 && *(_WORD *)(a2 + 112))
  {
    v5 = 0;
    do
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a2 + 120) + 8 * v5);
      if (v6)
      {
        if (uarpNtohs(**(unsigned __int16 **)(v6 + 16)) == 6)
        {
          v7 = uarpNtohs(*(unsigned __int16 *)(*(_QWORD *)(v6 + 16) + 6));
          if (!a3 || v7 == *(unsigned __int16 *)(a3 + 44))
            *(_BYTE *)(v6 + 33) = 1;
        }
      }
      ++v5;
    }
    while (v5 < *(unsigned __int16 *)(a2 + 112));
  }
}

_QWORD *uarpAvailableTransmitBuffer(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  _DWORD **i;
  _DWORD *v8;

  v3 = *(unsigned __int16 *)(a2 + 96);
  if (!*(_WORD *)(a2 + 96))
    return 0;
  for (i = *(_DWORD ***)(a2 + 104); ; ++i)
  {
    v8 = *i;
    if (*i)
      break;
    if (!--v3)
      return 0;
  }
  *i = 0;
  if (v8[6] < a3)
  {
    UARPLayer2ReturnTransmitMsgBuffer(a1, a2, v8);
    return uarpAllocateTransmitBuffer2(a1, a2, a3);
  }
  return v8;
}

void sub_24BCA0900(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24BCA0D6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double CoreUARPRestoreSetAssetPersonalizedFirmwareCallbacks(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_QWORD *)a1 = fPersonalizedFirmwareAssetReady;
  *(_QWORD *)(a1 + 64) = fPersonalizedFirmwarePayloadData;
  *(_QWORD *)(a1 + 80) = fPersonalizedFirmwarePayloadDataComplete;
  *(_QWORD *)(a1 + 120) = fPersonalizedFirmwareAssetCorrupt;
  *(_QWORD *)(a1 + 128) = fPersonalizedFirmwareAssetOrphaned;
  *(_QWORD *)(a1 + 136) = fPersonalizedFirmwareAssetReleased2;
  *(_QWORD *)(a1 + 144) = fPersonalizedFirmwareAssetProcessingNotification2;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 152) = fPersonalizedFirmwareAssetProcessingNotificationAck;
  *(_QWORD *)(a1 + 160) = fPersonalizedFirmwareAssetPreProcessingNotification;
  *(_QWORD *)(a1 + 168) = fPersonalizedFirmwareAssetPreProcessingNotificationAck;
  *(_QWORD *)(a1 + 176) = fPersonalizedFirmwareAssetAllHeadersAndMetaDataComplete;
  return result;
}

uint64_t fPersonalizedFirmwareAssetReady(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    if (a2)
      return uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(result + 648, *a2);
  }
  return result;
}

void *fPersonalizedFirmwarePayloadData(void *result, uint64_t a2, void *__src, size_t __n, unsigned int a5)
{
  if (result)
  {
    if (a2)
      return memcpy((void *)(*(_QWORD *)(*(_QWORD *)(a2 + 296) + 88 * *(unsigned __int16 *)(a2 + 304) + 80) + a5), __src, __n);
  }
  return result;
}

uint64_t fPersonalizedFirmwarePayloadDataComplete(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    if (a2)
      return uarpPlatformEndpointAssetFullyStaged(result + 648, *a2);
  }
  return result;
}

uint64_t fPersonalizedFirmwareAssetProcessingNotification2()
{
  return 0;
}

uint64_t fPersonalizedFirmwareAssetProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  v8 = 30;
  if (a1 && a3)
  {
    CoreUARPRestoreAssetPersonalizedFirmware(a1, *(_QWORD *)(*(_QWORD *)(a3 + 296) + 80), *(unsigned int *)(*(_QWORD *)(a3 + 296) + 28), a4, a5, a6, a7, a8);
    return 0;
  }
  return v8;
}

uint64_t fPersonalizedFirmwareAssetPreProcessingNotification()
{
  return 0;
}

uint64_t fPersonalizedFirmwareAssetPreProcessingNotificationAck()
{
  return 0;
}

void fPersonalizedFirmwareAssetAllHeadersAndMetaDataComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a1)
  {
    if (a3)
    {
      v5 = (void *)(a1 + 648);
      if (!uarpPlatformEndpointAssetQueryNumberOfPayloads(a1 + 648, *(_QWORD *)a3, (_WORD *)(a3 + 288)))
      {
        *(_QWORD *)(a3 + 296) = uarpZalloc(88 * *(unsigned __int16 *)(a3 + 288));
        if (*(_WORD *)(a3 + 288))
        {
          v6 = 0;
          v7 = 0;
          while (1)
          {
            v8 = *(_QWORD *)(a3 + 296) + v6;
            *(_WORD *)v8 = v7;
            if (uarpAssetQueryPayloadInfo((uint64_t)v5, *(_QWORD *)a3, v7, v8 + 4))
              break;
            *(_QWORD *)(v8 + 80) = uarpZalloc(*(unsigned int *)(v8 + 28));
            ++v7;
            v6 += 88;
            if (v7 >= *(unsigned __int16 *)(a3 + 288))
              goto LABEL_8;
          }
        }
        else
        {
LABEL_8:
          v9 = uarpPlatformEndpointAssetSetPayloadIndex(v5, *(_QWORD *)a3, 0);
          if (v9)
            CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "Failed to set FIRM payload index; %u",
              v10,
              v11,
              v12,
              v13,
              v14,
              v9);
        }
      }
    }
  }
}

double CoreUARPRestoreSetAssetCallbacks(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_QWORD *)a1 = fAssetReady;
  *(_QWORD *)(a1 + 8) = fAssetMetaDataTLV;
  *(_QWORD *)(a1 + 16) = fAssetMetaDataComplete;
  *(_QWORD *)(a1 + 24) = fAssetMetaDataProcessingError;
  *(_QWORD *)(a1 + 32) = fPayloadReady;
  *(_QWORD *)(a1 + 40) = fPayloadMetaDataTLV;
  *(_QWORD *)(a1 + 48) = fPayloadMetaDataComplete;
  *(_QWORD *)(a1 + 56) = fPayloadMetaDataProcessingError;
  *(_QWORD *)(a1 + 64) = fPayloadData;
  *(_QWORD *)(a1 + 72) = fPayloadDataComplete;
  *(_QWORD *)(a1 + 80) = fPayloadDataComplete2;
  *(_QWORD *)(a1 + 88) = fAssetGetBytesAtOffset2;
  *(_QWORD *)(a1 + 96) = fAssetSetBytesAtOffset2;
  *(_QWORD *)(a1 + 104) = fAssetRescinded;
  *(_QWORD *)(a1 + 112) = fAssetRescindedAck;
  *(_QWORD *)(a1 + 120) = fAssetCorrupt;
  *(_QWORD *)(a1 + 128) = fAssetOrphaned;
  *(_QWORD *)(a1 + 136) = fAssetReleased2;
  *(_QWORD *)(a1 + 144) = fAssetProcessingNotification2;
  *(_QWORD *)(a1 + 152) = fAssetProcessingNotificationAck;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_QWORD *)(a1 + 160) = fAssetPreProcessingNotification;
  *(_QWORD *)(a1 + 168) = fAssetPreProcessingNotificationAck;
  *(_QWORD *)(a1 + 176) = fAssetAllHeadersAndMetaDataComplete;
  return result;
}

uint64_t fAssetGetBytesAtOffset2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, _WORD *a7, uint64_t a8)
{
  unsigned int v10;
  size_t v14;
  FILE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  FILE *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unsigned __int16 v29;
  uint64_t v30;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v10 = a5;
  v14 = a5;
  CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: Get %u Bytes from offset %u", (uint64_t)a4, a5, a6, (uint64_t)a7, a8, a5);
  v15 = *(FILE **)(a3 + 16);
  if (v15)
  {
    fseek(v15, a6, 0);
    v20 = fread(a4, 1uLL, v14, *(FILE **)(a3 + 16));
    if (v20 < v10)
    {
      v21 = *(FILE **)(a3 + 16);
      v22 = ferror(v21);
      if (v22)
      {
        CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: Read error %d, Read %zu bytes", v23, v24, v25, v26, v27, v22);
        return 54;
      }
      v32 = feof(v21);
      CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: EOF %d, Read %zu bytes", v33, v34, v35, v36, v37, v32);
      if (!v32)
        return 54;
    }
  }
  else
  {
    v28 = *(_DWORD *)(a3 + 308);
    if (v10 + a6 <= v28)
      v29 = v10;
    else
      v29 = v28 - a6;
    LOWORD(v20) = v29;
    memcpy(a4, (const void *)(*(_QWORD *)(a3 + 280) + a6), v29);
  }
  *a7 = v20;
  v30 = *(unsigned int *)(a3 + 308);
  if ((_DWORD)v30)
    CoreUARPRestoreAssetTransferProgress(a1, a3, a6, v30, v16, v17, v18, v19);
  return 0;
}

uint64_t fAssetSetBytesAtOffset2()
{
  return 26;
}

uint64_t fAssetProcessingNotification2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CoreUARPRestoreAssetTransferStatus(a1, a3, a4, a4, a5, a6, a7, a8);
  return 0;
}

uint64_t fAssetProcessingNotificationAck()
{
  return 0;
}

uint64_t fAssetPreProcessingNotification()
{
  return 0;
}

uint64_t fAssetPreProcessingNotificationAck()
{
  return 0;
}

uint64_t uarpPlatformEndpointSendSyncMsg(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  _QWORD *v5;

  result = 30;
  if (a1 && a2)
  {
    v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0, 6u, *(_DWORD *)(a1 + 552) != 0);
    if (v5)
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    else
      return 11;
  }
  return result;
}

uint64_t uarpSendVersionDiscoveryRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  result = 30;
  if (a1 && a2)
  {
    v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 1u, 8u, 1);
    if (v7)
    {
      v8 = (uint64_t)v7;
      v9 = v7[2];
      if (a3 >= 4)
        v10 = 4;
      else
        v10 = a3;
      *(_WORD *)(a2 + 48) = v10;
      *(_WORD *)(v9 + 6) = uarpHtons(v10);
      return uarpTransmitBuffer2(a1, a2, v8);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendVersionDiscoveryResponse(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t result;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  result = 30;
  if (a1 && a2)
  {
    *(_WORD *)(a2 + 48) = a3;
    v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 2u, 0xAu, 0);
    if (v6)
    {
      v7 = (uint64_t)v6;
      v8 = v6[2];
      *(_WORD *)(v8 + 6) = uarpHtons(0);
      *(_WORD *)(v8 + 8) = uarpHtons(*(unsigned __int16 *)(a2 + 48));
      return uarpTransmitBuffer2(a1, a2, v7);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendInformationRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 3u, 0xAu, 1);
  if (!v6)
    return 11;
  v7 = (uint64_t)v6;
  v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpHtonl(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDataTransferNotificationPause(uint64_t a1, uint64_t a2)
{
  return uarpSendDataTransferNotification(a1, a2, 1u);
}

uint64_t uarpSendDataTransferNotification(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  result = 30;
  if (a1 && a2)
  {
    v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 8u, 8u, 1);
    if (v7)
    {
      v8 = (uint64_t)v7;
      v9 = v7[2];
      *(_WORD *)(v9 + 6) = uarpHtons(a3);
      return uarpTransmitBuffer2(a1, a2, v8);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendDataTransferNotificationResume(uint64_t a1, uint64_t a2)
{
  return uarpSendDataTransferNotification(a1, a2, 2u);
}

uint64_t uarpSendDynamicAssetPreProcessingStatus(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4, int a5)
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x13u, 0xCu, 1);
  if (!v10)
    return 11;
  v11 = (uint64_t)v10;
  v12 = v10[2];
  *(_DWORD *)(v12 + 6) = *a3;
  *(_WORD *)(v12 + 10) = uarpHtons(a5 | a4);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendAssetRequestData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;

  v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 6u, 0xEu, 1);
  if (!v10)
    return 11;
  v11 = (uint64_t)v10;
  v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  *(_DWORD *)(v12 + 8) = uarpHtonl(a4);
  if (a5 >= 0xFFFF)
    v13 = 0xFFFF;
  else
    v13 = a5;
  *(_WORD *)(v12 + 12) = uarpHtons(v13);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendVendorSpecific(uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;

  if (!a2)
    return 13;
  v12 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFFFFu, (unsigned __int16)(a6 + 11), a4 == 32);
  if (!v12)
    return 11;
  v13 = (uint64_t)v12;
  v14 = v12[2];
  v15 = *a3;
  *(_BYTE *)(v14 + 8) = *((_BYTE *)a3 + 2);
  *(_WORD *)(v14 + 6) = v15;
  *(_WORD *)(v14 + 9) = uarpHtons(a4);
  if (a5)
  {
    if (a6)
      memcpy((void *)(v14 + 11), a5, a6);
  }
  return uarpTransmitBuffer2(a1, a2, v13);
}

uint64_t UARPLayer2RequestBuffer(uint64_t a1, _QWORD *a2, unsigned int a3)
{
  uint64_t (*v4)(_QWORD, _QWORD *);
  void *v6;

  v4 = *(uint64_t (**)(_QWORD, _QWORD *))(a1 + 48);
  if (v4)
    return v4(*(_QWORD *)(a1 + 544), a2);
  v6 = uarpZalloc(a3);
  *a2 = v6;
  if (v6)
    return 0;
  else
    return 11;
}

void UARPLayer2ReturnBuffer(uint64_t a1, void *a2)
{
  void (*v2)(_QWORD, void *);

  v2 = *(void (**)(_QWORD, void *))(a1 + 56);
  if (v2)
    v2(*(_QWORD *)(a1 + 544), a2);
  else
    uarpFree(a2);
}

uint64_t UARPLayer2RequestTransmitMsgBuffer(uint64_t a1, uint64_t a2, _QWORD *a3, unsigned int *a4)
{
  size_t v5;
  uint64_t (*v6)(_QWORD, _QWORD *, size_t);
  void *v8;

  v5 = *a4;
  v6 = *(uint64_t (**)(_QWORD, _QWORD *, size_t))(a1 + 48);
  if (v6)
    return v6(*(_QWORD *)(a1 + 544), a3, v5);
  v8 = uarpZalloc(v5);
  *a3 = v8;
  if (v8)
    return 0;
  else
    return 11;
}

void UARPLayer2ReturnTransmitMsgBuffer(uint64_t a1, int a2, void *a3)
{
  void (*v3)(_QWORD, void *);

  v3 = *(void (**)(_QWORD, void *))(a1 + 56);
  if (v3)
    v3(*(_QWORD *)(a1 + 544), a3);
  else
    uarpFree(a3);
}

uint64_t UARPLayer2SendMessage(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 80);
  if (v2)
    return v2(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40));
  else
    return 14;
}

uint64_t UARPLayer2DataTransferPause(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 88);
  if (v2)
    return v2(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40));
  else
    return 14;
}

uint64_t UARPLayer2DataTransferPauseAck(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 96);
  if (v2)
    return v2(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40));
  else
    return 14;
}

uint64_t UARPLayer2DataTransferResume(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 104);
  if (v2)
    return v2(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40));
  else
    return 14;
}

uint64_t UARPLayer2DataTransferResumeAck(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 112);
  if (v2)
    return v2(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40));
  else
    return 14;
}

uint64_t UARPLayer2SuperBinaryOffered(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 120);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2DynamicAssetOffered(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 128);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2ApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 136);
  if (v2)
    return v2(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40));
  else
    return 14;
}

uint64_t UARPLayer2ApplyStagedAssetsResponse(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 144);
  if (v2)
    return v2(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40));
  else
    return 14;
}

uint64_t UARPLayer2ManufacturerName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t (*v3)(_QWORD, _DWORD *, _DWORD *);

  v3 = *(uint64_t (**)(_QWORD, _DWORD *, _DWORD *))(a1 + 152);
  if (v3)
    return v3(*(_QWORD *)(a1 + 544), a2, a3);
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0;
}

uint64_t UARPLayer2ManufacturerNameResponse(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 160);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2ModelName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t (*v3)(_QWORD, _DWORD *, _DWORD *);

  v3 = *(uint64_t (**)(_QWORD, _DWORD *, _DWORD *))(a1 + 168);
  if (v3)
    return v3(*(_QWORD *)(a1 + 544), a2, a3);
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0;
}

uint64_t UARPLayer2ModelNameResponse(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 176);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2SerialNumber(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t (*v3)(_QWORD, _DWORD *, _DWORD *);

  v3 = *(uint64_t (**)(_QWORD, _DWORD *, _DWORD *))(a1 + 184);
  if (v3)
    return v3(*(_QWORD *)(a1 + 544), a2, a3);
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0;
}

uint64_t UARPLayer2SerialNumberResponse(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 192);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2HardwareVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t (*v3)(_QWORD, _DWORD *, _DWORD *);

  v3 = *(uint64_t (**)(_QWORD, _DWORD *, _DWORD *))(a1 + 200);
  if (v3)
    return v3(*(_QWORD *)(a1 + 544), a2, a3);
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0;
}

uint64_t UARPLayer2HardwareVersionResponse(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 208);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2ActiveFirmwareVersion2(_QWORD *a1, unsigned int *a2, _QWORD *a3)
{
  uint64_t (*v5)(_QWORD, unsigned int *, _QWORD *);
  uint64_t (*v7)(_QWORD, unsigned int *, _QWORD *);

  v5 = (uint64_t (*)(_QWORD, unsigned int *, _QWORD *))a1[27];
  if (v5)
    return v5(a1[68], a2, a3);
  v7 = (uint64_t (*)(_QWORD, unsigned int *, _QWORD *))a1[64];
  if (v7)
  {
    if (a2)
    {
      a2 = (unsigned int *)uarpTagStructPack32(a2);
      v7 = (uint64_t (*)(_QWORD, unsigned int *, _QWORD *))a1[64];
    }
    return v7(a1[68], a2, a3);
  }
  else
  {
    *a3 = -1;
    a3[1] = -1;
    return 0;
  }
}

uint64_t UARPLayer2ActiveFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 224);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2StagedFirmwareVersion2(_QWORD *a1, unsigned int *a2, _QWORD *a3)
{
  uint64_t (*v5)(_QWORD, unsigned int *, _QWORD *);
  uint64_t (*v7)(_QWORD, unsigned int *, _QWORD *);

  v5 = (uint64_t (*)(_QWORD, unsigned int *, _QWORD *))a1[29];
  if (v5)
    return v5(a1[68], a2, a3);
  v7 = (uint64_t (*)(_QWORD, unsigned int *, _QWORD *))a1[65];
  if (v7)
  {
    if (a2)
    {
      a2 = (unsigned int *)uarpTagStructPack32(a2);
      v7 = (uint64_t (*)(_QWORD, unsigned int *, _QWORD *))a1[65];
    }
    return v7(a1[68], a2, a3);
  }
  else
  {
    *a3 = -1;
    a3[1] = -1;
    return 0;
  }
}

uint64_t UARPLayer2StagedFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 240);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2LastError(uint64_t a1, _QWORD *a2)
{
  uint64_t (*v2)(_QWORD);

  v2 = *(uint64_t (**)(_QWORD))(a1 + 248);
  if (v2)
    return v2(*(_QWORD *)(a1 + 544));
  *a2 = -1;
  return 0;
}

uint64_t UARPLayer2LastErrorResponse(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 256);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2StatisticsResponse(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 264);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2AssetSolicitation(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 272);
  if (v2)
    return v2(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40));
  else
    return 14;
}

uint64_t UARPLayer2RescindAllAssets(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(_QWORD, uint64_t, uint64_t);

  v3 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t))(result + 280);
  if (v3)
  {
    if (a2)
      a2 = *(_QWORD *)(a2 + 40);
    if (a3)
      a3 = *(_QWORD *)(a3 + 704);
    return v3(*(_QWORD *)(result + 544), a2, a3);
  }
  return result;
}

uint64_t UARPLayer2RescindAllAssetsAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(_QWORD, _QWORD, uint64_t);

  v3 = *(uint64_t (**)(_QWORD, _QWORD, uint64_t))(result + 288);
  if (v3)
  {
    if (a3)
      a3 = *(_QWORD *)(a3 + 704);
    return v3(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40), a3);
  }
  return result;
}

uint64_t UARPLayer2WatchdogSet(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 296);
  if (!v2)
    return 14;
  *(_BYTE *)(a2 + 50) = 1;
  return v2(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40));
}

uint64_t UARPLayer2WatchdogCancel(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 304);
  if (!v2)
    return 14;
  *(_BYTE *)(a2 + 50) = 0;
  return v2(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40));
}

uint64_t UARPLayer2ProtocolVersion(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 312);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2FriendlyName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t (*v3)(_QWORD, _DWORD *, _DWORD *);

  v3 = *(uint64_t (**)(_QWORD, _DWORD *, _DWORD *))(a1 + 320);
  if (v3)
    return v3(*(_QWORD *)(a1 + 544), a2, a3);
  *a3 = uarpCopyDefaultInfoString(a2, *a3);
  return 0;
}

uint64_t UARPLayer2FriendlyNameResponse(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 328);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2DecompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 336);
  if (v6)
    return v6(a2, a3, a4, a5, a6);
  else
    return 14;
}

uint64_t UARPLayer2CompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 344);
  if (v6)
    return v6(a2, a3, a4, a5, a6);
  else
    return 14;
}

uint64_t UARPLayer2HashInfo(uint64_t result, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t (*v4)(uint64_t, _DWORD *, _DWORD *);

  v4 = *(uint64_t (**)(uint64_t, _DWORD *, _DWORD *))(result + 352);
  if (v4)
    return v4(a2, a3, a4);
  *a3 = 0;
  *a4 = 0;
  return result;
}

uint64_t UARPLayer2HashInit(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t, uint64_t);

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 360);
  if (v3)
    return v3(a2, a3);
  return result;
}

uint64_t UARPLayer2HashUpdate(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);

  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 368);
  if (v5)
    return v5(a2, a3, a4, a5);
  return result;
}

uint64_t UARPLayer2HashFinal(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);

  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 376);
  if (v5)
    return v5(a2, a3, a4, a5);
  return result;
}

uint64_t UARPLayer2HashLog(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t, uint64_t);

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 384);
  if (v3)
    return v3(a2, a3);
  return result;
}

uint64_t UARPLayer2LogPacket(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 392);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t fUarpLayer3NoFirmwareUpdateAvailable(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 472);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2VendorSpecificRecvMessage(_QWORD *a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);
  uint64_t (*v4)(void);

  v2 = (uint64_t (*)(_QWORD, _QWORD))a1[60];
  if (v2)
    return v2(a1[68], *(_QWORD *)(a2 + 40));
  v4 = (uint64_t (*)(void))a1[74];
  if (v4)
    return v4();
  else
    return 14;
}

uint64_t UARPLayer2VendorSpecificCheckExpectedResponse(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 488);
  if (v2)
    return v2(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40));
  else
    return 1;
}

uint64_t UARPLayer2VendorSpecificCheckValidToSend(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a1 + 496);
  if (v2)
    return v2(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40));
  else
    return 1;
}

uint64_t UARPLayer2VendorSpecificExceededRetries(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(result + 504);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40));
  return result;
}

uint64_t UARPLayer2AssetReady(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 80);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 704));
  return result;
}

uint64_t UARPLayer2AssetMetaDataTLV(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 88);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 704));
  return result;
}

uint64_t UARPLayer2AssetMetaDataComplete(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 96);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 704));
  return result;
}

uint64_t UARPLayer2AssetMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 104);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 704));
  return result;
}

uint64_t UARPLayer2PayloadReady(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 112);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 704));
  return result;
}

void *UARPLayer2PayloadMetaDataTLV(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  void *result;
  uint64_t (*v11)(_QWORD, _QWORD, uint64_t, uint64_t, _DWORD *);

  result = uarpProcessPayloadTLVInternal(a1, a2, a2 + 464, a3, a4, a5);
  v11 = *(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t, _DWORD *))(a2 + 120);
  if (v11)
    return (void *)v11(a1[68], *(_QWORD *)(a2 + 704), a3, a4, a5);
  return result;
}

uint64_t UARPLayer2PayloadMetaDataComplete(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void (*v5)(void);
  uint64_t (*v6)(_QWORD, _QWORD);

  result = *(unsigned int *)(a2 + 540);
  if (!(_DWORD)result)
    goto LABEL_5;
  v5 = *(void (**)(void))(a1 + 376);
  if (v5)
    v5();
  result = uarpPlatformCompareHash(a1, *(void **)(a2 + 560), *(unsigned int *)(a2 + 568), *(void **)(a2 + 576), *(_DWORD *)(a2 + 584));
  if ((_DWORD)result)
  {
LABEL_5:
    v6 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 128);
    if (!v6)
      return result;
    return v6(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 704));
  }
  v6 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 200);
  if (v6)
    return v6(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 704));
  return result;
}

uint64_t UARPLayer2AssetCorrupt(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 200);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 704));
  return result;
}

uint64_t UARPLayer2PayloadMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 136);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 704));
  return result;
}

uint64_t UARPLayer2PayloadData(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 144);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 704));
  return result;
}

uint64_t UARPLayer2PayloadDataComplete(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 152);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 704));
  return result;
}

uint64_t UARPLayer2PayloadDataComplete2(uint64_t result, _QWORD *a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);
  uint64_t (*v3)(_QWORD, _QWORD);

  v2 = (uint64_t (*)(_QWORD, _QWORD))a2[20];
  if (v2)
    return v2(*(_QWORD *)(result + 544), a2[88]);
  v3 = (uint64_t (*)(_QWORD, _QWORD))a2[19];
  if (v3)
    return v3(*(_QWORD *)(result + 544), a2[88]);
  return result;
}

uint64_t UARPLayer2AssetGetBytesAtOffset2(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD);
  uint64_t (*v9)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t);

  if (a2)
    a2 = *(_QWORD *)(a2 + 40);
  v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD))a3[21];
  if (v7)
    return v7(*(_QWORD *)(a1 + 544), a2, a3[88]);
  v9 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))a3[34];
  if (v9)
    return v9(*(_QWORD *)(a1 + 544), a3[88], a4, a5, a6, a7);
  else
    return 14;
}

uint64_t UARPLayer2AssetSetBytesAtOffset2(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v6)(_QWORD, uint64_t, _QWORD);
  uint64_t (*v8)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t);

  if (a2)
    a2 = *(_QWORD *)(a2 + 40);
  v6 = (uint64_t (*)(_QWORD, uint64_t, _QWORD))a3[22];
  if (v6)
    return v6(*(_QWORD *)(a1 + 544), a2, a3[88]);
  v8 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))a3[35];
  if (v8)
    return v8(*(_QWORD *)(a1 + 544), a3[88], a4, a5, a6);
  else
    return 14;
}

uint64_t UARPLayer2AssetRescinded(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(_QWORD, uint64_t, _QWORD);

  if (a2)
    a2 = *(_QWORD *)(a2 + 40);
  v3 = *(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a3 + 184);
  if (v3)
    return v3(*(_QWORD *)(result + 544), a2, *(_QWORD *)(a3 + 704));
  return result;
}

uint64_t UARPLayer2AssetRescindedAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(_QWORD, uint64_t, _QWORD);

  if (a2)
    a2 = *(_QWORD *)(a2 + 40);
  v3 = *(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a3 + 192);
  if (v3)
    return v3(*(_QWORD *)(result + 544), a2, *(_QWORD *)(a3 + 704));
  return result;
}

uint64_t UARPLayer2AssetOrphaned(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 208);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 704));
  return result;
}

uint64_t UARPLayer2AssetReleased2(uint64_t result, uint64_t a2, _QWORD *a3)
{
  uint64_t (*v3)(_QWORD, uint64_t, _QWORD);
  uint64_t (*v4)(_QWORD, _QWORD);

  if (a2)
    a2 = *(_QWORD *)(a2 + 40);
  v3 = (uint64_t (*)(_QWORD, uint64_t, _QWORD))a3[27];
  if (v3)
    return v3(*(_QWORD *)(result + 544), a2, a3[88]);
  v4 = (uint64_t (*)(_QWORD, _QWORD))a3[36];
  if (v4)
    return v4(*(_QWORD *)(result + 544), a3[88]);
  return result;
}

uint64_t UARPLayer2AssetProcessingNotification2(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t (*v4)(_QWORD, _QWORD, _QWORD);
  uint64_t (*v6)(_QWORD, _QWORD, uint64_t);

  v4 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))a3[28];
  if (v4)
    return v4(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40), a3[88]);
  v6 = (uint64_t (*)(_QWORD, _QWORD, uint64_t))a3[37];
  if (v6)
    return v6(*(_QWORD *)(a1 + 544), a3[88], a4);
  else
    return 14;
}

uint64_t UARPLayer2AssetProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(_QWORD, _QWORD, _QWORD);

  v3 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a3 + 232);
  if (v3)
    return v3(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40), *(_QWORD *)(a3 + 704));
  else
    return 14;
}

uint64_t UARPLayer2AssetPreProcessingNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(_QWORD, _QWORD, _QWORD);

  v3 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a3 + 240);
  if (v3)
    return v3(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40), *(_QWORD *)(a3 + 704));
  else
    return 14;
}

uint64_t UARPLayer2AssetPreProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(_QWORD, _QWORD, _QWORD);

  v3 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a3 + 248);
  if (v3)
    return v3(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40), *(_QWORD *)(a3 + 704));
  else
    return 14;
}

uint64_t UARPLayer2AssetAllHeadersAndMetaDataComplete(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(_QWORD, _QWORD, _QWORD);

  v3 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a3 + 256);
  if (v3)
    return v3(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 40), *(_QWORD *)(a3 + 704));
  return result;
}

uint64_t UARPLayer2AssetStore(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD);

  v2 = *(uint64_t (**)(_QWORD, _QWORD))(a2 + 264);
  if (v2)
    return v2(*(_QWORD *)(result + 544), *(_QWORD *)(a2 + 704));
  return result;
}

uint64_t uarpPlatformEndpointQueryActiveFirmwareVersion(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  unsigned int v4;

  v4 = 0;
  if (a2)
    v4 = *(_DWORD *)(a2 + 48);
  return UARPLayer2ActiveFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformEndpointQueryStagedFirmwareVersion(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  unsigned int v4;

  v4 = 0;
  if (a2)
    v4 = *(_DWORD *)(a2 + 48);
  return UARPLayer2StagedFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformAssetFindByAssetID(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t result;

  for (result = *(_QWORD *)(a1 + 568); result; result = *(_QWORD *)(result + 712))
  {
    if (*(_DWORD *)(result + 304) == a3 && *(_QWORD *)(result + 696) == a2 && *(unsigned __int16 *)(result + 44) == a4)
      break;
  }
  return result;
}

uint64_t uarpPlatformAssetFindByTag(uint64_t a1, uint64_t a2, int a3, unsigned __int8 *a4)
{
  uint64_t i;

  for (i = *(_QWORD *)(a1 + 568); i; i = *(_QWORD *)(i + 712))
  {
    if (*(_DWORD *)(i + 304) == a3
      && *(_QWORD *)(i + 696) == a2
      && uarpAssetTagCompare((unsigned __int8 *)(i + 48), a4))
    {
      break;
    }
  }
  return i;
}

void uarpPlatformCleanupAssetsForRemoteEndpoint(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  if (*(_BYTE *)(a1 + 580) != 1)
  {
    v4 = *(_QWORD *)(a1 + 568);
    for (*(_QWORD *)(a1 + 568) = 0; v4; *(_QWORD *)(a1 + 568) = v7)
    {
      while (1)
      {
        v7 = v4;
        v4 = *(_QWORD *)(v4 + 712);
        *(_QWORD *)(v7 + 712) = 0;
        v8 = *(_QWORD *)(v7 + 696);
        v9 = v8 == a2 || a2 == 0;
        if (!v9 && v8 != 0)
          break;
        if (a3 == 1)
        {
          if ((*(_WORD *)(v7 + 46) & 1) != 0)
          {
            *(_QWORD *)(v7 + 696) = 0;
            UARPLayer2AssetOrphaned(a1, v7);
          }
          else
          {
            *(_BYTE *)(v7 + 72) = 1;
          }
        }
        if (*(_BYTE *)(v7 + 72) != 1)
          break;
        UARPLayer2AssetReleased2(a1, a2, (_QWORD *)v7);
        *(_QWORD *)(v7 + 704) = 0;
        uarpPlatformAssetCleanup(a1, v7);
        if (!v4)
          return;
      }
      *(_QWORD *)(v7 + 712) = *(_QWORD *)(a1 + 568);
    }
  }
}

uint64_t uarpPlatformAssetOrphan(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 696) = 0;
  return UARPLayer2AssetOrphaned(result, a2);
}

uint64_t uarpPlatformAssetRelease(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  result = UARPLayer2AssetReleased2(a1, a2, a3);
  a3[88] = 0;
  return result;
}

void uarpPlatformAssetCleanup(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = *(void **)(a2 + 640);
  if (v4 && !*(_BYTE *)(a2 + 652))
    UARPLayer2ReturnBuffer(a1, v4);
  *(_QWORD *)(a2 + 640) = 0;
  *(_DWORD *)(a2 + 648) = 0;
  v5 = *(void **)(a2 + 672);
  if (v5)
  {
    UARPLayer2ReturnBuffer(a1, v5);
    *(_QWORD *)(a2 + 672) = 0;
  }
  *(_DWORD *)(a2 + 680) = 0;
  v6 = *(_QWORD **)(a2 + 720);
  if (v6)
  {
    do
    {
      v7 = (_QWORD *)v6[2];
      v6[2] = 0;
      UARPLayer2ReturnBuffer(a1, v6);
      v6 = v7;
    }
    while (v7);
  }
  *(_QWORD *)(a2 + 720) = 0;
  v8 = *(_QWORD **)(a2 + 632);
  if (v8)
  {
    do
    {
      v9 = (_QWORD *)v8[21];
      v10 = (_QWORD *)v8[22];
      if (v9)
      {
        do
        {
          v11 = (_QWORD *)v9[2];
          v9[2] = 0;
          UARPLayer2ReturnBuffer(a1, v9);
          v9 = v11;
        }
        while (v11);
      }
      v8[21] = 0;
      uarpPlatformPayloadCleanup(a1, (uint64_t)v8);
      UARPLayer2ReturnBuffer(a1, v8);
      v8 = v10;
    }
    while (v10);
  }
  uarpPlatformPayloadCleanup(a1, a2 + 464);
  UARPLayer2ReturnBuffer(a1, (void *)a2);
}

uint64_t uarpPlatformAssetIsKnown(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 568);
  if (!v3)
    return 0;
  while (v3 != a3)
  {
    v3 = *(_QWORD *)(v3 + 712);
    if (!v3)
      return 0;
  }
  return 1;
}

void uarpPlatformPrepareAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, int a6)
{
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;

  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        v16 = 0;
        if (!UARPLayer2RequestBuffer(a1, &v16, 0x2D8u))
        {
          v12 = v16;
          if (v16)
          {
            *(_QWORD *)(v16 + 704) = a3;
            *(_QWORD *)(v12 + 696) = a2;
            uarpPlatformEndpointAssetSetCallbacks(a1, v12, a5);
            if (!v13)
            {
              v14 = v16;
              if (a6 == 1)
              {
                *(_DWORD *)(v16 + 304) = 1;
                v15 = *(_DWORD *)(a1 + 576);
                if (v15 == 65534)
                  v15 = 1;
                *(_DWORD *)(a1 + 576) = v15 + 1;
              }
              else
              {
                LOWORD(v15) = 0;
                *(_DWORD *)(v16 + 304) = 0;
              }
              *(_WORD *)(v14 + 44) = v15;
              *(_QWORD *)(v14 + 712) = *(_QWORD *)(a1 + 568);
              *(_QWORD *)(a1 + 568) = v14;
              if (a4)
              {
                *(_WORD *)(v14 + 46) = 2;
                *(_DWORD *)(v14 + 48) = *a4;
              }
              else
              {
                *(_WORD *)(v14 + 46) = 1;
              }
            }
          }
        }
      }
    }
  }
}

void uarpPlatformPayloadCleanup(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a2 + 80);
  if (v4)
  {
    UARPLayer2ReturnBuffer(a1, v4);
    *(_QWORD *)(a2 + 80) = 0;
    *(_DWORD *)(a2 + 88) = 0;
  }
  v5 = *(void **)(a2 + 96);
  if (v5)
  {
    UARPLayer2ReturnBuffer(a1, v5);
    *(_QWORD *)(a2 + 96) = 0;
    *(_DWORD *)(a2 + 104) = 0;
  }
  v6 = *(void **)(a2 + 112);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(_QWORD *)(a2 + 112) = 0;
    *(_DWORD *)(a2 + 120) = 0;
  }
  v7 = *(void **)(a2 + 64);
  if (v7)
  {
    UARPLayer2ReturnBuffer(a1, v7);
    *(_QWORD *)(a2 + 64) = 0;
    *(_DWORD *)(a2 + 72) = 0;
  }
}

uint64_t uarpPlatformEndpointAssetStore(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 <= 4)
    return UARPLayer2AssetStore(result, a2);
  return result;
}

uint64_t uarpPlatformAssetRescind(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    if (a3)
    {
      uarpTransmitQueueAssetRescinded(result, a2, a3);
      *(_BYTE *)(a3 + 392) = 0;
      *(_BYTE *)(a3 + 72) = 1;
      return UARPLayer2AssetRescinded(v5, a2, a3);
    }
    else
    {
      return UARPLayer2RescindAllAssets(result, a2, 0);
    }
  }
  return result;
}

uint64_t uarpPlatformReOfferFirmware(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v2 = *(_QWORD *)(result + 568);
  if (v2)
  {
    v4 = result;
    do
    {
      if (*(_DWORD *)(v2 + 304) == 1 && *(_QWORD *)(v2 + 696) == a2 && (*(_WORD *)(v2 + 46) & 2) == 0)
        result = uarpPlatformEndpointOfferAsset(v4, a2, *(_QWORD *)(v2 + 704));
      v2 = *(_QWORD *)(v2 + 712);
    }
    while (v2);
  }
  return result;
}

uint64_t uarpCallbackUpdateInformationTLV(_QWORD *a1, uint64_t a2, _DWORD *a3)
{
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t result;
  unsigned int v9;

  v5 = *a3;
  v6 = a3[1];
  v9 = v6;
  if (v5 != 7)
  {
    result = uarpPlatformQueryAccessoryInfo(a1, v5, a3 + 2, v6, &v9);
    if ((_DWORD)result)
      return result;
    v7 = v9;
    goto LABEL_6;
  }
  if (v6 >= 0x10)
  {
    a3[2] = uarpHtonl(*(_DWORD *)(a2 + 62));
    a3[3] = uarpHtonl(*(_DWORD *)(a2 + 66));
    a3[4] = uarpHtonl(*(_DWORD *)(a2 + 70));
    a3[5] = uarpHtonl(*(_DWORD *)(a2 + 74));
    v7 = 16;
LABEL_6:
    result = 0;
    a3[1] = v7;
    return result;
  }
  return 39;
}

uint64_t uarpPlatformQueryAccessoryInfo(_QWORD *a1, int a2, unsigned int *a3, unsigned int a4, unsigned int *a5)
{
  uint64_t active;
  uint64_t Error;
  unsigned int v9;
  unsigned int v10;

  *a5 = a4;
  switch(a2)
  {
    case 1:
      return UARPLayer2ManufacturerName((uint64_t)a1, a3, a5);
    case 2:
      return UARPLayer2ModelName((uint64_t)a1, a3, a5);
    case 3:
      return UARPLayer2SerialNumber((uint64_t)a1, a3, a5);
    case 4:
      return UARPLayer2HardwareVersion((uint64_t)a1, a3, a5);
    case 9:
      return UARPLayer2FriendlyName((uint64_t)a1, a3, a5);
    default:
      if ((a2 - 5) <= 1)
      {
        *a5 = 16;
        if (a4 >= 0x10)
        {
          if (a2 == 5)
          {
            v9 = 0;
            active = UARPLayer2ActiveFirmwareVersion2(a1, &v9, a3);
          }
          else
          {
            v10 = 0;
            active = UARPLayer2StagedFirmwareVersion2(a1, &v10, a3);
          }
          Error = active;
          *a3 = uarpHtonl(*a3);
          a3[1] = uarpHtonl(a3[1]);
          a3[2] = uarpHtonl(a3[2]);
          a3[3] = uarpHtonl(a3[3]);
          return Error;
        }
        return 39;
      }
      if (a2 == 8)
      {
        *a5 = 8;
        if (a4 < 8)
          return 39;
        Error = UARPLayer2LastError((uint64_t)a1, a3);
        *a3 = uarpHtonl(*a3);
        a3[1] = uarpHtonl(a3[1]);
      }
      else
      {
        *a5 = 0;
        return 28;
      }
      return Error;
  }
}

uint64_t uarpPlatformResponseAccessoryInfo(uint64_t result, uint64_t a2, uint64_t a3, int a4, unsigned int a5, unsigned int *a6)
{
  uint64_t v8;

  v8 = result;
  switch(a4)
  {
    case 1:
      result = UARPLayer2ManufacturerNameResponse(result, a2);
      break;
    case 2:
      result = UARPLayer2ModelNameResponse(result, a2);
      break;
    case 3:
      result = UARPLayer2SerialNumberResponse(result, a2);
      break;
    case 4:
      result = UARPLayer2HardwareVersionResponse(result, a2);
      break;
    case 5:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        result = UARPLayer2ActiveFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 138) = *(_OWORD *)a6;
      }
      break;
    case 6:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        result = UARPLayer2StagedFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 154) = *(_OWORD *)a6;
      }
      break;
    case 7:
      if (a5 >= 0x10)
      {
        *a6 = uarpNtohl(*a6);
        a6[1] = uarpNtohl(a6[1]);
        a6[2] = uarpNtohl(a6[2]);
        a6[3] = uarpNtohl(a6[3]);
        result = UARPLayer2StatisticsResponse(v8, a2);
      }
      break;
    case 8:
      if (a5 >= 8)
      {
        *a6 = uarpNtohl(*a6);
        a6[1] = uarpNtohl(a6[1]);
        result = UARPLayer2LastErrorResponse(v8, a2);
      }
      break;
    case 9:
      result = UARPLayer2FriendlyNameResponse(result, a2);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t uarpPlatformAssetDataRequest(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *__dst, unsigned __int16 *a7)
{
  uint64_t v8;
  unsigned int v10;
  unsigned __int16 v11;
  unsigned __int16 v12;

  v8 = *(_QWORD *)(a1 + 568);
  if (!v8)
    return 17;
  while (*(_DWORD *)(v8 + 304) != 1 || *(_QWORD *)(v8 + 696) != a2 || *(unsigned __int16 *)(v8 + 44) != a3)
  {
    v8 = *(_QWORD *)(v8 + 712);
    if (!v8)
      return 17;
  }
  v10 = *(_DWORD *)(v8 + 68);
  if (v10 < a4 + (int)a5)
    v11 = v10 - a5;
  else
    v11 = a4;
  if (v10 >= a5)
    v12 = v11;
  else
    v12 = 0;
  return uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v8, __dst, v12, a5, a7);
}

uint64_t uarpPlatformDataTransferResume(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 568);
  if (!v4)
    return UARPLayer2DataTransferResume(a1, a2);
  while (1)
  {
    if (!*(_DWORD *)(v4 + 304) && *(_QWORD *)(v4 + 696) == a2)
    {
      result = uarpPlatformAssetRequestData(a1, v4, v4 + 312);
      if ((_DWORD)result)
        break;
    }
    v4 = *(_QWORD *)(v4 + 712);
    if (!v4)
      return UARPLayer2DataTransferResume(a1, a2);
  }
  return result;
}

uint64_t uarpPlatformAssetRescinded(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(result + 568);
  if (a3 == 0xFFFF)
  {
    if (!v4)
      return uarpPlatformAssetRescind(result, a2, v4);
    v5 = *(_QWORD *)(result + 568);
    do
    {
      if (!*(_DWORD *)(v5 + 304) && *(_QWORD *)(v5 + 696) == a2)
        *(_BYTE *)(v5 + 72) = 1;
      v5 = *(_QWORD *)(v5 + 712);
    }
    while (v5);
  }
  if (v4)
  {
    while (*(_DWORD *)(v4 + 304) || *(_QWORD *)(v4 + 696) != a2 || *(unsigned __int16 *)(v4 + 44) != a3)
    {
      v4 = *(_QWORD *)(v4 + 712);
      if (!v4)
        goto LABEL_13;
    }
  }
  else
  {
LABEL_13:
    if (a3 != 0xFFFF)
      return result;
    v4 = 0;
  }
  return uarpPlatformAssetRescind(result, a2, v4);
}

uint64_t uarpAssetProcessingComplete(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v8 = uarpAllocPrepareTransmitBuffer2(a1, a2, 9u, 0xAu, 1);
    if (v8)
    {
      v9 = (uint64_t)v8;
      v10 = v8[2];
      *(_WORD *)(v10 + 6) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
      *(_WORD *)(v10 + 8) = uarpHtons(a4);
      return uarpTransmitBuffer2(a1, a2, v9);
    }
    else
    {
      return 11;
    }
  }
  else if (a4 == 3)
  {
    return 0;
  }
  else
  {
    return 13;
  }
}

uint64_t uarpOfferAssetToRemoteEP(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 5u, 0x24u, 1);
  if (!v6)
    return 11;
  v7 = (uint64_t)v6;
  v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpTagStructPack32((unsigned int *)(a3 + 48));
  *(_WORD *)(v8 + 10) = uarpHtons(*(unsigned __int16 *)(a3 + 46));
  *(_WORD *)(v8 + 12) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
  uarpVersionEndianSwap((unsigned int *)(a3 + 52), (_DWORD *)(v8 + 14));
  *(_DWORD *)(v8 + 30) = uarpHtonl(*(_DWORD *)(a3 + 68));
  *(_WORD *)(v8 + 34) = uarpHtons(*(unsigned __int16 *)(a3 + 448));
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpAssetRescind(uint64_t a1, uint64_t a2, unsigned int a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xCu, 8u, 1);
  if (!v6)
    return 11;
  v7 = (uint64_t)v6;
  v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  _QWORD *v6;

  v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x11u, 0xAu, 1);
  if (!v6)
    return 11;
  *(_DWORD *)(v6[2] + 6) = *a3;
  return uarpTransmitBuffer2(a1, a2, (uint64_t)v6);
}

uint64_t uarpPlatformFindPreparedAsset(uint64_t a1, uint64_t a2, uint64_t a3, char a4, unsigned __int8 *a5)
{
  uint64_t result;

  if ((a4 & 2) == 0)
    return 0;
  for (result = *(_QWORD *)(a1 + 568); result; result = *(_QWORD *)(result + 712))
  {
    if (!*(_DWORD *)(result + 304)
      && *(_QWORD *)(result + 696) == a2
      && !*(_WORD *)(result + 44)
      && *(unsigned __int8 *)(result + 48) == *a5
      && *(unsigned __int8 *)(result + 49) == a5[1]
      && *(unsigned __int8 *)(result + 50) == a5[2]
      && *(unsigned __int8 *)(result + 51) == a5[3])
    {
      break;
    }
  }
  return result;
}

uint64_t uarpPlatformCreateRxAsset(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t result;
  uint64_t v6;

  v6 = 0;
  v4 = UARPLayer2RequestBuffer(a1, &v6, 0x2D8u);
  result = 0;
  if (!v4)
  {
    result = v6;
    if (v6)
    {
      *(_QWORD *)(v6 + 696) = a2;
      *(_DWORD *)(result + 304) = 0;
      *(_QWORD *)(result + 712) = *(_QWORD *)(a1 + 568);
      *(_QWORD *)(a1 + 568) = result;
    }
  }
  return result;
}

BOOL uarpPlatformCompareHash(uint64_t a1, void *__s1, size_t __n, void *__s2, int a5)
{
  if (!*(_QWORD *)(a1 + 376))
    return 1;
  if ((_DWORD)__n == a5)
    return memcmp(__s1, __s2, __n) == 0;
  return 0;
}

uint64_t uarpAssetQueueSolicitation(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v5;
  unint64_t v6;

  if (!*(_QWORD *)(a2 + 80))
    return 1;
  if (!*(_WORD *)(a2 + 28))
    return 2;
  v5 = 0;
  v6 = 0;
  while (uarpAssetTagIsValid((_BYTE *)(*(_QWORD *)(a2 + 80) + v5)))
  {
    ++v6;
    v5 += 4;
    if (v6 >= *(unsigned __int16 *)(a2 + 28))
      return 2;
  }
  *(_DWORD *)(*(_QWORD *)(a2 + 80) + 4 * v6) = *a3;
  return v6 == 0;
}

uint64_t uarpPlatformEndpointSendMessageCompleteInternal(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t *i;
  uint64_t v5;

  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        v3 = *(unsigned __int16 *)(a2 + 112);
        if (*(_WORD *)(a2 + 112))
        {
          for (i = *(uint64_t **)(a2 + 120); ; ++i)
          {
            v5 = *i;
            if (*i)
            {
              if (*(_QWORD *)v5 == a3)
                break;
            }
            if (!--v3)
              return result;
          }
          *(_BYTE *)(v5 + 32) = 0;
          if (!*(_WORD *)(a2 + 18) || !*(_BYTE *)(v5 + 31))
            return uarpTransmitQueuePendingEntryComplete(result, a2, v5);
        }
      }
    }
  }
  return result;
}

uint64_t uarpPlatformRemoteEndpointAddEntry(uint64_t a1, uint64_t a2)
{
  int v4;
  _QWORD *v5;
  uint64_t v6;
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_DWORD *)(a1 + 556);
  if (v4)
  {
    v5 = *(_QWORD **)(a1 + 560);
    v6 = *(unsigned int *)(a1 + 556);
    while (*v5)
    {
      ++v5;
      if (!--v6)
        goto LABEL_5;
    }
    result = 0;
    *v5 = a2;
  }
  else
  {
LABEL_5:
    v7 = v4 + 1;
    v11 = 0;
    result = UARPLayer2RequestBuffer(a1, &v11, 8 * (v4 + 1));
    if (!(_DWORD)result)
    {
      v9 = *(unsigned int *)(a1 + 556);
      if ((_DWORD)v9)
      {
        v10 = 0;
        do
        {
          *(_QWORD *)(v11 + v10) = *(_QWORD *)(*(_QWORD *)(a1 + 560) + v10);
          v10 += 8;
        }
        while (8 * v9 != v10);
      }
      else
      {
        v9 = 0;
      }
      *(_QWORD *)(v11 + 8 * v9) = a2;
      UARPLayer2ReturnBuffer(a1, *(void **)(a1 + 560));
      result = 0;
      *(_DWORD *)(a1 + 556) = v7;
      *(_QWORD *)(a1 + 560) = v11;
    }
  }
  return result;
}

uint64_t uarpPlatformRemoteEndpointAlloc(uint64_t a1)
{
  int v2;
  uint64_t result;
  uint64_t v4;

  v4 = 0;
  v2 = UARPLayer2RequestBuffer(a1, &v4, 0xB8u);
  result = 0;
  if (!v2)
  {
    if (uarpPlatformRemoteEndpointAddEntry(a1, v4))
      return 0;
    else
      return v4;
  }
  return result;
}

uint64_t uarpPlatformAssetApproveOfferVersion(uint64_t a1, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  int v6;
  unsigned int v7;

  if (*(_WORD *)(a2 + 46) != 1 || !*(_BYTE *)(a1 + 32))
    return 0;
  v3 = (_DWORD *)(a2 + 52);
  v4 = uarpVersionCompare((_DWORD *)(a1 + 138), (_DWORD *)(a2 + 52));
  if (v4 == 2)
    return 59;
  if (!v4)
    return 60;
  v6 = uarpVersionCompare((_DWORD *)(a1 + 154), v3);
  if (v6)
    v7 = 0;
  else
    v7 = 62;
  if (v6 == 2)
    return 61;
  else
    return v7;
}

void *_generalInterestCallback(void *a1, const char *a2, int a3)
{
  if (a3 == -536870608)
    return (void *)objc_msgSend(a1, "propertyChanged");
  return a1;
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  void *v0;

  return objc_msgSend(v0, "requestType");
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

uint64_t CoreUARPRestorePersonalizationTssResponse(uint64_t a1, uint64_t a2, int a3, CFDictionaryRef theDict, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  const __CFData *Value;
  unsigned int Length;
  void *v13;
  const UInt8 *BytePtr;
  void (*v15)(_QWORD, _QWORD, _QWORD);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  tm *v21;
  int tm_mon;
  int tm_year;
  int tm_mday;
  int tm_hour;
  int tm_min;
  int tm_sec;
  FILE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t AssetLength;
  uint64_t i;
  uint64_t v36;
  unsigned __int16 *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v45;
  time_t v46;

  if (theDict)
  {
    v10 = *(_QWORD *)(a2 + 296);
    Value = (const __CFData *)CFDictionaryGetValue(theDict, *(const void **)(v10 + 56));
    Length = CFDataGetLength(Value);
    *(_DWORD *)(v10 + 72) = Length;
    v13 = uarpZalloc(Length);
    *(_QWORD *)(v10 + 64) = v13;
    BytePtr = CFDataGetBytePtr(Value);
    memcpy(v13, BytePtr, *(unsigned int *)(v10 + 72));
    v15 = *(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 48);
    if (v15)
      v15(*(_QWORD *)(a1 + 1928), *(_QWORD *)(v10 + 64), *(unsigned int *)(v10 + 72));
    CFRelease(*(CFTypeRef *)(v10 + 48));
    *(_QWORD *)(v10 + 48) = 0;
    CFRelease(*(CFTypeRef *)(v10 + 56));
    *(_QWORD *)(v10 + 56) = 0;
    CoreUARPRestoreLogInfo(*(_QWORD *)(a1 + 1928), 1, "CoreUARP Restore IM4M: Building Personalization Response", v16, v17, v18, v19, v20, v45);
    if (*(_BYTE *)(a1 + 1936) == 1)
    {
      v46 = time(0);
      v21 = localtime(&v46);
      tm_mon = v21->tm_mon;
      tm_year = v21->tm_year;
      tm_hour = v21->tm_hour;
      tm_mday = v21->tm_mday;
      tm_sec = v21->tm_sec;
      tm_min = v21->tm_min;
      *(_OWORD *)(a2 + 24) = 0u;
      *(_OWORD *)(a2 + 40) = 0u;
      *(_OWORD *)(a2 + 56) = 0u;
      *(_OWORD *)(a2 + 72) = 0u;
      *(_OWORD *)(a2 + 88) = 0u;
      *(_OWORD *)(a2 + 104) = 0u;
      *(_OWORD *)(a2 + 120) = 0u;
      *(_OWORD *)(a2 + 136) = 0u;
      *(_OWORD *)(a2 + 152) = 0u;
      *(_OWORD *)(a2 + 168) = 0u;
      *(_OWORD *)(a2 + 184) = 0u;
      *(_OWORD *)(a2 + 200) = 0u;
      *(_OWORD *)(a2 + 216) = 0u;
      *(_OWORD *)(a2 + 232) = 0u;
      *(_OWORD *)(a2 + 248) = 0u;
      *(_OWORD *)(a2 + 264) = 0u;
      snprintf((char *)(a2 + 24), 0x100uLL, "IM4M-CoreUARPRestore-%d-%02d-%02d-%02d-%02d-%02d.uarp", tm_year + 1900, tm_mon + 1, tm_mday, tm_hour, tm_min, tm_sec);
      v28 = fopen((const char *)(a2 + 24), "w+");
      *(_QWORD *)(a2 + 16) = v28;
      if (!v28)
      {
        AssetLength = 11;
LABEL_23:
        CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "CoreUARP Restore IM4M: CoreUARPRestoreBuildPersonalizationResponse: %d ", v29, v30, v31, v32, v33, AssetLength);
        return AssetLength;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 308) = 0x400000;
      *(_QWORD *)(a2 + 280) = uarpZalloc(0x400000uLL);
    }
    AssetLength = uarpPersonalizationRequestAssetInitialize(a1 + 648, a2, 1);
    if ((_DWORD)AssetLength)
      goto LABEL_23;
    for (i = *(_QWORD *)(a2 + 312); i; i = *(_QWORD *)(i + 16))
    {
      v36 = UARPSuperBinaryAddMetaData(a1 + 648, a2, *(_DWORD *)i, *(_DWORD *)(i + 4), *(_QWORD *)(i + 8));
      if ((_DWORD)v36)
        goto LABEL_22;
    }
    v37 = *(unsigned __int16 **)(a2 + 296);
    AssetLength = uarpPersonalizationRequestPreparePayload(a1 + 648, a2, *v37);
    if ((_DWORD)AssetLength)
      goto LABEL_23;
    v38 = *((_QWORD *)v37 + 5);
    if (v38)
    {
      while (1)
      {
        v36 = UARPSuperBinaryAddPayloadMetaData(a1 + 648, a2, *v37, *(_DWORD *)v38, *(_DWORD *)(v38 + 4), *(_QWORD *)(v38 + 8));
        if ((_DWORD)v36)
          break;
        v38 = *(_QWORD *)(v38 + 16);
        if (!v38)
          goto LABEL_17;
      }
LABEL_22:
      AssetLength = v36;
      goto LABEL_23;
    }
LABEL_17:
    AssetLength = UARPSuperBinaryAddPayloadData(a1 + 648, a2, *v37, *((_QWORD *)v37 + 8), *((_DWORD *)v37 + 18));
    if ((_DWORD)AssetLength)
      goto LABEL_23;
    AssetLength = UARPSuperBinaryFinalizeHeader(a1 + 648, a2);
    if ((_DWORD)AssetLength)
      goto LABEL_23;
    AssetLength = UARPSuperBinaryQueryAssetLength(a1 + 648, *(_QWORD *)a2, (_DWORD *)(a2 + 308));
    if ((_DWORD)AssetLength)
      goto LABEL_23;
    AssetLength = uarpPlatformEndpointOfferAsset(a1 + 648, a1 + 1728, a2);
    if ((_DWORD)AssetLength)
      CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "CoreUARP Restore IM4M: uarpPlatformEndpointOfferAsset: %d ", v39, v40, v41, v42, v43, 0);
  }
  else
  {
    CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "CoreUARP Restore IM4M: Post-Layer3: TSS Response is NULL", 0, a5, a6, a7, a8, v45);
    return 56;
  }
  return AssetLength;
}

double CoreUARPRestoreSetAssetPersonalizationCallbacks(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_QWORD *)a1 = fPersonalizationAssetReady;
  *(_QWORD *)(a1 + 88) = fPersonalizationAssetGetBytesAtOffset2;
  *(_QWORD *)(a1 + 96) = fPersonalizationAssetSetBytesAtOffset2;
  *(_QWORD *)(a1 + 120) = fPersonalizationAssetCorrupt;
  *(_QWORD *)(a1 + 128) = fPersonalizationAssetOrphaned;
  *(_QWORD *)(a1 + 136) = fPersonalizationAssetReleased2;
  *(_QWORD *)(a1 + 144) = fPersonalizationAssetProcessingNotification2;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 152) = fPersonalizationAssetProcessingNotificationAck;
  *(_QWORD *)(a1 + 160) = fPersonalizationAssetPreProcessingNotification;
  *(_QWORD *)(a1 + 168) = fPersonalizationAssetPreProcessingNotificationAck;
  *(_QWORD *)(a1 + 176) = fPersonalizationAssetAllHeadersAndMetaDataComplete;
  return result;
}

uint64_t fPersonalizationAssetReady(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    if (a2)
      return uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(result + 648, *a2);
  }
  return result;
}

uint64_t fPersonalizationAssetGetBytesAtOffset2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, _WORD *a7, uint64_t a8)
{
  unsigned int v10;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  FILE *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned __int16 v28;
  uint64_t v29;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v10 = a5;
  v14 = a5;
  CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore (IM4M): Get %u Bytes from offset %u", (uint64_t)a4, a5, a6, (uint64_t)a7, a8, a5);
  if (*(_BYTE *)(a1 + 1936) == 1)
  {
    fseek(*(FILE **)(a3 + 16), a6, 0);
    v19 = fread(a4, 1uLL, v14, *(FILE **)(a3 + 16));
    if (v19 < v10)
    {
      v20 = *(FILE **)(a3 + 16);
      v21 = ferror(v20);
      if (v21)
      {
        CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: Read error %d, Read %zu bytes", v22, v23, v24, v25, v26, v21);
        return 54;
      }
      v31 = feof(v20);
      CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: EOF %d, Read %zu bytes", v32, v33, v34, v35, v36, v31);
      if (!v31)
        return 54;
    }
  }
  else
  {
    v27 = *(_DWORD *)(a3 + 308);
    if (v10 + a6 <= v27)
      v28 = v10;
    else
      v28 = v27 - a6;
    LOWORD(v19) = v28;
    memcpy(a4, (const void *)(*(_QWORD *)(a3 + 280) + a6), v28);
  }
  *a7 = v19;
  v29 = *(unsigned int *)(a3 + 308);
  if ((_DWORD)v29)
    CoreUARPRestoreAssetTransferProgress(a1, a3, a6, v29, v15, v16, v17, v18);
  return 0;
}

uint64_t fPersonalizationAssetSetBytesAtOffset2(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  int v9;
  size_t v13;

  v8 = a6;
  v9 = a5;
  v13 = a5;
  CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore (IM4M): Get %u Bytes from offset %u", (uint64_t)a4, a5, a6, a7, a8, a5);
  if (*(_BYTE *)(a1 + 1936) == 1)
  {
    if (fseek(*(FILE **)(a3 + 16), v8, 0) == -1 || fwrite(a4, 1uLL, v13, *(FILE **)(a3 + 16)) != v9)
      return 54;
    fflush(*(FILE **)(a3 + 16));
  }
  else
  {
    if (v9 + v8 > *(_DWORD *)(a3 + 308))
      return 43;
    memcpy((void *)(*(_QWORD *)(a3 + 280) + v8), a4, v13);
  }
  return 0;
}

uint64_t fPersonalizationAssetProcessingNotification2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CoreUARPRestoreAssetTransferStatus(a1, a3, a4, a4, a5, a6, a7, a8);
  return 0;
}

uint64_t fPersonalizationAssetProcessingNotificationAck()
{
  return 0;
}

uint64_t fPersonalizationAssetPreProcessingNotification()
{
  return 0;
}

uint64_t fPersonalizationAssetPreProcessingNotificationAck()
{
  return 0;
}

void fPersonalizationAssetAllHeadersAndMetaDataComplete(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  int *v6;
  int v7;
  uint64_t SuperBinaryMetaData;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  size_t v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  _WORD *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t PayloadMetaData;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  unsigned int *v59;
  size_t v60;
  void *v61;
  _QWORD *v62;
  const __CFAllocator *v63;
  CFMutableDictionaryRef Mutable;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int *v70;
  CFStringRef v71;
  int v72;
  int v73;
  int v74;
  int v75;
  __CFDictionary *v76;
  CFStringRef v77;
  uint64_t v78;
  const __CFDictionary *v79;
  CFTypeID v80;
  CFNumberRef v81;
  CFNumberRef v82;
  CFNumberRef v83;
  CFStringRef v84;
  CFStringRef v85;
  int *v86;
  int v87;
  CFNumberRef v88;
  const __CFString *v89;
  CFNumberRef v90;
  const __CFAllocator *v91;
  CFNumberType v92;
  CFStringRef v93;
  const void *v94;
  const __CFString *v95;
  CFMutableDictionaryRef v96;
  int v97;
  __CFDictionary *v98;
  CFStringRef v99;
  unsigned int *v100;
  int v101;
  unsigned int v102;
  unsigned int v103;
  const UInt8 *v104;
  CFDataRef v105;
  __CFDictionary *v106;
  const __CFString *v107;
  BOOL v108;
  const void *v109;
  __CFDictionary *v110;
  const __CFString *v111;
  unsigned int v112;
  CFStringRef v113;
  CFStringRef v114;
  int v115;
  CFStringRef v116;
  CFStringRef v117;
  void (*v118)(_QWORD, _QWORD *, _QWORD, const char *, _QWORD);
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const __CFString *v123;
  CFStringRef v124;
  CFStringRef v125;
  CFStringRef v126;
  CFStringRef v127;
  CFStringRef v128;
  CFStringRef v129;
  const __CFString *v130;
  __CFDictionary *theDict;
  CFStringRef cf;
  int v133;
  _QWORD *v134;
  uint64_t v135;
  const void *v136;
  int v137;
  void *v138;
  _OWORD v139[8];
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _OWORD v143[3];
  unsigned int valuePtr;
  void *value[3];

  if (!a1)
    return;
  if (!a3)
    return;
  v5 = uarpZalloc(0x148uLL);
  v5[40] = a1[239];
  a1[239] = v5;
  v142 = 0u;
  memset(v143, 0, sizeof(v143));
  v140 = 0u;
  v141 = 0u;
  memset(v139, 0, sizeof(v139));
  uarpZero(v139, 0xE0uLL);
  memset((char *)v143 + 8, 0, 40);
  *(_OWORD *)((char *)&v139[6] + 8) = 0u;
  memset((char *)v139 + 8, 0, 80);
  *(_QWORD *)&v139[0] = fPersonalizationAssetReady;
  *((_QWORD *)&v139[5] + 1) = fPersonalizationAssetGetBytesAtOffset2;
  *(_QWORD *)&v139[6] = fPersonalizationAssetSetBytesAtOffset2;
  *((_QWORD *)&v139[7] + 1) = fPersonalizationAssetCorrupt;
  *(_QWORD *)&v140 = fPersonalizationAssetOrphaned;
  *((_QWORD *)&v140 + 1) = fPersonalizationAssetReleased2;
  *(_QWORD *)&v141 = fPersonalizationAssetProcessingNotification2;
  *((_QWORD *)&v141 + 1) = fPersonalizationAssetProcessingNotificationAck;
  *(_QWORD *)&v142 = fPersonalizationAssetPreProcessingNotification;
  *((_QWORD *)&v142 + 1) = fPersonalizationAssetPreProcessingNotificationAck;
  *(_QWORD *)&v143[0] = fPersonalizationAssetAllHeadersAndMetaDataComplete;
  v6 = uarpAssetTagStructPersonalization();
  uarpPlatformEndpointPrepareDynamicAsset((uint64_t)(a1 + 81), (uint64_t)(a1 + 216), (uint64_t)v5, v6, (uint64_t)v139);
  if (v7)
    return;
  *v5 = uarpPlatformAssetFindByAssetContext((uint64_t)(a1 + 81), (uint64_t)v5);
  v5[1] = a1;
  SuperBinaryMetaData = uarpAssetQuerySuperBinaryMetaData((uint64_t)(a1 + 81), *(_QWORD *)a3);
  if (SuperBinaryMetaData)
  {
    v14 = SuperBinaryMetaData;
    do
    {
      CoreUARPRestoreLogInfo(a1[241], 3, "Payload Metadata <0x%08x>", v9, v10, v11, v12, v13, *(_DWORD *)v14);
      v15 = (unsigned int *)uarpZalloc(0x18uLL);
      *v15 = *(_DWORD *)v14;
      v16 = *(unsigned int *)(v14 + 4);
      v15[1] = v16;
      v17 = uarpZalloc(v16);
      *((_QWORD *)v15 + 1) = v17;
      memcpy(v17, *(const void **)(v14 + 8), v15[1]);
      *((_QWORD *)v15 + 2) = v5[39];
      v5[39] = v15;
      v14 = *(_QWORD *)(v14 + 16);
    }
    while (v14);
  }
  *(_WORD *)(a3 + 288) = 0;
  if (uarpPlatformEndpointAssetQueryNumberOfPayloads((uint64_t)(a1 + 81), *(_QWORD *)a3, (_WORD *)(a3 + 288)))return;
  *(_QWORD *)(a3 + 296) = uarpZalloc(88 * *(unsigned __int16 *)(a3 + 288));
  v18 = *(unsigned __int16 *)(a3 + 288);
  *((_WORD *)v5 + 144) = v18;
  v5[37] = uarpZalloc(88 * v18);
  if (!*(_WORD *)(a3 + 288))
  {
LABEL_16:
    uarpPlatformEndpointAssetFullyStaged((uint64_t)(a1 + 81), *(_QWORD *)a3);
    if (!*((_WORD *)v5 + 144))
      return;
    v62 = (_QWORD *)v5[37];
    v63 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v134 = v62;
    v70 = (int *)v62[5];
    theDict = Mutable;
    if (!v70)
    {
      v76 = Mutable;
      v77 = 0;
      goto LABEL_55;
    }
    v71 = 0;
    v137 = 0;
    v72 = 0;
    v135 = 0;
    do
    {
      CoreUARPRestoreLogDebug(a1[241], 1, "CoreUARP Restore IM4M: First Pass on TLV <0x%08x>", v65, v66, v67, v68, v69, *v70);
      v73 = *v70;
      if (*v70 > -2001563359)
      {
        if (v73 == -2001563358)
        {
          if (v70[1] == 1 && **((_BYTE **)v70 + 1))
            v72 = 1;
        }
        else if (v73 == -2001563355 && v70[1] == 4)
        {
          v135 = uarpHtonl(**((_DWORD **)v70 + 1));
        }
      }
      else if (v73 == -2001563389)
      {
        v71 = CFStringCreateWithBytes(v63, *((const UInt8 **)v70 + 1), v70[1], 0x8000100u, 0);
      }
      else if (v73 == -2001563359 && v70[1] == 1)
      {
        v74 = v137;
        if (**((_BYTE **)v70 + 1))
          v74 = 1;
        v137 = v74;
      }
      v70 = (int *)*((_QWORD *)v70 + 2);
    }
    while (v70);
    v75 = v72;
    if (v137 != 1 && v72 != 1)
    {
      v76 = theDict;
      v77 = v71;
      goto LABEL_55;
    }
    v78 = v135;
    if (!(_DWORD)v135)
    {
      v79 = (const __CFDictionary *)CoreUARPRestoreNextLUNForPrefix_lunDictRef;
      if (!CoreUARPRestoreNextLUNForPrefix_lunDictRef)
      {
        v79 = CFDictionaryCreateMutable(v63, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        CoreUARPRestoreNextLUNForPrefix_lunDictRef = (uint64_t)v79;
      }
      value[0] = 0;
      if (CFDictionaryGetValueIfPresent(v79, v71, (const void **)value))
      {
        v80 = CFGetTypeID(value[0]);
        if (v80 == CFNumberGetTypeID() && CFNumberGetType((CFNumberRef)value[0]) == kCFNumberSInt32Type)
        {
          valuePtr = 0;
          if (CFNumberGetValue((CFNumberRef)value[0], kCFNumberSInt32Type, &valuePtr))
          {
            ++valuePtr;
            v81 = CFNumberCreate(v63, kCFNumberSInt32Type, &valuePtr);
            if (v81)
            {
              v82 = v81;
              CFDictionaryReplaceValue((CFMutableDictionaryRef)CoreUARPRestoreNextLUNForPrefix_lunDictRef, v71, v81);
LABEL_50:
              v78 = valuePtr;
              CFRelease(v82);
              goto LABEL_52;
            }
          }
        }
      }
      else
      {
        valuePtr = 1;
        v83 = CFNumberCreate(v63, kCFNumberSInt32Type, &valuePtr);
        if (v83)
        {
          v82 = v83;
          CFDictionarySetValue((CFMutableDictionaryRef)CoreUARPRestoreNextLUNForPrefix_lunDictRef, v71, v83);
          goto LABEL_50;
        }
      }
      v78 = 0;
    }
LABEL_52:
    v77 = CFStringCreateWithFormat(v63, 0, CFSTR("%@%d"), v71, v78, v121, v122);
    CFRelease(v71);
    v108 = v75 == 1;
    v76 = theDict;
    if (v108)
    {
      v84 = CFStringCreateWithFormat(v63, 0, CFSTR("%@%d"), CFSTR("BoardID"), v78);
      cf = CFStringCreateWithFormat(v63, 0, CFSTR("%@%d"), CFSTR("ChipID"), v78);
      v129 = CFStringCreateWithFormat(v63, 0, CFSTR("%@%d"), CFSTR("ECID"), v78);
      v128 = CFStringCreateWithFormat(v63, 0, CFSTR("%@%d"), CFSTR("Nonce"), v78);
      v127 = CFStringCreateWithFormat(v63, 0, CFSTR("%@%d"), CFSTR("ProductionMode"), v78);
      v126 = CFStringCreateWithFormat(v63, 0, CFSTR("%@%d"), CFSTR("SecurityDomain"), v78);
      v125 = CFStringCreateWithFormat(v63, 0, CFSTR("%@%d"), CFSTR("SecurityMode"), v78);
      v85 = CFStringCreateWithFormat(v63, 0, CFSTR("%@%d"), CFSTR("SocLiveNonce"), v78);
LABEL_56:
      v124 = v85;
      v86 = (int *)v134[5];
      v138 = (void *)*MEMORY[0x24BDBD270];
      if (v86)
      {
        v133 = 0;
        v136 = (const void *)*MEMORY[0x24BDBD268];
        v123 = v84;
        v130 = v77;
        while (2)
        {
          v87 = *v86;
          switch(*v86)
          {
            case -2001563388:
              if (v86[1] == 4)
              {
                LODWORD(value[0]) = 0;
                LODWORD(value[0]) = uarpHtonl(**((_DWORD **)v86 + 1));
                v91 = v63;
                v92 = kCFNumberSInt32Type;
                goto LABEL_123;
              }
              goto LABEL_131;
            case -2001563387:
              if (v86[1] == 4)
              {
                LODWORD(value[0]) = 0;
                LODWORD(value[0]) = uarpHtonl(**((_DWORD **)v86 + 1));
                v88 = CFNumberCreate(v63, kCFNumberSInt32Type, value);
                v89 = cf;
                goto LABEL_72;
              }
              goto LABEL_131;
            case -2001563386:
              if (v86[1] == 8)
              {
                value[0] = 0;
                value[0] = (void *)uarpHtonll(**((_QWORD **)v86 + 1));
                v90 = CFNumberCreate(v63, kCFNumberSInt64Type, value);
                goto LABEL_69;
              }
              goto LABEL_131;
            case -2001563385:
            case -2001563384:
              v88 = CFDataCreate(v63, *((const UInt8 **)v86 + 1), v86[1]);
              v89 = CFSTR("Nonce");
              goto LABEL_72;
            case -2001563383:
              if (v86[1] != 4)
                goto LABEL_131;
              LODWORD(value[0]) = 0;
              LODWORD(value[0]) = uarpHtonl(**((_DWORD **)v86 + 1));
              v88 = CFNumberCreate(v63, kCFNumberSInt32Type, value);
              v89 = CFSTR("SecurityDomain");
              goto LABEL_72;
            case -2001563382:
              if (v86[1] != 4)
                goto LABEL_131;
              if (uarpHtonl(**((_DWORD **)v86 + 1)))
                v94 = v138;
              else
                v94 = v136;
              v95 = CFSTR("SecurityMode");
              goto LABEL_120;
            case -2001563381:
              if (v86[1] != 4)
                goto LABEL_131;
              if (uarpHtonl(**((_DWORD **)v86 + 1)))
                v94 = v138;
              else
                v94 = v136;
              v95 = CFSTR("ProductionMode");
              goto LABEL_120;
            case -2001563380:
            case -2001563379:
            case -2001563378:
            case -2001563377:
            case -2001563375:
            case -2001563374:
            case -2001563373:
            case -2001563372:
            case -2001563371:
            case -2001563370:
            case -2001563369:
            case -2001563367:
            case -2001563366:
              goto LABEL_131;
            case -2001563376:
              v96 = CFDictionaryCreateMutable(v63, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              v97 = v86[1];
              if (v97)
              {
                v98 = v96;
                v99 = 0;
                v100 = (unsigned int *)*((_QWORD *)v86 + 1);
                do
                {
                  v101 = uarpNtohl(*v100);
                  v102 = uarpNtohl(v100[1]);
                  v103 = v102;
                  v104 = (const UInt8 *)(v100 + 2);
                  switch(v101)
                  {
                    case -2001563374:
                      v99 = CFStringCreateWithBytes(v63, v104, v102, 0x8000100u, 0);
                      goto LABEL_112;
                    case -2001563373:
                      v105 = CFDataCreate(v63, v104, v102);
                      v106 = v98;
                      v107 = CFSTR("Digest");
                      goto LABEL_95;
                    case -2001563371:
                      if (v102 != 2)
                        goto LABEL_112;
                      if (uarpHtons(*(unsigned __int16 *)v104))
                        v109 = v138;
                      else
                        v109 = v136;
                      v110 = v98;
                      v111 = CFSTR("ESEC");
                      break;
                    case -2001563370:
                      if (v102 != 2)
                        goto LABEL_112;
                      if (uarpHtons(*(unsigned __int16 *)v104))
                        v109 = v138;
                      else
                        v109 = v136;
                      v110 = v98;
                      v111 = CFSTR("EPRO");
                      break;
                    case -2001563369:
                      if (v102 != 2)
                        goto LABEL_112;
                      if (uarpHtons(*(unsigned __int16 *)v104))
                        v109 = v138;
                      else
                        v109 = v136;
                      v110 = v98;
                      v111 = CFSTR("Trusted");
                      break;
                    default:
                      v108 = v101 == -2001563360 && v102 == 4;
                      if (v108)
                      {
                        LODWORD(value[0]) = 0;
                        LODWORD(value[0]) = uarpHtonl(*(_DWORD *)v104);
                        v105 = CFNumberCreate(v63, kCFNumberSInt32Type, value);
                        v106 = v98;
                        v107 = CFSTR("DigestListSize");
LABEL_95:
                        CFDictionaryAddValue(v106, v107, v105);
                        CFRelease(v105);
                      }
                      goto LABEL_112;
                  }
                  CFDictionaryAddValue(v110, v111, v109);
LABEL_112:
                  v100 = (unsigned int *)&v104[v103];
                  v112 = v97 - v103;
                  v97 = v97 - v103 - 8;
                }
                while (v112 != 8);
                v77 = v130;
                if (v99)
                {
                  v113 = CFStringCreateWithFormat(v63, 0, CFSTR("%@,%@"), v130, v99);
                  v76 = theDict;
                  CFDictionaryAddValue(theDict, v113, v98);
                  CFRelease(v113);
                }
                else
                {
                  v76 = theDict;
                }
                v84 = v123;
              }
              else
              {
                v77 = v130;
              }
              goto LABEL_131;
            case -2001563368:
              if (v86[1] != 1)
                goto LABEL_131;
              if (**((_BYTE **)v86 + 1))
                v94 = v138;
              else
                v94 = v136;
              v95 = CFSTR("SocLiveNonce");
LABEL_120:
              v114 = CFStringCreateWithFormat(v63, 0, CFSTR("%@,%@"), v77, v95);
              CFDictionaryAddValue(v76, v114, v94);
              goto LABEL_131;
            case -2001563365:
              if (v86[1] != 8)
                goto LABEL_131;
              value[0] = 0;
              value[0] = (void *)uarpHtonll(**((_QWORD **)v86 + 1));
              v91 = v63;
              v92 = kCFNumberSInt64Type;
LABEL_123:
              v88 = CFNumberCreate(v91, v92, value);
              v93 = CFStringCreateWithFormat(v63, 0, CFSTR("%@,%@"), v77, v84);
              goto LABEL_73;
            default:
              if (v87 == -2001563353)
              {
                if (v86[1] == 1)
                {
                  v115 = v133;
                  if (**((_BYTE **)v86 + 1))
                    v115 = 1;
                  v133 = v115;
                }
              }
              else if (v87 == -2001563339)
              {
                v90 = CFDataCreate(v63, *((const UInt8 **)v86 + 1), v86[1]);
LABEL_69:
                v88 = v90;
                v89 = CFSTR("ECID");
LABEL_72:
                v93 = CFStringCreateWithFormat(v63, 0, CFSTR("%@,%@"), v77, v89);
LABEL_73:
                CFDictionaryAddValue(v76, v93, v88);
                CFRelease(v88);
              }
LABEL_131:
              v86 = (int *)*((_QWORD *)v86 + 2);
              if (!v86)
                goto LABEL_134;
              continue;
          }
        }
      }
      LOBYTE(v133) = 0;
LABEL_134:
      v116 = CFStringCreateWithFormat(v63, 0, CFSTR("%@,%@"), v77, CFSTR("Ticket"));
      v134[7] = v116;
      v117 = CFStringCreateWithFormat(v63, 0, CFSTR("@%@"), v116);
      CFDictionaryAddValue(v76, v117, v138);
      CFRelease(v117);
      CFRelease(v77);
      CFRelease(v84);
      CFRelease(cf);
      CFRelease(v129);
      CFRelease(v128);
      CFRelease(v127);
      CFRelease(v126);
      CFRelease(v125);
      CFRelease(v124);
      v134[6] = v76;
      v118 = (void (*)(_QWORD, _QWORD *, _QWORD, const char *, _QWORD))a1[5];
      if (v118)
        v118(a1[241], v5, *(_QWORD *)(v5[37] + 48), "https://gs.apple.com:443", v133);
      return;
    }
LABEL_55:
    v84 = CFStringCreateWithFormat(v63, 0, CFSTR("%@"), CFSTR("BoardID"), v119);
    cf = CFStringCreateWithFormat(v63, 0, CFSTR("%@"), CFSTR("ChipID"));
    v129 = CFStringCreateWithFormat(v63, 0, CFSTR("%@"), CFSTR("ECID"));
    v128 = CFStringCreateWithFormat(v63, 0, CFSTR("%@"), CFSTR("Nonce"));
    v127 = CFStringCreateWithFormat(v63, 0, CFSTR("%@"), CFSTR("ProductionMode"));
    v126 = CFStringCreateWithFormat(v63, 0, CFSTR("%@"), CFSTR("SecurityDomain"));
    v125 = CFStringCreateWithFormat(v63, 0, CFSTR("%@"), CFSTR("SecurityMode"));
    v85 = CFStringCreateWithFormat(v63, 0, CFSTR("%@"), CFSTR("SocLiveNonce"), v120);
    goto LABEL_56;
  }
  v19 = 0;
  while (1)
  {
    v20 = *(_QWORD *)(a3 + 296);
    v21 = (_WORD *)(v20 + 88 * v19);
    v22 = v5[37];
    *v21 = v19;
    v23 = (char *)(v21 + 2);
    if (uarpAssetQueryPayloadInfo((uint64_t)(a1 + 81), *(_QWORD *)a3, v19, (uint64_t)v23))
      break;
    CoreUARPRestoreLogInfo(a1[241], 3, "Payload Index %u", v24, v25, v26, v27, v28, v19);
    CoreUARPRestoreLogInfo(a1[241], 3, "- Tag is %c%c%c%c", v29, v30, v31, v32, v33, *v23);
    v34 = v20 + 88 * v19;
    v121 = *(unsigned int *)(v34 + 16);
    v122 = *(unsigned int *)(v34 + 20);
    v119 = *(unsigned int *)(v34 + 12);
    CoreUARPRestoreLogInfo(a1[241], 3, "- Version is %u.%u.%u.%u", v35, v36, v37, v38, v39, *(_DWORD *)(v34 + 8));
    CoreUARPRestoreLogInfo(a1[241], 3, "- Data length is %u", v40, v41, v42, v43, v44, *(_DWORD *)(v34 + 28));
    CoreUARPRestoreLogInfo(a1[241], 3, "- MetaData length is %u", v45, v46, v47, v48, v49, *(_DWORD *)(v34 + 24));
    v50 = v22 + 88 * v19;
    *(_DWORD *)(v50 + 4) = *(_DWORD *)v23;
    *(_OWORD *)(v50 + 8) = *(_OWORD *)(v34 + 8);
    *(_QWORD *)(v34 + 80) = uarpZalloc(*(unsigned int *)(v34 + 28));
    PayloadMetaData = uarpAssetQueryPayloadMetaData((uint64_t)(a1 + 81), *(_QWORD *)a3, v19);
    *(_QWORD *)(v34 + 40) = PayloadMetaData;
    if (PayloadMetaData)
    {
      v57 = PayloadMetaData;
      v58 = (_QWORD *)(v22 + 88 * v19 + 40);
      do
      {
        CoreUARPRestoreLogInfo(a1[241], 3, "Payload Metadata <0x%08x>", v52, v53, v54, v55, v56, *(_DWORD *)v57);
        v59 = (unsigned int *)uarpZalloc(0x18uLL);
        *v59 = *(_DWORD *)v57;
        v60 = *(unsigned int *)(v57 + 4);
        v59[1] = v60;
        v61 = uarpZalloc(v60);
        *((_QWORD *)v59 + 1) = v61;
        memcpy(v61, *(const void **)(v57 + 8), v59[1]);
        *((_QWORD *)v59 + 2) = *v58;
        *v58 = v59;
        v57 = *(_QWORD *)(v57 + 16);
      }
      while (v57);
    }
    if (++v19 >= (unint64_t)*(unsigned __int16 *)(a3 + 288))
      goto LABEL_16;
  }
}

uint64_t CoreUARPRestoreEndpointPropertyManifestPrefix(uint64_t a1)
{
  return *(_QWORD *)(a1 + 2048);
}

uint64_t CoreUARPRestoreEndpointPropertyBoardID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2056);
}

uint64_t CoreUARPRestoreEndpointPropertyBoardID64(uint64_t a1)
{
  return *(_QWORD *)(a1 + 2056);
}

uint64_t CoreUARPRestoreEndpointPropertyChipID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2064);
}

uint64_t CoreUARPRestoreEndpointPropertyChipRevision(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2068);
}

uint64_t CoreUARPRestoreEndpointPropertyECID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 2072);
}

uint64_t CoreUARPRestoreEndpointPropertySecurityDomain(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2092);
}

uint64_t CoreUARPRestoreEndpointPropertySecurityMode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2096);
}

uint64_t CoreUARPRestoreEndpointPropertyProductionMode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2100);
}

uint64_t CoreUARPRestoreEndpointPropertyChipEpoch(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2104);
}

uint64_t CoreUARPRestoreEndpointPropertyEnableMixMatch(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2108);
}

uint64_t CoreUARPRestoreEndpointPropertyLiveNonce(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2109);
}

uint64_t CoreUARPRestoreEndpointPropertyPrefixNeedsLUN(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2110);
}

uint64_t CoreUARPRestoreEndpointPropertySuffixNeedsLUN(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2111);
}

uint64_t CoreUARPRestoreEndpointPropertyLogicalUnitNumber(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2112);
}

uint64_t CoreUARPRestoreEndpointPropertyTicketLongName(uint64_t a1)
{
  return *(_QWORD *)(a1 + 2120);
}

uint64_t CoreUARPRestoreEndpointPropertyRequiresPersonalization(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2128);
}

uint64_t CoreUARPRestoreEndpointPropertyApBoardID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2132);
}

uint64_t CoreUARPRestoreEndpointPropertyApChipID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2136);
}

uint64_t CoreUARPRestoreEndpointPropertyApProductionMode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2140);
}

uint64_t CoreUARPRestoreEndpointPropertyApSecurityMode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2144);
}

uint64_t CoreUARPRestoreEndpointPropertyHardwareSpecific(uint64_t result, _QWORD *a2, _DWORD *a3)
{
  *a2 = *(_QWORD *)(result + 2152);
  *a3 = *(_DWORD *)(result + 2160);
  return result;
}

uint64_t CoreUARPRestoreEndpointPropertyNonce(uint64_t result, _QWORD *a2, _DWORD *a3)
{
  *a2 = *(_QWORD *)(result + 2168);
  *a3 = *(_DWORD *)(result + 2176);
  return result;
}

uint64_t CoreUARPRestoreEndpointPropertyLife(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2180);
}

uint64_t CoreUARPRestoreEndpointPropertyProvisioning(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2182);
}

uint64_t CoreUARPRestoreEndpointPropertyManifestEpoch(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2181);
}

uint64_t CoreUARPRestoreEndpointPropertyManifestSuffix(uint64_t a1)
{
  return *(_QWORD *)(a1 + 2184);
}

uint64_t CoreUARPRestoreEndpointPropertyECIDData(uint64_t result, _QWORD *a2, _DWORD *a3)
{
  *a2 = *(_QWORD *)(result + 2080);
  *a3 = *(_DWORD *)(result + 2088);
  return result;
}

void sub_24BCA75F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t b2p_command_handler(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, _BYTE *a5, _BYTE *a6, void *a7, _WORD *a8)
{
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v14 = (void *)MEMORY[0x24BDBCE50];
  v15 = a4;
  v16 = *(id *)(a1 + 232);
  objc_msgSend(v14, "dataWithBytes:length:", a3, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "inputCommandWithOpCode:data:", a2, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    *a5 = 1;
    *a6 = objc_msgSend(v18, "status");
    objc_msgSend(v18, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {
      *a8 = objc_msgSend(v19, "length");
      v20 = objc_retainAutorelease(v19);
      memcpy(a7, (const void *)objc_msgSend(v20, "bytes"), objc_msgSend(v20, "length"));
    }

  }
  else
  {
    *a5 = 0;
  }

  return 0;
}

uint64_t buddy_command_handler()
{
  return 1;
}

uint64_t buddy_response_handler()
{
  return 1;
}

uint64_t b2p_response_handler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;

  v8 = (void *)MEMORY[0x24BDBCE50];
  v9 = a5;
  v10 = *(id *)(a1 + 232);
  objc_msgSend(v8, "dataWithBytes:length:", a4, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputCommandResponseWithOpCode:status:data:", a2, a3, v11);

  return 0;
}

uint64_t b2p_reset_handler(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 232), "resetWithReason:", a2);
}

uint64_t b2p_send_data(uint64_t a1, uint64_t a2, unsigned int a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x24BDBCE50];
  v5 = a3;
  v6 = *(id *)(a1 + 232);
  objc_msgSend(v4, "dataWithBytes:length:", a2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "sendData:", v7);

  return v8;
}

uint64_t b2p_timer_init(void *a1)
{
  sTimerCallback = a1;
  return 0;
}

uint64_t b2p_timer_start(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 232), "startTimerType:deadlineMS:", a2, a3);
  return 0;
}

uint64_t b2p_timer_clear(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 232), "stopTimerType:", a2);
  return 0;
}

uint64_t b2p_mutex_lock(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 232), "lock");
  return 0;
}

uint64_t b2p_mutex_unlock(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 232), "unlock");
  return 0;
}

uint64_t b2p_printf(unsigned int a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  id v11;
  os_log_type_t v12;
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v17;
  char __str[513];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v11 = *(id *)(a2 + 232);
  if (objc_msgSend(v11, "debugLevel") >= a1)
  {
    if (a1 >= 5)
      v12 = OS_LOG_TYPE_DEFAULT;
    else
      v12 = (0x201101000uLL >> (8 * a1));
    bzero(__str, 0x201uLL);
    vsnprintf(__str, 0x200uLL, a3, &a9);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", __str);
    v14 = os_log_create("com.apple.accessoryupdater.uarp", "b2pEngine");
    if (os_log_type_enabled(v14, v12))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl(&dword_24BC99000, v14, v12, "%@", buf, 0xCu);
    }

  }
  return 0;
}

uint64_t uarpPlatformEndpointRecvMessage(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned int a4)
{
  uint64_t v4;
  unsigned __int16 v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  __int16 v16;
  int v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  int updated;
  unsigned __int16 v22;
  __int16 v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t PreparedAsset;
  __int16 v36;
  unsigned int v37;
  unsigned __int16 v38;
  uint64_t v39;
  int v40;
  _QWORD *v41;
  uint64_t v42;
  unsigned __int16 v43;
  __int16 v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  size_t v51;
  unsigned int v52;
  char v53;
  _QWORD *v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  __int16 v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  unsigned __int8 *v63;
  unint64_t v64;
  unsigned __int16 v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  _QWORD *v73;
  BOOL v74;
  char v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  int v81;
  unsigned int v82;
  unsigned int v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  __int16 v102;
  unint64_t v104;
  _BYTE *v105;
  unsigned int v106[5];
  unsigned int v107;

  v4 = 30;
  if (!a1 || !a2 || !a3)
    return v4;
  UARPLayer2LogPacket(a1, a2);
  if (a4 < 6)
    return 9;
  *a3 = uarpNtohs(*a3);
  a3[1] = uarpNtohs(a3[1]);
  v9 = uarpNtohs(a3[2]);
  a3[2] = v9;
  *(_WORD *)(a2 + 60) = v9;
  if (a3[1] + 6 != a4)
    return 9;
  v4 = 1;
  *(_BYTE *)(a1 + 580) = 1;
  switch(*a3)
  {
    case 0u:
      if (!*(_DWORD *)(a1 + 552))
      {
        uarpPlatformEndpointSendSyncMsg(a1, a2);
        goto LABEL_153;
      }
      v10 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112))
        goto LABEL_135;
      v11 = 0;
      while (1)
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a2 + 120) + 8 * v11);
        if (v12)
        {
          if (!uarpNtohs(**(unsigned __int16 **)(v12 + 16)))
          {
            UARPLayer2WatchdogCancel(a1, a2);
            uarpTransmitQueuePendingEntryComplete(a1, a2, v12);
LABEL_135:
            *(_QWORD *)(a2 + 146) = 0;
            *(_QWORD *)(a2 + 138) = 0;
            *(_QWORD *)(a2 + 162) = 0;
            *(_QWORD *)(a2 + 154) = 0;
            v101 = *(_DWORD *)(a1 + 552);
            if (v101 == 1
              || v101 == 2
              && !uarpPlatformEndpointIsMessageTypePending(a1, a2, 1)
              && *(_QWORD *)(a1 + 296))
            {
              uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
            }
            if (*(_BYTE *)(a2 + 14) == 1)
              uarpPlatformReOfferFirmware(a1, a2);
            goto LABEL_153;
          }
          v10 = *(unsigned __int16 *)(a2 + 112);
        }
        if (++v11 >= (unint64_t)v10)
          goto LABEL_135;
      }
    case 1u:
      if (a4 < 8)
        goto LABEL_93;
      v14 = uarpNtohs(a3[3]);
      v15 = *(unsigned __int16 *)(a1 + 12);
      if (v14 < v15)
        v15 = v14;
      if (v15 <= 1)
        v16 = 1;
      else
        v16 = v15;
      *(_WORD *)(a2 + 48) = v16;
      UARPLayer2ProtocolVersion(a1, a2);
      uarpSendVersionDiscoveryResponse(a1, a2, *(_WORD *)(a2 + 48));
      goto LABEL_153;
    case 2u:
      if (a4 < 0xA)
        goto LABEL_93;
      v17 = uarpNtohs(a3[3]);
      a3[3] = v17;
      if (v17)
      {
        v4 = 2;
        goto LABEL_154;
      }
      v96 = uarpNtohs(a3[4]);
      if (v96 <= 1)
        v97 = 1;
      else
        v97 = v96;
      if (v97 >= 4)
        LOWORD(v97) = 4;
      *(_WORD *)(a2 + 48) = v97;
      v98 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112))
        goto LABEL_152;
      v99 = 0;
      break;
    case 3u:
      if (a4 < 0xA)
        goto LABEL_93;
      v18 = uarpAllocPrepareTransmitBuffer2(a1, a2, 4u, 0x10u, 0);
      if (!v18)
        goto LABEL_114;
      v19 = v18;
      v20 = v18[2];
      *(_DWORD *)(v20 + 8) = uarpNtohl(*(_DWORD *)(a3 + 3));
      *(_DWORD *)(v20 + 12) = *((_DWORD *)v19 + 6) - 16;
      updated = uarpCallbackUpdateInformationTLV((_QWORD *)a1, a2, (_DWORD *)(v20 + 8));
      v22 = updated;
      if (updated)
      {
        v23 = 16;
      }
      else
      {
        v102 = *(_WORD *)(v20 + 12);
        *(_WORD *)(v20 + 2) = uarpHtons((unsigned __int16)(v102 + 10));
        *(_DWORD *)(v20 + 8) = uarpHtonl(*(_DWORD *)(v20 + 8));
        *(_DWORD *)(v20 + 12) = uarpHtonl(*(_DWORD *)(v20 + 12));
        v23 = v102 + 16;
      }
      *(_WORD *)(v20 + 6) = uarpHtons(v22);
      *((_WORD *)v19 + 14) = v23;
      goto LABEL_145;
    case 4u:
      if (a4 < 8)
        goto LABEL_93;
      v24 = uarpNtohs(a3[3]);
      v25 = uarpNtohl(*((_DWORD *)a3 + 2));
      v26 = uarpNtohl(*((_DWORD *)a3 + 3));
      uarpPlatformResponseAccessoryInfo(a1, a2, v24, v25, v26, (unsigned int *)a3 + 4);
      goto LABEL_153;
    case 5u:
      if (a4 < 0x24)
        goto LABEL_93;
      v107 = 0;
      uarpTagStructUnpack32(*(unsigned int *)(a3 + 3), &v107);
      v27 = uarpNtohs(a3[5]);
      v28 = uarpNtohs(a3[6]);
      *(_OWORD *)v106 = 0uLL;
      uarpVersionEndianSwap((unsigned int *)(a3 + 7), v106);
      v29 = uarpNtohl(*(_DWORD *)(a3 + 15));
      v30 = uarpNtohs(a3[17]);
      v31 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xDu, 0x24u, 0);
      if (!v31)
        goto LABEL_114;
      v32 = (uint64_t)v31;
      v33 = v31[2];
      *(_DWORD *)(v33 + 6) = uarpTagStructPack32(&v107);
      *(_WORD *)(v33 + 10) = uarpHtons(v27);
      *(_WORD *)(v33 + 12) = uarpHtons(v28);
      uarpVersionEndianSwap(v106, (_DWORD *)(v33 + 14));
      *(_DWORD *)(v33 + 30) = uarpHtonl(v29);
      *(_WORD *)(v33 + 34) = uarpHtons(v30);
      v4 = uarpTransmitBuffer2(a1, a2, v32);
      if ((_DWORD)v4)
        goto LABEL_154;
      v34 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v28);
      if (v34 && !*(_DWORD *)(v34 + 8))
        goto LABEL_153;
      PreparedAsset = uarpPlatformFindPreparedAsset(a1, a2, v28, v27, (unsigned __int8 *)&v107);
      if (!PreparedAsset)
      {
        PreparedAsset = uarpPlatformCreateRxAsset(a1, a2);
        if (!PreparedAsset)
          goto LABEL_114;
      }
      *(_QWORD *)(PreparedAsset + 452) = -1;
      *(_DWORD *)(PreparedAsset + 448) = uarpNtohs(a3[17]);
      *(_WORD *)(PreparedAsset + 44) = v28;
      *(_WORD *)(PreparedAsset + 46) = v27;
      *(_DWORD *)(PreparedAsset + 48) = v107;
      *(_OWORD *)(PreparedAsset + 52) = *(_OWORD *)v106;
      *(_DWORD *)(PreparedAsset + 68) = uarpNtohl(*(_DWORD *)(a3 + 15));
      v36 = *(_WORD *)(PreparedAsset + 46);
      if ((v36 & 1) != 0)
      {
        UARPLayer2SuperBinaryOffered(a1, a2);
      }
      else
      {
        if ((v36 & 2) == 0)
        {
          v4 = 22;
          goto LABEL_154;
        }
        UARPLayer2DynamicAssetOffered(a1, a2);
      }
      goto LABEL_153;
    case 6u:
      if (a4 < 0xE)
        goto LABEL_93;
      v37 = uarpNtohs(a3[6]);
      if (*(_DWORD *)a2 >= v37)
        v38 = v37;
      else
        v38 = *(_DWORD *)a2;
      LOWORD(v106[0]) = v38;
      v39 = uarpNtohl(*((_DWORD *)a3 + 2));
      v40 = uarpNtohs(a3[3]);
      v41 = uarpAllocPrepareTransmitBuffer2(a1, a2, 7u, (unsigned __int16)(v38 + 18), 0);
      if (!v41)
        goto LABEL_114;
      v19 = v41;
      v42 = v41[2];
      v43 = uarpPlatformAssetDataRequest(a1, a2, v40, v38, v39, (void *)(v42 + 18), (unsigned __int16 *)v106);
      *(_WORD *)(v42 + 6) = uarpHtons(v43);
      *(_WORD *)(v42 + 8) = a3[3];
      *(_DWORD *)(v42 + 10) = *((_DWORD *)a3 + 2);
      *(_WORD *)(v42 + 14) = a3[6];
      *(_WORD *)(v42 + 16) = uarpHtons(LOWORD(v106[0]));
      v44 = LOWORD(v106[0]) + 18;
      *(_WORD *)(v42 + 2) = uarpHtons((unsigned __int16)(LOWORD(v106[0]) + 12));
      *((_WORD *)v19 + 14) = v44;
LABEL_145:
      v69 = a1;
      v70 = a2;
      v71 = (uint64_t)v19;
LABEL_146:
      v13 = uarpTransmitBuffer2(v69, v70, v71);
      goto LABEL_147;
    case 7u:
      if (a4 < 0x12)
        goto LABEL_93;
      v45 = uarpNtohs(a3[4]);
      v46 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v45);
      if (!v46)
        goto LABEL_119;
      v47 = v46;
      v48 = uarpNtohs(a3[3]);
      v49 = uarpNtohl(*(_DWORD *)(a3 + 5));
      v50 = uarpNtohs(a3[7]);
      v51 = uarpNtohs(a3[8]);
      v52 = uarpPlatformAssetResponseData(a1, v47, v48, a3 + 9, v49, v50, v51);
      if (v52 == 29)
        v4 = 0;
      else
        v4 = v52;
      goto LABEL_154;
    case 8u:
      if (a4 < 8)
        goto LABEL_93;
      v53 = uarpNtohs(a3[3]);
      v54 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xEu, 8u, 0);
      if (!v54)
        goto LABEL_114;
      *(_WORD *)(v54[2] + 6) = a3[3];
      v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v54);
      if ((_DWORD)v4)
        goto LABEL_154;
      if ((v53 & 1) != 0 && *(_BYTE *)(a2 + 56) == 1)
      {
        *(_BYTE *)(a2 + 56) = 0;
        v13 = UARPLayer2DataTransferPause(a1, a2);
        goto LABEL_147;
      }
      if ((v53 & 2) == 0 || *(_BYTE *)(a2 + 56))
      {
        v4 = 33;
        goto LABEL_154;
      }
      *(_BYTE *)(a2 + 56) = 1;
      v13 = uarpPlatformDataTransferResume(a1, a2);
      goto LABEL_147;
    case 9u:
      if (a4 < 0xA)
        goto LABEL_93;
      v55 = uarpNtohs(a3[3]);
      v56 = uarpNtohs(a3[4]);
      v57 = uarpPlatformAssetFindByAssetID(a1, a2, 1, v55);
      if (!v57)
        goto LABEL_153;
      v58 = (_QWORD *)v57;
      v106[0] = *(_DWORD *)(v57 + 48);
      v59 = *(_WORD *)(v57 + 46);
      v60 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFu, 0xAu, 0);
      if (!v60)
        goto LABEL_114;
      v61 = (uint64_t)v60;
      v62 = v60[2];
      *(_WORD *)(v62 + 6) = uarpHtons(v55);
      *(_WORD *)(v62 + 8) = uarpHtons(v56);
      v4 = uarpTransmitBuffer2(a1, a2, v61);
      if ((_DWORD)v4)
        goto LABEL_154;
      v4 = UARPLayer2AssetProcessingNotification2(a1, a2, v58, v56);
      if ((_DWORD)v4)
        goto LABEL_154;
      if ((v59 & 2) != 0)
      {
        v63 = *(unsigned __int8 **)(a2 + 80);
        if (v63)
        {
          if (uarp4ccCompare((unsigned __int8 *)v106, v63))
          {
            if (*(_WORD *)(a2 + 28) == 1)
            {
              v64 = 0;
            }
            else
            {
              v104 = 0;
              do
              {
                *(_DWORD *)(*(_QWORD *)(a2 + 80) + 4 * v104) = *(_DWORD *)(*(_QWORD *)(a2 + 80) + 4 * v104 + 4);
                v64 = *(unsigned __int16 *)(a2 + 28) - 1;
                ++v104;
              }
              while (v104 < v64);
            }
            v105 = *(_BYTE **)(a2 + 80);
            *(_DWORD *)&v105[4 * v64] = 0;
            if (uarpAssetTagIsValid(v105))
              goto LABEL_157;
          }
        }
      }
      goto LABEL_153;
    case 0xAu:
      LOWORD(v106[0]) = 0;
      v65 = UARPLayer2ApplyStagedAssets(a1, a2);
      v4 = 11;
      v66 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xBu, 0xAu, 0);
      if (!v66)
        goto LABEL_154;
      v67 = v66;
      v68 = v66[2];
      *(_WORD *)(v68 + 6) = uarpHtons(v65);
      *(_WORD *)(v68 + 8) = uarpHtons(LOWORD(v106[0]));
      v69 = a1;
      v70 = a2;
      v71 = (uint64_t)v67;
      goto LABEL_146;
    case 0xBu:
      if (a4 < 0xA)
        goto LABEL_105;
      uarpNtohs(a3[3]);
      uarpNtohs(a3[4]);
      v13 = UARPLayer2ApplyStagedAssetsResponse(a1, a2);
      goto LABEL_147;
    case 0xCu:
      if (a4 < 8)
        goto LABEL_93;
      v72 = uarpNtohs(a3[3]);
      v73 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x10u, 8u, 0);
      if (!v73)
        goto LABEL_114;
      *(_WORD *)(v73[2] + 6) = a3[3];
      v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v73);
      if (!(_DWORD)v4)
        uarpPlatformAssetRescinded(a1, a2, v72);
      goto LABEL_154;
    case 0xDu:
      v74 = a4 >= 0x24;
      goto LABEL_95;
    case 0xEu:
      if (a4 < 8)
        goto LABEL_105;
      v75 = uarpNtohs(a3[3]);
      if ((v75 & 1) != 0)
      {
        v13 = UARPLayer2DataTransferPauseAck(a1, a2);
      }
      else
      {
        if ((v75 & 2) == 0)
        {
          v4 = 26;
          goto LABEL_154;
        }
        v13 = UARPLayer2DataTransferResumeAck(a1, a2);
      }
      goto LABEL_147;
    case 0xFu:
      if (a4 < 0xA)
        goto LABEL_105;
      v76 = uarpNtohs(a3[3]);
      uarpNtohs(a3[4]);
      v77 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v76);
      if (!v77)
        goto LABEL_153;
      v78 = v77;
      v4 = UARPLayer2AssetProcessingNotificationAck(a1, a2, v77);
      *(_BYTE *)(v78 + 72) = 1;
      goto LABEL_154;
    case 0x10u:
      if (a4 < 8)
        goto LABEL_105;
      v79 = uarpNtohs(a3[3]);
      if (v79 == 0xFFFF)
      {
        UARPLayer2RescindAllAssetsAck(a1, a2, 0);
        goto LABEL_153;
      }
      v80 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v79);
      if (v80)
      {
        UARPLayer2AssetRescindedAck(a1, a2, v80);
        goto LABEL_153;
      }
LABEL_119:
      v4 = 17;
      goto LABEL_154;
    case 0x11u:
      if (a4 < 0xA)
      {
LABEL_93:
        v4 = 9;
        goto LABEL_154;
      }
      v91 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x12u, 0xEu, 0);
      if (!v91)
      {
LABEL_114:
        v4 = 11;
        goto LABEL_154;
      }
      v92 = (uint64_t)v91;
      v93 = v91[2];
      *(_DWORD *)(v93 + 6) = uarpHtonl(0);
      *(_DWORD *)(v93 + 10) = *(_DWORD *)(a3 + 3);
      v4 = uarpTransmitBuffer2(a1, a2, v92);
      if ((_DWORD)v4)
        goto LABEL_154;
      v106[0] = *(_DWORD *)(a3 + 3);
      v94 = uarpAssetQueueSolicitation(a1, a2, v106);
      if (v94 == 1)
      {
LABEL_157:
        UARPLayer2AssetSolicitation(a1, a2);
      }
      else if (v94 == 2)
      {
        uarpSendDynamicAssetPreProcessingStatus(a1, a2, v106, 2u, 3328);
      }
      goto LABEL_153;
    case 0x12u:
      v74 = a4 >= 0xE;
LABEL_95:
      v81 = !v74;
      v4 = (8 * v81);
      goto LABEL_154;
    case 0x13u:
      if (a4 < 0xC)
        goto LABEL_105;
      v82 = uarpNtohs(a3[5]);
      v83 = *(_DWORD *)(a3 + 3);
      v106[0] = v83;
      v84 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x14u, 0xCu, 0);
      if (!v84)
        goto LABEL_114;
      v85 = (uint64_t)v84;
      v86 = v84[2];
      *(_DWORD *)(v86 + 6) = v83;
      *(_WORD *)(v86 + 10) = uarpHtons(v82);
      v4 = uarpTransmitBuffer2(a1, a2, v85);
      if ((_DWORD)v4)
        goto LABEL_154;
      v87 = uarpPlatformAssetFindByTag(a1, a2, 0, (unsigned __int8 *)v106);
      if (v87)
      {
        *(_BYTE *)(v87 + 72) = 1;
        v13 = UARPLayer2AssetPreProcessingNotification(a1, a2, v87);
        goto LABEL_147;
      }
      v4 = 3;
      goto LABEL_154;
    case 0x14u:
      if (a4 < 0xC)
        goto LABEL_105;
      uarpNtohs(a3[5]);
      v106[0] = *(_DWORD *)(a3 + 3);
      v95 = uarpPlatformAssetFindByTag(a1, a2, 1, (unsigned __int8 *)v106);
      if (v95)
      {
        *(_BYTE *)(v95 + 72) = 1;
        v4 = UARPLayer2AssetPreProcessingNotificationAck(a1, a2, v95);
        if ((_DWORD)v4 != 3)
          goto LABEL_154;
      }
      goto LABEL_153;
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
      goto LABEL_154;
    case 0x1Du:
      v88 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Eu, 8u, 0);
      if (!v88)
        goto LABEL_114;
      v89 = (uint64_t)v88;
      v90 = v88[2];
      *(_WORD *)(v90 + 6) = uarpHtons(0);
      v4 = uarpTransmitBuffer2(a1, a2, v89);
      if (!(_DWORD)v4)
        fUarpLayer3NoFirmwareUpdateAvailable(a1, a2);
      goto LABEL_154;
    case 0x1Eu:
      goto LABEL_153;
    default:
      if (*a3 != 0xFFFF)
        goto LABEL_154;
      if (a4 < 0xB)
      {
LABEL_105:
        v4 = 8;
      }
      else
      {
        uarpNtohs(*(unsigned __int16 *)((char *)a3 + 9));
        v13 = UARPLayer2VendorSpecificRecvMessage((_QWORD *)a1, a2);
LABEL_147:
        v4 = v13;
      }
      goto LABEL_154;
  }
  while (1)
  {
    v100 = *(_QWORD *)(*(_QWORD *)(a2 + 120) + 8 * v99);
    if (v100)
      break;
LABEL_131:
    if (++v99 >= (unint64_t)v98)
      goto LABEL_152;
  }
  if (uarpNtohs(**(unsigned __int16 **)(v100 + 16)) != 1)
  {
    v98 = *(unsigned __int16 *)(a2 + 112);
    goto LABEL_131;
  }
  UARPLayer2WatchdogCancel(a1, a2);
  uarpTransmitQueuePendingEntryComplete(a1, a2, v100);
LABEL_152:
  UARPLayer2ProtocolVersion(a1, a2);
LABEL_153:
  v4 = 0;
LABEL_154:
  *a3 = uarpHtons(*a3);
  a3[1] = uarpHtons(a3[1]);
  a3[2] = uarpHtons(a3[2]);
  uarpTransmitQueueProcessRecv(a1, a2, a3, a4);
  *(_BYTE *)(a1 + 580) = 0;
  uarpTransmitQueueService(a1, a2);
  uarpPlatformGarbageCollection(a1, a2);
  return v4;
}

uint64_t isPanicEnabled(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v2 = os_parse_boot_arg_int();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v3 = "Disabled";
    v5 = 136315650;
    v6 = "BOOL isPanicEnabled(char *)";
    v7 = 2080;
    v8 = a1;
    if ((_DWORD)v2)
      v3 = "Enabled";
    v9 = 2080;
    v10 = v3;
    _os_log_impl(&dword_24BC99000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: %s is %s", (uint8_t *)&v5, 0x20u);
  }
  return v2;
}

void triggerSystemPanic(void *a1)
{
  id v1;
  id v2;
  int v3;
  int v4;

  v1 = a1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    triggerSystemPanic_cold_2((uint64_t)v1);
  v2 = objc_retainAutorelease(v1);
  v3 = MEMORY[0x24BD2FF68](3072, objc_msgSend(v2, "UTF8String"));
  if (v3)
  {
    v4 = v3;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      triggerSystemPanic_cold_1(v4);
  }

}

void logSystemFatal(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  void *v11;

  v9 = (objc_class *)MEMORY[0x24BDD16A8];
  v10 = a1;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithFormat:arguments:", v10, &a9);

  if (isPanicEnabled((uint64_t)"rt13-failure-panic"))
  {
    triggerSystemPanic(v11);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    logSystemFatal_cold_1((uint64_t)v11);
  }

}

uint64_t sleepMS(int a1)
{
  return usleep(1000 * a1);
}

id _uarpRestoreLayer4EndpointInitialize(void *a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(uint64_t a1, void *a2, uint64_t a3, unsigned int a4))
{
  id v7;

  v7 = a1;
  objc_msgSend(v7, "setUarpChipCallbacks:", a3);
  objc_msgSend(v7, "setUarpContext:", a2);

  *a4 = _uarpRestoreEndpointMsgSend;
  return v7;
}

uint64_t _uarpRestoreLayer4FirmwareStageProgress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "firmwareBytesTransferred:bytesTotal:", a2, a3);
}

uint64_t _uarpRestoreLayer4FirmwareStagingComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "firmwareStagingCompleteWithStatus:reason:", a2, a3);
}

uint64_t _uarpRestoreLayer4FirmwareApplyComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "firmwareApplyCompleteWithStatus:flags:", a2, a3);
}

uint64_t _uarpRestoreEndpointMsgSend(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDBCE50];
  v6 = a4;
  v7 = a2;
  objc_msgSend(v5, "dataWithBytes:length:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeData:", v8);

  return 0;
}

uint64_t uarpPlatformAssetProcessingCompleteInternal(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  uint64_t result;

  result = 30;
  if (a1 && a3)
  {
    if (uarpPlatformAssetIsKnown(a1, a2, a3))
    {
      *(_BYTE *)(a3 + 392) = 0;
      *(_BYTE *)(a3 + 72) = 1;
      *(_QWORD *)(a3 + 696) = 0;
      if (!a2 || (result = uarpAssetProcessingComplete(a1, a2, a3, a5 | a4), !(_DWORD)result))
      {
        result = 0;
        if (a4 == 4 && !a6)
        {
          UARPLayer2AssetCorrupt(a1, a3);
          return 0;
        }
      }
    }
    else
    {
      return 23;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetRequestData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  if (!a2)
    return 30;
  v3 = *(_QWORD *)(a2 + 696);
  if (!v3)
    return 30;
  if (*(_BYTE *)(a3 + 80) == 1)
    return 16;
  if (*(_BYTE *)(a2 + 73) == 1 || !*(_BYTE *)(v3 + 56))
    return 31;
  v6 = *(_DWORD *)(a3 + 8);
  v7 = *(_DWORD *)(a3 + 84);
  v8 = v7 + v6 + *(_DWORD *)a3;
  v9 = *(_DWORD *)(a3 + 4) - (v7 + v6);
  if (v9 >= *(_DWORD *)(a3 + 24) - v7)
    v9 = *(_DWORD *)(a3 + 24) - v7;
  *(_DWORD *)(a3 + 92) = v8;
  *(_DWORD *)(a3 + 96) = v9;
  if (v9 >= *(_DWORD *)(*(_QWORD *)(a2 + 696) + 4))
    v10 = *(_DWORD *)(*(_QWORD *)(a2 + 696) + 4);
  else
    v10 = v9;
  *(_DWORD *)(a3 + 96) = v10;
  result = uarpSendAssetRequestData(a1, *(_QWORD *)(a2 + 696), *(unsigned __int16 *)(a2 + 44), v8, v10);
  if (!(_DWORD)result)
    *(_BYTE *)(a3 + 80) = 1;
  return result;
}

uint64_t uarpPlatformAssetResponseData(uint64_t a1, uint64_t a2, uint64_t a3, void *__src, int a5, int a6, size_t __n)
{
  uint64_t v7;
  uint64_t v10;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;

  if (!*(_BYTE *)(a2 + 392))
    return 29;
  v7 = a3;
  if ((_DWORD)a3)
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(_QWORD *)(a2 + 696), a2, 4u, 0, 0);
    return v7;
  }
  if (*(_DWORD *)(a2 + 404) != a5)
    return 29;
  if (*(_DWORD *)(a2 + 408) != a6)
    return 29;
  v10 = *(unsigned int *)(a2 + 396);
  if ((v10 + __n) > *(_DWORD *)(a2 + 336))
    return 29;
  *(_BYTE *)(a2 + 392) = 0;
  *(_DWORD *)(a2 + 412) = __n;
  memcpy((void *)(*(_QWORD *)(a2 + 328) + v10), __src, __n);
  v12 = *(_DWORD *)(a2 + 396) + *(_DWORD *)(a2 + 412);
  *(_DWORD *)(a2 + 396) = v12;
  v13 = *(_DWORD *)(a2 + 320) + v12;
  v14 = *(_DWORD *)(a2 + 316);
  if (v12 == *(_DWORD *)(a2 + 336) || v13 == v14)
  {
    v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 376))(a1, a2, a2 + 312);
    if ((_DWORD)v7)
      return v7;
    v15 = *(_DWORD *)(a2 + 396);
    v16 = *(unsigned int *)(a2 + 400);
    v17 = v15 - v16;
    if (v15 != (_DWORD)v16)
    {
      memcpy(*(void **)(a2 + 328), (const void *)(*(_QWORD *)(a2 + 328) + v16), (v15 - v16));
      v15 = *(_DWORD *)(a2 + 400);
    }
    *(_DWORD *)(a2 + 396) = v17;
    *(_DWORD *)(a2 + 320) += v15;
    *(_DWORD *)(a2 + 400) = 0;
  }
  if (v13 == v14)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 384))(a1, a2, a2 + 312);
  else
    return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
}

uint64_t uarpPlatformAssetUpdateMetaData(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))
{
  unsigned int v4;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int *v14;
  int v15;

  v4 = *(_DWORD *)(a3 + 84);
  if (v4 < 8)
    return 0;
  v9 = *(unsigned int **)(a3 + 16);
  while (1)
  {
    v10 = uarpNtohl(*v9);
    v11 = uarpNtohl(v9[1]);
    if (v11 > *(_DWORD *)(a3 + 24) - 8)
      break;
    v12 = v11;
    v13 = v4 - 8;
    v4 = v4 - 8 - v11;
    if (v13 >= v11)
    {
      v14 = v9 + 2;
      v15 = *(_DWORD *)(a3 + 88) + 8;
      *(_DWORD *)(a3 + 88) = v15;
      if (a4)
      {
        a4(a1, a2, v10, v11, v14);
        v15 = *(_DWORD *)(a3 + 88);
      }
      v9 = (unsigned int *)((char *)v14 + v12);
      *(_DWORD *)(a3 + 88) = v15 + v12;
      if (v4 > 7)
        continue;
    }
    return 0;
  }
  return 53;
}

uint64_t uarpPlatformAssetSuperBinaryPullHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 30;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 392) == 1)
    {
      return 16;
    }
    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(_QWORD *)(a2 + 312) = 0x2C00000000;
      *(_QWORD *)(a2 + 328) = *(_QWORD *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(_QWORD *)(a2 + 376) = uarpPlatformAssetSuperBinaryRequestWindowFilled;
      *(_QWORD *)(a2 + 384) = uarpPlatformAssetSuperBinaryRequestCompleted;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }
  return result;
}

uint64_t uarpPlatformAssetSuperBinaryRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int *v6;
  int v7;
  unsigned int v8;
  uint64_t result;

  UARPLayer2AssetStore(a1, a2);
  v6 = *(unsigned int **)(a3 + 16);
  *(_DWORD *)a2 = uarpNtohl(*v6);
  *(_DWORD *)(a2 + 4) = uarpNtohl(v6[1]);
  *(_DWORD *)(a2 + 8) = uarpNtohl(v6[2]);
  uarpVersionEndianSwap(v6 + 3, (_DWORD *)(a2 + 12));
  *(_DWORD *)(a2 + 28) = uarpNtohl(v6[7]);
  *(_DWORD *)(a2 + 32) = uarpNtohl(v6[8]);
  *(_DWORD *)(a2 + 36) = uarpNtohl(v6[9]);
  v7 = uarpNtohl(v6[10]);
  *(_DWORD *)(a2 + 40) = v7;
  *(_DWORD *)(a3 + 88) = *(_DWORD *)(a3 + 84);
  v8 = *(_DWORD *)(a2 + 68);
  if (*(_DWORD *)(a2 + 36) + v7 > v8
    || *(_DWORD *)(a2 + 32) + *(_DWORD *)(a2 + 28) > v8
    || *(_DWORD *)(a2 + 4) != 44
    || (result = 0, *(_DWORD *)a2 >= 4u))
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(_QWORD *)(a2 + 696), a2, 4u, 0, 0);
    return 47;
  }
  return result;
}

uint64_t uarpPlatformAssetSuperBinaryRequestCompleted(uint64_t a1, uint64_t a2)
{
  UARPLayer2AssetReady(a1, a2);
  return 0;
}

uint64_t uarpPlatformAssetSuperBinaryPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 32))
    {
      *(_DWORD *)(a2 + 688) = 0;
      if (*(_BYTE *)(a2 + 392) == 1)
      {
        return 16;
      }
      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(_QWORD *)(a2 + 312) = *(_QWORD *)(a2 + 28);
        *(_QWORD *)(a2 + 328) = *(_QWORD *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(_QWORD *)(a2 + 376) = uarpPlatformAssetSuperBinaryMetaDataRequestWindowFilled;
        *(_QWORD *)(a2 + 384) = uarpPlatformAssetSuperBinaryMetaDataRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }
    else
    {
      return 40;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetSuperBinaryMetaDataRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;

  UARPLayer2AssetStore(a1, a2);
  v6 = *(_DWORD *)(a3 + 84);
  if (v6 < 8)
  {
LABEL_6:
    v11 = 0;
    *(_DWORD *)(a2 + 688) += *(_DWORD *)(a3 + 88);
  }
  else
  {
    v7 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      uarpNtohl(*v7);
      v8 = uarpNtohl(v7[1]);
      if (v8 > *(_DWORD *)(a3 + 24) - 8)
        break;
      v9 = v8;
      v10 = v6 - 8;
      v6 = v6 - 8 - v8;
      if (v10 >= v8)
      {
        *(_DWORD *)(a3 + 88) += 8;
        UARPLayer2AssetMetaDataTLV(a1, a2);
        v7 = (unsigned int *)((char *)v7 + v9 + 8);
        *(_DWORD *)(a3 + 88) += v9;
        if (v6 > 7)
          continue;
      }
      goto LABEL_6;
    }
    v11 = 53;
    UARPLayer2AssetMetaDataProcessingError(a1, a2);
  }
  return v11;
}

uint64_t uarpPlatformAssetSuperBinaryMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  UARPLayer2AssetMetaDataComplete(a1, a2);
  return 0;
}

uint64_t uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 30;
  if (a1 && a2 && *(_DWORD *)(a2 + 456) <= *(_DWORD *)(a2 + 448))
  {
    if (*(_BYTE *)(a2 + 392) == 1)
    {
      return 16;
    }
    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(_DWORD *)(a2 + 312) = 40 * *(_DWORD *)(a2 + 456) + 44;
      *(_DWORD *)(a2 + 316) = 40;
      *(_QWORD *)(a2 + 328) = *(_QWORD *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(_QWORD *)(a2 + 376) = uarpPlatformAssetPayloadHeaderRequestWindowFilled;
      *(_QWORD *)(a2 + 384) = uarpPlatformAssetPayloadHeaderRequestCompleted;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }
  return result;
}

uint64_t uarpPlatformAssetPayloadHeaderRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  UARPLayer2AssetStore(a1, a2);
  v6 = uarpPlatformAssetPayloadHeaderProcess(*(unsigned int **)(a3 + 16), a2 + 464, *(_DWORD *)(a2 + 68));
  if ((_DWORD)v6)
    uarpPlatformAssetProcessingCompleteInternal(a1, *(_QWORD *)(a2 + 696), a2, 4u, 0, 0);
  else
    *(_DWORD *)(a3 + 88) = *(_DWORD *)(a3 + 84);
  return v6;
}

uint64_t uarpPlatformAssetPayloadHeaderRequestCompleted(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 452) = *(_DWORD *)(a2 + 456);
  UARPLayer2PayloadReady(a1, a2);
  return 0;
}

uint64_t uarpPlatformAssetPayloadHeaderProcess(unsigned int *a1, uint64_t a2, unsigned int a3)
{
  int v6;
  uint64_t v7;

  *(_DWORD *)a2 = uarpNtohl(*a1);
  *(_DWORD *)(a2 + 4) = a1[1];
  uarpVersionEndianSwap(a1 + 2, (_DWORD *)(a2 + 8));
  *(_DWORD *)(a2 + 24) = uarpNtohl(a1[6]);
  *(_DWORD *)(a2 + 28) = uarpNtohl(a1[7]);
  *(_DWORD *)(a2 + 32) = uarpNtohl(a1[8]);
  v6 = uarpNtohl(a1[9]);
  *(_DWORD *)(a2 + 36) = v6;
  *(_BYTE *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 56) = 0;
  *(_DWORD *)(a2 + 76) = 0;
  *(_DWORD *)(a2 + 128) = v6;
  v7 = 48;
  if (*(_DWORD *)(a2 + 28) + *(_DWORD *)(a2 + 24) <= a3)
  {
    if (*(_DWORD *)(a2 + 32) + v6 <= a3)
      return 0;
    else
      return 48;
  }
  return v7;
}

uint64_t uarpPlatformAssetPayloadPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 44;
    }
    else if (*(_DWORD *)(a2 + 492))
    {
      *(_DWORD *)(a2 + 512) = 0;
      if (*(_BYTE *)(a2 + 392) == 1)
      {
        return 16;
      }
      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(_QWORD *)(a2 + 312) = *(_QWORD *)(a2 + 488);
        *(_QWORD *)(a2 + 328) = *(_QWORD *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(_QWORD *)(a2 + 376) = uarpPlatformAssetPayloadMetaDataRequestWindowFilled;
        *(_QWORD *)(a2 + 384) = uarpPlatformAssetPayloadMetaDataRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }
    else
    {
      return 40;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetPayloadMetaDataRequestWindowFilled(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  _DWORD *v12;
  uint64_t v13;

  UARPLayer2AssetStore((uint64_t)a1, a2);
  v6 = *(_DWORD *)(a3 + 84);
  if (v6 < 8)
  {
LABEL_6:
    v13 = 0;
    *(_DWORD *)(a2 + 512) += *(_DWORD *)(a3 + 88);
  }
  else
  {
    v7 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      v8 = uarpNtohl(*v7);
      v9 = uarpNtohl(v7[1]);
      if (v9 > *(_DWORD *)(a3 + 24) - 8)
        break;
      v10 = v9;
      v11 = v6 - 8;
      v6 = v6 - 8 - v9;
      if (v11 >= v9)
      {
        v12 = v7 + 2;
        *(_DWORD *)(a3 + 88) += 8;
        UARPLayer2PayloadMetaDataTLV(a1, a2, v8, v9, v12);
        v7 = (_DWORD *)((char *)v12 + v10);
        *(_DWORD *)(a3 + 88) += v10;
        if (v6 > 7)
          continue;
      }
      goto LABEL_6;
    }
    v13 = 53;
    UARPLayer2PayloadMetaDataProcessingError((uint64_t)a1, a2);
  }
  return v13;
}

uint64_t uarpPlatformAssetPayloadMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  UARPLayer2PayloadMetaDataComplete(a1, a2);
  return 0;
}

uint64_t uarpPlatformAssetPayloadPullData(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;

  result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
      return 44;
    v5 = *(_DWORD *)(a2 + 508);
    if (v5 > *(_DWORD *)(a2 + 500) || *(_DWORD *)(a2 + 496) + v5 > *(_DWORD *)(a2 + 8))
      return 43;
    if (*(_BYTE *)(a2 + 392) == 1)
      return 16;
    uarpZero((void *)(a2 + 312), 0x88uLL);
    v6 = *(_DWORD *)(a2 + 508);
    *(_DWORD *)(a2 + 312) = v6 + *(_DWORD *)(a2 + 496);
    *(_DWORD *)(a2 + 316) = *(_DWORD *)(a2 + 500) - v6;
    *(_QWORD *)(a2 + 328) = *(_QWORD *)(a2 + 640);
    v7 = *(_DWORD *)(a2 + 648);
    *(_DWORD *)(a2 + 336) = v7;
    *(_DWORD *)(a2 + 368) = v7;
    *(_QWORD *)(a2 + 376) = uarpPlatformAssetPayloadDataRequestWindowFilled;
    *(_QWORD *)(a2 + 384) = uarpPlatformAssetPayloadDataRequestCompleted;
    v8 = *(unsigned int *)(a2 + 520);
    *(_DWORD *)(a2 + 416) = v8;
    UARPLayer2HashInfo(a1, v8, (_DWORD *)(a2 + 420), (_DWORD *)(a2 + 432));
    v9 = *(_DWORD *)(a2 + 420);
    if (v9)
    {
      result = UARPLayer2RequestBuffer(a1, (_QWORD *)(a2 + 424), v9);
      if ((_DWORD)result)
        return result;
      if (!*(_QWORD *)(a2 + 424))
        return 11;
    }
    v10 = *(_DWORD *)(a2 + 432);
    if (!v10)
    {
LABEL_17:
      UARPLayer2HashInit(a1, *(unsigned int *)(a2 + 416), *(_QWORD *)(a2 + 424));
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
    result = UARPLayer2RequestBuffer(a1, (_QWORD *)(a2 + 440), v10);
    if (!(_DWORD)result)
    {
      if (*(_QWORD *)(a2 + 440))
        goto LABEL_17;
      return 11;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetPayloadDataRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;

  UARPLayer2HashUpdate(a1, *(unsigned int *)(a3 + 104), *(_QWORD *)(a3 + 112), *(_QWORD *)(a3 + 16), *(unsigned int *)(a3 + 84));
  UARPLayer2PayloadData(a1, a2);
  v6 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 88) = v6;
  *(_DWORD *)(a2 + 508) += v6;
  return 0;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompleted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _BOOL4 v7;
  void *v8;
  void *v9;

  v5 = *(unsigned int *)(a2 + 520);
  if (!(_DWORD)v5)
    goto LABEL_7;
  UARPLayer2HashFinal(a1, v5, *(_QWORD *)(a3 + 112), *(_QWORD *)(a3 + 128), *(unsigned int *)(a3 + 120));
  v7 = uarpPlatformCompareHash(a1, *(void **)(a3 + 128), *(unsigned int *)(a3 + 120), *(void **)(a2 + 528), *(_DWORD *)(a2 + 536));
  v8 = *(void **)(a3 + 112);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(_QWORD *)(a3 + 112) = 0;
    *(_DWORD *)(a3 + 108) = 0;
  }
  v9 = *(void **)(a3 + 128);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(_QWORD *)(a3 + 128) = 0;
    *(_DWORD *)(a3 + 120) = 0;
  }
  *(_DWORD *)(a3 + 104) = 0;
  if (!v7)
    UARPLayer2AssetCorrupt(a1, a2);
  else
LABEL_7:
    UARPLayer2PayloadDataComplete2(a1, (_QWORD *)a2);
  return 0;
}

uint64_t uarpPlatformAssetPullAllPayloadHeaders(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  result = 30;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 392) == 1)
    {
      return 16;
    }
    else
    {
      v7 = 0;
      if (*(int *)(a2 + 448) < 1)
      {
LABEL_9:
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(_QWORD *)(a2 + 312) = *(_QWORD *)(a2 + 36);
        *(_QWORD *)(a2 + 328) = *(_QWORD *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(_QWORD *)(a2 + 376) = uarpPlatformAssetAllPayloadHeadersRequestWindowFilled;
        *(_QWORD *)(a2 + 384) = uarpPlatformAssetAllPayloadHeadersRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
      else
      {
        v5 = 0;
        while (1)
        {
          result = UARPLayer2RequestBuffer(a1, &v7, 0xB8u);
          if ((_DWORD)result)
            break;
          v6 = v7;
          *(_QWORD *)(v7 + 176) = *(_QWORD *)(a2 + 632);
          *(_QWORD *)(a2 + 632) = v6;
          if (++v5 >= *(_DWORD *)(a2 + 448))
            goto LABEL_9;
        }
      }
    }
  }
  return result;
}

uint64_t uarpPlatformAssetAllPayloadHeadersRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(int *)(a2 + 448) < 1)
    return 0;
  v6 = 0;
  v7 = *(unsigned int **)(a3 + 16);
  v8 = *(_QWORD *)(a2 + 632);
  while (1)
  {
    if (!v8)
      return 11;
    v9 = uarpPlatformAssetPayloadHeaderProcess(v7, v8, *(_DWORD *)(a2 + 68));
    if ((_DWORD)v9)
      break;
    *(_DWORD *)(v8 + 124) = v6;
    v8 = *(_QWORD *)(v8 + 176);
    *(_DWORD *)(a3 + 88) += 40;
    ++v6;
    v7 += 10;
    if (v6 >= *(int *)(a2 + 448))
      return 0;
  }
  v10 = v9;
  uarpPlatformAssetProcessingCompleteInternal(a1, *(_QWORD *)(a2 + 696), a2, 4u, 0, 0);
  return v10;
}

_DWORD *uarpProcessTLV(uint64_t a1, unsigned int *a2)
{
  int v4;
  unsigned int v5;
  int v6;
  _DWORD *v7;
  _DWORD *v9;

  v4 = uarpNtohl(*a2);
  v5 = uarpNtohl(a2[1]);
  v9 = 0;
  v6 = UARPLayer2RequestBuffer(a1, &v9, v5 + 24);
  v7 = 0;
  if (!v6)
  {
    v7 = v9;
    *v9 = v4;
    v7[1] = v5;
    memcpy(v7 + 6, a2 + 2, v5);
    *((_QWORD *)v7 + 1) = v7 + 6;
  }
  return v7;
}

uint64_t uarpPlatformAssetPullAllMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unsigned int v5;
  int v6;
  uint64_t i;
  int v8;
  int v9;
  int v10;

  result = 30;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 392) == 1)
      return 16;
    uarpZero((void *)(a2 + 312), 0x88uLL);
    v6 = *(_DWORD *)(a2 + 28);
    v5 = *(_DWORD *)(a2 + 32);
    *(_DWORD *)(a2 + 312) = v6;
    *(_DWORD *)(a2 + 316) = v5;
    for (i = *(_QWORD *)(a2 + 632); i; i = *(_QWORD *)(i + 176))
    {
      v8 = *(_DWORD *)(i + 24);
      if (v8)
      {
        if (v8 != v5 + v6)
          return 43;
        v5 += *(_DWORD *)(i + 28);
        *(_DWORD *)(a2 + 316) = v5;
      }
    }
    *(_DWORD *)(a2 + 680) = v5;
    *(_QWORD *)(a2 + 672) = 0;
    if (v5)
    {
      result = UARPLayer2RequestBuffer(a1, (_QWORD *)(a2 + 672), v5);
      if ((_DWORD)result)
        return result;
      v9 = *(_DWORD *)(a2 + 680);
      v10 = *(_DWORD *)(a2 + 316);
      *(_QWORD *)(a2 + 328) = *(_QWORD *)(a2 + 672);
      *(_DWORD *)(a2 + 336) = v9;
      *(_QWORD *)(a2 + 376) = uarpPlatformAssetAllMetaDataWindowFilled;
      *(_QWORD *)(a2 + 384) = uarpPlatformAssetAllMetaDataRequestCompleted;
      if (v10)
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
    else
    {
      *(_QWORD *)(a2 + 328) = 0;
      *(_DWORD *)(a2 + 336) = 0;
      *(_QWORD *)(a2 + 376) = uarpPlatformAssetAllMetaDataWindowFilled;
      *(_QWORD *)(a2 + 384) = uarpPlatformAssetAllMetaDataRequestCompleted;
    }
    UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(_QWORD *)(a2 + 696), a2);
    return 0;
  }
  return result;
}

uint64_t uarpPlatformAssetAllMetaDataWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  int v4;
  uint64_t result;
  unsigned int *v9;
  _DWORD *v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int *v16;
  _DWORD *v17;
  uint64_t v18;
  int v19;

  v3 = *(_DWORD *)(a2 + 32);
  v4 = *(_DWORD *)(a3 + 88);
  if (*(_DWORD *)(a3 + 84) - v4 < v3)
    return 18;
  if (v3)
  {
    v9 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      v10 = uarpProcessTLV(a1, v9);
      if (!v10)
        return 10;
      v11 = (v10[1] + 8);
      v9 = (unsigned int *)((char *)v9 + v11);
      *((_QWORD *)v10 + 2) = *(_QWORD *)(a2 + 720);
      *(_QWORD *)(a2 + 720) = v10;
      v3 -= v11;
      if (!v3)
      {
        v12 = *(_DWORD *)(a2 + 32);
        v4 = *(_DWORD *)(a3 + 88);
        goto LABEL_9;
      }
    }
  }
  else
  {
    v12 = 0;
LABEL_9:
    v13 = v4 + v12;
    *(_DWORD *)(a3 + 88) = v13;
    v14 = *(_QWORD *)(a2 + 632);
    if (v14)
    {
      while (1)
      {
        v15 = *(_DWORD *)(v14 + 28);
        if (*(_DWORD *)(a3 + 84) - v13 < v15)
          return 18;
        if (v15)
        {
          v16 = (unsigned int *)(*(_QWORD *)(a3 + 16) + v13);
          while (1)
          {
            v17 = uarpProcessTLV(a1, v16);
            if (!v17)
              return 10;
            v18 = (v17[1] + 8);
            v16 = (unsigned int *)((char *)v16 + v18);
            *((_QWORD *)v17 + 2) = *(_QWORD *)(v14 + 168);
            *(_QWORD *)(v14 + 168) = v17;
            v15 -= v18;
            if (!v15)
            {
              v19 = *(_DWORD *)(v14 + 28);
              v13 = *(_DWORD *)(a3 + 88);
              goto LABEL_17;
            }
          }
        }
        v19 = 0;
LABEL_17:
        result = 0;
        v13 += v19;
        *(_DWORD *)(a3 + 88) = v13;
        v14 = *(_QWORD *)(v14 + 176);
        if (!v14)
          return result;
      }
    }
    return 0;
  }
}

uint64_t uarpPlatformAssetAllMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(_QWORD *)(a2 + 696), a2);
  return 0;
}

id InternalStorageDirectoryPath()
{
  if (InternalStorageDirectoryPath_onceToken != -1)
    dispatch_once(&InternalStorageDirectoryPath_onceToken, &__block_literal_global);
  return (id)InternalStorageDirectoryPath_path;
}

uint64_t SoCUpdaterShouldSkipSameVersion(void *a1)
{
  void *v1;
  void *v2;
  int v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  int v7;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Options"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("RestoreInternal"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("SkipSameVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");
  if ((v5 & 1) != 0 || !v3)
  {
    if (v4)
      v7 = v3;
    else
      v7 = 1;
    v6 = v7 | v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t SoCUpdaterRunningInTetheredMode(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Options"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("PreflightRequired"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue") ^ 1;

  return v3;
}

uint64_t SoCUpdaterDeferredCommitEnabled(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Options"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("DeferredCommit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

uint64_t SoCUpdaterGetMode(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Options"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PreflightContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SoCUpdaterDeferredCommitEnabled(v1);

  if (objc_msgSend(v3, "isEqual:", CFSTR("Limited")))
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PreflightTickets"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = 1;

    if (v4 == 1)
    {
      if (os_variant_is_recovery())
        v6 = 6;
      else
        v6 = 4;
    }
    else
    {
      v6 = 1;
    }
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("BootedOS")))
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PreflightTickets"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v6 = 3;
    }
    else
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PreflightRequired"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "BOOLValue"))
        v6 = 2;
      else
        v6 = 3;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

const char *StringForSoCRestoreUpdateMode(unsigned int a1)
{
  if (a1 > 8)
    return "Unrecognized";
  else
    return off_251CE3F00[a1];
}

id UARPPersonalizationTSSRequestWithSigningServer(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  int v11;
  void *v12;

  v3 = a1;
  v4 = a2;
  String();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    UARPPersonalizationTSSRequestWithSigningServer_cold_3();

  String(v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  String();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
      UARPPersonalizationTSSRequestWithSigningServer_cold_2();

    v9 = v6;
  }
  else
  {
    if (v8)
      UARPPersonalizationTSSRequestWithSigningServer_cold_1();

    v10 = (void *)MGCopyAnswer();
    v11 = objc_msgSend(v10, "BOOLValue");
    v12 = 0;
    if (v11)
    {
      UARPPersonalizationTSSRequestWithSigningServerSSO(v3, v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v12;

  }
  return v9;
}

id String()
{
  if (TSSRequestLogToken_onceToken != -1)
    dispatch_once(&TSSRequestLogToken_onceToken, &__block_literal_global_0);
  return (id)TSSRequestLogToken_logToken;
}

id String(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  int PersonalizedResponse;
  NSObject *v18;
  const __CFString *v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  String();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    _os_log_impl(&dword_24BC99000, v7, OS_LOG_TYPE_INFO, "UARP: TSS request to signing server %{public}@", buf, 0xCu);
  }

  AMAuthInstallLogSetHandler();
  v8 = AMAuthInstallCreate();
  if (v8)
  {
    v9 = (const void *)v8;
    if (AMAuthInstallSetSigningServerURL())
    {
      String();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        TSSRequestWithSigningServer_cold_5();
LABEL_7:

      CFRelease(v9);
      goto LABEL_11;
    }
    if (a3)
    {
      String();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24BC99000, v13, OS_LOG_TYPE_INFO, "UARP: TSS request is using SSO", buf, 2u);
      }

      if (AMAuthInstallSsoInitialize())
      {
        String();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          TSSRequestWithSigningServer_cold_4();
        goto LABEL_7;
      }
      if (AMAuthInstallSsoEnable())
      {
        String();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          TSSRequestWithSigningServer_cold_3();
        goto LABEL_7;
      }
    }
    String();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (a3)
        v15 = CFSTR(" <AppleConnect>");
      else
        v15 = CFSTR(" ");
      *(_DWORD *)buf = 138543618;
      v23 = v6;
      v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_24BC99000, v14, OS_LOG_TYPE_INFO, "UARP: TSS Request %{public}@%{public}@ is ", buf, 0x16u);
    }

    String();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      _os_log_impl(&dword_24BC99000, v16, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
    }

    PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
    String();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      if (a3)
        v19 = CFSTR(" <AppleConnect>");
      else
        v19 = CFSTR(" ");
      *(_DWORD *)buf = 138543618;
      v23 = v6;
      v24 = 2114;
      v25 = v19;
      _os_log_impl(&dword_24BC99000, v18, OS_LOG_TYPE_INFO, "UARP: TSS Response %{public}@%{public}@ is ", buf, 0x16u);
    }

    String();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v23 = 0;
      _os_log_impl(&dword_24BC99000, v20, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
    }

    if (PersonalizedResponse)
    {
      String();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        TSSRequestWithSigningServer_cold_2(PersonalizedResponse, v21);

    }
    CFRelease(v9);
  }
  else
  {
    String();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      TSSRequestWithSigningServer_cold_1();

  }
LABEL_11:

  return 0;
}

id UARPPersonalizationTSSRequestWithSigningServerSSO(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;

  v3 = a1;
  v4 = a2;
  String();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    UARPPersonalizationTSSRequestWithSigningServerSSO_cold_2();

  String(v3, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    String();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      UARPPersonalizationTSSRequestWithSigningServerSSO_cold_1();

  }
  return v6;
}

void String(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  String();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136446210;
    v5 = a2;
    _os_log_impl(&dword_24BC99000, v3, OS_LOG_TYPE_INFO, "UARP: Personalization Message >> %{public}s", (uint8_t *)&v4, 0xCu);
  }

}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_24BCB2868(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24BCB2C1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CoreUARPRestoreLogError(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v12;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 80))
    {
      v12 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x100004077774924uLL);
      vsnprintf(v12, 0x400uLL, a3, &a9);
      (*(void (**)(_QWORD, uint64_t, char *))(a1 + 80))(*(_QWORD *)(a1 + 1928), a2, v12);
      free(v12);
    }
  }
}

void CoreUARPRestoreLogInfo(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v12;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 88))
    {
      v12 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x100004077774924uLL);
      vsnprintf(v12, 0x400uLL, a3, &a9);
      (*(void (**)(_QWORD, uint64_t, char *))(a1 + 88))(*(_QWORD *)(a1 + 1928), a2, v12);
      free(v12);
    }
  }
}

void CoreUARPRestoreLogDebug(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v12;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 96))
    {
      v12 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x100004077774924uLL);
      vsnprintf(v12, 0x400uLL, a3, &a9);
      (*(void (**)(_QWORD, uint64_t, char *))(a1 + 96))(*(_QWORD *)(a1 + 1928), a2, v12);
      free(v12);
    }
  }
}

void CoreUARPRestoreLogFault(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v12;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 104))
    {
      v12 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x100004077774924uLL);
      vsnprintf(v12, 0x400uLL, a3, &a9);
      (*(void (**)(_QWORD, uint64_t, char *))(a1 + 104))(*(_QWORD *)(a1 + 1928), a2, v12);
      free(v12);
    }
  }
}

__n128 CoreUARPRestoreEndpointInitialize(_QWORD *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v10;
  __n128 result;
  char *v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  BOOL v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  *a1 = 0;
  v10 = (char *)uarpZalloc(0x898uLL);
  if (v10)
  {
    v12 = v10;
    *((_WORD *)v10 + 969) = 1;
    *((_QWORD *)v10 + 251) = a4;
    v13 = (__int128 *)(v10 + 112);
    if (a3)
    {
      v14 = *(_OWORD *)a3;
      v15 = *(_OWORD *)(a3 + 16);
      *((_DWORD *)v10 + 36) = *(_DWORD *)(a3 + 32);
      *v13 = v14;
      *((_OWORD *)v10 + 8) = v15;
      v16 = *((_WORD *)v10 + 64) == 0;
    }
    else
    {
      v16 = 0;
      *((_QWORD *)v10 + 14) = 0x800000008000;
      *((_DWORD *)v10 + 30) = 0x8000;
      *((_WORD *)v10 + 62) = 4;
      v10[126] = 0;
      *((_DWORD *)v10 + 32) = 264144;
      *((_WORD *)v10 + 66) = 1;
      *((_DWORD *)v10 + 34) = 0;
    }
    *((_QWORD *)v10 + 19) = 0;
    *((_QWORD *)v10 + 23) = fRestoreUARPSendMessage;
    *((_QWORD *)v10 + 24) = fRestoreUARPDataTransferPause;
    *((_QWORD *)v10 + 25) = fRestoreUARPDataTransferPauseAck;
    *((_QWORD *)v10 + 26) = fRestoreUARPDataTransferResume;
    *((_QWORD *)v10 + 27) = fRestoreUARPDataTransferResumeAck;
    *((_QWORD *)v10 + 28) = fRestoreUARPSuperBinaryOffered;
    *((_QWORD *)v10 + 29) = fRestoreUARPDynamicAssetOffered;
    *((_QWORD *)v10 + 30) = fRestoreUARPApplyStagedAssets;
    *((_QWORD *)v10 + 31) = fRestoreUARPApplyStagedAssetsResponse;
    *((_QWORD *)v10 + 32) = fRestoreUARPManufacturerName;
    *((_QWORD *)v10 + 33) = fRestoreUARPManufacturerNameResponse;
    *((_QWORD *)v10 + 34) = fRestoreUARPModelName;
    *((_QWORD *)v10 + 35) = fRestoreUARPModelNameResponse;
    *((_QWORD *)v10 + 36) = fRestoreUARPSerialNumber;
    *((_QWORD *)v10 + 37) = fRestoreUARPSerialNumberResponse;
    *((_QWORD *)v10 + 38) = fRestoreUARPHardwareVersion;
    *((_QWORD *)v10 + 39) = fRestoreUARPHardwareVersionResponse;
    *((_QWORD *)v10 + 40) = fRestoreUARPActiveFirmwareVersion2;
    *((_QWORD *)v10 + 41) = fRestoreUARPActiveFirmwareVersionResponse;
    *((_QWORD *)v10 + 42) = fRestoreUARPStagedFirmwareVersion2;
    *((_QWORD *)v10 + 43) = fRestoreUARPStagedFirmwareVersionResponse;
    *((_QWORD *)v10 + 44) = fRestoreUARPLastError;
    *((_QWORD *)v10 + 45) = fRestoreUARPLastErrorResponse;
    *((_QWORD *)v10 + 46) = fRestoreUARPStatisticsResponse;
    *((_QWORD *)v10 + 20) = 0;
    *((_QWORD *)v10 + 47) = fRestoreUARPAssetSolicitation;
    *((_QWORD *)v10 + 48) = fRestoreUARPRescindAllAssets;
    *((_QWORD *)v10 + 49) = fRestoreUARPRescindAllAssetsAck;
    if (!v16 && *((_WORD *)v10 + 65) && a4)
    {
      *((_QWORD *)v10 + 50) = fRestoreUARPTxWatchdogSet;
      *((_QWORD *)v10 + 51) = fRestoreUARPTxWatchdogCancel;
    }
    *((_QWORD *)v10 + 52) = fRestoreUARPProtocolVersion;
    *((_QWORD *)v10 + 53) = fRestoreUARPFriendlyName;
    *((_QWORD *)v10 + 54) = fRestoreUARPFriendlyNameResponse;
    *((_QWORD *)v10 + 62) = fRestoreUARPPlatformLogPacket;
    *((_QWORD *)v10 + 63) = CoreUARPRestoreLogError;
    *((_QWORD *)v10 + 64) = CoreUARPRestoreLogInfo;
    *((_QWORD *)v10 + 65) = CoreUARPRestoreLogDebug;
    *((_QWORD *)v10 + 66) = CoreUARPRestoreLogFault;
    *((_QWORD *)v10 + 73) = fRestoreUARPVendorSpecificRecvMsg;
    *((_QWORD *)v10 + 74) = fRestoreUARPVendorSpecificCheckExpectedResponse;
    *((_QWORD *)v10 + 75) = fRestoreUARPVendorSpecificCheckValidToSend;
    *((_QWORD *)v10 + 76) = fRestoreUARPVendorSpecificExceededRetries;
    *((_QWORD *)v10 + 159) = fRestoreUARPAppleModelNumberResponse;
    *((_QWORD *)v10 + 161) = fRestoreUARPHardwareFusingTypeResponse;
    *((_QWORD *)v10 + 163) = fRestoreUARPManifestPrefixResponse;
    *((_QWORD *)v10 + 165) = fRestoreUARPBoardIDResponse;
    *((_QWORD *)v10 + 167) = fRestoreUARPChipIDResponse;
    *((_QWORD *)v10 + 169) = fRestoreUARPChipRevisionResponse;
    *((_QWORD *)v10 + 171) = fRestoreUARPECIDResponse;
    *((_QWORD *)v10 + 173) = fRestoreUARPECIDDataResponse;
    *((_QWORD *)v10 + 175) = fRestoreUARPSecurityDomainResponse;
    *((_QWORD *)v10 + 177) = fRestoreUARPSecurityModeResponse;
    *((_QWORD *)v10 + 179) = fRestoreUARPProductionModeResponse;
    *((_QWORD *)v10 + 181) = fRestoreUARPChipEpochResponse;
    *((_QWORD *)v10 + 183) = fRestoreUARPEnableMixMatchResponse;
    *((_QWORD *)v10 + 185) = fRestoreUARPSocLiveNonceResponse;
    *((_QWORD *)v10 + 187) = fRestoreUARPPrefixNeedsLogicalUnitNumberResponse;
    *((_QWORD *)v10 + 189) = fRestoreUARPSuffixNeedsLogicalUnitNumberResponse;
    *((_QWORD *)v10 + 191) = fRestoreUARPLogicalUnitNumberResponse;
    *((_QWORD *)v10 + 193) = fRestoreUARPTicketLongNameResponse;
    *((_QWORD *)v10 + 195) = fRestoreUARPRequiresPersonalizationResponse;
    *((_QWORD *)v10 + 197) = fRestoreUARPApBoardIDResponse;
    *((_QWORD *)v10 + 199) = fRestoreUARPApChipIDResponse;
    *((_QWORD *)v10 + 201) = fRestoreUARPApProductionModeResponse;
    *((_QWORD *)v10 + 203) = fRestoreUARPApSecurityModeResponse;
    *((_QWORD *)v10 + 205) = fRestoreUARPHardwareSpecificResponse;
    *((_QWORD *)v10 + 207) = fRestoreUARPNonceResponse;
    *((_QWORD *)v10 + 209) = fRestoreUARPLifeResponse;
    *((_QWORD *)v10 + 211) = fRestoreUARPProvisioningResponse;
    *((_QWORD *)v10 + 213) = fRestoreUARPManifestEpochResponse;
    *((_QWORD *)v10 + 215) = fRestoreUARPManifestSuffixResponse;
    if (!uarpPlatformEndpointInit2(v10 + 648, (uint64_t)v10, 2u, v13, v10 + 152, (uint64_t)(v10 + 1256)))
    {
      v17 = *a2;
      v18 = a2[2];
      *((_OWORD *)v12 + 1) = a2[1];
      *((_OWORD *)v12 + 2) = v18;
      *(_OWORD *)v12 = v17;
      result = (__n128)a2[3];
      v19 = a2[4];
      v20 = a2[6];
      *((_OWORD *)v12 + 5) = a2[5];
      *((_OWORD *)v12 + 6) = v20;
      *((__n128 *)v12 + 3) = result;
      *((_OWORD *)v12 + 4) = v19;
      *((_QWORD *)v12 + 241) = a5;
      *a1 = v12;
    }
  }
  return result;
}

uint64_t fRestoreUARPSendMessage(uint64_t a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;

  if (!a1)
    return 30;
  uarpNtohs(*a3);
  uarpNtohs(a3[1]);
  uarpNtohs(a3[2]);
  CoreUARPRestoreLogDebug(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: UARP TX: Buffer = %p, Payload Length = %u, Type = 0x%04x, Total Length = %u, ID = %u", v7, v8, v9, v10, v11, (char)a3);
  v17 = (*(uint64_t (**)(_QWORD, unsigned __int16 *, uint64_t))a1)(*(_QWORD *)(a1 + 1928), a3, a4);
  if ((_DWORD)v17)
    CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: Failed to tx uarp message", v12, v13, v14, v15, v16, v19);
  return v17;
}

uint64_t fRestoreUARPDataTransferPause(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!a1)
    return 30;
  CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP.LAYER3.TRANSFER.PAUSE - Not Implemented", a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t fRestoreUARPDataTransferPauseAck(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!a1)
    return 30;
  CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP.LAYER3.TRANSFER.PAUSE.ACK - Not Implemented", a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t fRestoreUARPDataTransferResume(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!a1)
    return 30;
  CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP.LAYER3.TRANSFER.RESUME - Not Implemented", a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t fRestoreUARPDataTransferResumeAck(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!a1)
    return 30;
  CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP.LAYER3.TRANSFER.RESUME.ACK - Not Implemented", a4, a5, a6, a7, a8, vars0);
  return 0;
}

void fRestoreUARPSuperBinaryOffered(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
    CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP.LAYER3.OFFER.SUPERBINARY - Not Implemented", a4, a5, a6, a7, a8, a9);
}

void fRestoreUARPDynamicAssetOffered(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  int *v6;
  _BOOL4 v7;
  int *v8;
  _BOOL4 v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v22[14];

  v5 = uarpZalloc(0x148uLL);
  *v5 = a3;
  v5[1] = a1;
  v5[40] = *(_QWORD *)(a1 + 1920);
  *(_QWORD *)(a1 + 1920) = v5;
  memset(v22, 0, sizeof(v22));
  uarpZero(v22, 0xE0uLL);
  v6 = uarpAssetTagStructPersonalization();
  v7 = uarpAssetTagCompare((unsigned __int8 *)v6, (unsigned __int8 *)(a3 + 48));
  v8 = uarpAssetTagStructPersonalizedFirmware();
  v9 = uarpAssetTagCompare((unsigned __int8 *)v8, (unsigned __int8 *)(a3 + 48));
  if (v7)
  {
    CoreUARPRestoreSetAssetPersonalizationCallbacks((uint64_t)v22);
    goto LABEL_5;
  }
  if (v9)
  {
    CoreUARPRestoreSetAssetPersonalizedFirmwareCallbacks((uint64_t)v22);
LABEL_5:
    v10 = uarpPlatformEndpointAssetAccept(a1 + 648, a1 + 1728, a3, (uint64_t)v5, v22);
    if (v10)
      CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: Failed to accept superbinary; 0x%08x",
        v11,
        v12,
        v13,
        v14,
        v15,
        v10);
    return;
  }
  CoreUARPRestoreSetAssetCallbacks((uint64_t)v22);
  v16 = uarpPlatformEndpointAssetDeny(a1 + 648, a1 + 1728, a3, 3072, (uint64_t)v5, v22);
  if (v16)
    CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: Failed to deny unknown dynamic asset; 0x%08x",
      v17,
      v18,
      v19,
      v20,
      v21,
      v16);
}

uint64_t fRestoreUARPApplyStagedAssets(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!a1)
    return 30;
  CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP.LAYER3.APPLY.ASSETS - Not Implemented", a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t fRestoreUARPApplyStagedAssetsResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;

  if (!a1)
    return 30;
  CoreUARPRestoreLogInfo(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: Apply Staged Assets; status <0x%04x>, flags <0x%04x>",
    a4,
    a5,
    a6,
    a7,
    a8,
    a4);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 24);
  v17 = *(_QWORD *)(a1 + 1928);
  if (v16)
    v16(v17, a4, a3);
  else
    CoreUARPRestoreLogError(v17, 1, "UARP Restore: %s: fLayer3ApplyStatus is NULL", v11, v12, v13, v14, v15, (char)"CoreUARPRestoreAssetApplyStatus");
  return 0;
}

uint64_t fRestoreUARPManufacturerName()
{
  return 0;
}

void fRestoreUARPManufacturerNameResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 1944));
    *(_QWORD *)(a1 + 1944) = 0;
    if (a3 || a4)
    {
      v7 = uarpZalloc(a4 + 1);
      *(_QWORD *)(a1 + 1944) = v7;
      memcpy(v7, a3, a4);
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 56);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 1);
  }
}

uint64_t fRestoreUARPModelName()
{
  return 0;
}

void fRestoreUARPModelNameResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 1952));
    *(_QWORD *)(a1 + 1952) = 0;
    if (a3 || a4)
    {
      v7 = uarpZalloc(a4 + 1);
      *(_QWORD *)(a1 + 1952) = v7;
      memcpy(v7, a3, a4);
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 56);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 2);
  }
}

uint64_t fRestoreUARPSerialNumber()
{
  return 0;
}

void fRestoreUARPSerialNumberResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 1960));
    *(_QWORD *)(a1 + 1960) = 0;
    if (a3 || a4)
    {
      v7 = uarpZalloc(a4 + 1);
      *(_QWORD *)(a1 + 1960) = v7;
      memcpy(v7, a3, a4);
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 56);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 3);
  }
}

uint64_t fRestoreUARPHardwareVersion()
{
  return 0;
}

void fRestoreUARPHardwareVersionResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 1968));
    *(_QWORD *)(a1 + 1968) = 0;
    if (a3 || a4)
    {
      v7 = uarpZalloc(a4 + 1);
      *(_QWORD *)(a1 + 1968) = v7;
      memcpy(v7, a3, a4);
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 56);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 4);
  }
}

uint64_t fRestoreUARPActiveFirmwareVersion2()
{
  return 0;
}

_QWORD *fRestoreUARPActiveFirmwareVersionResponse(_QWORD *result, uint64_t a2, _OWORD *a3)
{
  _OWORD *v3;
  uint64_t (*v4)(_QWORD, uint64_t);

  if (result)
  {
    v3 = result + 247;
    if (a3)
    {
      *v3 = *a3;
    }
    else
    {
      *(_QWORD *)v3 = 0;
      result[248] = 0;
    }
    v4 = (uint64_t (*)(_QWORD, uint64_t))result[7];
    if (v4)
      return (_QWORD *)v4(result[241], 5);
  }
  return result;
}

uint64_t fRestoreUARPStagedFirmwareVersion2()
{
  return 0;
}

_QWORD *fRestoreUARPStagedFirmwareVersionResponse(_QWORD *result, uint64_t a2, _OWORD *a3)
{
  _OWORD *v3;
  uint64_t (*v4)(_QWORD, uint64_t);

  if (result)
  {
    v3 = result + 249;
    if (a3)
    {
      *v3 = *a3;
    }
    else
    {
      *(_QWORD *)v3 = 0;
      result[250] = 0;
    }
    v4 = (uint64_t (*)(_QWORD, uint64_t))result[7];
    if (v4)
      return (_QWORD *)v4(result[241], 6);
  }
  return result;
}

uint64_t fRestoreUARPLastError()
{
  return 0;
}

void fRestoreUARPLastErrorResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
    CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP.RESTORE.LAYER3.INFO.RESPONSE <Last Error> - Not Implemented", a4, a5, a6, a7, a8, a9);
}

void fRestoreUARPStatisticsResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
    CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP.RESTORE.LAYER3.INFO.RESPONSE <Statistics> - Not Implemented", a4, a5, a6, a7, a8, a9);
}

uint64_t fRestoreUARPAssetSolicitation()
{
  return 0;
}

uint64_t fRestoreUARPTxWatchdogSet(dispatch_queue_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  int64_t v10;
  dispatch_time_t v11;
  char v13;

  if (!a1)
    return 30;
  v8 = a3;
  CoreUARPRestoreCancelWatchdogTimer((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, v13);
  a1[252] = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, a1[251]);
  if (v8)
    v10 = 1000000 * v8;
  else
    v10 = 1;
  v11 = dispatch_time(0, v10);
  dispatch_set_context(a1[252], a1);
  dispatch_source_set_timer(a1[252], v11, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  dispatch_source_set_event_handler_f(a1[252], (dispatch_function_t)fRestoreUARPWatchdogExpire);
  dispatch_resume(a1[252]);
  return 0;
}

uint64_t fRestoreUARPTxWatchdogCancel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!a1)
    return 30;
  CoreUARPRestoreCancelWatchdogTimer(a1, a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t fRestoreUARPProtocolVersion(uint64_t result, uint64_t a2, __int16 a3)
{
  if (result)
    *(_WORD *)(result + 1938) = a3;
  return result;
}

uint64_t fRestoreUARPFriendlyName()
{
  return 0;
}

void fRestoreUARPFriendlyNameResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 2040));
    *(_QWORD *)(a1 + 2040) = 0;
    if (a3 || a4)
    {
      v7 = uarpZalloc(a4 + 1);
      *(_QWORD *)(a1 + 2040) = v7;
      memcpy(v7, a3, a4);
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 56);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 9);
  }
}

uint64_t fRestoreUARPVendorSpecificRecvMsg(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4, unsigned int *a5, unsigned int a6)
{
  if (a1)
    return uarpApplePlatformEndpointRecvMessage(a1 + 648, a1 + 1728, a3, a4, a5, a6);
  else
    return 30;
}

BOOL fRestoreUARPVendorSpecificCheckExpectedResponse(_BOOL8 result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if (result)
    return uarpApplePlatformMessageCheckExpectedResponse(result + 648, result + 1728, a3, a4, a5, a6);
  return result;
}

uint64_t fRestoreUARPVendorSpecificCheckValidToSend(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (result)
    return uarpApplePlatformMessageCheckValidToSend(result + 648, result + 1728, a3, a4);
  return result;
}

uint64_t fRestoreUARPVendorSpecificExceededRetries(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (result)
    return uarpApplePlatformMessageExceededRetries(result + 648, result + 1728, a3, a4);
  return result;
}

void fRestoreUARPAppleModelNumberResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 2024));
    *(_QWORD *)(a1 + 2024) = 0;
    if (a3 && a4)
    {
      v7 = uarpZalloc(a4 + 1);
      *(_QWORD *)(a1 + 2024) = v7;
      memcpy(v7, a3, a4);
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 64);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 1);
  }
}

void fRestoreUARPHardwareFusingTypeResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 2032));
    *(_QWORD *)(a1 + 2032) = 0;
    if (a3 && a4)
    {
      v7 = uarpZalloc(a4 + 1);
      *(_QWORD *)(a1 + 2032) = v7;
      memcpy(v7, a3, a4);
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 64);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 2);
  }
}

void fRestoreUARPManifestPrefixResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 2048));
    *(_QWORD *)(a1 + 2048) = 0;
    if (a3 && a4)
    {
      v7 = uarpZalloc(a4 + 1);
      *(_QWORD *)(a1 + 2048) = v7;
      memcpy(v7, a3, a4);
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 64);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 3);
  }
}

uint64_t fRestoreUARPBoardIDResponse(uint64_t result, uint64_t a2, _DWORD *a3, int a4)
{
  uint64_t (*v4)(_QWORD, uint64_t);

  if (result)
  {
    if (a3 && a4 == 4)
    {
      *(_DWORD *)(result + 2056) = *a3;
    }
    else if (a3 && a4 == 8)
    {
      *(_QWORD *)(result + 2056) = *(_QWORD *)a3;
    }
    else
    {
      *(_QWORD *)(result + 2056) = 0;
    }
    v4 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v4)
      return v4(*(_QWORD *)(result + 1928), 4);
  }
  return result;
}

uint64_t fRestoreUARPChipIDResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  int v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 4)
      v4 = *a3;
    *(_DWORD *)(result + 2064) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 5);
  }
  return result;
}

uint64_t fRestoreUARPChipRevisionResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  int v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 4)
      v4 = *a3;
    *(_DWORD *)(result + 2068) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 6);
  }
  return result;
}

_QWORD *fRestoreUARPECIDResponse(_QWORD *result, uint64_t a2, uint64_t *a3, int a4)
{
  uint64_t v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 8)
      v4 = *a3;
    result[259] = v4;
    v5 = (uint64_t (*)(_QWORD, uint64_t))result[8];
    if (v5)
      return (_QWORD *)v5(result[241], 7);
  }
  return result;
}

void fRestoreUARPECIDDataResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 2080));
    *(_QWORD *)(a1 + 2080) = 0;
    *(_DWORD *)(a1 + 2088) = 0;
    if (a3 && a4)
    {
      *(_DWORD *)(a1 + 2088) = a4;
      v7 = uarpZalloc(a4);
      *(_QWORD *)(a1 + 2080) = v7;
      memcpy(v7, a3, *(unsigned int *)(a1 + 2088));
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 64);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 29);
  }
}

uint64_t fRestoreUARPSecurityDomainResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  int v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 4)
      v4 = *a3;
    *(_DWORD *)(result + 2092) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 8);
  }
  return result;
}

uint64_t fRestoreUARPSecurityModeResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  int v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 4)
      v4 = *a3;
    *(_DWORD *)(result + 2096) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 9);
  }
  return result;
}

uint64_t fRestoreUARPProductionModeResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  int v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 4)
      v4 = *a3;
    *(_DWORD *)(result + 2100) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 10);
  }
  return result;
}

uint64_t fRestoreUARPChipEpochResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  int v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 4)
      v4 = *a3;
    *(_DWORD *)(result + 2104) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 11);
  }
  return result;
}

uint64_t fRestoreUARPEnableMixMatchResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  char v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 1)
      v4 = *a3;
    *(_BYTE *)(result + 2108) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 12);
  }
  return result;
}

uint64_t fRestoreUARPSocLiveNonceResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  char v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 1)
      v4 = *a3;
    *(_BYTE *)(result + 2109) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 13);
  }
  return result;
}

uint64_t fRestoreUARPPrefixNeedsLogicalUnitNumberResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  char v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 1)
      v4 = *a3;
    *(_BYTE *)(result + 2110) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 14);
  }
  return result;
}

uint64_t fRestoreUARPSuffixNeedsLogicalUnitNumberResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  char v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 1)
      v4 = *a3;
    *(_BYTE *)(result + 2111) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 15);
  }
  return result;
}

uint64_t fRestoreUARPLogicalUnitNumberResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  int v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 4)
      v4 = *a3;
    *(_DWORD *)(result + 2112) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 16);
  }
  return result;
}

void fRestoreUARPTicketLongNameResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 2120));
    *(_QWORD *)(a1 + 2120) = 0;
    if (a3 && a4)
    {
      v7 = uarpZalloc(a4 + 1);
      *(_QWORD *)(a1 + 2120) = v7;
      memcpy(v7, a3, a4);
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 64);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 17);
  }
}

uint64_t fRestoreUARPRequiresPersonalizationResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  char v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 1)
      v4 = *a3;
    *(_BYTE *)(result + 2128) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 18);
  }
  return result;
}

uint64_t fRestoreUARPApBoardIDResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  int v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 4)
      v4 = *a3;
    *(_DWORD *)(result + 2132) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 19);
  }
  return result;
}

uint64_t fRestoreUARPApChipIDResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  int v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 4)
      v4 = *a3;
    *(_DWORD *)(result + 2136) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 20);
  }
  return result;
}

uint64_t fRestoreUARPApProductionModeResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  int v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 4)
      v4 = *a3;
    *(_DWORD *)(result + 2140) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 21);
  }
  return result;
}

uint64_t fRestoreUARPApSecurityModeResponse(uint64_t result, uint64_t a2, int *a3, int a4)
{
  int v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 4)
      v4 = *a3;
    *(_DWORD *)(result + 2144) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 22);
  }
  return result;
}

void fRestoreUARPHardwareSpecificResponse(uint64_t a1, uint64_t a2, const void *a3, int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 2152));
    *(_QWORD *)(a1 + 2152) = 0;
    *(_DWORD *)(a1 + 2160) = 0;
    if (a3 && a4)
    {
      *(_DWORD *)(a1 + 2160) = a4;
      v7 = uarpZalloc((a4 + 1));
      *(_QWORD *)(a1 + 2152) = v7;
      memcpy(v7, a3, *(unsigned int *)(a1 + 2160));
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 64);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 23);
  }
}

void fRestoreUARPNonceResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 2168));
    *(_QWORD *)(a1 + 2168) = 0;
    *(_DWORD *)(a1 + 2176) = 0;
    if (a3 && a4)
    {
      *(_DWORD *)(a1 + 2176) = a4;
      v7 = uarpZalloc(a4);
      *(_QWORD *)(a1 + 2168) = v7;
      memcpy(v7, a3, *(unsigned int *)(a1 + 2176));
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 64);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 24);
  }
}

uint64_t fRestoreUARPLifeResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  char v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 1)
      v4 = *a3;
    *(_BYTE *)(result + 2180) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 25);
  }
  return result;
}

uint64_t fRestoreUARPProvisioningResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  char v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 1)
      v4 = *a3;
    *(_BYTE *)(result + 2182) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 26);
  }
  return result;
}

uint64_t fRestoreUARPManifestEpochResponse(uint64_t result, uint64_t a2, char *a3, int a4)
{
  char v4;
  uint64_t (*v5)(_QWORD, uint64_t);

  if (result)
  {
    v4 = 0;
    if (a3 && a4 == 1)
      v4 = *a3;
    *(_BYTE *)(result + 2181) = v4;
    v5 = *(uint64_t (**)(_QWORD, uint64_t))(result + 64);
    if (v5)
      return v5(*(_QWORD *)(result + 1928), 27);
  }
  return result;
}

void fRestoreUARPManifestSuffixResponse(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4)
{
  void *v7;
  void (*v8)(_QWORD, uint64_t);

  if (a1)
  {
    uarpFree(*(void **)(a1 + 2184));
    *(_QWORD *)(a1 + 2184) = 0;
    if (a3 && a4)
    {
      v7 = uarpZalloc(a4 + 1);
      *(_QWORD *)(a1 + 2184) = v7;
      memcpy(v7, a3, a4);
    }
    v8 = *(void (**)(_QWORD, uint64_t))(a1 + 64);
    if (v8)
      v8(*(_QWORD *)(a1 + 1928), 28);
  }
}

uint64_t CoreUARPRestoreEndpointRemoteEndpointAdd(uint64_t a1)
{
  return uarpPlatformRemoteEndpointAdd(a1 + 648, a1 + 1728, (__int128 *)(a1 + 112), a1);
}

uint64_t CoreUARPRestoreEndpointRemoteEndpointRemove(uint64_t a1)
{
  return uarpPlatformRemoteEndpointRemove(a1 + 648, a1 + 1728);
}

uint64_t CoreUARPRestoreEndpointOfferSuperBinary(uint64_t a1, const char *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  FILE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;

  v4 = uarpZalloc(0x148uLL);
  if (!v4)
  {
    CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: Failed to allocate restore asset", v5, v6, v7, v8, v9, v25);
    return 11;
  }
  v10 = v4;
  v11 = fopen(a2, "r");
  *((_QWORD *)v10 + 2) = v11;
  if (!v11)
  {
    CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: Failed to open file %s", v12, v13, v14, v15, v16, (char)a2);
    uarpFree(v10);
    return 11;
  }
  fseek(v11, 0, 2);
  *((_DWORD *)v10 + 77) = MEMORY[0x24BD2FC38](*((_QWORD *)v10 + 2));
  fseek(*((FILE **)v10 + 2), 0, 0);
  CoreUARPRestoreEndpointOfferSuperBinaryCommon(a1, (uint64_t *)v10);
  v23 = v22;
  if ((_DWORD)v22)
  {
    CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: Failed to offer superbinary", v17, v18, v19, v20, v21, v25);
    fclose(*((FILE **)v10 + 2));
    uarpFree(v10);
  }
  return v23;
}

void CoreUARPRestoreEndpointOfferSuperBinaryCommon(uint64_t a1, uint64_t *a2)
{
  int v4;
  _OWORD v5[14];

  memset(v5, 0, sizeof(v5));
  CoreUARPRestoreSetAssetCallbacks((uint64_t)v5);
  uarpPlatformEndpointPrepareSuperBinary(a1 + 648, a1 + 1728, (uint64_t)a2, (uint64_t)v5);
  if (!v4)
  {
    *a2 = uarpPlatformAssetFindByAssetContextAndList(a1 + 648, (uint64_t)a2, 1);
    if (!uarpPlatformEndpointOfferAsset(a1 + 648, a1 + 1728, (uint64_t)a2))
    {
      a2[40] = *(_QWORD *)(a1 + 1912);
      *(_QWORD *)(a1 + 1912) = a2;
    }
  }
}

uint64_t CoreUARPRestoreEndpointOfferSuperBinaryBuffer(uint64_t a1, uint64_t a2, int a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = uarpZalloc(0x148uLL);
  if (!v6)
    return 11;
  v7 = v6;
  *((_QWORD *)v6 + 35) = a2;
  *((_DWORD *)v6 + 77) = a3;
  CoreUARPRestoreEndpointOfferSuperBinaryCommon(a1, (uint64_t *)v6);
  v9 = v8;
  if ((_DWORD)v8)
    uarpFree(v7);
  return v9;
}

uint64_t CoreUARPRestoreEndpointMsgRecv(uint64_t a1, unsigned __int16 *a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  uarpNtohs(*a2);
  uarpNtohs(a2[1]);
  uarpNtohs(a2[2]);
  CoreUARPRestoreLogDebug(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: UARP RX: Buffer = %p, Payload Length = %u, Type = 0x%04x, Total Length = %u, ID = %u", v6, v7, v8, v9, v10, (char)a2);
  v16 = uarpPlatformEndpointRecvMessage(a1 + 648, a1 + 1728, a2, a3);
  if ((_DWORD)v16)
    CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: Failed to process rx uarp message", v11, v12, v13, v14, v15, v18);
  return v16;
}

uint64_t CoreUARPRestoreEndpointDataRecv(uint64_t a1, char *a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = uarpPlatformEndpointStreamingRecvBytes(a1 + 648, a1 + 1728, a2, a3);
  if ((_DWORD)v9)
    CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "uarpPlatformEndpointStreamingRecvBytes() failed; 0x%08x",
      v4,
      v5,
      v6,
      v7,
      v8,
      v9);
  return v9;
}

uint64_t CoreUARPRestoreEndpointRemoteEndpointApplyStagedAssets(uint64_t a1)
{
  return uarpPlatformEndpointApplyStagedAssets(a1 + 648, a1 + 1728);
}

uint64_t CoreUARPRestoreEndpointRemoteEndpointRescindAssets(uint64_t a1)
{
  return uarpPlatformEndpointRescindAllAssets(a1 + 648, a1 + 1728);
}

uint64_t CoreUARPRestoreEndpointQueryAppleProperty(uint64_t a1, unsigned int a2)
{
  __int16 *v3;
  int v5;

  v5 = uarpHtonl(a2);
  v3 = uarpOuiAppleGenericFeatures();
  return uarpPlatformEndpointSendVendorSpecific(a1 + 648, a1 + 1728, v3, 0x20u, &v5, 4u);
}

void CoreUARPRestoreAssetTransferProgress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int *v12;

  if (a1)
  {
    if (a2)
    {
      if (*(_QWORD *)a2)
      {
        if (*(_QWORD *)(a1 + 8))
        {
          v12 = uarpAssetTagStructSuperBinary();
          if (uarpAssetTagCompare((unsigned __int8 *)v12, (unsigned __int8 *)(*(_QWORD *)a2 + 48)))
            (*(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 1928), a3, a4);
        }
        else
        {
          CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: %s: fLayer3FirmwareStageProgress is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferProgress");
        }
      }
      else
      {
        CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: %s: pAsset->_pAsset is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferProgress");
      }
    }
    else
    {
      CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: %s: pAsset is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferProgress");
    }
  }
  else
  {
    CoreUARPRestoreLogError(MEMORY[0x788], 1, "UARP Restore: %s: pEndpoint is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferProgress");
  }
}

void CoreUARPRestoreAssetTransferStatus(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int *v11;

  if (a1)
  {
    if (a2)
    {
      if (*(_QWORD *)(a1 + 16))
      {
        v11 = uarpAssetTagStructSuperBinary();
        if (uarpAssetTagCompare((unsigned __int8 *)v11, (unsigned __int8 *)(*(_QWORD *)a2 + 48)))
          (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 1928), a3, a3 & 0xFF00);
      }
      else
      {
        CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: %s: fLayer3FirmwareStageStatus is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferStatus");
      }
    }
    else
    {
      CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP Restore: %s: pAsset is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferStatus");
    }
  }
  else
  {
    CoreUARPRestoreLogError(MEMORY[0x788], 1, "UARP Restore: %s: pEndpoint is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetTransferStatus");
  }
}

void CoreUARPRestoreAssetApplyStatus(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void (*v8)(uint64_t);
  uint64_t v9;

  if (a1)
  {
    v8 = *(void (**)(uint64_t))(a1 + 24);
    v9 = *(_QWORD *)(a1 + 1928);
    if (v8)
      v8(v9);
    else
      CoreUARPRestoreLogError(v9, 1, "UARP Restore: %s: fLayer3ApplyStatus is NULL", 0, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetApplyStatus");
  }
  else
  {
    CoreUARPRestoreLogError(MEMORY[0x788], 1, "UARP Restore: %s: pEndpoint is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetApplyStatus");
  }
}

void CoreUARPRestoreAssetRescindStatus(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void (*v8)(uint64_t);
  uint64_t v9;

  if (a1)
  {
    v8 = *(void (**)(uint64_t))(a1 + 32);
    v9 = *(_QWORD *)(a1 + 1928);
    if (v8)
      v8(v9);
    else
      CoreUARPRestoreLogError(v9, 1, "UARP Restore: %s: fLayer3RescindStatus is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetRescindStatus");
  }
  else
  {
    CoreUARPRestoreLogError(MEMORY[0x788], 1, "UARP Restore: %s: pEndpoint is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetRescindStatus");
  }
}

void CoreUARPRestoreAssetPersonalizedFirmware(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void (*v8)(uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t v9;

  if (a1)
  {
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 72);
    v9 = *(_QWORD *)(a1 + 1928);
    if (v8)
      v8(v9, a2, a3, 0);
    else
      CoreUARPRestoreLogError(v9, 1, "UARP Restore: %s: fLayer3PersonalizedFirmware is NULL", a4, 0, a6, a7, a8, (char)"CoreUARPRestoreAssetPersonalizedFirmware");
  }
  else
  {
    CoreUARPRestoreLogError(MEMORY[0x788], 1, "UARP Restore: %s: pEndpoint is NULL", a4, a5, a6, a7, a8, (char)"CoreUARPRestoreAssetPersonalizedFirmware");
  }
}

uint64_t CoreUARPRestoreEndpointPropertyManufacturerName(uint64_t a1)
{
  return *(_QWORD *)(a1 + 1944);
}

uint64_t CoreUARPRestoreEndpointPropertyModelName(uint64_t a1)
{
  return *(_QWORD *)(a1 + 1952);
}

uint64_t CoreUARPRestoreEndpointPropertySerialNumber(uint64_t a1)
{
  return *(_QWORD *)(a1 + 1960);
}

uint64_t CoreUARPRestoreEndpointPropertyHadwareVersion(uint64_t a1)
{
  return *(_QWORD *)(a1 + 1968);
}

uint64_t CoreUARPRestoreEndpointPropertyActiveFirmwareVersion(uint64_t a1)
{
  return a1 + 1976;
}

uint64_t CoreUARPRestoreEndpointPropertyStagedFirmwareVersion(uint64_t a1)
{
  return a1 + 1992;
}

uint64_t CoreUARPRestoreEndpointPropertyFriendlyName(uint64_t a1)
{
  return *(_QWORD *)(a1 + 2040);
}

uint64_t CoreUARPRestoreEndpointPropertyAppleModelNumber(uint64_t a1)
{
  return *(_QWORD *)(a1 + 2024);
}

uint64_t CoreUARPRestoreEndpointPropertyHardwareFusing(uint64_t a1)
{
  return *(_QWORD *)(a1 + 2032);
}

void CoreUARPRestoreCancelWatchdogTimer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = *(NSObject **)(a1 + 2016);
  if (v10)
  {
    dispatch_source_cancel(v10);
    dispatch_release(*(dispatch_object_t *)(a1 + 2016));
    *(_QWORD *)(a1 + 2016) = 0;
    CoreUARPRestoreLogError(*(_QWORD *)(a1 + 1928), 1, "UARP.LAYER3.WATCHDOG.CANCEL", v11, v12, v13, v14, v15, a9);
  }
}

uint64_t fRestoreUARPWatchdogExpire(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;

  if (result)
  {
    v8 = result;
    CoreUARPRestoreLogDebug(*(_QWORD *)(result + 1928), 1, "UARP.RESTORE.LAYER3.WATCHDOG.EXPIRE", a4, a5, a6, a7, a8, v16);
    CoreUARPRestoreCancelWatchdogTimer(v8, v9, v10, v11, v12, v13, v14, v15, v17);
    return uarpPlatformEndpointWatchDogExpired(v8 + 648, v8 + 1728);
  }
  return result;
}

uint64_t uarpPlatformEndpointInit2(char *a1, uint64_t a2, unsigned int a3, __int128 *a4, const void *a5, uint64_t a6)
{
  return uarpPlatformEndpointInit(a1, a2, a3, a4, a5, a6, 0);
}

uint64_t uarpPlatformEndpointInit(char *a1, uint64_t a2, unsigned int a3, __int128 *a4, const void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  __int128 v15;
  __int128 v16;

  result = 30;
  if (a3 <= 2 && a2 && a1 && a4 && a5)
  {
    uarpZero(a1, 0x260uLL);
    memcpy(a1 + 48, a5, 0x1F0uLL);
    *((_QWORD *)a1 + 68) = a2;
    *((_QWORD *)a1 + 5) = a6;
    *((_DWORD *)a1 + 144) = 1;
    *((_QWORD *)a1 + 74) = a7;
    v16 = *a4;
    v15 = a4[1];
    *((_DWORD *)a1 + 8) = *((_DWORD *)a4 + 8);
    *(_OWORD *)a1 = v16;
    *((_OWORD *)a1 + 1) = v15;
    if (!*((_WORD *)a1 + 6))
      *((_WORD *)a1 + 6) = 4;
    result = 0;
    *((_DWORD *)a1 + 138) = a3;
    a1[580] = 0;
    *((_DWORD *)a1 + 146) = 1;
    *((_WORD *)a1 + 300) = 1;
  }
  return result;
}

uint64_t uarpPlatformRemoteEndpointAdd(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  unsigned int v11;
  int v12;
  int v13;
  unint64_t v14;
  int v15;

  result = 30;
  if (a1)
  {
    if (a2)
    {
      if (a4)
      {
        *(_QWORD *)(a2 + 40) = a4;
        v7 = *(_OWORD *)a1;
        v8 = *(_OWORD *)(a1 + 16);
        *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 32);
        *(_OWORD *)a2 = v7;
        *(_OWORD *)(a2 + 16) = v8;
        if (!a3
          || (v10 = *a3,
              v9 = a3[1],
              *(_DWORD *)(a2 + 32) = *((_DWORD *)a3 + 8),
              *(_OWORD *)a2 = v10,
              *(_OWORD *)(a2 + 16) = v9,
              (v11 = *(_DWORD *)(a2 + 4)) != 0)
          && *(_DWORD *)a2
          && *(_DWORD *)(a2 + 8) >= v11)
        {
          if (!*(_WORD *)(a2 + 12))
            *(_WORD *)(a2 + 12) = *(_WORD *)(a1 + 12);
          *(_WORD *)(a2 + 48) = 0;
          v12 = *(_DWORD *)(a1 + 584);
          *(_DWORD *)(a1 + 584) = v12 + 1;
          *(_DWORD *)(a2 + 52) = v12;
          *(_BYTE *)(a2 + 56) = 1;
          *(_DWORD *)(a2 + 58) = 1;
          if (!*(_WORD *)(a2 + 28)
            || (result = UARPLayer2RequestBuffer(a1, (_QWORD *)(a2 + 80), 4 * *(unsigned __int16 *)(a2 + 28)), !(_DWORD)result))
          {
            result = uarpPlatformRemoteEndpointAddEntry(a1, a2);
            if (!(_DWORD)result)
            {
              v13 = *(unsigned __int16 *)(a2 + 20);
              if (!*(_WORD *)(a2 + 20))
              {
                v13 = 1;
                *(_WORD *)(a2 + 20) = 1;
              }
              *(_WORD *)(a2 + 96) = v13;
              result = UARPLayer2RequestBuffer(a1, (_QWORD *)(a2 + 104), 8 * v13);
              if (!(_DWORD)result)
              {
                if (*(_WORD *)(a2 + 96))
                {
                  v14 = 0;
                  do
                    *(_QWORD *)(*(_QWORD *)(a2 + 104) + 8 * v14++) = uarpAllocateTransmitBuffer2(a1, a2, 0);
                  while (v14 < *(unsigned __int16 *)(a2 + 96));
                }
                v15 = *(unsigned __int16 *)(a2 + 20);
                *(_WORD *)(a2 + 112) = v15;
                result = UARPLayer2RequestBuffer(a1, (_QWORD *)(a2 + 120), 8 * v15);
                if (!(_DWORD)result)
                {
                  if ((*(_DWORD *)(a1 + 552) - 1) > 1)
                    return 0;
                  result = uarpPlatformEndpointSendSyncMsg(a1, a2);
                  if (!(_DWORD)result)
                  {
                    if (*(_DWORD *)(a1 + 552) != 2)
                      return 0;
                    result = uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
                    if (!(_DWORD)result)
                      return 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t uarpPlatformRemoteEndpointRemove(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = 30;
  if (a1 && a2)
  {
    uarpTransmitQueuesCleanup(a1, a2);
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 1);
    v5 = *(unsigned int *)(a1 + 556);
    if ((_DWORD)v5)
    {
      v6 = 0;
      v7 = 8 * v5;
      do
      {
        v8 = *(_QWORD *)(a1 + 560);
        if (*(_QWORD *)(v8 + v6) == a2)
          *(_QWORD *)(v8 + v6) = 0;
        v6 += 8;
      }
      while (v7 != v6);
    }
    uarpPlatformEndpointStreamingRecvDeinit(a1, a2);
    UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 80));
    result = 0;
    *(_QWORD *)(a2 + 80) = 0;
  }
  return result;
}

uint64_t uarpPlatformEndpointRequestInfoProperty(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a1 && a2 && a3 - 10 >= 0xFFFFFFF7)
    return uarpSendInformationRequest(a1, a2, a3);
  else
    return 30;
}

uint64_t uarpPlatformEndpointAssetIsAcceptable(_QWORD *a1, uint64_t a2, _BYTE *a3, __int16 *a4)
{
  uint64_t ActiveFirmwareVersion;
  int v9;
  int v10;
  BOOL v11;
  __int16 v12;
  __int16 v13;
  _QWORD v15[2];
  _QWORD v16[2];

  ActiveFirmwareVersion = 30;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          *a3 = 1;
          *a4 = 0;
          v16[0] = 0;
          v16[1] = 0;
          ActiveFirmwareVersion = uarpPlatformEndpointQueryActiveFirmwareVersion(a1, a2, v16);
          if (!(_DWORD)ActiveFirmwareVersion)
          {
            v9 = uarpVersionCompare(v16, (_DWORD *)(a2 + 52));
            if (v9 == 1)
            {
              v15[0] = 0;
              v15[1] = 0;
              ActiveFirmwareVersion = uarpPlatformEndpointQueryStagedFirmwareVersion(a1, a2, v15);
              if ((_DWORD)ActiveFirmwareVersion)
                return ActiveFirmwareVersion;
              v10 = uarpVersionCompare(v15, (_DWORD *)(a2 + 52));
              if (v10 == 1)
                return ActiveFirmwareVersion;
              *a3 = 0;
              v11 = v10 == 0;
              v12 = 1280;
              v13 = 768;
            }
            else
            {
              ActiveFirmwareVersion = 0;
              *a3 = 0;
              v11 = v9 == 0;
              v12 = 1536;
              v13 = 1024;
            }
            if (v11)
              v12 = v13;
            *a4 = v12;
          }
        }
      }
    }
  }
  return ActiveFirmwareVersion;
}

uint64_t uarpPlatformEndpointAssetAccept(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, 0, 0, 0, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadWindow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, a6, a7, 0, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7, uint64_t a8, unsigned int a9)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  int v28;
  _QWORD *v29;
  unsigned int v30;

  result = 30;
  if (a1 && a2 && a3 && (!a6 || a7 && *(_DWORD *)(a2 + 8) <= a7) && (!a8 || a9 && *(_DWORD *)(a2 + 8) <= a9))
  {
    v15 = *(_QWORD *)(a1 + 568);
    if (v15)
    {
      v16 = *(_QWORD *)(a1 + 568);
      while (v16 != a3 || *(_DWORD *)(v16 + 304))
      {
        v16 = *(_QWORD *)(v16 + 712);
        if (!v16)
          goto LABEL_15;
      }
    }
    else
    {
LABEL_15:
      *(_QWORD *)(a3 + 712) = v15;
      *(_QWORD *)(a1 + 568) = a3;
    }
    if (a4)
      *(_QWORD *)(a3 + 704) = a4;
    *(_WORD *)(a3 + 72) = 0;
    if (!a5)
      return 30;
    v17 = a5[1];
    *(_OWORD *)(a3 + 80) = *a5;
    *(_OWORD *)(a3 + 96) = v17;
    v18 = a5[2];
    v19 = a5[3];
    v20 = a5[5];
    *(_OWORD *)(a3 + 144) = a5[4];
    *(_OWORD *)(a3 + 160) = v20;
    *(_OWORD *)(a3 + 112) = v18;
    *(_OWORD *)(a3 + 128) = v19;
    v21 = a5[6];
    v22 = a5[7];
    v23 = a5[9];
    *(_OWORD *)(a3 + 208) = a5[8];
    *(_OWORD *)(a3 + 224) = v23;
    *(_OWORD *)(a3 + 176) = v21;
    *(_OWORD *)(a3 + 192) = v22;
    v24 = a5[10];
    v25 = a5[11];
    v26 = a5[13];
    *(_OWORD *)(a3 + 272) = a5[12];
    *(_OWORD *)(a3 + 288) = v26;
    *(_OWORD *)(a3 + 240) = v24;
    *(_OWORD *)(a3 + 256) = v25;
    if (a6)
    {
      if (!*(_BYTE *)(a3 + 652))
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 640));
      *(_QWORD *)(a3 + 640) = a6;
      *(_DWORD *)(a3 + 648) = a7;
      *(_BYTE *)(a3 + 652) = 1;
    }
    else if (!*(_QWORD *)(a3 + 640))
    {
      v29 = (_QWORD *)(a3 + 640);
      *(_BYTE *)(a3 + 652) = 0;
      v30 = *(_DWORD *)(a2 + 8);
      *(_DWORD *)(a3 + 648) = v30;
      result = UARPLayer2RequestBuffer(a1, (_QWORD *)(a3 + 640), v30);
      if ((_DWORD)result)
        return result;
      if (!*v29)
        return 11;
    }
    if (a8)
    {
      if (!*(_BYTE *)(a3 + 668))
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 656));
      *(_QWORD *)(a3 + 656) = a8;
      *(_DWORD *)(a3 + 664) = a9;
      v27 = 1;
    }
    else
    {
      v27 = 0;
    }
    *(_BYTE *)(a3 + 668) = v27;
    if (uarpVersionCompare((_DWORD *)(a3 + 52), (_DWORD *)(a3 + 12))
      || *(_DWORD *)(a3 + 68) != *(_DWORD *)(a3 + 8))
    {
      return uarpPlatformAssetSuperBinaryPullHeader(a1, a3);
    }
    else if (*(_DWORD *)(a3 + 688) == *(_DWORD *)(a3 + 32))
    {
      v28 = *(_DWORD *)(a3 + 452);
      if (v28 == -1)
      {
        UARPLayer2AssetMetaDataComplete(a1, a3);
        return 0;
      }
      else if (v28 == *(_DWORD *)(a3 + 456))
      {
        if (*(_DWORD *)(a3 + 512) == *(_DWORD *)(a3 + 492))
        {
          if (*(_DWORD *)(a3 + 508))
            return uarpPlatformAssetRequestData(a1, a3, a3 + 312);
          result = uarpPlatformAssetPayloadPullData(a1, a3);
          if (!(_DWORD)result)
            return uarpPlatformAssetRequestData(a1, a3, a3 + 312);
        }
        else
        {
          return uarpPlatformAssetPayloadPullMetaData(a1, a3);
        }
      }
      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(a1, a3);
      }
    }
    else
    {
      return uarpPlatformAssetSuperBinaryPullMetaData(a1, a3);
    }
  }
  return result;
}

__n128 uarpPlatformEndpointAssetSetCallbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;
  __int128 v11;
  __int128 v12;

  if (a1 && a2)
  {
    if (a3)
    {
      v3 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(a2 + 80) = *(_OWORD *)a3;
      *(_OWORD *)(a2 + 96) = v3;
      v4 = *(_OWORD *)(a3 + 32);
      v5 = *(_OWORD *)(a3 + 48);
      v6 = *(_OWORD *)(a3 + 80);
      *(_OWORD *)(a2 + 144) = *(_OWORD *)(a3 + 64);
      *(_OWORD *)(a2 + 160) = v6;
      *(_OWORD *)(a2 + 112) = v4;
      *(_OWORD *)(a2 + 128) = v5;
      v7 = *(_OWORD *)(a3 + 96);
      v8 = *(_OWORD *)(a3 + 112);
      v9 = *(_OWORD *)(a3 + 144);
      *(_OWORD *)(a2 + 208) = *(_OWORD *)(a3 + 128);
      *(_OWORD *)(a2 + 224) = v9;
      *(_OWORD *)(a2 + 176) = v7;
      *(_OWORD *)(a2 + 192) = v8;
      result = *(__n128 *)(a3 + 160);
      v11 = *(_OWORD *)(a3 + 176);
      v12 = *(_OWORD *)(a3 + 208);
      *(_OWORD *)(a2 + 272) = *(_OWORD *)(a3 + 192);
      *(_OWORD *)(a2 + 288) = v12;
      *(__n128 *)(a2 + 240) = result;
      *(_OWORD *)(a2 + 256) = v11;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetDeny(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, _OWORD *a6)
{
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v6 = 30;
  if (a1 && a2 && a3)
  {
    if (a5)
      *(_QWORD *)(a3 + 704) = a5;
    if (a6)
    {
      v8 = a6[1];
      *(_OWORD *)(a3 + 80) = *a6;
      *(_OWORD *)(a3 + 96) = v8;
      v9 = a6[2];
      v10 = a6[3];
      v11 = a6[5];
      *(_OWORD *)(a3 + 144) = a6[4];
      *(_OWORD *)(a3 + 160) = v11;
      *(_OWORD *)(a3 + 112) = v9;
      *(_OWORD *)(a3 + 128) = v10;
      v12 = a6[6];
      v13 = a6[7];
      v14 = a6[9];
      *(_OWORD *)(a3 + 208) = a6[8];
      *(_OWORD *)(a3 + 224) = v14;
      *(_OWORD *)(a3 + 176) = v12;
      *(_OWORD *)(a3 + 192) = v13;
      v15 = a6[10];
      v16 = a6[11];
      v17 = a6[13];
      *(_OWORD *)(a3 + 272) = a6[12];
      *(_OWORD *)(a3 + 288) = v17;
      *(_OWORD *)(a3 + 240) = v15;
      *(_OWORD *)(a3 + 256) = v16;
      v6 = uarpAssetProcessingComplete(a1, a2, a3, a4 | 2u);
      if (!(_DWORD)v6)
        *(_BYTE *)(a3 + 72) = 1;
    }
    else
    {
      return 30;
    }
  }
  return v6;
}

uint64_t uarpPlatformEndpointAssetAbandon(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, a2, a3, 3u, a4, 1);
}

uint64_t uarpPlatformEndpointAssetCorrupt(uint64_t a1, uint64_t a2)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, *(_QWORD *)(a2 + 696), a2, 4u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = uarpPlatformAssetFindByAssetContext(a1, *(_QWORD *)(a3 + 704));
  return uarpPlatformAssetProcessingCompleteInternal(a1, 0, v4, 1u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = uarpPlatformAssetFindByAssetContext(a1, a3);
  return uarpPlatformAssetProcessingCompleteInternal(a1, 0, v4, 1u, 0, 1);
}

uint64_t uarpPlatformAssetFindByAssetContext(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 568);
    if (v4)
    {
      result = v4;
      while (*(_DWORD *)(result + 304) != 1 || *(_QWORD *)(result + 704) != a2)
      {
        result = *(_QWORD *)(result + 712);
        if (!result)
        {
          while (v4)
          {
            if (!*(_DWORD *)(v4 + 304) && *(_QWORD *)(v4 + 704) == a2)
              return v4;
            v4 = *(_QWORD *)(v4 + 712);
          }
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryNumberOfPayloads(uint64_t a1, uint64_t a2, _WORD *a3)
{
  uint64_t result;

  result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      result = 0;
      *a3 = *(_DWORD *)(a2 + 448);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryFormatVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result;

  result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      result = 0;
      *a3 = *a2;
    }
  }
  return result;
}

__n128 uarpPlatformEndpointAssetQueryAssetVersion(uint64_t a1, uint64_t a2, __n128 *a3)
{
  __n128 result;

  if (a1 && a2)
  {
    if (a3)
    {
      result = *(__n128 *)(a2 + 12);
      *a3 = result;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;

  result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      result = 0;
      *a3 = *(_DWORD *)(a2 + 68);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;

  result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      result = 0;
      *a3 = *(_DWORD *)(a2 + 48);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex(void *a1, uint64_t a2, int a3)
{
  return uarpPlatformEndpointAssetSetPayloadIndex2(a1, a2, a3);
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex2(void *a1, uint64_t a2, int a3)
{
  uint64_t result;
  _OWORD *v6;
  __int128 *v7;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t i;
  uint64_t v18;

  result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 448) <= a3)
    {
      return 44;
    }
    else
    {
      *(_DWORD *)(a2 + 456) = a3;
      v6 = (_OWORD *)(a2 + 464);
      *(_QWORD *)(a2 + 508) = 0;
      if (*(_BYTE *)(a2 + 460) == 1)
      {
        v7 = *(__int128 **)(a2 + 632);
        if (v7)
        {
          while (1)
          {
            v8 = *((_DWORD *)v7 + 31);
            if (v8 == *(_DWORD *)(a2 + 456))
            {
              *(_DWORD *)(a2 + 452) = v8;
              v9 = *v7;
              v10 = v7[2];
              *(_OWORD *)(a2 + 480) = v7[1];
              *(_OWORD *)(a2 + 496) = v10;
              *v6 = v9;
              v11 = v7[3];
              v12 = v7[4];
              v13 = v7[6];
              *(_OWORD *)(a2 + 544) = v7[5];
              *(_OWORD *)(a2 + 560) = v13;
              *(_OWORD *)(a2 + 512) = v11;
              *(_OWORD *)(a2 + 528) = v12;
              v14 = v7[7];
              v15 = v7[8];
              v16 = v7[9];
              *(_QWORD *)(a2 + 624) = *((_QWORD *)v7 + 20);
              *(_OWORD *)(a2 + 592) = v15;
              *(_OWORD *)(a2 + 608) = v16;
              *(_OWORD *)(a2 + 576) = v14;
              for (i = *((_QWORD *)v7 + 21); i; i = *(_QWORD *)(i + 16))
                uarpProcessPayloadTLVInternal(a1, a2, a2 + 464, *(_DWORD *)i, *(unsigned int *)(i + 4), *(_DWORD **)(i + 8));
              v18 = *((unsigned int *)v7 + 19);
              if ((_DWORD)v18)
              {
                UARPLayer2HashFinal((uint64_t)a1, v18, *((_QWORD *)v7 + 10), *((_QWORD *)v7 + 12), *((unsigned int *)v7 + 26));
                if (memcmp(*((const void **)v7 + 12), *((const void **)v7 + 14), *((unsigned int *)v7 + 30)))
                  break;
              }
            }
            v7 = (__int128 *)*((_QWORD *)v7 + 22);
            if (!v7)
              return uarpPlatformEndpointPayloadRequestData((uint64_t)a1, a2);
          }
          return 54;
        }
        else
        {
          return uarpPlatformEndpointPayloadRequestData((uint64_t)a1, a2);
        }
      }
      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader((uint64_t)a1, a2);
      }
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestData(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;

  v2 = 30;
  if (a1 && a2)
  {
    v3 = *(_DWORD *)(a2 + 500);
    if (v3)
      v3 -= *(_DWORD *)(a2 + 508);
    if (v3 >= *(_DWORD *)(a2 + 648))
      v3 = *(_DWORD *)(a2 + 648);
    if (v3)
      return uarpPlatformAssetPayloadPullData(a1, a2);
    UARPLayer2PayloadDataComplete2(a1, (_QWORD *)a2);
    return 0;
  }
  return v2;
}

uint64_t uarpPlatformEndpointAssetPayloadVersion(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t result;

  result = 30;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32;
    }
    else
    {
      result = 0;
      *a3 = *(_OWORD *)(a2 + 472);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetPayloadTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;

  result = 30;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32;
    }
    else
    {
      result = 0;
      *a3 = *(_DWORD *)(a2 + 468);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 460) = 1;
  if (*(int *)(a2 + 448) >= 1)
    return uarpPlatformAssetPullAllPayloadHeaders(a1, a2);
  if (*(_DWORD *)(a2 + 32))
    return uarpPlatformAssetPullAllMetaData(a1, a2);
  UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(_QWORD *)(a2 + 696), a2);
  return 0;
}

uint64_t uarpPlatformEndpointAssetSetPayloadOffset(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  if (!a2)
    return 30;
  if (*(_DWORD *)(a2 + 452) == -1)
    return 44;
  if (*(_DWORD *)(a2 + 500) <= a3)
    return 43;
  if (*(_BYTE *)(a2 + 392) == 1)
    return 16;
  result = 0;
  *(_DWORD *)(a2 + 508) = a3;
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataPause(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 30;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *(_BYTE *)(a2 + 73) = 1;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataResume(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = 30;
  if (!a1)
    return v2;
  if (!a2)
    return v2;
  v2 = *(unsigned __int8 *)(a2 + 73);
  if (!*(_BYTE *)(a2 + 73))
    return v2;
  *(_BYTE *)(a2 + 73) = 0;
  v2 = *(_QWORD *)(a2 + 696);
  if (!v2)
    return v2;
  if (*(_BYTE *)(a2 + 392) == 1)
    return 0;
  return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
}

uint64_t uarpPlatformEndpointAssetFullyStaged(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
    return uarpAssetProcessingComplete(a1, *(_QWORD *)(a2 + 696), a2, 1u);
  else
    return 30;
}

double uarpPlatformEndpointSuperBinaryMerge(uint64_t a1, __int128 *a2, uint64_t a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  double result;

  if (a1 && a2)
  {
    if (a3)
    {
      v3 = *a2;
      v4 = a2[1];
      *(_OWORD *)(a3 + 28) = *(__int128 *)((char *)a2 + 28);
      *(_OWORD *)a3 = v3;
      *(_OWORD *)(a3 + 16) = v4;
      *((_BYTE *)a2 + 72) = 1;
      *(_BYTE *)(a3 + 72) = 0;
      *(_BYTE *)(a3 + 73) = *((_BYTE *)a2 + 73);
      *((_BYTE *)a2 + 392) = 0;
      v6 = *(__int128 *)((char *)a2 + 360);
      v5 = *(__int128 *)((char *)a2 + 376);
      v7 = *(__int128 *)((char *)a2 + 344);
      *(_OWORD *)(a3 + 328) = *(__int128 *)((char *)a2 + 328);
      *(_OWORD *)(a3 + 344) = v7;
      *(_OWORD *)(a3 + 360) = v6;
      *(_OWORD *)(a3 + 376) = v5;
      *(_OWORD *)(a3 + 312) = *(__int128 *)((char *)a2 + 312);
      v8 = *(__int128 *)((char *)a2 + 392);
      v9 = *(__int128 *)((char *)a2 + 408);
      v10 = *(__int128 *)((char *)a2 + 424);
      *(_QWORD *)(a3 + 440) = *((_QWORD *)a2 + 55);
      *(_OWORD *)(a3 + 408) = v9;
      *(_OWORD *)(a3 + 424) = v10;
      *(_OWORD *)(a3 + 392) = v8;
      *(_DWORD *)(a3 + 452) = *((_DWORD *)a2 + 113);
      *(_DWORD *)(a3 + 456) = *((_DWORD *)a2 + 114);
      v11 = a2[29];
      v12 = a2[31];
      *(_OWORD *)(a3 + 480) = a2[30];
      *(_OWORD *)(a3 + 496) = v12;
      *(_OWORD *)(a3 + 464) = v11;
      v13 = a2[32];
      v14 = a2[33];
      v15 = a2[35];
      *(_OWORD *)(a3 + 544) = a2[34];
      *(_OWORD *)(a3 + 560) = v15;
      *(_OWORD *)(a3 + 512) = v13;
      *(_OWORD *)(a3 + 528) = v14;
      v16 = a2[36];
      v17 = a2[37];
      v18 = a2[38];
      *(_QWORD *)(a3 + 624) = *((_QWORD *)a2 + 78);
      *(_OWORD *)(a3 + 592) = v17;
      *(_OWORD *)(a3 + 608) = v18;
      *(_OWORD *)(a3 + 576) = v16;
      *((_QWORD *)a2 + 78) = 0;
      result = 0.0;
      a2[37] = 0u;
      a2[38] = 0u;
      a2[35] = 0u;
      a2[36] = 0u;
      a2[33] = 0u;
      a2[34] = 0u;
      a2[31] = 0u;
      a2[32] = 0u;
      a2[29] = 0u;
      a2[30] = 0u;
      *(_QWORD *)(a3 + 640) = *((_QWORD *)a2 + 80);
      *((_QWORD *)a2 + 80) = 0;
      *(_BYTE *)(a3 + 652) = *((_BYTE *)a2 + 652);
      *(_DWORD *)(a3 + 648) = *((_DWORD *)a2 + 162);
      *((_DWORD *)a2 + 162) = 0;
      *(_DWORD *)(a3 + 688) = *((_DWORD *)a2 + 172);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointSendMessageComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = uarpPlatformEndpointSendMessageCompleteInternal(a1, a2, a3);
  if (!*(_BYTE *)(a1 + 580))
    return uarpTransmitQueueService(a1, a2);
  return result;
}

void uarpPlatformEndpointCleanupAssets(uint64_t a1)
{
  if (a1)
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, 0, 0);
}

void uarpPlatformEndpointCleanupAssets2(uint64_t a1, uint64_t a2)
{
  if (a1)
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 0);
}

void uarpPlatformEndpointPrepareDynamicAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  uarpPlatformPrepareAsset(a1, a2, a3, a4, a5, 1);
}

void uarpPlatformEndpointPrepareSolicitedDynamicAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  uarpPlatformPrepareAsset(a1, a2, a3, a4, a5, 0);
}

void uarpPlatformEndpointPrepareSuperBinary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uarpPlatformPrepareAsset(a1, a2, a3, 0, a4, 1);
}

uint64_t uarpPlatformEndpointOfferAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  unsigned __int16 v7;
  _OWORD __dst[3];

  result = 30;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        v6 = *(_QWORD *)(a1 + 568);
        if (v6)
        {
          while (*(_DWORD *)(v6 + 304) != 1 || *(_QWORD *)(v6 + 704) != a3)
          {
            v6 = *(_QWORD *)(v6 + 712);
            if (!v6)
              return 30;
          }
          memset(__dst, 0, 44);
          v7 = 0;
          result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v6, __dst, 44, 0, &v7);
          if (!(_DWORD)result)
          {
            uarpSuperBinaryHeaderEndianSwap((unsigned int *)__dst, (_DWORD *)v6);
            *(_OWORD *)(v6 + 52) = *(_OWORD *)(v6 + 12);
            *(_DWORD *)(v6 + 68) = *(_DWORD *)(v6 + 8);
            *(_DWORD *)(v6 + 448) = *(unsigned __int16 *)(v6 + 40) / 0x28u;
            result = uarpPlatformAssetApproveOfferVersion(a2, v6);
            if (!(_DWORD)result)
              return uarpOfferAssetToRemoteEP(a1, a2, v6);
          }
        }
      }
    }
  }
  return result;
}

uint64_t uarpPlatformAssetFindByAssetContextAndList(uint64_t result, uint64_t a2, int a3)
{
  if (result)
  {
    for (result = *(_QWORD *)(result + 568); result; result = *(_QWORD *)(result + 712))
    {
      if (*(_DWORD *)(result + 304) == a3 && *(_QWORD *)(result + 704) == a2)
        break;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetGetBytesAtOffset(uint64_t a1, uint64_t a2, uint64_t a3, void *__dst, uint64_t a5, uint64_t a6, unsigned __int16 *a7)
{
  uint64_t result;
  __int16 v15;

  result = 30;
  if (a1 && a3 && __dst && (_DWORD)a5)
  {
    v15 = *(_WORD *)(a3 + 46);
    if ((v15 & 0x80) != 0)
    {
      result = UARPSuperBinaryGetInternalSuperBinaryMetaData(a1, a3, __dst, a5, a6, a7);
      if ((_DWORD)result != 40)
        return result;
      v15 = *(_WORD *)(a3 + 46);
    }
    if ((v15 & 8) == 0)
      return UARPLayer2AssetGetBytesAtOffset2(a1, a2, (_QWORD *)a3, (uint64_t)__dst, a5, a6, (uint64_t)a7);
    result = UARPSuperBinaryGetInternalPayloadMetaData(a1, a3, __dst, a5, a6, a7);
    if ((_DWORD)result == 40)
      return UARPLayer2AssetGetBytesAtOffset2(a1, a2, (_QWORD *)a3, (uint64_t)__dst, a5, a6, (uint64_t)a7);
  }
  return result;
}

uint64_t uarpPlatformEndpointRemoveAssetPayloadWindow(uint64_t a1, uint64_t a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t result;

  result = 30;
  if (a3)
  {
    if (a4)
    {
      result = 0;
      *a3 = *(_QWORD *)(a2 + 640);
      *(_QWORD *)(a2 + 640) = 0;
      *a4 = *(_DWORD *)(a2 + 648);
      *(_DWORD *)(a2 + 648) = 0;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointProvideAssetPayloadWindow(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result;
  void *v9;

  result = 30;
  if (a3 && a4)
  {
    v9 = *(void **)(a2 + 640);
    if (v9)
    {
      if (!*(_BYTE *)(a2 + 652))
        UARPLayer2ReturnBuffer(a1, v9);
    }
    result = 0;
    *(_QWORD *)(a2 + 640) = a3;
    *(_DWORD *)(a2 + 648) = a4;
    *(_BYTE *)(a2 + 652) = 1;
  }
  return result;
}

uint64_t uarpPlatformEndpointDynamicAssetSolicitationDeny(uint64_t a1, uint64_t a2, _DWORD *a3, int a4)
{
  if (a1 && a2 && a3)
    return uarpSendDynamicAssetPreProcessingStatus(a1, a2, a3, 2u, a4);
  else
    return 30;
}

uint64_t uarpPlatformEndpointAssetSetBytesAtOffset(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 && a3 && a4 && (_DWORD)a5)
    return UARPLayer2AssetSetBytesAtOffset2(a1, a2, a3, a4, a5, a6);
  else
    return 30;
}

uint64_t uarpPlatformEndpointWatchDogExpired(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 30;
  if (a1 && a2)
  {
    result = 0;
    *(_BYTE *)(a2 + 50) = 0;
    if (!*(_BYTE *)(a1 + 580))
    {
      uarpTransmitQueueService(a1, a2);
      return 0;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointRescindAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (!a1)
    return 30;
  if (!a2)
    return 30;
  if (!a3)
    return 30;
  v3 = *(_QWORD *)(a1 + 568);
  if (!v3)
    return 30;
  while (*(_DWORD *)(v3 + 304) != 1 || *(_QWORD *)(v3 + 704) != a3)
  {
    v3 = *(_QWORD *)(v3 + 712);
    if (!v3)
      return 30;
  }
  return uarpAssetRescind(a1, a2, *(unsigned __int16 *)(v3 + 44));
}

uint64_t uarpPlatformEndpointRescindAllAssets(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
    return uarpAssetRescind(a1, a2, 0xFFFFu);
  else
    return 30;
}

uint64_t uarpPlatformEndpointApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  _QWORD *v5;

  result = 30;
  if (a1 && a2)
  {
    v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xAu, 6u, 1);
    if (v5)
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    else
      return 11;
  }
  return result;
}

uint64_t uarpPlatformEndpointPauseAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
    return uarpSendDataTransferNotificationPause(a1, a2);
  else
    return 30;
}

uint64_t uarpPlatformEndpointResumeAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
    return uarpSendDataTransferNotificationResume(a1, a2);
  else
    return 30;
}

uint64_t uarpPlatformEndpointSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  uint64_t v4;

  if (!a1)
    return 30;
  if (!a2)
    return 30;
  if (!a4)
    return 30;
  v4 = *(_QWORD *)(a1 + 568);
  if (!v4)
    return 30;
  while (*(_DWORD *)(v4 + 304) || *(_QWORD *)(v4 + 704) != a4)
  {
    v4 = *(_QWORD *)(v4 + 712);
    if (!v4)
      return 30;
  }
  return uarpSolicitDynamicAsset(a1, a2, a3);
}

uint64_t uarpPlatformEndpointSendVendorSpecific(uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (a1 && a2 && a3 && a5)
    return uarpSendVendorSpecific(a1, a2, a3, a4, a5, a6);
  else
    return 30;
}

uint64_t uarpPlatformNoFirmwareUpdateAvailable(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  v4 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Du, 6u, 1);
  if (v4)
    return uarpTransmitBuffer2(a1, a2, (uint64_t)v4);
  else
    return 11;
}

uint64_t uarpRemoteEndpointID(uint64_t a1)
{
  if (a1)
    return *(unsigned int *)(a1 + 52);
  else
    return 0xFFFFFFFFLL;
}

uint64_t uarpRemoteEndpointIDForAsset(uint64_t a1)
{
  uint64_t v1;

  if (a1 && (v1 = *(_QWORD *)(a1 + 696)) != 0)
    return *(unsigned int *)(v1 + 52);
  else
    return 0xFFFFFFFFLL;
}

uint64_t uarpPlatformRemoteDelegateForAssetDelegate(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 696);
    if (v1)
      return *(_QWORD *)(v1 + 40);
    else
      return 0;
  }
  return result;
}

__n128 uarpPlatformAssetSelectedPayloadInfo(uint64_t a1, char *a2)
{
  __n128 result;
  int v5;

  if (a1 && a2 && *(_DWORD *)(a1 + 452) != -1 && *(_BYTE *)(a1 + 460) != 1)
  {
    uarpZero(a2, 0x20uLL);
    *(_DWORD *)a2 = *(_DWORD *)(a1 + 468);
    result = *(__n128 *)(a1 + 472);
    *(__n128 *)(a2 + 4) = result;
    v5 = *(_DWORD *)(a1 + 500);
    *((_DWORD *)a2 + 5) = *(_DWORD *)(a1 + 492);
    *((_DWORD *)a2 + 6) = v5;
  }
  return result;
}

uint64_t uarpAssetQuerySuperBinaryMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 0;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 460))
      return *(_QWORD *)(a2 + 720);
    else
      return 0;
  }
  return result;
}

uint64_t uarpAssetQueryPayloadMetaData(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;
  uint64_t v5;

  result = 0;
  if (a1 && a2)
  {
    if (*(_BYTE *)(a2 + 460) && (v5 = *(_QWORD *)(a2 + 632)) != 0)
    {
      while (*(_DWORD *)(v5 + 124) != a3)
      {
        v5 = *(_QWORD *)(v5 + 176);
        if (!v5)
          return 0;
      }
      return *(_QWORD *)(v5 + 168);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpAssetQueryPayloadInfo(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;
  int v7;
  _DWORD *v8;
  int v9;

  result = 30;
  if (a1 && a2)
  {
    if (a4)
    {
      if (*(_BYTE *)(a2 + 460))
      {
        v6 = *(_QWORD *)(a2 + 632);
        if (!v6)
          return 54;
        while (*(_DWORD *)(v6 + 124) != a3)
        {
          v6 = *(_QWORD *)(v6 + 176);
          if (!v6)
            return 54;
        }
        *(_DWORD *)a4 = *(_DWORD *)(v6 + 4);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(v6 + 8);
        v9 = *(_DWORD *)(v6 + 36);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(v6 + 28);
        *(_DWORD *)(a4 + 24) = v9;
        v8 = (_DWORD *)(v6 + 128);
        goto LABEL_14;
      }
      if (*(_DWORD *)(a2 + 452) == a3)
      {
        *(_DWORD *)a4 = *(_DWORD *)(a2 + 468);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(a2 + 472);
        v7 = *(_DWORD *)(a2 + 500);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(a2 + 492);
        *(_DWORD *)(a4 + 24) = v7;
        v8 = (_DWORD *)(a2 + 592);
LABEL_14:
        result = 0;
        *(_DWORD *)(a4 + 28) = *v8;
        return result;
      }
      return 44;
    }
    else
    {
      return 26;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetQueryAssetID(uint64_t a1, _WORD *a2)
{
  uint64_t result;

  result = 30;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *(_WORD *)(a1 + 44);
    }
  }
  return result;
}

__n128 uarpPlatformAssetQueryAssetVersion(uint64_t a1, __n128 *a2)
{
  __n128 result;

  if (a1)
  {
    if (a2)
    {
      result = *(__n128 *)(a1 + 52);
      *a2 = result;
    }
  }
  return result;
}

uint64_t uarpPlatformSetMaxTxPayloadLength(uint64_t a1, _DWORD *a2, int a3)
{
  uint64_t result;

  result = 30;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = a3;
    }
  }
  return result;
}

uint64_t uarpPlatformGetMaxTxPayloadLength(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result;

  result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      result = 0;
      *a3 = *a2;
    }
  }
  return result;
}

uint64_t uarpPlatformSetMaxRxPayloadLength(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  result = 30;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *(_DWORD *)(a2 + 4) = a3;
    }
  }
  return result;
}

uint64_t uarpPlatformGetMaxRxPayloadLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result;

  result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      result = 0;
      *a3 = *(_DWORD *)(a2 + 4);
    }
  }
  return result;
}

char *uarpAssetTagPersonalization4cc()
{
  char *result;

  result = uarpAssetTagPersonalization4cc_assetTag;
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagPersonalization()
{
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagPersonalization4cc_assetTag);
}

int *uarpAssetTagStructPersonalization()
{
  int *result;

  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  result = &uarpAssetTagStructPersonalization_myTag;
  uarpAssetTagStructPersonalization_myTag = *(_DWORD *)uarpAssetTagPersonalization4cc_assetTag;
  return result;
}

char *uarpAssetTagPersonalizedFirmware4cc()
{
  char *result;

  result = uarpAssetTagPersonalizedFirmware4cc_assetTag;
  uarpAssetTagPersonalizedFirmware4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagPersonalizedFirmware()
{
  uarpAssetTagPersonalizedFirmware4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagPersonalizedFirmware4cc_assetTag);
}

int *uarpAssetTagStructPersonalizedFirmware()
{
  int *result;

  uarpAssetTagPersonalizedFirmware4cc_assetTag[4] = 0;
  result = &uarpAssetTagStructPersonalizedFirmware_myTag;
  uarpAssetTagStructPersonalizedFirmware_myTag = *(_DWORD *)uarpAssetTagPersonalizedFirmware4cc_assetTag;
  return result;
}

__int16 *uarpOuiPersonalization()
{
  __int16 *result;

  result = &uarpOuiPersonalization_myOui;
  uarpOuiPersonalization_myOui = -19832;
  byte_257A55F52 = -111;
  return result;
}

uint64_t uarpPersonalizationRequestAssetInitialize(uint64_t a1, uint64_t a2, int a3)
{
  __int128 v4;

  v4 = 0uLL;
  return UARPSuperBinarySetupHeader(a1, a2, 2u, &v4, a3);
}

uint64_t uarpPersonalizationRequestPreparePayload(uint64_t a1, uint64_t a2, int a3)
{
  __int128 v4;

  v4 = 0uLL;
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  uarpAssetTagStructPersonalization_myTag = *(_DWORD *)uarpAssetTagPersonalization4cc_assetTag;
  return UARPSuperBinaryPreparePayload(a1, a2, a3, (unsigned int *)&uarpAssetTagStructPersonalization_myTag, &v4);
}

uint64_t uarpPersonalizationRequestAddPayloadTag(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29101, 4u, a4);
}

uint64_t uarpPersonalizationRequestAddRemoteAssetID(uint64_t a1, uint64_t a2, unsigned int a3)
{
  __int16 v6;

  v6 = uarpHtons(a3);
  return UARPSuperBinaryAddMetaData(a1, a2, 0x88B29102, 2u, (uint64_t)&v6);
}

uint64_t uarpPersonalizationRequestAddManifestPrefix(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29103, a5, a4);
}

uint64_t uarpPersonalizationRequestAddBoardID(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8;

  v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29104, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddBoardID64(uint64_t a1, uint64_t a2, int a3, unint64_t a4)
{
  unint64_t v8;

  v8 = uarpHtonll(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2911B, 8u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddChipID(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8;

  v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29105, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddECID(uint64_t a1, uint64_t a2, int a3, unint64_t a4)
{
  unint64_t v8;

  v8 = uarpHtonll(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29106, 8u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddNonce(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29107, a5, a4);
}

uint64_t uarpPersonalizationRequestAddNonceHash(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29108, a5, a4);
}

uint64_t uarpPersonalizationRequestAddDigest(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29113, a5, a4);
}

uint64_t uarpPersonalizationRequestAddSecurityDomain(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8;

  v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29109, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddSecurityMode(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8;

  v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910A, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddProductionMode(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8;

  v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910B, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddChipEpoch(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8;

  v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910C, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddChipRevision(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8;

  v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910F, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddEnableMixMatch(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5;

  v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910D, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddSoCLiveNonce(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5;

  v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29118, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddTicketPrefixLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5;

  v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29126, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddPrefixNeedsLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5;

  v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29121, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddPrefixLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5;

  v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29121, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddSuffixLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5;

  v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29122, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestMoreRequestsToFollow(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5;

  v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29127, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddRemoteAssetPayloadIndex(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8;

  v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910E, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddLogicalUnitNumber(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8;

  v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29125, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddMeasurementWithOverrides(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  _WORD *v19;
  unsigned int v20;

  v10 = uarpHtons(a6);
  v11 = uarpHtons(a7);
  if (!a5)
    return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29110, a5, a4);
  v12 = v11;
  v13 = (unsigned int *)a4;
  v14 = a5;
  while (1)
  {
    v15 = v14 - 8;
    if (v14 < 8)
      return 30;
    v16 = uarpHtonl(*v13);
    v17 = uarpHtonl(v13[1]);
    if (v15 < v17)
      return 30;
    v18 = v17;
    v19 = v13 + 2;
    v20 = v10;
    if (v16 == -2001563371)
      goto LABEL_8;
    if (v16 == -2001563370)
    {
      v20 = v12;
LABEL_8:
      *v19 = uarpHtons(v20);
    }
    v13 = (unsigned int *)((char *)v19 + v18);
    v14 = v15 - v18;
    if (v15 == v18)
      return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29110, a5, a4);
  }
}

uint64_t uarpPersonalizationRequestAddMeasurement(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29110, a5, a4);
}

void sub_24BCBC438(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_4_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

const char *stringForB2PProtocolVersion(unsigned int a1)
{
  if (a1 > 2)
    return "unrecognized";
  else
    return off_251CE4090[a1];
}

const char *stringForB2PProtocolMode(unsigned int a1)
{
  if (a1 > 3)
    return "unrecognized";
  else
    return off_251CE40A8[a1];
}

const char *stringForB2PResponseStatus(unsigned int a1)
{
  if (a1 > 6)
    return "unrecognized";
  else
    return off_251CE40C8[a1];
}

const char *stringForB2PProductCategory(int a1)
{
  const char *v1;

  v1 = "unrecognized";
  if (a1 == 1)
    v1 = "tethered";
  if (a1)
    return v1;
  else
    return "untethered";
}

const char *stringForB2PRoute(unsigned int a1)
{
  if (a1 > 0xF)
    return "unrecognized";
  else
    return off_251CE4100[(char)a1];
}

const char *stringForB2PInfoID(unsigned int a1)
{
  if (a1 > 3)
    return "unrecognized";
  else
    return off_251CE4180[a1];
}

const char *stringForB2PDataSessionID(unsigned int a1)
{
  if (a1 > 0xF)
    return "Plaform specific";
  if (a1 > 5)
    return "unrecognized";
  return off_251CE41A0[(char)a1];
}

const char *stringForB2PDataSessionState(int a1)
{
  const char *v1;

  v1 = "unrecognized";
  if (a1 == 1)
    v1 = "open";
  if (a1)
    return v1;
  else
    return "close";
}

const char *stringForB2PTimerType(int a1)
{
  const char *v1;

  v1 = "unrecognized";
  if (a1 == 1)
    v1 = "response";
  if (a1)
    return v1;
  else
    return "midpacket";
}

const char *stringForB2PFWUPControlCommand(unsigned int a1)
{
  if (a1 > 6)
    return "unrecognized";
  else
    return off_251CE41D0[a1];
}

const char *stringForB2PResetReason(int a1)
{
  if (a1)
    return "unrecognized";
  else
    return "response timeout";
}

const char *stringForB2PDataSessionStatus(int a1)
{
  const char *result;

  result = "idle";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "ok";
      break;
    case 2:
      result = "success";
      break;
    case 3:
      result = "error";
      break;
    default:
      if (a1 == 255)
        result = "unknown";
      else
        result = "unrecognized";
      break;
  }
  return result;
}

const char *stringForB2PSerialNumberComponent(unsigned int a1)
{
  if (a1 > 0x10)
    return "unrecognized";
  else
    return off_251CE4208[a1];
}

uint64_t uarpPlatformEndpointStreamingRecvInit(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unsigned int v5;
  void *v6;
  void *v7;

  result = 30;
  if (a1 && a2)
  {
    v7 = 0;
    UARPLayer2RequestBuffer(a1, &v7, 0x18u);
    if (v7)
    {
      v5 = *(_DWORD *)(a2 + 4) + 36;
      UARPLayer2RequestBuffer(a1, v7, v5);
      v6 = v7;
      if (*(_QWORD *)v7)
      {
        result = 0;
        *((_DWORD *)v7 + 2) = v5;
        *(_QWORD *)(a2 + 88) = v6;
        return result;
      }
      UARPLayer2ReturnBuffer(a1, v7);
    }
    return 11;
  }
  return result;
}

void uarpPlatformEndpointStreamingRecvDeinit(uint64_t a1, uint64_t a2)
{
  void **v3;

  if (a1)
  {
    if (a2)
    {
      v3 = *(void ***)(a2 + 88);
      if (v3)
      {
        if (*v3)
        {
          UARPLayer2ReturnBuffer(a1, *v3);
          v3 = *(void ***)(a2 + 88);
          *v3 = 0;
        }
        UARPLayer2ReturnBuffer(a1, v3);
        *(_QWORD *)(a2 + 88) = 0;
      }
    }
  }
}

uint64_t uarpPlatformEndpointStreamingRecvBytes(uint64_t a1, uint64_t a2, char *a3, int a4)
{
  uint64_t result;
  char *v7;
  uint64_t v8;
  _DWORD *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;

  result = 30;
  if (a1)
  {
    if (a2)
    {
      v7 = a3;
      if (a3)
      {
        LODWORD(v8) = a4;
        if (a4)
        {
          v9 = *(_DWORD **)(a2 + 88);
          if (v9)
            goto LABEL_6;
          result = uarpPlatformEndpointStreamingRecvInit(a1, a2);
          if ((_DWORD)result)
            return result;
          v9 = *(_DWORD **)(a2 + 88);
          if (v9)
          {
LABEL_6:
            if (v9[2] >= v8)
            {
              v8 = v8;
              v10 = v9[4];
              do
              {
                v11 = *v7++;
                *(_BYTE *)(*(_QWORD *)v9 + v10) = v11;
                v10 = v9[4] + 1;
                v9[4] = v10;
                if (v10 == 6)
                {
                  v12 = uarpNtohs(*(unsigned __int16 *)(*(_QWORD *)v9 + 2)) + 6;
                  v9[3] = v12;
                  v10 = v9[4];
                }
                else
                {
                  v12 = v9[3];
                }
                if (v10 == v12)
                {
                  result = uarpPlatformEndpointRecvMessage(a1, a2, *(unsigned __int16 **)v9, v12);
                  if ((_DWORD)result)
                    return result;
                  bzero(*(void **)v9, v9[2]);
                  v10 = 0;
                  v9[3] = 0;
                  v9[4] = 0;
                }
                --v8;
              }
              while (v8);
              return 0;
            }
            else
            {
              return 30;
            }
          }
          else
          {
            return 27;
          }
        }
      }
    }
  }
  return result;
}

uint64_t AppleTypeCRetimerUpdaterCreate(uint64_t a1, void (*a2)(uint64_t, const char *), uint64_t a3)
{
  AppleTypeCRetimerUpdateController *v6;

  if (_dfuChecker && (objc_msgSend((id)_dfuChecker, "checkDeferredRouterIDs") & 1) == 0)
    a2(a3, "Deferred DFU check failed.");
  v6 = [AppleTypeCRetimerUpdateController alloc];
  return (uint64_t)-[AppleTypeCRetimerUpdateController initWithOptions:logFunction:logContext:forcingPower:](v6, "initWithOptions:logFunction:logContext:forcingPower:", a1, a2, a3, _dfuChecker == 0);
}

uint64_t AppleTypeCRetimerUpdaterExecCommand(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v7 = a1;
  v8 = a2;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("queryInfo")))
  {
    objc_msgSend(v7, "queryInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      *a4 = v9;
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }

    if (v11)
      goto LABEL_9;
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("performNextStage"))
         && objc_msgSend(v7, "performUpdateWithDictionary:", a3))
  {
LABEL_9:
    v19 = 1;
    goto LABEL_10;
  }
  logSystemFatal(CFSTR("%s: fatal error detected at this stage."), v12, v13, v14, v15, v16, v17, v18, (uint64_t)"Boolean AppleTypeCRetimerUpdaterExecCommand(AppleTypeCRetimerUpdaterRef _Nonnull, CFStringRef _Nonnull, CFDictionaryRef _Nullable, CFDictionaryRef * _Nullable, CFErrorRef * _Nullable)");
  v19 = 0;
LABEL_10:

  return v19;
}

uint64_t AppleTypeCRetimerUpdaterIsDone(void *a1)
{
  _BOOL8 v1;
  void *v2;

  if (a1)
    return objc_msgSend(a1, "isDone");
  +[AppleTypeCRetimerUpdaterIIC getDeviceNames](AppleTypeCRetimerUpdaterIIC, "getDeviceNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v2, "count") == 0;

  return v1;
}

uint64_t AppleTypeCRetimerUpdaterDFUCheck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  AppleTypeCRetimerDFUChecker *v3;
  void *v4;

  v3 = -[AppleTypeCRetimerDFUChecker initWithOptions:logFunction:logContext:deviceNamePrefix:]([AppleTypeCRetimerDFUChecker alloc], "initWithOptions:logFunction:logContext:deviceNamePrefix:", a1, a2, a3, CFSTR("atcrt"));
  v4 = (void *)_dfuChecker;
  _dfuChecker = (uint64_t)v3;

  return objc_msgSend((id)_dfuChecker, "doCheck");
}

uint64_t AppleTypeCRetimerUpdaterReset(void *a1)
{
  objc_msgSend(a1, "performReset");
  return 1;
}

void sub_24BCBF8E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24BCBFC94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id UARPStringDynamicAssetsFilepath()
{
  if (UARPStringDynamicAssetsFilepath_onceToken != -1)
    dispatch_once(&UARPStringDynamicAssetsFilepath_onceToken, &__block_literal_global_1);
  return (id)UARPStringDynamicAssetsFilepath_path;
}

id UARPStringSupplementalAssetsFilepath()
{
  if (UARPStringSupplementalAssetsFilepath_onceToken != -1)
    dispatch_once(&UARPStringSupplementalAssetsFilepath_onceToken, &__block_literal_global_496);
  return (id)UARPStringSupplementalAssetsFilepath_path;
}

id UARPStringTempFilesFilepath()
{
  if (UARPStringTempFilesFilepath_onceToken != -1)
    dispatch_once(&UARPStringTempFilesFilepath_onceToken, &__block_literal_global_497);
  return (id)UARPStringTempFilesFilepath_path;
}

id UARPStringPcapFilesFilepath()
{
  if (UARPStringPcapFilesFilepath_onceToken != -1)
    dispatch_once(&UARPStringPcapFilesFilepath_onceToken, &__block_literal_global_498);
  return (id)UARPStringPcapFilesFilepath_path;
}

id UARPPayloadHashAlgorithmStringToValue(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA-256")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA-384")))
    {
      v2 = objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("SHA-512"));
      v3 = (void *)MEMORY[0x24BDD16E0];
      if (v2)
        v4 = 0;
      else
        v4 = 3;
    }
    else
    {
      v3 = (void *)MEMORY[0x24BDD16E0];
      v4 = 2;
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    v4 = 1;
  }
  objc_msgSend(v3, "numberWithUnsignedShort:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id UARPStringTmapDirectoryPath()
{
  if (UARPStringTmapDirectoryPath_onceToken != -1)
    dispatch_once(&UARPStringTmapDirectoryPath_onceToken, &__block_literal_global_587);
  return (id)UARPStringTmapDirectoryPath_path;
}

id UARPStringTmapDatabaseFilePath()
{
  if (UARPStringTmapDatabaseFilePath_onceToken != -1)
    dispatch_once(&UARPStringTmapDatabaseFilePath_onceToken, &__block_literal_global_588);
  return (id)UARPStringTmapDatabaseFilePath_path;
}

id UARPStringTapToRadarFilePath()
{
  if (UARPStringTapToRadarFilePath_onceToken != -1)
    dispatch_once(&UARPStringTapToRadarFilePath_onceToken, &__block_literal_global_591);
  return (id)UARPStringTapToRadarFilePath_path;
}

id UARPStringLogsDirectoryFilePath()
{
  if (UARPStringLogsDirectoryFilePath_onceToken != -1)
    dispatch_once(&UARPStringLogsDirectoryFilePath_onceToken, &__block_literal_global_594);
  return (id)UARPStringLogsDirectoryFilePath_path;
}

id UARPStringCrashAnalyticsDirectoryFilePath()
{
  if (UARPStringCrashAnalyticsDirectoryFilePath_onceToken != -1)
    dispatch_once(&UARPStringCrashAnalyticsDirectoryFilePath_onceToken, &__block_literal_global_597);
  return (id)UARPStringCrashAnalyticsDirectoryFilePath_path;
}

id UARPStringCmapDirectoryPath()
{
  if (UARPStringCmapDirectoryPath_onceToken != -1)
    dispatch_once(&UARPStringCmapDirectoryPath_onceToken, &__block_literal_global_644);
  return (id)UARPStringCmapDirectoryPath_path;
}

id UARPStringCmapDatabaseFilePath()
{
  if (UARPStringCmapDatabaseFilePath_onceToken != -1)
    dispatch_once(&UARPStringCmapDatabaseFilePath_onceToken, &__block_literal_global_645);
  return (id)UARPStringCmapDatabaseFilePath_path;
}

id UARPStringSysdiagnoseDirectoryFilePath()
{
  if (UARPStringSysdiagnoseDirectoryFilePath_onceToken != -1)
    dispatch_once(&UARPStringSysdiagnoseDirectoryFilePath_onceToken, &__block_literal_global_650);
  return (id)UARPStringSysdiagnoseDirectoryFilePath_path;
}

id UARPStringPifMetricsFilePath()
{
  if (UARPStringPifMetricsFilePath_onceToken != -1)
    dispatch_once(&UARPStringPifMetricsFilePath_onceToken, &__block_literal_global_653);
  return (id)UARPStringPifMetricsFilePath_path;
}

void sub_24BCC0DF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AppleTypeCRetimerUARPUpdaterCreate(uint64_t a1, void (*a2)(uint64_t, const char *), uint64_t a3)
{
  AppleTypeCRetimerUARPUpdaterController *v6;

  if (_dfuChecker_0 && (objc_msgSend((id)_dfuChecker_0, "checkDeferredRouterIDs") & 1) == 0)
    a2(a3, "Deferred DFU check failed.");
  v6 = [AppleTypeCRetimerUARPUpdaterController alloc];
  return (uint64_t)-[AppleTypeCRetimerUARPUpdaterController initWithOptions:logFunction:logContext:forcingPower:](v6, "initWithOptions:logFunction:logContext:forcingPower:", a1, a2, a3, _dfuChecker_0 == 0);
}

uint64_t AppleTypeCRetimerUARPUpdaterExecCommand(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v7 = a1;
  v8 = a2;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("queryInfo")))
  {
    objc_msgSend(v7, "queryInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      *a4 = v9;
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }

  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("performNextStage")))
  {
    v11 = objc_msgSend(v7, "performUpdateWithDictionary:", a3);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t AppleTypeCRetimerUARPUpdaterIsDone(void *a1)
{
  _BOOL8 v1;
  void *v2;

  if (a1)
    return objc_msgSend(a1, "isDone");
  IICGetDeviceNamesWithPrefix(CFSTR("uatcrt"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v2, "count") == 0;

  return v1;
}

uint64_t AppleTypeCRetimerUARPUpdaterDFUCheck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  AppleTypeCRetimerDFUChecker *v3;
  void *v4;

  v3 = -[AppleTypeCRetimerDFUChecker initWithOptions:logFunction:logContext:deviceNamePrefix:]([AppleTypeCRetimerDFUChecker alloc], "initWithOptions:logFunction:logContext:deviceNamePrefix:", a1, a2, a3, CFSTR("uatcrt"));
  v4 = (void *)_dfuChecker_0;
  _dfuChecker_0 = (uint64_t)v3;

  return objc_msgSend((id)_dfuChecker_0, "doCheck");
}

uint64_t AppleTypeCRetimerUARPUpdaterReset(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = objc_msgSend(a1, "performReset");
  if ((v8 & 1) == 0)
    logSystemFatal(CFSTR("%s: fatal error detected at this stage."), v1, v2, v3, v4, v5, v6, v7, (uint64_t)"Boolean AppleTypeCRetimerUARPUpdaterReset(AppleTypeCRetimerUARPUpdaterRef _Nonnull, CFErrorRef * _Nullable)");
  return v8;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_6_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t stringForFourCharCode(int a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%c%c%c%c'"), (a1 >> 24), (a1 << 8 >> 24), ((__int16)a1 >> 8), (char)a1);
}

__int16 *uarpOuiAppleGenericFeatures()
{
  __int16 *result;

  result = &uarpOuiAppleGenericFeatures_myOui;
  uarpOuiAppleGenericFeatures_myOui = 2492;
  byte_257A5604A = 99;
  return result;
}

uint64_t uarpApplePlatformEndpointRecvMessage(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4, unsigned int *a5, unsigned int a6)
{
  uint64_t result;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unsigned int v17;
  unint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *);
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  _QWORD *v27;
  void (*v28)(_QWORD, _QWORD, unint64_t *, uint64_t);
  uint64_t (*v29)(_QWORD, uint64_t, uint64_t, uint64_t, unsigned int *);
  unsigned int v30;
  unsigned int v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *);
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(_QWORD, uint64_t, uint64_t, uint64_t, unsigned int *);
  __int16 v36;
  void (**v37)(_QWORD, _QWORD, unint64_t *, uint64_t);
  uint64_t v38;
  void (*v39)(_QWORD, _QWORD, unint64_t *, uint64_t);
  void (*v40)(_QWORD, _QWORD, unint64_t *, uint64_t);
  void (*v41)(_QWORD, _QWORD, unint64_t *, uint64_t);
  void (*v42)(_QWORD, _QWORD, unint64_t *, uint64_t);
  void (*v43)(_QWORD, _QWORD, unint64_t *, uint64_t);
  void (*v44)(_QWORD, _QWORD, unint64_t *, uint64_t);
  void (*v45)(_QWORD, _QWORD, unint64_t *, uint64_t);
  unsigned int v46;

  result = 30;
  if (!a1 || !a2 || !a3 || !a5)
    return result;
  uarpOuiAppleGenericFeatures_myOui = 2492;
  byte_257A5604A = 99;
  if (!uarpOuiCompare(a3, (unsigned __int8 *)&uarpOuiAppleGenericFeatures_myOui))
    return 9;
  if (a4 != 33)
  {
    if (a4 == 32 && a6 >= 4)
    {
      v12 = *(_DWORD *)a2;
      v13 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFFFFu, (unsigned __int16)*(_DWORD *)a2, 0);
      if (!v13)
        return 11;
      v14 = (uint64_t)v13;
      v15 = v13[2];
      uarpOuiAppleGenericFeatures_myOui = 2492;
      byte_257A5604A = 99;
      *(_WORD *)(v15 + 6) = 2492;
      *(_BYTE *)(v15 + 8) = 99;
      *(_WORD *)(v15 + 9) = uarpHtons(0x21u);
      v16 = *(_QWORD **)(a1 + 40);
      v46 = 0;
      v17 = uarpNtohl(*a5);
      v18 = (unint64_t *)(v15 + 23);
      v19 = (v12 - 23);
      switch(v17)
      {
        case 1u:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[1];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 1;
          goto LABEL_90;
        case 2u:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[3];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 2;
          goto LABEL_90;
        case 3u:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[5];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 3;
          goto LABEL_90;
        case 4u:
          v29 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, unsigned int *))v16[7];
          if (!v29)
            goto LABEL_91;
          v30 = v29(*(_QWORD *)(a1 + 544), 4, v15 + 23, v19, &v46);
          if (*(unsigned __int16 *)(a2 + 48) < 4u)
            break;
          v31 = v46;
          if (v46 != 8)
            goto LABEL_74;
LABEL_41:
          *v18 = uarpHtonll(*v18);
          break;
        case 5u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[9];
          if (!v32)
            goto LABEL_91;
          v33 = *(_QWORD *)(a1 + 544);
          v34 = 5;
          goto LABEL_72;
        case 6u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[11];
          if (!v32)
            goto LABEL_91;
          v33 = *(_QWORD *)(a1 + 544);
          v34 = 6;
          goto LABEL_72;
        case 7u:
          v35 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, unsigned int *))v16[13];
          if (!v35)
            goto LABEL_91;
          v30 = v35(*(_QWORD *)(a1 + 544), 7, v15 + 23, v19, &v46);
          if (*(unsigned __int16 *)(a2 + 48) >= 4u && v46 == 8)
            goto LABEL_41;
          break;
        case 8u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[17];
          if (!v32)
            goto LABEL_91;
          v33 = *(_QWORD *)(a1 + 544);
          v34 = 8;
          goto LABEL_72;
        case 9u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[19];
          if (!v32)
            goto LABEL_91;
          v33 = *(_QWORD *)(a1 + 544);
          v34 = 9;
          goto LABEL_72;
        case 0xAu:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[21];
          if (!v32)
            goto LABEL_91;
          v33 = *(_QWORD *)(a1 + 544);
          v34 = 10;
          goto LABEL_72;
        case 0xBu:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[23];
          if (!v32)
            goto LABEL_91;
          v33 = *(_QWORD *)(a1 + 544);
          v34 = 11;
          goto LABEL_72;
        case 0xCu:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[25];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 12;
          goto LABEL_90;
        case 0xDu:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[27];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 13;
          goto LABEL_90;
        case 0xEu:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[29];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 14;
          goto LABEL_90;
        case 0xFu:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[31];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 15;
          goto LABEL_90;
        case 0x10u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[33];
          if (!v32)
            goto LABEL_91;
          v33 = *(_QWORD *)(a1 + 544);
          v34 = 16;
          goto LABEL_72;
        case 0x11u:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[35];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 17;
          goto LABEL_90;
        case 0x12u:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[37];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 18;
          goto LABEL_90;
        case 0x13u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[39];
          if (!v32)
            goto LABEL_91;
          v33 = *(_QWORD *)(a1 + 544);
          v34 = 19;
          goto LABEL_72;
        case 0x14u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[41];
          if (!v32)
            goto LABEL_91;
          v33 = *(_QWORD *)(a1 + 544);
          v34 = 20;
          goto LABEL_72;
        case 0x15u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[43];
          if (!v32)
            goto LABEL_91;
          v33 = *(_QWORD *)(a1 + 544);
          v34 = 21;
          goto LABEL_72;
        case 0x16u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[45];
          if (!v32)
            goto LABEL_91;
          v33 = *(_QWORD *)(a1 + 544);
          v34 = 22;
LABEL_72:
          v30 = v32(v33, v34, v15 + 23, v19, &v46);
          if (*(unsigned __int16 *)(a2 + 48) < 4u)
            break;
          v31 = v46;
LABEL_74:
          if (v31 == 4)
            *(_DWORD *)v18 = uarpHtonl(*(_DWORD *)v18);
          break;
        case 0x17u:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[47];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 23;
          goto LABEL_90;
        case 0x18u:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[49];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 24;
          goto LABEL_90;
        case 0x19u:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[51];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 25;
          goto LABEL_90;
        case 0x1Au:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[53];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 26;
          goto LABEL_90;
        case 0x1Bu:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[55];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 27;
          goto LABEL_90;
        case 0x1Cu:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[57];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 28;
          goto LABEL_90;
        case 0x1Du:
          v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[15];
          if (!v20)
            goto LABEL_91;
          v21 = *(_QWORD *)(a1 + 544);
          v22 = 29;
LABEL_90:
          v30 = v20(v21, v22, v15 + 23, v19, &v46);
          break;
        default:
LABEL_91:
          v30 = 26;
          break;
      }
      *(_DWORD *)(v15 + 11) = uarpHtonl(v30);
      *(_DWORD *)(v15 + 15) = uarpHtonl(v17);
      *(_DWORD *)(v15 + 19) = uarpHtonl(v46);
      v36 = v46 + 23;
      *(_WORD *)(v15 + 2) = uarpHtons((unsigned __int16)(v46 + 17));
      *(_WORD *)(v14 + 28) = v36;
      return uarpTransmitBuffer2(a1, a2, v14);
    }
    return 9;
  }
  if (a6 < 4)
    return 9;
  if (a6 < 0xC)
    return 8;
  v23 = uarpNtohl(a5[1]);
  v24 = uarpNtohl(a5[2]);
  if ((int)v24 + 12 > a6)
    return 8;
  v25 = v24;
  if ((_DWORD)v24)
    v26 = (unint64_t *)(a5 + 3);
  else
    v26 = 0;
  v27 = *(_QWORD **)(a1 + 40);
  switch(v23)
  {
    case 1:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[2];
      if (v28)
        goto LABEL_118;
      return 1;
    case 2:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[4];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 3:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[6];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 4:
      v38 = v27[8];
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 8);
      if (!v38)
        return 1;
      if ((_DWORD)v24 == 8)
        goto LABEL_107;
      if ((_DWORD)v24 != 4)
        goto LABEL_117;
      break;
    case 5:
      v39 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[10];
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 10);
      v28 = v39;
      if (!v39)
        return 1;
      goto LABEL_115;
    case 6:
      v40 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[12];
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 12);
      v28 = v40;
      if (!v40)
        return 1;
      goto LABEL_115;
    case 7:
      v41 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[14];
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 14);
      v28 = v41;
      if (!v41)
        return 1;
      if ((_DWORD)v24 != 8)
        goto LABEL_118;
LABEL_107:
      *v26 = uarpNtohll(*v26);
      goto LABEL_117;
    case 8:
      v42 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[18];
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 18);
      v28 = v42;
      if (!v42)
        return 1;
      goto LABEL_115;
    case 9:
      v43 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[20];
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 20);
      v28 = v43;
      if (!v43)
        return 1;
      goto LABEL_115;
    case 10:
      v44 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[22];
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 22);
      v28 = v44;
      if (!v44)
        return 1;
      goto LABEL_115;
    case 11:
      v45 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[24];
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 24);
      v28 = v45;
      if (!v45)
        return 1;
LABEL_115:
      if ((_DWORD)v24 == 4)
        break;
      goto LABEL_118;
    case 12:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[26];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 13:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[28];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 14:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[30];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 15:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[32];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 16:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[34];
      if (!v28)
        return 1;
      if ((_DWORD)v24 != 4)
        goto LABEL_118;
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 34);
      break;
    case 17:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[36];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 18:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[38];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 19:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[40];
      if (!v28)
        return 1;
      if ((_DWORD)v24 != 4)
        goto LABEL_118;
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 40);
      break;
    case 20:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[42];
      if (!v28)
        return 1;
      if ((_DWORD)v24 != 4)
        goto LABEL_118;
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 42);
      break;
    case 21:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[44];
      if (!v28)
        return 1;
      if ((_DWORD)v24 != 4)
        goto LABEL_118;
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 44);
      break;
    case 22:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[46];
      if (!v28)
        return 1;
      if ((_DWORD)v24 != 4)
        goto LABEL_118;
      v37 = (void (**)(_QWORD, _QWORD, unint64_t *, uint64_t))(v27 + 46);
      break;
    case 23:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[48];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 24:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[50];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 25:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[52];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 26:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[54];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 27:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[56];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 28:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[58];
      if (!v28)
        return 1;
      goto LABEL_118;
    case 29:
      v28 = (void (*)(_QWORD, _QWORD, unint64_t *, uint64_t))v27[16];
      if (!v28)
        return 1;
      goto LABEL_118;
    default:
      return 1;
  }
  *(_DWORD *)v26 = uarpNtohl(*(_DWORD *)v26);
LABEL_117:
  v28 = *v37;
LABEL_118:
  v28(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40), v26, v25);
  return 0;
}

BOOL uarpApplePlatformMessageCheckExpectedResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  _BOOL8 result;
  BOOL v10;
  int v12;

  if (a6 < 0xB)
    return 0;
  if (*(unsigned __int16 *)(a5 + 6) != *(unsigned __int16 *)(a3 + 6)
    || *(unsigned __int8 *)(a5 + 8) != *(unsigned __int8 *)(a3 + 8))
  {
    return 0;
  }
  uarpOuiAppleGenericFeatures_myOui = 2492;
  byte_257A5604A = 99;
  v10 = *(_WORD *)(a5 + 6) == 2492 && *(_BYTE *)(a5 + 8) == 99;
  if (!v10 || uarpNtohs(*(unsigned __int16 *)(a5 + 9)) != 33)
    return 0;
  v12 = uarpNtohs(*(unsigned __int16 *)(a3 + 9));
  result = 0;
  if (a6 >= 0x17 && v12 == 32)
    return *(_DWORD *)(a5 + 15) == *(_DWORD *)(a3 + 11);
  return result;
}

uint64_t uarpApplePlatformMessageCheckValidToSend(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t result;
  int v11;
  void (*v12)(_QWORD, _QWORD, _QWORD, _QWORD);

  v4 = *(_QWORD *)(a1 + 40);
  if (!v4)
    return 1;
  uarpOuiAppleGenericFeatures_myOui = 2492;
  byte_257A5604A = 99;
  if (*(_WORD *)(a3 + 6) != 2492 || *(_BYTE *)(a3 + 8) != 99)
    return 1;
  v11 = uarpNtohs(*(unsigned __int16 *)(a3 + 9));
  result = 1;
  if (a4 >= 0xF && v11 == 32)
  {
    if (uarpNtohl(*(_DWORD *)(a3 + 11)) == 2
      && (*(unsigned __int16 *)(a2 + 48) < 2u || *(_DWORD *)(a2 + 24)))
    {
      v12 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v4 + 32);
      if (v12)
LABEL_14:
        v12(*(_QWORD *)(a1 + 544), *(_QWORD *)(a2 + 40), 0, 0);
    }
    else
    {
      if (uarpNtohl(*(_DWORD *)(a3 + 11)) != 1
        || *(unsigned __int16 *)(a2 + 48) >= 2u && !*(_DWORD *)(a2 + 24))
      {
        return 1;
      }
      v12 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v4 + 16);
      if (v12)
        goto LABEL_14;
    }
    return 0;
  }
  return result;
}

uint64_t uarpApplePlatformMessageExceededRetries(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  _QWORD *v4;
  uint64_t v9;
  uint64_t (*v10)(_QWORD, _QWORD, _QWORD, _QWORD);

  v4 = *(_QWORD **)(result + 40);
  if (v4)
  {
    uarpOuiAppleGenericFeatures_myOui = 2492;
    byte_257A5604A = 99;
    if (*(_WORD *)(a3 + 6) == 2492 && *(_BYTE *)(a3 + 8) == 99)
    {
      v9 = result;
      result = uarpHtons(*(unsigned __int16 *)(a3 + 9));
      if (a4 >= 0xF && (_DWORD)result == 32)
      {
        result = uarpHtonl(*(_DWORD *)(a3 + 11));
        if ((_DWORD)result == 1)
        {
          v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[2];
          if (!v10)
            return result;
          return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
        }
        result = uarpHtonl(*(_DWORD *)(a3 + 11));
        if ((_DWORD)result == 2)
        {
          v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[4];
          if (v10)
            return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
        }
        else
        {
          result = uarpHtonl(*(_DWORD *)(a3 + 11));
          if ((_DWORD)result == 3)
          {
            v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[6];
            if (v10)
              return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
          }
          else
          {
            result = uarpHtonl(*(_DWORD *)(a3 + 11));
            if ((_DWORD)result == 4)
            {
              v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[8];
              if (v10)
                return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
            }
            else
            {
              result = uarpHtonl(*(_DWORD *)(a3 + 11));
              if ((_DWORD)result == 5)
              {
                v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[10];
                if (v10)
                  return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
              }
              else
              {
                result = uarpHtonl(*(_DWORD *)(a3 + 11));
                if ((_DWORD)result == 6)
                {
                  v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[12];
                  if (v10)
                    return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                }
                else
                {
                  result = uarpHtonl(*(_DWORD *)(a3 + 11));
                  if ((_DWORD)result == 7)
                  {
                    v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[14];
                    if (v10)
                      return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                  }
                  else
                  {
                    result = uarpHtonl(*(_DWORD *)(a3 + 11));
                    if ((_DWORD)result == 29)
                    {
                      v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[16];
                      if (v10)
                        return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                    }
                    else
                    {
                      result = uarpHtonl(*(_DWORD *)(a3 + 11));
                      if ((_DWORD)result == 8)
                      {
                        v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[18];
                        if (v10)
                          return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                      }
                      else
                      {
                        result = uarpHtonl(*(_DWORD *)(a3 + 11));
                        if ((_DWORD)result == 9)
                        {
                          v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[20];
                          if (v10)
                            return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                        }
                        else
                        {
                          result = uarpHtonl(*(_DWORD *)(a3 + 11));
                          if ((_DWORD)result == 10)
                          {
                            v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[22];
                            if (v10)
                              return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                          }
                          else
                          {
                            result = uarpHtonl(*(_DWORD *)(a3 + 11));
                            if ((_DWORD)result == 11)
                            {
                              v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[24];
                              if (v10)
                                return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                            }
                            else
                            {
                              result = uarpHtonl(*(_DWORD *)(a3 + 11));
                              if ((_DWORD)result == 12)
                              {
                                v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[26];
                                if (v10)
                                  return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                              }
                              else
                              {
                                result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                if ((_DWORD)result == 13)
                                {
                                  v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[28];
                                  if (v10)
                                    return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                                }
                                else
                                {
                                  result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                  if ((_DWORD)result == 14)
                                  {
                                    v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[30];
                                    if (v10)
                                      return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                                  }
                                  else
                                  {
                                    result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                    if ((_DWORD)result == 15)
                                    {
                                      v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[32];
                                      if (v10)
                                        return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                                    }
                                    else
                                    {
                                      result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                      if ((_DWORD)result == 16)
                                      {
                                        v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[34];
                                        if (v10)
                                          return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                                      }
                                      else
                                      {
                                        result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                        if ((_DWORD)result == 17)
                                        {
                                          v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[36];
                                          if (v10)
                                            return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                                        }
                                        else
                                        {
                                          result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                          if ((_DWORD)result == 18)
                                          {
                                            v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[38];
                                            if (v10)
                                              return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                                          }
                                          else
                                          {
                                            result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                            if ((_DWORD)result == 19)
                                            {
                                              v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[40];
                                              if (v10)
                                                return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                                            }
                                            else
                                            {
                                              result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                              if ((_DWORD)result == 20)
                                              {
                                                v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[42];
                                                if (v10)
                                                  return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                                              }
                                              else
                                              {
                                                result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                if ((_DWORD)result == 21)
                                                {
                                                  v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[44];
                                                  if (v10)
                                                    return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                                                }
                                                else
                                                {
                                                  result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                  if ((_DWORD)result == 22)
                                                  {
                                                    v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[46];
                                                    if (v10)
                                                      return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                                                  }
                                                  else
                                                  {
                                                    result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                    if ((_DWORD)result == 23)
                                                    {
                                                      v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[48];
                                                      if (v10)
                                                        return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                                                    }
                                                    else
                                                    {
                                                      result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                      if ((_DWORD)result == 24)
                                                      {
                                                        v10 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))v4[50];
                                                        if (v10)
                                                          return v10(*(_QWORD *)(v9 + 544), *(_QWORD *)(a2 + 40), 0, 0);
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_24BCC5994(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_24BCC5D40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id IICGetDeviceNamesWithPrefix(void *a1)
{
  id v1;
  void *v2;
  mach_port_t v3;
  const __CFDictionary *v4;
  io_object_t v5;
  io_registry_entry_t v6;
  const __CFAllocator *v7;
  void *CFProperty;
  void *v9;
  void *v10;
  io_iterator_t existing;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  existing = 0;
  v3 = *MEMORY[0x24BDD8B20];
  v4 = IOServiceMatching("AppleARMIICDevice");
  if (!IOServiceGetMatchingServices(v3, v4, &existing))
  {
    v5 = IOIteratorNext(existing);
    if (v5)
    {
      v6 = v5;
      v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      do
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, CFSTR("name"), v7, 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", CFProperty, 4);
          if (objc_msgSend(v9, "hasPrefix:", v1))
            objc_msgSend(v2, "addObject:", v9);

        }
        IOObjectRelease(v6);
        v6 = IOIteratorNext(existing);

      }
      while (v6);
    }
    IOObjectRelease(existing);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void *uarpZalloc(size_t a1)
{
  return malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
}

unint64_t uarpHtonll(unint64_t a1)
{
  return bswap64(a1);
}

unint64_t uarpNtohll(unint64_t a1)
{
  return bswap64(a1);
}

uint64_t uarpHtonl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpNtohl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpHtons(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpNtohs(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpPlatformDarwinDecompressBuffer(int a1, void *__src, size_t src_size, void *__dst, size_t __n)
{
  compression_algorithm v5;
  uint64_t result;

  v5 = 1538;
  switch(a1)
  {
    case 0:
      if ((_DWORD)src_size != (_DWORD)__n)
        return 51;
      memcpy(__dst, __src, __n);
      return 0;
    case 1:
      goto LABEL_6;
    case 2:
      v5 = COMPRESSION_LZBITMAP;
      goto LABEL_6;
    case 3:
      v5 = COMPRESSION_LZ4;
LABEL_6:
      if (compression_decode_buffer((uint8_t *)__dst, __n, (const uint8_t *)__src, src_size, 0, v5) == __n)result = 0;
      else
        result = 51;
      break;
    default:
      result = 50;
      break;
  }
  return result;
}

uint64_t uarpPlatformDarwinCompressBuffer()
{
  return 50;
}

uint64_t uarpPlatformDarwinHashInfo(uint64_t result, _DWORD *a2, int *a3)
{
  int v3;
  int v4;
  int v5;

  v3 = result - 1;
  if ((result - 1) > 2)
  {
    v4 = 0;
    v5 = 0;
  }
  else
  {
    v4 = dword_24BCE047C[v3];
    v5 = 16 * v3 + 32;
  }
  *a2 = v4;
  *a3 = v5;
  return result;
}

uint64_t uarpPlatformDarwinHashInit(uint64_t result, CC_SHA512_CTX *c)
{
  switch((_DWORD)result)
  {
    case 3:
      return CC_SHA512_Init(c);
    case 2:
      return CC_SHA384_Init(c);
    case 1:
      return CC_SHA256_Init((CC_SHA256_CTX *)c);
  }
  return result;
}

uint64_t uarpPlatformDarwinHashUpdate(uint64_t result, CC_SHA512_CTX *c, void *data, CC_LONG len)
{
  switch((_DWORD)result)
  {
    case 3:
      return CC_SHA512_Update(c, data, len);
    case 2:
      return CC_SHA384_Update(c, data, len);
    case 1:
      return CC_SHA256_Update((CC_SHA256_CTX *)c, data, len);
  }
  return result;
}

uint64_t uarpPlatformDarwinHashFinal(uint64_t result, CC_SHA512_CTX *a2, unsigned __int8 *md, int a4)
{
  if ((_DWORD)result == 2)
  {
    if (a4 == 48)
      return CC_SHA384_Final(md, a2);
  }
  else if ((_DWORD)result == 1)
  {
    if (a4 == 32)
      return CC_SHA256_Final(md, (CC_SHA256_CTX *)a2);
  }
  else if ((_DWORD)result == 3 && a4 == 64)
  {
    return CC_SHA512_Final(md, a2);
  }
  return result;
}

void uarpLogError(unsigned int a1, char *__format, ...)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  va_list va;

  va_start(va, __format);
  vsnprintf(uarpLogError_logBuffer, 0x200uLL, __format, va);
  v3 = uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    uarpLogError_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t uarpLogToken(unsigned int a1)
{
  uint64_t i;
  const char *v3;

  for (i = 0; i != 9; ++i)
  {
    v3 = uarpLoggingCategoryToString(i);
    uarpLogToken_tokens[i] = os_log_create("com.apple.uarp.embedded", v3);
  }
  if (a1 <= 8)
    return uarpLogToken_tokens[a1];
  else
    return MEMORY[0x24BDACB70];
}

void uarpLogDebug(unsigned int a1, char *__format, ...)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  va_list va;

  va_start(va, __format);
  vsnprintf(uarpLogDebug_logBuffer, 0x200uLL, __format, va);
  v3 = uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    uarpLogDebug_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
}

void uarpLogInfo(unsigned int a1, char *__format, ...)
{
  NSObject *v3;
  uint8_t buf[4];
  char *v5;
  uint64_t v6;
  va_list va;

  va_start(va, __format);
  v6 = *MEMORY[0x24BDAC8D0];
  vsnprintf(uarpLogInfo_logBuffer, 0x200uLL, __format, va);
  v3 = uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v5 = uarpLogInfo_logBuffer;
    _os_log_impl(&dword_24BC99000, v3, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }
}

void uarpLogFault(unsigned int a1, char *__format, ...)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  va_list va;

  va_start(va, __format);
  vsnprintf(uarpLogFault_logBuffer, 0x200uLL, __format, va);
  v3 = uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    uarpLogFault_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
}

void uarpPlatformDarwinLogError(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  vsnprintf(uarpPlatformDarwinLogError_logBuffer, 0x200uLL, a3, &a9);
  v10 = uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    uarpPlatformDarwinLogError_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
}

void uarpPlatformDarwinLogInfo(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  NSObject *v10;
  uint8_t buf[4];
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  vsnprintf(uarpPlatformDarwinLogInfo_logBuffer, 0x200uLL, a3, &a9);
  v10 = uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = uarpPlatformDarwinLogInfo_logBuffer;
    _os_log_impl(&dword_24BC99000, v10, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }
}

void uarpPlatformDarwinLogDebug(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  vsnprintf(uarpPlatformDarwinLogDebug_logBuffer, 0x200uLL, a3, &a9);
  v10 = uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    uarpPlatformDarwinLogDebug_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
}

void uarpPlatformDarwinLogFault(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  NSObject *v10;

  vsnprintf(uarpPlatformDarwinLogFault_logBuffer, 0x200uLL, a3, &a9);
  v10 = uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    uarpPlatformDarwinLogFault_cold_1(v10);
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_24BCC7640(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t uarpPayloadTagPack(unsigned int *a1)
{
  return *a1;
}

uint64_t uarpPayloadTagUnpack(uint64_t result, char *a2)
{
  unsigned int v2;
  unsigned int v3;
  char v4;
  char v5;

  v2 = result >> 8;
  v3 = WORD1(result);
  if ((_DWORD)result)
    v4 = result;
  else
    v4 = 48;
  if (!(_DWORD)result)
  {
    LOBYTE(v2) = 48;
    LOBYTE(v3) = 48;
  }
  *a2 = v4;
  a2[1] = v2;
  if ((_DWORD)result)
    v5 = BYTE3(result);
  else
    v5 = 48;
  a2[2] = v3;
  a2[3] = v5;
  return result;
}

_BYTE *uarpPayloadTagStructPack(_BYTE *result, _BYTE *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[2];
  a2[3] = result[3];
  return result;
}

_BYTE *uarpPayloadTagStructUnpack(_BYTE *result, _BYTE *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[2];
  a2[3] = result[3];
  return result;
}

uint64_t uarpTagStructPack32(unsigned int *a1)
{
  return *a1;
}

uint64_t uarpTagStructUnpack32(uint64_t result, _DWORD *a2)
{
  *a2 = result;
  return result;
}

BOOL uarp4ccCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

BOOL uarpOuiCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t uarpVersionCompare(_DWORD *a1, _DWORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  BOOL v10;
  _BOOL4 v11;

  if (*a1 > *a2)
    return 2;
  if (*a1 < *a2)
    return 1;
  v2 = a1[1];
  v3 = a2[1];
  if (v2 > v3)
    return 2;
  if (v2 < v3)
    return 1;
  v4 = a1[2];
  v5 = a2[2];
  if (v4 > v5)
    return 2;
  if (v4 < v5)
    return 1;
  v7 = a1[3];
  v8 = a2[3];
  v9 = v7 >= v8;
  v10 = v7 == v8;
  v11 = v7 < v8;
  if (!v10 && v9)
    return 2;
  else
    return v11;
}

uint64_t uarpAssetCompare(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a1 + 46) == *(unsigned __int16 *)(a2 + 46)
    && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48)
    && *(unsigned __int8 *)(a1 + 49) == *(unsigned __int8 *)(a2 + 49)
    && *(unsigned __int8 *)(a1 + 50) == *(unsigned __int8 *)(a2 + 50)
    && *(unsigned __int8 *)(a1 + 51) == *(unsigned __int8 *)(a2 + 51)
    && *(_DWORD *)(a1 + 68) == *(_DWORD *)(a2 + 68)
    && *(_DWORD *)(a1 + 448) == *(_DWORD *)(a2 + 448))
  {
    return uarpVersionCompare((_DWORD *)(a1 + 52), (_DWORD *)(a2 + 52));
  }
  else
  {
    return 3;
  }
}

BOOL uarpAssetTagCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

uint64_t uarpVersionEndianSwap(unsigned int *a1, _DWORD *a2)
{
  uint64_t result;

  *a2 = uarpNtohl(*a1);
  a2[1] = uarpNtohl(a1[1]);
  a2[2] = uarpNtohl(a1[2]);
  result = uarpNtohl(a1[3]);
  a2[3] = result;
  return result;
}

const char *uarpStatusCodeToString(unsigned int a1)
{
  if (a1 > 0x3E)
    return "<unknown>";
  else
    return (&off_251CE5030)[a1];
}

BOOL uarpAssetTagIsValid(_BYTE *a1)
{
  return *a1 || a1[1] || a1[2] || a1[3];
}

int *uarpAssetTagStructSuperBinary()
{
  int *result;

  result = &uarpAssetTagStructSuperBinary_myTag;
  uarpAssetTagStructSuperBinary_myTag = 0;
  return result;
}

const char *uarpApplyFlagsToString(int a1)
{
  if ((a1 - 1) > 5)
    return "<unknown>";
  else
    return (&off_251CE5228)[a1 - 1];
}

const char *uarpProcessingFlagsReasonToString(int a1)
{
  unsigned int v1;
  unint64_t v2;

  HIDWORD(v2) = a1;
  LODWORD(v2) = a1 - 256;
  v1 = v2 >> 8;
  if (v1 > 0xE)
    return "<unknown>";
  else
    return (&off_251CE5258)[v1];
}

const char *uarpProcessingStatusToString(int a1)
{
  if ((a1 - 1) > 4)
    return "<unknown>";
  else
    return (&off_251CE52D0)[(__int16)(a1 - 1)];
}

__int128 *uarpStageStatusToString(unsigned __int16 a1)
{
  const char *v1;
  const char *v2;

  v1 = "Upload Denied";
  switch((char)a1)
  {
    case 1:
      strcpy((char *)uarpStageStatusToString_stageStatusString, "Upload Complete");
      return uarpStageStatusToString_stageStatusString;
    case 2:
      goto LABEL_7;
    case 3:
      v1 = "Upload Abandoned";
      goto LABEL_7;
    case 4:
      v1 = "Asset Corrupt";
      goto LABEL_7;
    case 5:
      v1 = "Asset Not Found";
      goto LABEL_7;
    default:
      v1 = "<unknown>";
LABEL_7:
      v2 = uarpProcessingFlagsReasonToString(a1 & 0xFF00);
      snprintf((char *)uarpStageStatusToString_stageStatusString, 0x100uLL, "%s (%s)", v1, v2);
      return uarpStageStatusToString_stageStatusString;
  }
}

const char *uarpEndpointRoleToString(unsigned int a1)
{
  if (a1 > 2)
    return "<unknown>";
  else
    return (&off_251CE5340)[a1];
}

const char *uarpLoggingCategoryToString(unsigned int a1)
{
  if (a1 > 8)
    return "<unknown>";
  else
    return (&off_251CE52F8)[a1];
}

void *uarpProcessPayloadTLVInternal(void *result, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, _DWORD *a6)
{
  uint64_t v10;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  void **v15;
  void **v16;
  int v17;
  int v18;

  v10 = (uint64_t)result;
  if (a4 == -858619624)
  {
    *(_DWORD *)(a3 + 120) = a5;
    v15 = (void **)(a3 + 112);
    if (!UARPLayer2RequestBuffer((uint64_t)result, (_QWORD *)(a3 + 112), a5) && *v15)
      return memcpy(*v15, a6, *(unsigned int *)(a3 + 120));
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }
  if (a4 == -858619625)
  {
    if ((_DWORD)a5 == 2)
    {
      v12 = uarpNtohs(*(unsigned __int16 *)a6);
      *(_DWORD *)(a3 + 76) = v12;
      UARPLayer2HashInfo(v10, v12, (_DWORD *)(a3 + 88), (_DWORD *)(a3 + 104));
      v13 = *(_DWORD *)(a3 + 88);
      if (!v13 || !UARPLayer2RequestBuffer(v10, (_QWORD *)(a3 + 80), v13) && *(_QWORD *)(a3 + 80))
      {
        v14 = *(_DWORD *)(a3 + 104);
        if (!v14 || !UARPLayer2RequestBuffer(v10, (_QWORD *)(a3 + 96), v14) && *(_QWORD *)(a3 + 96))
          return (void *)UARPLayer2HashInit(v10, *(unsigned int *)(a3 + 76), *(_QWORD *)(a3 + 80));
      }
      *(_DWORD *)(a3 + 76) = 0;
    }
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }
  if (*(_DWORD *)(a3 + 76))
  {
    v18 = uarpHtonl(a4);
    UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(_QWORD *)(a3 + 80), (uint64_t)&v18, 4);
    v17 = uarpHtonl(a5);
    UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(_QWORD *)(a3 + 80), (uint64_t)&v17, 4);
    result = (void *)UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(_QWORD *)(a3 + 80), (uint64_t)a6, a5);
  }
  switch(a4)
  {
    case 0xCCD28119:
      if ((_DWORD)a5 == 4)
      {
        result = (void *)uarpNtohl(*a6);
        *(_DWORD *)(a3 + 128) = (_DWORD)result;
        return result;
      }
      break;
    case 0xCCD28112:
      if ((_DWORD)a5 == 2)
      {
        result = (void *)uarpNtohs(*(unsigned __int16 *)a6);
        *(_DWORD *)(a3 + 56) = (_DWORD)result;
        return result;
      }
      break;
    case 0xCCD28107:
      *(_DWORD *)(a3 + 72) = a5;
      v16 = (void **)(a3 + 64);
      if (!UARPLayer2RequestBuffer(v10, (_QWORD *)(a3 + 64), a5) && *v16)
        return memcpy(*v16, a6, *(unsigned int *)(a3 + 72));
      break;
    default:
      return result;
  }
  return (void *)UARPLayer2AssetCorrupt(v10, a2);
}

uint64_t uarpAssetSuperBinaryVersionForProtocolVersion(unsigned int a1)
{
  if (a1 < 3)
    return 2;
  else
    return 3;
}

void uarpPrintDataResponseDetails(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6, int a7)
{
  void (*v12)(uint64_t, uint64_t, const char *, ...);
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;
  void (*v20)(_QWORD, uint64_t, const char *, ...);
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  const char *v26;

  v12 = *(void (**)(uint64_t, uint64_t, const char *, ...))(a1 + 408);
  if (v12)
  {
    v13 = *(_QWORD *)(a1 + 544);
    v14 = *(int *)(a1 + 552);
    if (v14 > 2)
      v15 = "<unknown>";
    else
      v15 = (&off_251CE5340)[v14];
    v18 = uarpStatusCodeToString(a4);
    v12(v13, 1, "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u", v15, v18, a5, a6, a7);
  }
  else
  {
    v16 = *(int *)(a1 + 552);
    if (v16 > 2)
      v17 = "<unknown>";
    else
      v17 = (&off_251CE5340)[v16];
    v19 = uarpStatusCodeToString(a4);
    uarpLogInfo(1u, "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u", v17, v19, a5, a6, a7);
  }
  v20 = *(void (**)(_QWORD, uint64_t, const char *, ...))(a1 + 408);
  if (v20)
  {
    v21 = *(int *)(a1 + 552);
    if (v21 > 2)
      v22 = "<unknown>";
    else
      v22 = (&off_251CE5340)[v21];
    if (*(_BYTE *)(a3 + 80) == 1)
      v25 = "YES";
    else
      v25 = "NO";
    v20(*(_QWORD *)(a1 + 544), 1, "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u", v22, v25, *(_DWORD *)(a3 + 92), *(_DWORD *)(a3 + 96));
  }
  else
  {
    v23 = *(int *)(a1 + 552);
    if (v23 > 2)
      v24 = "<unknown>";
    else
      v24 = (&off_251CE5340)[v23];
    if (*(_BYTE *)(a3 + 80) == 1)
      v26 = "YES";
    else
      v26 = "NO";
    uarpLogInfo(1u, "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u", v24, v26, *(_DWORD *)(a3 + 92), *(_DWORD *)(a3 + 96));
  }
}

uint64_t uarpCopyDefaultInfoString(_DWORD *a1, uint64_t a2)
{
  if (a2 < 7)
    return 0;
  *(_DWORD *)((char *)a1 + 3) = 1314344782;
  *a1 = 1313558101;
  return a2;
}

void OUTLINED_FUNCTION_4_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id _endpointInitialize(void *a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(uint64_t a1, void *a2, uint64_t a3, unsigned int a4))
{
  id v7;

  v7 = a1;
  objc_msgSend(v7, "setUarpChipCallbacks:", a3);
  objc_msgSend(v7, "setUarpContext:", a2);

  *a4 = _endpointMsgSend;
  return v7;
}

void _applePropertyUpdate(uint64_t a1, int a2)
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;

  v4 = *(id *)(a1 + 48);
  switch(a2)
  {
    case 4:
      objc_msgSend(v4, "setBoardID:", CoreUARPRestoreEndpointPropertyBoardID(*(_QWORD *)(a1 + 40)));
      break;
    case 5:
      objc_msgSend(v4, "setChipID:", CoreUARPRestoreEndpointPropertyChipID(*(_QWORD *)(a1 + 40)));
      break;
    case 6:
      objc_msgSend(v4, "setChipRev:", CoreUARPRestoreEndpointPropertyChipRevision(*(_QWORD *)(a1 + 40)));
      break;
    case 7:
      objc_msgSend(v4, "setECID:", CoreUARPRestoreEndpointPropertyECID(*(_QWORD *)(a1 + 40)));
      break;
    case 8:
      objc_msgSend(v4, "setSecurityDomain:", CoreUARPRestoreEndpointPropertySecurityDomain(*(_QWORD *)(a1 + 40)));
      break;
    case 9:
      objc_msgSend(v4, "setSecurityMode:", CoreUARPRestoreEndpointPropertySecurityMode(*(_QWORD *)(a1 + 40)));
      break;
    case 10:
      objc_msgSend(v4, "setProductionMode:", CoreUARPRestoreEndpointPropertyProductionMode(*(_QWORD *)(a1 + 40)));
      break;
    case 11:
      objc_msgSend(v4, "setSecurityEpoch:", CoreUARPRestoreEndpointPropertyChipEpoch(*(_QWORD *)(a1 + 40)));
      break;
    case 24:
      v7 = 0;
      v6 = 0;
      CoreUARPRestoreEndpointPropertyNonce(*(_QWORD *)(a1 + 40), &v7, &v6);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v7, v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setNonce:", v5);

      break;
    default:
      break;
  }

}

uint64_t _propertyQueriesComplete(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "queryComplete");
}

uint64_t _endpointMsgSend(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDBCE50];
  v6 = a4;
  v7 = a2;
  objc_msgSend(v5, "dataWithBytes:length:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeData:", v8);

  return 0;
}

const char *stringForATCRTTaskSFWiResult(unsigned int a1)
{
  if (a1 > 3)
    return "Unrecognized";
  else
    return off_251CE5440[a1];
}

const char *stringForATCRTTaskSFWdResult(unsigned int a1)
{
  if (a1 > 6)
    return "Unrecognized";
  else
    return off_251CE5460[a1];
}

const char *stringForATCRTTaskSFWfResult(unsigned int a1)
{
  if (a1 > 6)
    return "Unrecognized";
  else
    return off_251CE5460[a1];
}

const char *stringForATCRTTaskSFWsResult(unsigned int a1)
{
  if (a1 > 6)
    return "Unrecognized";
  else
    return off_251CE5498[a1];
}

id AppleTypeCRetimerGetRouterIDsForIicPrefix(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  IICGetDeviceNamesWithPrefix(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = objc_msgSend(v1, "length");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "deleteCharactersInRange:", 0, v3);
          v15 = 0;
          v10 = objc_retainAutorelease(v9);
          if (sscanf((const char *)objc_msgSend(v10, "UTF8String"), "%u", &v15) == 1)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v15);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v11);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

  }
  objc_msgSend(v14, "sortUsingComparator:", &__block_literal_global_3);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

const char *stringForACEDeviceID(int a1)
{
  if (a1 > 826622784)
  {
    if (a1 != 826622785)
    {
      if (a1 == 860308291)
        return "HCPM";
      return "Unrecognized";
    }
    return "ACE";
  }
  else
  {
    if (a1 != 13447703)
    {
      if (a1 == 13447704)
        return "ACE2 No FET";
      return "Unrecognized";
    }
    return "ACE2";
  }
}

const char *stringForACEDeviceType(int a1)
{
  if (a1 == 1228030752)
    return "I2C";
  else
    return "Unrecognized";
}

const char *stringForACEDeviceMode(int a1)
{
  const char *v1;

  v1 = "Unrecognized";
  if (a1 == 1095782432)
    v1 = "App";
  if (a1 == 1112493908)
    return "Boot";
  else
    return v1;
}

id stringForUpdateStatus(uint64_t a1)
{
  if (a1 < 0x1A)
    return *((id *)&off_251CE54D0 + (int)a1);
  if ((a1 - 188) > 0x34)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unrecognized error 0x%x"), a1);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IOReturn 0x%08x"), a1 | 0xE0000200);
  return (id)objc_claimAutoreleasedReturnValue();
}

const char *stringForACETaskResult(unsigned int a1)
{
  if (a1 > 4)
    return "Unrecognized";
  else
    return off_251CE55A0[(char)a1];
}

_QWORD *UarpRestoreInitializeEndpoint(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  return UarpRestoreInitializeEndpoint2(a1, a2, a3, 0, a4);
}

_QWORD *UarpRestoreInitializeEndpoint2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5)
{
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  const char *v13;
  dispatch_queue_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  int v22;
  __int128 v24;
  void (*v25)(uint64_t, uint64_t, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v26)(uint64_t, uint64_t, int, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v27)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v28)(dispatch_queue_t *, uint64_t, uint64_t, uint64_t, char);
  void (*v29)(uint64_t, const void *, size_t);
  void (*v30)(dispatch_queue_t *, int);
  void (*v31)(dispatch_queue_t *, int);
  void (*v32)(uint64_t, const void *, uint64_t, uint64_t);
  void (*v33)(uint64_t, unsigned int, uint64_t);
  void (*v34)(uint64_t, unsigned int, uint64_t);
  void (*v35)(uint64_t, unsigned int, uint64_t);
  void (*v36)(uint64_t, unsigned int, uint64_t);
  _QWORD v37[2];

  if (!a5)
    return 0;
  v37[0] = UarpRestoreEndpointMsgRecv;
  v37[1] = UarpRestoreEndpointDataRecv;
  v10 = uarpZalloc(0x108uLL);
  if (v10)
  {
    v11 = uarpZalloc(0x50uLL);
    v12 = 0;
    v10[32] = v11;
    do
    {
      v13 = uarpLoggingCategoryToString(v12);
      v11[v12++] = os_log_create("com.apple.uarp.layer3.restore", v13);
    }
    while (v12 != 9);
    v14 = dispatch_queue_create(a5, 0);
    v10[7] = a1;
    *v10 = v14;
    v10[1] = a2;
    v15 = *(_OWORD *)(a3 + 80);
    v16 = *(_OWORD *)(a3 + 96);
    v17 = *(_OWORD *)(a3 + 112);
    v10[24] = *(_QWORD *)(a3 + 128);
    *((_OWORD *)v10 + 10) = v16;
    *((_OWORD *)v10 + 11) = v17;
    *((_OWORD *)v10 + 9) = v15;
    v18 = *(_OWORD *)(a3 + 16);
    v19 = *(_OWORD *)(a3 + 32);
    v20 = *(_OWORD *)(a3 + 64);
    *((_OWORD *)v10 + 7) = *(_OWORD *)(a3 + 48);
    *((_OWORD *)v10 + 8) = v20;
    *((_OWORD *)v10 + 5) = v18;
    *((_OWORD *)v10 + 6) = v19;
    *((_OWORD *)v10 + 4) = *(_OWORD *)a3;
    v21 = ((uint64_t (*)(uint64_t, _QWORD *, _QWORD *, _QWORD *))v10[8])(a2, v10, v37, v10 + 3);
    v10[6] = v21;
    if (v21)
    {
      *(_QWORD *)&v24 = UarpRestoreLayer3MsgSend;
      *((_QWORD *)&v24 + 1) = UarpRestoreLayer3FirmwareStageProgress;
      v25 = UarpRestoreLayer3FirmwareStageStatus;
      v26 = UarpRestoreLayer3ApplyStatus;
      v27 = UarpRestoreLayer3AssetsRescinded;
      v28 = UarpRestoreLayer3TssRequest;
      v29 = UarpRestoreLayer3TssResponse;
      v30 = UarpRestoreLayer3UarpPropertyUpdate;
      v31 = UarpRestoreLayer3ApplePropertyUpdate;
      v32 = UarpRestoreLayer3PersonalizedFirmware;
      v33 = UarpRestoreLayer3LogError;
      v34 = UarpRestoreLayer3LogInfo;
      v35 = UarpRestoreLayer3LogDebug;
      v36 = UarpRestoreLayer3LogFault;
      CoreUARPRestoreEndpointInitialize(v10 + 5, &v24, a4, *v10, (uint64_t)v10);
      if (!v22)
      {
        dispatch_async_f((dispatch_queue_t)*v10, v10, (dispatch_function_t)UarpRestoreRemoteEndpointAddHandler);
        return v10;
      }
    }
    uarpFree(v10);
    return 0;
  }
  return v10;
}

void UarpRestoreFinalizeEndpoint(uint64_t *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = CoreUARPRestoreEndpointRemoteEndpointRemove(a1[5]);
  if (v2)
    UarpRestoreLayer3LogErrorInternal((uint64_t)a1, v3, "UARP Restore: Failed to remove endpoint, status 0x%08x", v4, v5, v6, v7, v8, v2);
  CoreUARPRestoreEndpointFinalize(a1[5]);
  v9 = (void *)a1[30];
  if (v9)
  {
    uarpFree(v9);
    a1[30] = 0;
    a1[31] = 0;
  }
  v10 = (void *)a1[32];
  if (v10)
  {
    uarpFree(v10);
    a1[32] = 0;
  }
  uarpFree(a1);
}

void UarpRestoreLayer3LogErrorInternal(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(UarpRestoreLayer3LogErrorInternal_logBuffer, 0x400uLL, a3, &a9);
  UarpRestoreLayer3LogError(a1, 2u, (uint64_t)UarpRestoreLayer3LogErrorInternal_logBuffer);
}

uint64_t UarpRestoreStageFirmwareFilename(uint64_t a1, char *__s1)
{
  uint64_t result;

  result = 30;
  if (a1)
  {
    if (__s1)
    {
      *(_QWORD *)(a1 + 208) = strdup(__s1);
      dispatch_async_f(*(dispatch_queue_t *)a1, (void *)a1, (dispatch_function_t)UarpRestoreStageFirmwareFilenameQueueHandler);
      return 0;
    }
  }
  return result;
}

void UarpRestoreStageFirmwareFilenameQueueHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a1)
  {
    v9 = *(_QWORD *)(a1 + 40);
    *(_BYTE *)(v9 + 1936) = 1;
    v10 = CoreUARPRestoreEndpointOfferSuperBinary(v9, *(const char **)(a1 + 208));
    if (v10)
    {
      UarpRestoreLayer3LogErrorInternal(a1, v11, "UARP Restore: Failed to offer superbinary, status 0x%08x", v12, v13, v14, v15, v16, v10);
      UarpRestoreLayer3FirmwareStageStatus(a1, 5, 2560, v17, v18, v19, v20, v21);
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreStageFirmwareFilenameQueueHandler");
  }
}

uint64_t UarpRestoreStageFirmwareDataBuffer(uint64_t a1, const void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  void *v12;
  char v13;

  result = 30;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 240))
    {
      UarpRestoreLayer3LogErrorInternal(a1, (uint64_t)a2, "UARP Restore: Offered Firmware with outstanding offer", a4, a5, a6, a7, a8, v13);
      return 54;
    }
    else
    {
      v12 = uarpZalloc(a3);
      *(_QWORD *)(a1 + 240) = v12;
      *(_QWORD *)(a1 + 248) = a3;
      memcpy(v12, a2, a3);
      dispatch_async_f(*(dispatch_queue_t *)a1, (void *)a1, (dispatch_function_t)UarpRestoreStageFirmwareDataBufferQueueHandler);
      return 0;
    }
  }
  return result;
}

void UarpRestoreStageFirmwareDataBufferQueueHandler(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (a1)
  {
    v9 = a1[30];
    if (v9)
    {
      v10 = a1[5];
      *(_BYTE *)(v10 + 1936) = 0;
      v11 = CoreUARPRestoreEndpointOfferSuperBinaryBuffer(v10, v9, a1[31]);
      if (v11)
      {
        UarpRestoreLayer3LogErrorInternal((uint64_t)a1, v12, "UARP Restore: Failed to offer superbinary, status 0x%08x", v13, v14, v15, v16, v17, v11);
        UarpRestoreLayer3FirmwareStageStatus((uint64_t)a1, 5, 2560, v18, v19, v20, v21, v22);
      }
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal((uint64_t)a1, 0, "%s: NULL pBuffer", a4, a5, a6, a7, a8, (char)"UarpRestoreStageFirmwareDataBufferQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreStageFirmwareDataBufferQueueHandler");
  }
}

uint64_t UarpRestoreApplyStagedAssets(dispatch_queue_t *context)
{
  dispatch_async_f(*context, context, (dispatch_function_t)UarpRestoreApplyStagedAssetsHandler);
  return 0;
}

void UarpRestoreApplyStagedAssetsHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
    CoreUARPRestoreEndpointRemoteEndpointApplyStagedAssets(*(_QWORD *)(a1 + 40));
  else
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreApplyStagedAssetsHandler");
}

uint64_t UarpRestoreInfoQueries(dispatch_queue_t *a1, const void *a2, int a3, const void *a4, int a5)
{
  BOOL v8;
  char v9;
  uint64_t result;
  BOOL v13;
  BOOL v14;
  int *v15;
  void *v16;
  void *v17;

  if (!a1)
    return 30;
  if (a2)
    v8 = 1;
  else
    v8 = a3 <= 0;
  v9 = !v8;
  result = 30;
  if ((a3 & 0x80000000) == 0 && (v9 & 1) == 0)
  {
    v13 = a4 || a5 <= 0;
    v14 = !v13;
    if ((a5 & 0x80000000) == 0 && !v14)
    {
      v15 = (int *)uarpZalloc(0x28uLL);
      *(_QWORD *)v15 = a1;
      v15[2] = a3;
      if (a3 >= 1)
      {
        v16 = malloc_type_calloc(a3, 4uLL, 0x100004052888210uLL);
        *((_QWORD *)v15 + 2) = v16;
        memcpy(v16, a2, 4 * v15[2]);
      }
      v15[6] = a5;
      if (a5 >= 1)
      {
        v17 = malloc_type_calloc(a5, 4uLL, 0x100004052888210uLL);
        *((_QWORD *)v15 + 4) = v17;
        memcpy(v17, a4, 4 * v15[6]);
      }
      dispatch_async_f(*a1, v15, (dispatch_function_t)UarpRestoreInfoQueriesQueueHandler);
      return 0;
    }
  }
  return result;
}

void UarpRestoreInfoQueriesQueueHandler(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if (a1)
  {
    v9 = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
    {
      if (a1[2])
      {
        v10 = 0;
        do
        {
          if (!uarpPlatformEndpointRequestInfoProperty(*(_QWORD *)(v9 + 40) + 648, *(_QWORD *)(v9 + 40) + 1728, *(_DWORD *)(*((_QWORD *)a1 + 2) + 4 * v10)))++*(_DWORD *)(v9 + 200);
          ++v10;
        }
        while (v10 < a1[2]);
      }
      if (a1[6])
      {
        v11 = 0;
        do
        {
          if (!CoreUARPRestoreEndpointQueryAppleProperty(*(_QWORD *)(v9 + 40), *(_DWORD *)(*((_QWORD *)a1 + 4) + 4 * v11)))++*(_DWORD *)(v9 + 200);
          ++v11;
        }
        while (v11 < a1[6]);
      }
      free(*((void **)a1 + 4));
      free(*((void **)a1 + 2));
      free(a1);
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreInfoQueriesQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreInfoQueriesQueueHandler");
  }
}

uint64_t UarpRestoreInfoPropertyManufacturerName(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyManufacturerName(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyModelName(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyModelName(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertySerialNumber(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertySerialNumber(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyHardwareVersion(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyHadwareVersion(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyFirmwareVersion(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyActiveFirmwareVersion(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyStagedFirmwareVersion(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyStagedFirmwareVersion(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyFriendlyName(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyFriendlyName(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyAppleModelNumber(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyAppleModelNumber(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyHardwareFusing(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyHardwareFusing(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyManifestPrefix(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyManifestPrefix(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyBoardID(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyBoardID(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyBoardID64(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyBoardID64(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyChipID(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyChipID(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyChipRevision(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyChipRevision(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyECID(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyECID(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertySecurityDomain(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertySecurityDomain(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertySecurityMode(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertySecurityMode(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyProductionMode(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyProductionMode(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyChipEpoch(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyChipEpoch(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyEnableMixMatch(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyEnableMixMatch(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyLiveNonce(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyLiveNonce(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyPrefixNeedsLUN(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyPrefixNeedsLUN(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertySuffixNeedsLUN(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertySuffixNeedsLUN(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyLogicalUnitNumber(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyLogicalUnitNumber(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyTicketLongName(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyTicketLongName(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyRequiresPersonalization(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyRequiresPersonalization(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyApBoardID(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyApBoardID(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyApChipID(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyApChipID(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyApProductionMode(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyApProductionMode(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyApSecurityMode(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyApSecurityMode(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyHardwareSpecific(uint64_t result, _QWORD *a2, _DWORD *a3)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyHardwareSpecific(*(_QWORD *)(result + 40), a2, a3);
  return result;
}

uint64_t UarpRestoreInfoPropertyNonce(uint64_t result, _QWORD *a2, _DWORD *a3)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyNonce(*(_QWORD *)(result + 40), a2, a3);
  return result;
}

uint64_t UarpRestoreInfoPropertyLife(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyLife(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyProvisioning(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyProvisioning(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyManifestEpoch(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyManifestEpoch(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyManifestSuffix(uint64_t result)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyManifestSuffix(*(_QWORD *)(result + 40));
  return result;
}

uint64_t UarpRestoreInfoPropertyEcidData(uint64_t result, _QWORD *a2, _DWORD *a3)
{
  if (result)
    return CoreUARPRestoreEndpointPropertyECIDData(*(_QWORD *)(result + 40), a2, a3);
  return result;
}

uint64_t UarpRestoreEndpointMsgRecv(dispatch_queue_t *a1, uint64_t a2, const void *a3, unsigned int a4)
{
  _QWORD *v7;
  void *v8;

  v7 = uarpZalloc(0x18uLL);
  *v7 = a1;
  v8 = uarpZalloc(a4);
  v7[1] = v8;
  *((_DWORD *)v7 + 4) = a4;
  memcpy(v8, a3, a4);
  dispatch_async_f(*a1, v7, (dispatch_function_t)UarpRestoreEndpointMsgRecvQueueHandler);
  return 0;
}

uint64_t UarpRestoreEndpointDataRecv(dispatch_queue_t *a1, uint64_t a2, const void *a3, unsigned int a4)
{
  _QWORD *v7;
  void *v8;

  v7 = uarpZalloc(0x18uLL);
  *v7 = a1;
  v8 = uarpZalloc(a4);
  v7[1] = v8;
  *((_DWORD *)v7 + 4) = a4;
  memcpy(v8, a3, a4);
  dispatch_async_f(*a1, v7, (dispatch_function_t)UarpRestoreEndpointDataRecvQueueHandler);
  return 0;
}

uint64_t UarpRestoreLayer3MsgSend(dispatch_queue_t *a1, uint64_t a2, int a3)
{
  _QWORD *v6;

  v6 = uarpZalloc(0x18uLL);
  *v6 = a1;
  v6[1] = a2;
  *((_DWORD *)v6 + 4) = a3;
  dispatch_async_f(*a1, v6, (dispatch_function_t)UarpRestoreLayer3MsgSendQueueHandler);
  return 0;
}

uint64_t UarpRestoreLayer3FirmwareStageProgress(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 104);
  if (v1)
    return v1();
  return result;
}

void UarpRestoreLayer3FirmwareStageStatus(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  _DWORD *v11;

  if (*(_QWORD *)(a1 + 112))
  {
    v9 = a2;
    UarpRestoreLayer3LogInfoInternal(a1, a2, "UARP Restore Layer 3: Stage Status; status <0x%04x>, reason <0x%04x>",
      a4,
      a5,
      a6,
      a7,
      a8,
      a2);
    v11 = uarpZalloc(0x10uLL);
    *(_QWORD *)v11 = a1;
    v11[2] = v9;
    v11[3] = a3;
    dispatch_async_f(*(dispatch_queue_t *)a1, v11, (dispatch_function_t)UarpRestoreLayer3FirmwareStageStatusQueueHandler);
  }
}

void UarpRestoreLayer3ApplyStatus(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  _DWORD *v11;

  if (*(_QWORD *)(a1 + 120))
  {
    v9 = a2;
    UarpRestoreLayer3LogInfoInternal(a1, a2, "UARP Restore Layer 3: Apply Staged Assets; status <0x%04x>, flags <0x%04x>",
      a4,
      a5,
      a6,
      a7,
      a8,
      a2);
    v11 = uarpZalloc(0x10uLL);
    *(_QWORD *)v11 = a1;
    v11[2] = v9;
    v11[3] = a3;
    dispatch_async_f(*(dispatch_queue_t *)a1, v11, (dispatch_function_t)UarpRestoreLayer3FirmwareApplyStatusQueueHandler);
  }
}

void UarpRestoreLayer3AssetsRescinded(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  UarpRestoreLayer3FirmwareStageStatus(a1, 3, 3840, a4, a5, a6, a7, a8);
}

void UarpRestoreLayer3TssRequest(dispatch_queue_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v9;

  v9 = uarpZalloc(0x20uLL);
  *v9 = a1;
  v9[1] = a2;
  v9[2] = a4;
  *((_BYTE *)v9 + 24) = a5;
  dispatch_async_f(*a1, v9, (dispatch_function_t)UarpRestoreLayer3TssRequestQueueHandler);
}

void UarpRestoreLayer3TssResponse(uint64_t a1, const void *a2, size_t a3)
{
  const char *v4;
  FILE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  FILE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = *(const char **)(a1 + 216);
  if (v4)
  {
    v7 = fopen(v4, "w+");
    if (v7)
    {
      v14 = v7;
      if (fwrite(a2, 1uLL, a3, v7) != a3)
        UarpRestoreLayer3LogErrorInternal(a1, v15, "UARP Restore: Mismatch in writing to manifest file %s.Expected to write %d bytes, actually wrote %d bytes", v16, v17, v18, v19, v20, *(_QWORD *)(a1 + 216));
      fclose(v14);
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(a1, v8, "UARP Restore: Could not open manifest file %s", v9, v10, v11, v12, v13, *(_QWORD *)(a1 + 216));
    }
  }
}

void UarpRestoreLayer3UarpPropertyUpdate(dispatch_queue_t *a1, int a2)
{
  _DWORD *v4;

  v4 = uarpZalloc(0x10uLL);
  *(_QWORD *)v4 = a1;
  v4[2] = a2;
  dispatch_async_f(*a1, v4, (dispatch_function_t)UarpRestoreLayer3UarpPropertyUpdateQueueHandler);
}

void UarpRestoreLayer3ApplePropertyUpdate(dispatch_queue_t *a1, int a2)
{
  _DWORD *v4;

  v4 = uarpZalloc(0x10uLL);
  *(_QWORD *)v4 = a1;
  v4[2] = a2;
  dispatch_async_f(*a1, v4, (dispatch_function_t)UarpRestoreLayer3ApplePropertyUpdateQueueHandler);
}

void UarpRestoreLayer3PersonalizedFirmware(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  const char *v8;
  FILE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  FILE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, const void *, uint64_t, uint64_t);

  if ((_DWORD)a3)
  {
    if (a2)
    {
      v8 = *(const char **)(a1 + 232);
      if (v8)
      {
        v9 = fopen(v8, "w+");
        if (!v9)
        {
          UarpRestoreLayer3LogErrorInternal(a1, v10, "UARP Restore: Could not open personalized firmware file %s", v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 232));
          return;
        }
        v16 = v9;
        if (fwrite(a2, 1uLL, a3, v9) != a3)
          UarpRestoreLayer3LogErrorInternal(a1, v17, "UARP Restore: Mismatch in writing to personalized firmware file %s.Expected to write %d bytes, actually wrote %d bytes", v18, v19, v20, v21, v22, *(_QWORD *)(a1 + 232));
        fflush(v16);
        fclose(v16);
      }
    }
  }
  v23 = *(void (**)(uint64_t, const void *, uint64_t, uint64_t))(a1 + 160);
  if (v23)
    v23(a1, a2, a3, a4);
}

void UarpRestoreLayer3LogError(uint64_t a1, unsigned int a2, uint64_t a3)
{
  void (*v4)(void);
  uint64_t v5;
  NSObject *v6;

  if (a1 && (v4 = *(void (**)(void))(a1 + 168)) != 0)
  {
    v4();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 256);
    if (v5)
    {
      if (a2 <= 9)
        v6 = *(NSObject **)(v5 + 8 * a2);
      else
        v6 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        UarpRestoreLayer3LogError_cold_1(a3, v6);
    }
  }
}

void UarpRestoreLayer3LogInfo(uint64_t a1, unsigned int a2, uint64_t a3)
{
  void (*v4)(void);
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a1 && (v4 = *(void (**)(void))(a1 + 176)) != 0)
  {
    v4();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 256);
    if (v5)
    {
      if (a2 <= 9)
        v6 = *(NSObject **)(v5 + 8 * a2);
      else
        v6 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = 136315138;
        v8 = a3;
        _os_log_impl(&dword_24BC99000, v6, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

void UarpRestoreLayer3LogDebug(uint64_t a1, unsigned int a2, uint64_t a3)
{
  void (*v4)(void);
  uint64_t v5;
  NSObject *v6;

  if (a1 && (v4 = *(void (**)(void))(a1 + 184)) != 0)
  {
    v4();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 256);
    if (v5)
    {
      if (a2 <= 9)
        v6 = *(NSObject **)(v5 + 8 * a2);
      else
        v6 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        UarpRestoreLayer3LogDebug_cold_1(a3, v6);
    }
  }
}

void UarpRestoreLayer3LogFault(uint64_t a1, unsigned int a2, uint64_t a3)
{
  void (*v4)(void);
  uint64_t v5;
  NSObject *v6;

  if (a1 && (v4 = *(void (**)(void))(a1 + 192)) != 0)
  {
    v4();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 256);
    if (v5)
    {
      if (a2 <= 9)
        v6 = *(NSObject **)(v5 + 8 * a2);
      else
        v6 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        UarpRestoreLayer3LogFault_cold_1(a3, v6);
    }
  }
}

void UarpRestoreRemoteEndpointAddHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1)
  {
    if (CoreUARPRestoreEndpointRemoteEndpointAdd(*(_QWORD *)(a1 + 40)))
      UarpRestoreLayer3LogErrorInternal(0, v8, "%s: ERROR adding remote endpoint, status = 0x%08x", v9, v10, v11, v12, v13, (char)"UarpRestoreRemoteEndpointAddHandler");
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreRemoteEndpointAddHandler");
  }
}

void UarpRestoreEndpointMsgRecvQueueHandler(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  unsigned __int16 *v10;

  if (a1)
  {
    v9 = *(_QWORD *)a1;
    if (v9)
    {
      v10 = (unsigned __int16 *)*((_QWORD *)a1 + 1);
      if (v10)
      {
        CoreUARPRestoreEndpointMsgRecv(*(_QWORD *)(v9 + 40), v10, *((_DWORD *)a1 + 4));
        uarpFree(*((void **)a1 + 1));
        uarpFree(a1);
      }
      else
      {
        UarpRestoreLayer3LogErrorInternal(v9, 0, "%s: NULL pBuffer", a4, a5, a6, a7, a8, (char)"UarpRestoreEndpointMsgRecvQueueHandler");
      }
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreEndpointMsgRecvQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreEndpointMsgRecvQueueHandler");
  }
}

void UarpRestoreEndpointDataRecvQueueHandler(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  char *v10;

  if (a1)
  {
    v9 = *(_QWORD *)a1;
    if (v9)
    {
      v10 = (char *)*((_QWORD *)a1 + 1);
      if (v10)
      {
        CoreUARPRestoreEndpointDataRecv(*(_QWORD *)(v9 + 40), v10, *((_DWORD *)a1 + 4));
        uarpFree(*((void **)a1 + 1));
        uarpFree(a1);
      }
      else
      {
        UarpRestoreLayer3LogErrorInternal(v9, 0, "%s: NULL pBuffer", a4, a5, a6, a7, a8, (char)"UarpRestoreEndpointDataRecvQueueHandler");
      }
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreEndpointDataRecvQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreEndpointDataRecvQueueHandler");
  }
}

void UarpRestoreLayer3MsgSendQueueHandler(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  uint64_t (*v10)(_QWORD *, _QWORD, void *, _QWORD);
  void *v11;
  unsigned int v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a1)
  {
    v9 = (_QWORD *)*a1;
    if (*a1)
    {
      if (a1[1])
      {
        v10 = (uint64_t (*)(_QWORD *, _QWORD, void *, _QWORD))v9[3];
        v11 = uarpZalloc(*((unsigned int *)a1 + 4));
        memcpy(v11, (const void *)a1[1], *((unsigned int *)a1 + 4));
        v12 = v10(v9, v9[6], v11, *((unsigned int *)a1 + 4));
        if (v12)
        {
          v13 = v12;
          uarpStatusCodeToString(v12);
          UarpRestoreLayer3LogErrorInternal((uint64_t)v9, v14, "UARP Restore: Failed to tx uarp message to uarp silicon updater;status <0x%08x>, %s",
            v15,
            v16,
            v17,
            v18,
            v19,
            v13);
        }
        uarpPlatformEndpointSendMessageComplete(v9[5] + 648, v9[5] + 1728, a1[1]);
        uarpFree(a1);
        uarpFree(v11);
      }
      else
      {
        UarpRestoreLayer3LogErrorInternal((uint64_t)v9, a2, "%s: NULL pBuffer", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3MsgSendQueueHandler");
      }
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3MsgSendQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3MsgSendQueueHandler");
  }
}

void UarpRestoreLayer3LogInfoInternal(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(UarpRestoreLayer3LogInfoInternal_logBuffer, 0x400uLL, a3, &a9);
  UarpRestoreLayer3LogInfo(a1, 2u, (uint64_t)UarpRestoreLayer3LogInfoInternal_logBuffer);
}

void UarpRestoreLayer3FirmwareStageStatusQueueHandler(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;

  if (a1)
  {
    v9 = *(_QWORD *)a1;
    if (v9)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 112))(v9, a1[2], a1[3]);
      uarpFree(a1);
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3FirmwareStageStatusQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3FirmwareStageStatusQueueHandler");
  }
}

void UarpRestoreLayer3FirmwareApplyStatusQueueHandler(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;

  if (a1)
  {
    v9 = *(_QWORD *)a1;
    if (v9)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 120))(v9, a1[2], a1[3]);
      uarpFree(a1);
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3FirmwareApplyStatusQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3FirmwareApplyStatusQueueHandler");
  }
}

void UarpRestoreLayer3TssRequestQueueHandler(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;

  if (a1)
  {
    v9 = *a1;
    if (*a1)
    {
      v10 = a1[1];
      if (v10)
      {
        v11 = *(_QWORD *)(v10 + 296);
        if (v11)
        {
          v12 = *(_QWORD *)(v11 + 48);
          if (v12)
          {
            v13 = *((unsigned __int8 *)a1 + 24);
            v14 = a1[2];
            UarpRestoreLayer3LogInfoInternal(v9, a2, "UARP Restore: Tatsu Server set to %s", a4, a5, a6, a7, a8, v14);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 128))(v9, v10, v12, v14, v13);
            uarpFree(a1);
            return;
          }
          v15 = "%s: NULL tssOptions";
        }
        else
        {
          v15 = "%s: NULL pIM4M->payloads";
        }
      }
      else
      {
        v15 = "%s: NULL pIM4M";
      }
    }
    else
    {
      v15 = "%s: NULL pUarpCtx";
    }
    UarpRestoreLayer3LogErrorInternal(0, a2, v15, a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3TssRequestQueueHandler");
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3TssRequestQueueHandler");
  }
}

void UarpRestoreLayer3UarpPropertyUpdateQueueHandler(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  void (*v11)(uint64_t, _QWORD);
  void (*v12)(uint64_t);

  if (a1)
  {
    v9 = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
    {
      v10 = *(_DWORD *)(v9 + 200) - 1;
      *(_DWORD *)(v9 + 200) = v10;
      v11 = *(void (**)(uint64_t, _QWORD))(v9 + 136);
      if (v11)
      {
        v11(v9, a1[2]);
        v10 = *(_DWORD *)(v9 + 200);
      }
      if (!v10)
      {
        v12 = *(void (**)(uint64_t))(v9 + 152);
        if (v12)
          v12(v9);
      }
      uarpFree(a1);
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3UarpPropertyUpdateQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3UarpPropertyUpdateQueueHandler");
  }
}

void UarpRestoreLayer3ApplePropertyUpdateQueueHandler(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  void (*v11)(uint64_t, _QWORD);
  void (*v12)(uint64_t);

  if (a1)
  {
    v9 = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
    {
      v10 = *(_DWORD *)(v9 + 200) - 1;
      *(_DWORD *)(v9 + 200) = v10;
      v11 = *(void (**)(uint64_t, _QWORD))(v9 + 144);
      if (v11)
      {
        v11(v9, a1[2]);
        v10 = *(_DWORD *)(v9 + 200);
      }
      if (!v10)
      {
        v12 = *(void (**)(uint64_t))(v9 + 152);
        if (v12)
          v12(v9);
      }
      uarpFree(a1);
    }
    else
    {
      UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pUarpCtx", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3ApplePropertyUpdateQueueHandler");
    }
  }
  else
  {
    UarpRestoreLayer3LogErrorInternal(0, a2, "%s: NULL pBlock", a4, a5, a6, a7, a8, (char)"UarpRestoreLayer3ApplePropertyUpdateQueueHandler");
  }
}

uint64_t b2p_init(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 232);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  if (v3)
    *(_QWORD *)(a1 + 232) = v3;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 80) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 76) = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 116) = v4;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 56);
  if (v5)
  {
    *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 104) = v5;
  }
  v6 = *(_QWORD *)(a2 + 40);
  if (v6)
  {
    *(_DWORD *)(a1 + 140) = *(_DWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 152) = v6;
  }
  b2p_link_init(a1);
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_DWORD *)(a1 + 224) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  *(_WORD *)a1 |= 2u;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 184) = 0;
  *(_QWORD *)(a1 + 168) = 0;
  return 0;
}

uint64_t b2p_init_routing(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  unsigned __int8 v3;
  int v4;

  if (!a2)
    return 8;
  if (!*(_QWORD *)(a1 + 168) || *(__int16 *)(a1 + 4) == -1)
  {
    if (*a2 <= 0xEu)
    {
      v3 = a2[1];
      *(_BYTE *)(a1 + 51) = *(_BYTE *)(a1 + 51) & 0xE1 | (2 * (v3 & 0xF));
      v4 = v3 & 0xF;
      if (v4)
      {
        v2 = *(_QWORD *)&a2[8 * (v4 - 1) + 8];
        if (!v2)
        {
          *(_QWORD *)(a1 + 168) = a2;
          return v2;
        }
      }
    }
    return 8;
  }
  return 1;
}

uint64_t b2p_enable(__int16 *a1, uint64_t a2)
{
  __int16 v2;
  uint64_t result;
  __int16 v4;
  char v5;

  v2 = *a1;
  if ((*a1 & 2) == 0)
    return 3;
  if (!*(_WORD *)a2)
    return 8;
  v4 = *(_WORD *)(a2 + 2);
  if (!v4)
    return 8;
  v5 = *(_BYTE *)(a2 + 4);
  if (!v5)
    return 8;
  if ((v2 & 1) != 0)
    return 9;
  result = 0;
  a1[80] = *(_WORD *)a2;
  a1[81] = v4;
  *((_BYTE *)a1 + 164) = v5;
  *((_BYTE *)a1 + 165) = 3;
  *a1 = v2 | 1;
  return result;
}

uint64_t b2p_disable(unsigned __int8 *a1)
{
  __int16 v1;

  v1 = *(_WORD *)a1;
  if ((*(_WORD *)a1 & 2) == 0)
    return 3;
  if ((v1 & 1) == 0)
    return 4;
  *(_WORD *)a1 = v1 & 0xFFFE;
  b2p_link_reset(a1);
  return 0;
}

uint64_t b2p_is_enabled(_WORD *a1)
{
  return *a1 & 1;
}

uint64_t b2p_reset(uint64_t a1)
{
  if ((*(_WORD *)a1 & 2) == 0)
    return 3;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_DWORD *)(a1 + 224) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  b2p_link_reset((unsigned __int8 *)a1);
  return 0;
}

uint64_t b2p_recv_bytes(_WORD *a1, unsigned __int8 *a2, int a3)
{
  uint64_t v7;

  if ((*a1 & 2) == 0)
    return 3;
  if ((*a1 & 1) == 0)
    return 4;
  b2p_mutex_lock((uint64_t)a1);
  v7 = b2p_link_process_received_bytes((uint64_t)a1, a2, a3);
  b2p_mutex_unlock((uint64_t)a1);
  return v7;
}

uint64_t b2p_send_command(uint64_t a1, unsigned int a2, char *a3, unsigned int a4)
{
  return b2p_send_command_prioritized_w_callback(a1, 1u, a2, a3, a4, 0, 0);
}

uint64_t b2p_send_command_prioritized_w_callback(uint64_t a1, unsigned int a2, unsigned int a3, char *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  uint64_t packet;
  unsigned int v15;
  int v17;

  if ((*(_WORD *)a1 & 2) == 0)
    return 3;
  if ((*(_WORD *)a1 & 1) == 0)
    return 4;
  if ((a3 & 1) != 0)
    return 8;
  v15 = *(unsigned __int8 *)(a1 + 51);
  if ((a3 & 0xFFF) == 0xFFE && (v15 & 0x1E) != 0)
    return 8;
  v17 = (v15 >> 1) & 0xF;
  if (v17)
  {
    packet = 8;
    if (a2 > 2 || a3 >> 12 == v17)
      return packet;
  }
  else if (a2 > 2)
  {
    return 8;
  }
  if (!*(_QWORD *)(a1 + 24 * a2 + 104) || !*(_DWORD *)(a1 + 24 * a2 + 92))
    return 8;
  b2p_mutex_lock(a1);
  packet = b2p_link_queue_b2p_packet(a1, a2, a3, a4, a5, a6, a7);
  if (!(_DWORD)packet)
  {
    if ((*(_BYTE *)(a1 + 51) & 1) == 0 && *(__int16 *)(a1 + 4) == -1)
      packet = b2p_link_send_next_packet(a1);
    else
      packet = 0;
  }
  b2p_mutex_unlock(a1);
  return packet;
}

uint64_t b2p_send_command_w_callback(uint64_t a1, unsigned int a2, char *a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  return b2p_send_command_prioritized_w_callback(a1, 1u, a2, a3, a4, a5, a6);
}

uint64_t b2p_send_command_prioritized(uint64_t a1, unsigned int a2, unsigned int a3, char *a4, unsigned int a5)
{
  return b2p_send_command_prioritized_w_callback(a1, a2, a3, a4, a5, 0, 0);
}

uint64_t b2p_queue_command(_WORD *a1, unsigned int a2, unsigned int a3, char *a4, unsigned int a5)
{
  uint64_t result;
  uint64_t v11;

  if ((*a1 & 2) == 0)
    return 3;
  if ((*a1 & 1) == 0)
    return 4;
  result = 8;
  if (a2 <= 2 && (a3 & 1) == 0 && *(_QWORD *)&a1[12 * a2 + 52])
  {
    if (*(_DWORD *)&a1[12 * a2 + 46])
    {
      b2p_mutex_lock((uint64_t)a1);
      v11 = b2p_link_queue_b2p_packet((uint64_t)a1, a2, a3, a4, a5, 0, 0);
      b2p_mutex_unlock((uint64_t)a1);
      return v11;
    }
  }
  return result;
}

uint64_t b2p_send_next_packet(_DWORD *a1)
{
  uint64_t packet;

  if ((*(_WORD *)a1 & 2) == 0)
    return 3;
  if ((*(_WORD *)a1 & 1) == 0)
    return 4;
  b2p_mutex_lock((uint64_t)a1);
  if (b2p_link_is_tx_pending(a1))
    packet = b2p_link_send_next_packet((uint64_t)a1);
  else
    packet = 6;
  b2p_mutex_unlock((uint64_t)a1);
  return packet;
}

uint64_t b2p_send_response(uint64_t a1, __int16 a2, char a3, const void *a4, unsigned int a5)
{
  uint64_t v11;

  if ((*(_WORD *)a1 & 2) == 0)
    return 3;
  if ((*(_WORD *)a1 & 1) == 0)
    return 4;
  if ((a2 & 1) == 0)
    return 8;
  b2p_mutex_lock(a1);
  *(_BYTE *)(*(_QWORD *)(a1 + 24) + 7) = a3;
  *(_WORD *)(a1 + 2) = a5;
  *(_BYTE *)(a1 + 6) = 1;
  memcpy((void *)(*(_QWORD *)(a1 + 24) + 8), a4, a5);
  v11 = b2p_link_send_or_queue_response(a1, a2 | 1u, *(_QWORD *)(a1 + 24), *(unsigned __int16 *)(a1 + 2));
  b2p_mutex_unlock(a1);
  return v11;
}

uint64_t b2p_get_tx_queue_size(uint64_t a1, _WORD *a2)
{
  uint64_t result;
  int v5;
  __int16 v6;
  __int16 v7;

  if ((*(_WORD *)a1 & 2) == 0)
    return 3;
  if ((*(_WORD *)a1 & 1) == 0)
    return 4;
  if (!a2)
    return 8;
  v5 = *(_DWORD *)(a1 + 116);
  v6 = v5 + ~(unsigned __int16)b2p_link_tx_buf_get_free_bytes((_DWORD *)a1);
  *a2 = v6;
  if ((*(_WORD *)a1 & 0x300) != 0)
    v7 = *(_WORD *)(a1 + 2);
  else
    v7 = 0;
  result = 0;
  *a2 = v7 + v6;
  return result;
}

uint64_t b2p_get_num_queued_packets(unsigned __int16 *a1, _WORD *a2)
{
  uint64_t result;
  __int16 num_queued_packets;

  if ((*a1 & 2) == 0)
    return 3;
  if ((*a1 & 1) == 0)
    return 4;
  if (!a2)
    return 8;
  num_queued_packets = b2p_link_get_num_queued_packets(a1);
  result = 0;
  *a2 = num_queued_packets;
  return result;
}

BOOL b2p_rx_is_waiting(unsigned __int16 *a1)
{
  return (~*a1 & 3) == 0 && *((_BYTE *)a1 + 53) != 0;
}

uint64_t b2p_set_max_attempts(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 165) = a2;
  return 0;
}

uint64_t b2p_register_post_callback(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 8;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *(_QWORD *)(a1 + 176) = a2;
    }
  }
  return result;
}

uint64_t b2p_register_timeout_callback(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 8;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *(_QWORD *)(a1 + 184) = a2;
    }
  }
  return result;
}

uint64_t b2p_get_handle_for_node_id(uint64_t a1, char a2)
{
  unsigned __int8 *v2;

  if ((a2 - 15) >= 0xF2u
    && (v2 = *(unsigned __int8 **)(a1 + 168)) != 0
    && (*(_BYTE *)(a1 + 51) & 0x1E) != 0
    && *v2 > (a2 - 1))
  {
    return *(_QWORD *)&v2[8 * (a2 - 1) + 8];
  }
  else
  {
    return 0;
  }
}

uint64_t b2p_process_received_nominal_packet(unsigned __int16 *a1, unsigned __int8 *a2, __int16 a3, char a4)
{
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned __int8 v24;
  uint64_t v25;
  void (*v26)(unsigned __int16 *, _QWORD, uint64_t, _QWORD, unsigned __int8 *, _QWORD);
  unsigned __int8 *v27;
  unsigned __int8 *v28;
  uint64_t v29;
  char *v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  void (*v33)(unsigned __int16 *);
  void (*v34)(unsigned __int16 *);
  unsigned __int8 *v35;
  unsigned __int8 v36;
  uint64_t v37;
  __int16 v38;
  unsigned __int16 v39;

  v7 = a2[1];
  v8 = *a2 | (v7 << 8);
  if ((*a2 & 1) == 0)
  {
    if ((a4 & 1) == 0)
      *a1 &= 0xFFC3u;
    if ((v8 & 0xFFF) == 0xFFE)
    {
      LOWORD(v9) = v8 | 1;
      if ((*((_BYTE *)a1 + 51) & 0x1E) != 0)
      {
        v9 = v8 & 0xFFE | 1 | (*a1 >> 2 << 12);
        v10 = 1;
        if ((a4 & 1) != 0)
          goto LABEL_24;
      }
      else
      {
        v10 = 0;
        if ((a4 & 1) != 0)
          goto LABEL_24;
      }
    }
    else
    {
      v10 = 0;
      LOWORD(v9) = v8 | 1;
      if ((a4 & 1) != 0)
      {
LABEL_24:
        if (*((_BYTE *)a1 + 6) == 1)
          b2p_link_send_or_queue_response((uint64_t)a1, v9, *((_QWORD *)a1 + 3), a1[1]);
        return 0;
      }
    }
    if ((*a1 & 0x300) != 0)
      goto LABEL_24;
    if (v8 < 0x1000)
      v20 = v10;
    else
      v20 = 0;
    if ((v20 & 1) == 0)
    {
      if (!v10)
      {
        b2p_command_handler((uint64_t)a1, v8, (uint64_t)(a2 + 2), (unsigned __int16)(a3 - 2), (_BYTE *)a1 + 6, (_BYTE *)(*((_QWORD *)a1 + 3) + 7), (void *)(*((_QWORD *)a1 + 3) + 8), a1 + 1);
        goto LABEL_24;
      }
      v21 = v8 >> 12;
      v22 = *((unsigned __int8 *)a1 + 51);
      if (v8 >> 12 != ((v22 >> 1) & 0xF))
      {
        if (v21 - 15 >= 0xFFFFFFF2 && (v22 & 0x1E) != 0)
        {
          v27 = (unsigned __int8 *)*((_QWORD *)a1 + 21);
          if (v27)
          {
            if (*v27 > (v21 - 1))
            {
              v28 = &v27[8 * (v21 - 1)];
              v29 = *((_QWORD *)v28 + 1);
              if (v29)
              {
                if ((unsigned __int16 *)v29 != a1)
                {
                  v30 = (char *)(a2 + 2);
                  v31 = a2[2];
                  v32 = a2[3];
                  b2p_mutex_lock(*((_QWORD *)v28 + 1));
                  if (!b2p_link_queue_b2p_packet_routed(v29, 1u, v8, v30, (unsigned __int16)(a3 - 2), 0, 0, 4094, 0, 1))
                  {
                    a1[1] = 2;
                    *(_BYTE *)(*((_QWORD *)a1 + 3) + 8) = v31;
                    *(_BYTE *)(*((_QWORD *)a1 + 3) + 9) = v32 & 0xF | (16 * (v21 & 0xF));
                    *((_BYTE *)a1 + 6) = 1;
                    b2p_link_send_next_packet(v29);
                  }
                  b2p_mutex_unlock(v29);
                }
              }
            }
          }
        }
        goto LABEL_24;
      }
      v23 = a2[3];
      v24 = a2[2];
      v25 = v24 | (v23 << 8);
      if ((v24 & 1) != 0)
      {
        b2p_response_handler((uint64_t)a1, v25, a2[4], (uint64_t)(a2 + 5), (unsigned __int16)(a3 - 5));
        *((_BYTE *)a1 + 6) = 1;
        a1[1] = 2;
        *(_BYTE *)(*((_QWORD *)a1 + 3) + 8) = v24;
        *(_BYTE *)(*((_QWORD *)a1 + 3) + 9) = v23;
        v34 = (void (*)(unsigned __int16 *))*((_QWORD *)a1 + 22);
        if (v34)
          v34(a1);
        goto LABEL_24;
      }
      b2p_command_handler((uint64_t)a1, v25, (uint64_t)(a2 + 4), (unsigned __int16)(a3 - 4), (_BYTE *)a1 + 6, (_BYTE *)(*((_QWORD *)a1 + 3) + 7), (void *)(*((_QWORD *)a1 + 3) + 10), a1 + 1);
      a1[1] += 2;
      *(_BYTE *)(*((_QWORD *)a1 + 3) + 8) = v24 | 1;
      *(_BYTE *)(*((_QWORD *)a1 + 3) + 9) = v23 & 0xF | (16 * ((*((_BYTE *)a1 + 51) >> 1) & 0xF));
      *a1 = *a1 & 0xFFC3 | (v23 >> 2) & 0x3C;
      if (*((_DWORD *)a1 + 19) >= a1[1])
      {
        LOWORD(v9) = ((_WORD)v23 << 8) & 0xF000 | v9 & 0xFFF;
        goto LABEL_24;
      }
    }
    return 1;
  }
  v11 = a1[2];
  if (v11 == 0xFFFF)
    return 0;
  if ((*a1 & 0xFC00) != 0x400)
    return 0;
  v12 = v11 | 1;
  if (v12 != (_DWORD)v8 && ((*((_BYTE *)a1 + 51) & 0x1E) == 0 || (*a2 | (v7 << 8) & 0xFFF) != (v12 & 0xFFF)))
    return 0;
  if (*((unsigned __int8 *)a1 + 52) != *((unsigned __int8 *)a1 + 7))
    return 0;
  b2p_link_set_cmd_lock((uint64_t)a1, 0xFFFF, 0);
  *a1 &= 0x3FFu;
  if ((~(_DWORD)v8 & 0xFFF) != 0)
    goto LABEL_38;
  v13 = *((unsigned __int8 *)a1 + 51);
  if (v8 <= 0xFFF && (v13 & 0x1E) != 0)
    return 0;
  if ((v13 & 0x1E) == 0)
  {
LABEL_38:
    v26 = (void (*)(unsigned __int16 *, _QWORD, uint64_t, _QWORD, unsigned __int8 *, _QWORD))*((_QWORD *)a1 + 1);
    if (v26)
    {
      v26(a1, *((_QWORD *)a1 + 2), v8, a2[2], a2 + 3, (unsigned __int16)(a3 - 3));
      *((_QWORD *)a1 + 1) = 0;
      *((_QWORD *)a1 + 2) = 0;
      goto LABEL_52;
    }
    v15 = a2[2];
    v16 = (uint64_t)(a2 + 3);
    v17 = (unsigned __int16)(a3 - 3);
    v18 = (uint64_t)a1;
    v14 = v8;
LABEL_51:
    b2p_response_handler(v18, v14, v15, v16, v17);
LABEL_52:
    v33 = (void (*)(unsigned __int16 *))*((_QWORD *)a1 + 22);
    if (v33)
      v33(a1);
    return 0;
  }
  if (((v13 >> 1) & 0xF) == v8 >> 12)
  {
    v14 = *(unsigned __int16 *)(a2 + 3);
    v15 = a2[2];
    v16 = (uint64_t)(a2 + 5);
    v17 = (unsigned __int16)(a3 - 5);
    v18 = (uint64_t)a1;
    goto LABEL_51;
  }
  if ((v8 >> 12) - 15 < 0xFFFFFFF2)
    return 1;
  v35 = (unsigned __int8 *)*((_QWORD *)a1 + 21);
  if (!v35)
    return 1;
  v36 = (v8 >> 12) - 1;
  if (*v35 <= v36)
    return 1;
  v37 = *(_QWORD *)&v35[8 * v36 + 8];
  result = 1;
  if ((unsigned __int16 *)v37 != a1)
  {
    if (v37)
    {
      v38 = a2[3];
      if ((v38 & 1) != 0)
      {
        v39 = v38 | (a2[4] << 8);
        b2p_mutex_lock(v37);
        if (!b2p_link_queue_b2p_packet_routed(v37, 1u, (v7 << 8) | 0xFFEu, (char *)a2 + 5, (unsigned __int16)(a3 - 5), 0, 0, v39, a2[2], 0))b2p_link_send_next_packet(v37);
        b2p_mutex_unlock(v37);
        return 0;
      }
    }
  }
  return result;
}

uint64_t b2p_link_pop_tx_queue(uint64_t result)
{
  uint64_t v3;

  if (*(_DWORD *)(result + 100) != *(_DWORD *)(result + 96)
    || *(_DWORD *)(result + 124) != *(_DWORD *)(result + 120)
    || *(_DWORD *)(result + 148) != *(_DWORD *)(result + 144))
  {
    v3 = result + 24 * *(unsigned __int8 *)(result + 73);
    *(_DWORD *)(v3 + 100) = ((*(unsigned __int8 *)(*(_QWORD *)(v3 + 104)
                                                 + (*(_DWORD *)(v3 + 100) + 2) % *(_DWORD *)(v3 + 92)) | ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 + 104) + (*(_DWORD *)(v3 + 100) + 3) % *(_DWORD *)(v3 + 92)) << 8))
                           + *(unsigned int *)(v3 + 100)
                           + 16)
                          % *(unsigned int *)(v3 + 92);
    --*(_WORD *)(v3 + 88);
    *(_BYTE *)(result + 73) = 3;
  }
  return result;
}

BOOL b2p_link_is_tx_pending(_DWORD *a1)
{
  return a1[25] != a1[24] || a1[31] != a1[30] || a1[37] != a1[36];
}

uint64_t b2p_link_peek_and_send_packet(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;

  if (*(unsigned __int8 *)(result + 73) <= 2uLL)
  {
    v1 = result;
    v2 = result + 24 * *(unsigned __int8 *)(result + 73);
    v5 = *(_DWORD *)(v2 + 92);
    v4 = v2 + 92;
    v3 = v5;
    v6 = *(unsigned int *)(v4 + 8);
    if ((_DWORD)v6 != *(_DWORD *)(v4 + 4))
    {
      v7 = *(_QWORD *)(v4 + 12);
      v8 = *(unsigned __int8 *)(v7 + ((int)v6 + 2) % v3) | (*(unsigned __int8 *)(v7 + ((int)v6 + 3) % v3) << 8);
      *(_BYTE *)(result + 32) = *(_BYTE *)(v7 + ((int)v6 + 4) % v3);
      if (v6 + v8 <= v3)
      {
        v9 = v7 + v6;
      }
      else
      {
        memcpy(*(void **)(result + 80), (const void *)(v7 + v6), v3 - v6);
        memcpy((void *)(*(_QWORD *)(v1 + 80) + (*(_DWORD *)v4 - *(_DWORD *)(v4 + 8))), *(const void **)(v4 + 12), (*(_DWORD *)(v4 + 8) + v8) % *(_DWORD *)v4);
        v9 = *(_QWORD *)(v1 + 80);
      }
      result = b2p_send_data(v1, v9, v8);
      ++*(_DWORD *)(v1 + 224);
    }
  }
  return result;
}

uint64_t b2p_link_init(uint64_t a1)
{
  char v1;

  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  v1 = *(_WORD *)a1;
  *(_WORD *)(a1 + 4) = -1;
  *(_WORD *)a1 = v1 & 0xFE;
  *(_BYTE *)(a1 + 55) = -2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 33) = -1;
  *(_QWORD *)(a1 + 41) = -1;
  *(_BYTE *)(a1 + 32) = -1;
  *(_BYTE *)(a1 + 53) = 0;
  *(_BYTE *)(a1 + 50) = 0;
  *(_BYTE *)(a1 + 73) = 3;
  *(_BYTE *)(a1 + 51) &= 0xE1u;
  return b2p_timer_init(b2p_link_timeout_handler);
}

uint64_t b2p_link_timeout_handler(uint64_t a1, int a2)
{
  int v4;
  int v5;
  const char *v6;
  uint32x4_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, _QWORD, _QWORD);
  uint64_t v16;
  unsigned __int8 v17;
  int v18;
  void (*v19)(uint64_t, uint64_t, _QWORD);

  b2p_mutex_lock(a1);
  if ((*(_WORD *)a1 & 1) == 0)
  {
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  if (a2)
  {
    if (a2 == 1 && *(_BYTE *)(a1 + 73) != 3)
    {
      v4 = *(unsigned __int8 *)(a1 + 50);
      if (*(_BYTE *)(a1 + 50))
      {
        v5 = 0;
        v6 = (const char *)(a1 + 164);
        v7 = (uint32x4_t)vdupq_n_s32(v4 - 1);
        v8 = vld1q_dup_s8(v6);
        v9.i64[0] = 0x101010101010101;
        v9.i64[1] = 0x101010101010101;
        do
        {
          v10 = v9;
          v9 = vmulq_s8(v8, v9);
          v5 += 16;
        }
        while ((((_WORD)v4 + 15) & 0x1F0) != v5);
        v11 = (int8x16_t)vdupq_n_s32(v5 - 16);
        v12 = vbslq_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_u32((uint32x4_t)vorrq_s8(v11, (int8x16_t)xmmword_24BCE04F0), v7), (int16x8_t)vcgtq_u32((uint32x4_t)vorrq_s8(v11, (int8x16_t)xmmword_24BCE0500), v7)), (int8x16_t)vuzp1q_s16((int16x8_t)vcgtq_u32((uint32x4_t)vorrq_s8(v11, (int8x16_t)xmmword_24BCE0510), v7), (int16x8_t)vcgtq_u32((uint32x4_t)vorrq_s8(v11, (int8x16_t)xmmword_24BCE0520), v7))), v10, v9);
        *(int8x8_t *)v12.i8 = vmul_s8(*(int8x8_t *)v12.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL));
        v13 = (v12.i8[0]
                              * v12.i8[1]
                              * v12.i8[2]
                              * v12.i8[3]
                              * v12.i8[4]
                              * v12.i8[5]
                              * v12.i8[6]
                              * v12.i8[7]);
      }
      else
      {
        v13 = 1;
      }
      v17 = v4 + 1;
      *(_BYTE *)(a1 + 50) = v17;
      v18 = *(_DWORD *)(a1 + 208) + 1;
      *(_DWORD *)(a1 + 208) = v18;
      v19 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 184);
      if (v19)
      {
        v19(a1, 1, v18);
        v17 = *(_BYTE *)(a1 + 50);
      }
      if (*(unsigned __int8 *)(a1 + 165) >= v17)
      {
        b2p_link_peek_and_send_packet(a1);
        v16 = v13 * *(unsigned __int16 *)(a1 + 162);
        goto LABEL_18;
      }
      ++*(_DWORD *)(a1 + 200);
      b2p_link_reset((unsigned __int8 *)a1);
      b2p_reset_handler(a1, 0);
    }
    goto LABEL_17;
  }
  v14 = *(_DWORD *)(a1 + 204) + 1;
  *(_DWORD *)(a1 + 204) = v14;
  v15 = *(void (**)(uint64_t, _QWORD, _QWORD))(a1 + 184);
  if (v15)
    v15(a1, 0, v14);
  v16 = 0;
  *(_BYTE *)(a1 + 53) = 0;
LABEL_18:
  b2p_mutex_unlock(a1);
  return v16;
}

uint64_t b2p_link_reset(unsigned __int8 *a1)
{
  *((_QWORD *)a1 + 15) = 0;
  *((_WORD *)a1 + 56) = 0;
  *((_QWORD *)a1 + 18) = 0;
  *((_WORD *)a1 + 68) = 0;
  *((_QWORD *)a1 + 12) = 0;
  *((_WORD *)a1 + 44) = 0;
  *((_WORD *)a1 + 2) = -1;
  *(_WORD *)a1 = *a1;
  a1[55] = -2;
  *((_QWORD *)a1 + 1) = 0;
  *((_QWORD *)a1 + 2) = 0;
  *(_QWORD *)(a1 + 33) = -1;
  *(_QWORD *)(a1 + 41) = -1;
  a1[32] = -1;
  a1[53] = 0;
  a1[50] = 0;
  a1[73] = 3;
  b2p_timer_clear((uint64_t)a1, 0);
  return b2p_timer_clear((uint64_t)a1, 1);
}

uint64_t b2p_link_tx_buf_get_free_bytes(_DWORD *a1)
{
  unsigned int v1;
  unsigned int v2;
  int v3;

  v2 = a1[30];
  v1 = a1[31];
  if (v2 >= v1)
  {
    v3 = ~v2;
    v1 += a1[29];
  }
  else
  {
    v3 = ~v2;
  }
  return v1 + v3;
}

uint64_t b2p_link_get_num_queued_packets(unsigned __int16 *a1)
{
  return a1[56] + a1[44] + a1[68];
}

uint64_t b2p_link_set_cmd_lock(uint64_t a1, int a2, char a3)
{
  *(_WORD *)(a1 + 4) = a2;
  if (a2 == 0xFFFF)
  {
    b2p_timer_clear(a1, 1);
    b2p_link_pop_tx_queue(a1);
    a3 = 0;
  }
  *(_BYTE *)(a1 + 7) = a3;
  return 0;
}

uint64_t b2p_link_queue_b2p_packet_routed(uint64_t a1, unsigned int a2, unsigned int a3, char *__src, unsigned int a5, uint64_t a6, uint64_t a7, int a8, char a9, char a10)
{
  __int16 v14;
  uint64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  char v18;
  __int16 v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int v24;
  int v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  void **v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  char v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  char *v48;
  size_t v49;
  char *v50;
  unsigned int v51;
  uint64_t v52;
  _OWORD *v53;
  __int128 __srca;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  if ((a3 & 1) != 0)
    return 1;
  v14 = a5 + 11;
  v15 = a3 >> 12;
  if (a3 >= 0x1000)
  {
    v16 = *(unsigned __int8 **)(a1 + 168);
    if (v16)
    {
      if ((*(_BYTE *)(a1 + 51) & 0x1E) != 0 && v15 <= *v16)
      {
        if (!*(_QWORD *)&v16[8 * v15])
        {
          LOBYTE(v15) = 0;
          v18 = 1;
          goto LABEL_20;
        }
        v17 = 8;
        if (a2 != 1 || a6 || a7)
          return v17;
      }
    }
  }
  v18 = 1;
  if ((_DWORD)v15 && (a10 & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 168))
    {
      if ((a8 & 1) != 0)
        v19 = 14;
      else
        v19 = 13;
      v20 = v19 + a5;
      v18 = 0;
      if ((*(_BYTE *)(a1 + 51) & 0x1E) != 0)
        v14 = v20;
    }
    else
    {
      v18 = 0;
    }
  }
LABEL_20:
  if (*(_DWORD *)(a1 + 76) - 11 < a5)
    return 8;
  v21 = a1 + 24 * a2;
  v24 = *(_DWORD *)(v21 + 96);
  v23 = (unsigned int *)(v21 + 96);
  v22 = v24;
  v26 = v23 - 1;
  v25 = *(v23 - 1);
  v27 = v23[1];
  v28 = v27 + ~v24;
  if (v24 >= v27)
    v29 = *(v23 - 1);
  else
    v29 = 0;
  v30 = v28 + v29;
  if (*(_DWORD *)(a1 + 212) < (unsigned __int16)(v14 + 16 + v25 - v30))
    *(_DWORD *)(a1 + 212) = (unsigned __int16)(v14 + 16 + v25 - v30);
  if (v30 < (unsigned __int16)(v14 + 16))
    return 5;
  v31 = a1 + 24 * a2;
  v33 = *(_QWORD *)(v31 + 104);
  v32 = (void **)(v31 + 104);
  *(_BYTE *)(v33 + v22) = -1;
  v34 = (*v23 + 1) % *v26;
  *v23 = v34;
  *((_BYTE *)*v32 + v34) = -78;
  v35 = (*v23 + 1) % *v26;
  *v23 = v35;
  *((_BYTE *)*v32 + v35) = v14;
  v36 = (*v23 + 1) % *v26;
  *v23 = v36;
  *((_BYTE *)*v32 + v36) = HIBYTE(v14);
  v37 = (*v23 + 1) % *v26;
  if (v37 + 1 == *v26)
    v38 = 0;
  else
    v38 = v37 + 1;
  *v23 = v38;
  if ((v18 & 1) == 0 && *(_QWORD *)(a1 + 168) && (*(_BYTE *)(a1 + 51) & 0x1E) != 0)
  {
    *((_BYTE *)*v32 + v38) = -2;
    v39 = (*v23 + 1) % *v26;
    *v23 = v39;
    *((_BYTE *)*v32 + v39) = (16 * v15) | 0xF;
    v40 = (*v23 + 1) % *v26;
    *v23 = v40;
    v41 = a3 & 0xF00 | (*(unsigned __int8 *)(a1 + 51) >> 1 << 12);
    if (a8 == 4094)
      v42 = a3;
    else
      v42 = a8;
    if (a8 != 4094)
      BYTE1(v41) = BYTE1(a8);
    *((_BYTE *)*v32 + v40) = v42;
    v43 = (*v23 + 1) % *v26;
    *v23 = v43;
    *((_BYTE *)*v32 + v43) = BYTE1(v41);
    v44 = *v26;
    v45 = (*v23 + 1) % *v26;
    *v23 = v45;
    if ((a8 & 1) == 0)
      goto LABEL_44;
    *((_BYTE *)*v32 + v45) = a9;
  }
  else
  {
    *((_BYTE *)*v32 + v38) = a3;
    v46 = (*v23 + 1) % *v26;
    *v23 = v46;
    *((_BYTE *)*v32 + v46) = BYTE1(a3);
  }
  v44 = *v26;
  v45 = (*v23 + 1) % *v26;
  *v23 = v45;
LABEL_44:
  v47 = a1 + 24 * a2;
  v48 = (char *)*v32 + v45;
  if (v45 + a5 >= v44)
  {
    memcpy(v48, __src, v44 - v45);
    v48 = (char *)*v32;
    v50 = &__src[*v26 - *v23];
    v49 = (*v23 + a5) % *v26;
  }
  else
  {
    v49 = a5;
    v50 = __src;
  }
  memcpy(v48, v50, v49);
  v51 = *v26;
  v52 = ((*v23 + a5) % *v26 + 4) % *v26;
  *v23 = v52;
  *(_QWORD *)&__srca = a6;
  *((_QWORD *)&__srca + 1) = a7;
  v53 = (char *)*v32 + v52;
  if (v52 + 16 >= (unint64_t)v51)
  {
    memcpy(v53, &__srca, v51 - v52);
    memcpy(*v32, (char *)&__srca + *v26 - *v23, ((unint64_t)*v23 + 16) % *v26);
  }
  else
  {
    *v53 = __srca;
  }
  v17 = 0;
  *v23 = ((unint64_t)*v23 + 16) % *v26;
  ++*(_WORD *)(v47 + 88);
  return v17;
}

uint64_t b2p_link_queue_b2p_packet(uint64_t a1, unsigned int a2, unsigned int a3, char *a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  return b2p_link_queue_b2p_packet_routed(a1, a2, a3, a4, a5, a6, a7, 4094, 0, 0);
}

uint64_t b2p_link_send_or_queue_response(uint64_t a1, __int16 a2, unint64_t a3, unsigned int a4)
{
  uint64_t result;
  uint64_t v7;
  int v8;

  if (*(_DWORD *)(a1 + 76) - 12 < a4)
    return 8;
  if ((*(_WORD *)a1 & 0x300) != 0)
    return 5;
  *(_WORD *)a3 = -19713;
  v7 = a4 + 8;
  *(_WORD *)(a3 + 2) = a4 + 12;
  *(_BYTE *)(a3 + 4) = *(_BYTE *)(a1 + 52);
  *(_WORD *)(a3 + 5) = a2;
  v8 = b2p_crc32_calc(a3, a4 + 8);
  *(_DWORD *)(a3 + v7) = b2p_crc32_calc_done(v8);
  *(_WORD *)a1 = *(_WORD *)a1 & 0xFCFF | 0x100;
  if ((*(_BYTE *)(a1 + 51) & 1) != 0)
    return 0;
  b2p_send_data(a1, *(_QWORD *)(a1 + 24), *(unsigned __int16 *)(*(_QWORD *)(a1 + 24) + 2));
  result = 0;
  ++*(_DWORD *)(a1 + 224);
  *(_WORD *)a1 &= 0xFCFFu;
  return result;
}

uint64_t b2p_link_send_response_packet(uint64_t a1)
{
  uint64_t result;

  result = b2p_send_data(a1, *(_QWORD *)(a1 + 24), *(unsigned __int16 *)(*(_QWORD *)(a1 + 24) + 2));
  ++*(_DWORD *)(a1 + 224);
  *(_WORD *)a1 &= 0xFCFFu;
  return result;
}

uint64_t b2p_link_send_next_packet(uint64_t a1)
{
  char v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  uint64_t v6;
  unsigned __int8 **v7;
  unsigned int v8;
  unsigned int *v9;
  unint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  unsigned int v17;
  unsigned __int8 *v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  unsigned __int8 *v23;
  int v24;
  unsigned int v25;
  unsigned __int16 v26;
  unsigned __int8 *v27;
  uint64_t v28;
  unint64_t v29;
  unsigned int v30;
  unsigned int v31;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (*(__int16 *)(a1 + 4) != -1)
    return 0;
  *(_BYTE *)(a1 + 50) = 1;
  if (*(_QWORD *)(a1 + 152) && *(_DWORD *)(a1 + 148) != *(_DWORD *)(a1 + 144))
  {
    v2 = 2;
    goto LABEL_11;
  }
  if (*(_QWORD *)(a1 + 128) && *(_DWORD *)(a1 + 124) != *(_DWORD *)(a1 + 120))
  {
    v2 = 1;
    goto LABEL_11;
  }
  if (*(_QWORD *)(a1 + 104) && *(_DWORD *)(a1 + 100) != *(_DWORD *)(a1 + 96))
  {
    v2 = 0;
LABEL_11:
    *(_BYTE *)(a1 + 73) = v2;
  }
  v3 = a1 + 24 * *(unsigned __int8 *)(a1 + 73);
  v5 = *(_DWORD *)(v3 + 92);
  v4 = (unsigned int *)(v3 + 92);
  v7 = (unsigned __int8 **)(v4 + 3);
  v6 = *(_QWORD *)(v4 + 3);
  v9 = v4 + 2;
  v8 = v4[2];
  v10 = a1 + ((unint64_t)*(unsigned __int8 *)(v6 + (v8 + 6) % v5) >> 4);
  *(_BYTE *)(v6 + (v8 + 4) % v5) = *(_BYTE *)(v10 + 33);
  v11 = *(_BYTE *)(v10 + 33);
  if (v11 == -1)
    v12 = 1;
  else
    v12 = v11 + 1;
  *(_BYTE *)(v10 + 33) = v12;
  v13 = *v9;
  v14 = *v4;
  v15 = (*v7)[((int)v13 + 2) % v14] | ((*v7)[((int)v13 + 3) % v14] << 8);
  v16 = v15 + v13;
  v17 = v15 + v13 - 4;
  v18 = &(*v7)[v13];
  if (v17 >= *v4)
  {
    v20 = b2p_crc32_calc_cont(0, v18, v14 - v13);
    v18 = *v7;
    v19 = v17 - *v4;
  }
  else
  {
    v19 = v15 - 4;
    v20 = 0;
  }
  v21 = b2p_crc32_calc_cont(v20, v18, v19);
  v22 = b2p_crc32_calc_done(v21);
  (*v7)[v17 % *v4] = v22;
  (*v7)[(v16 - 3) % *v4] = BYTE1(v22);
  (*v7)[(v16 - 2) % *v4] = BYTE2(v22);
  (*v7)[(v16 - 1) % *v4] = HIBYTE(v22);
  b2p_link_peek_and_send_packet(a1);
  b2p_timer_start(a1, 1, *(unsigned __int16 *)(a1 + 162));
  v23 = *v7;
  v24 = *v9;
  v25 = *v4;
  if ((*v7)[(*v9 + 1) % *v4] == 188)
  {
    v26 = v23[(v24 + 5) % v25];
    if ((v26 & 1) != 0)
      return 0;
  }
  else
  {
    v26 = v23[(v24 + 5) % v25] | (v23[(v24 + 6) % v25] << 8);
    if ((v26 & 1) != 0)
      return 0;
  }
  *(_WORD *)a1 = *(_WORD *)a1 & 0x3FF | 0x400;
  b2p_link_set_cmd_lock(a1, v26, *(_BYTE *)(a1 + 32));
  v27 = *v7;
  v28 = *v9;
  v29 = *v4;
  v30 = v27[((int)v28 + 2) % v29] | (v27[((int)v28 + 3) % v29] << 8);
  v31 = v28 + v30;
  if (v29 <= v28 + v30 || v31 + 16 < v29)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)&v27[v31 % v29];
    *(_QWORD *)(a1 + 16) = *(_QWORD *)&v27[(v28 + (unint64_t)v30 + 8) % v29];
  }
  else
  {
    __memcpy_chk();
    memcpy((char *)&v33 + (v29 - v31), &v27[(v31 + (v29 - v31)) % v29], 16 - (v29 - v31));
    *(_OWORD *)(a1 + 8) = v33;
  }
  return 0;
}

uint64_t b2p_link_process_received_bytes(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  unsigned __int8 *v19;
  char v20;

  *(_BYTE *)(a1 + 51) |= 1u;
  if (a3)
  {
    LODWORD(v6) = a3;
    b2p_timer_clear(a1, 0);
    v5 = 0;
    v6 = v6;
    v7 = *(unsigned __int8 *)(a1 + 53);
    while (1)
    {
      v9 = *a2++;
      v8 = v9;
      *(_BYTE *)(a1 + 54) = v9;
      if (v7 != 6)
        break;
LABEL_21:
      v16 = *(unsigned __int16 *)(a1 + 58);
      *(_DWORD *)(a1 + 60) |= v8 << (8 * v16++);
      *(_WORD *)(a1 + 58) = v16;
      if (v16 == 4)
      {
        v17 = b2p_crc32_calc_done(*(_DWORD *)(a1 + 64));
        *(_DWORD *)(a1 + 64) = v17;
        if (v17 == *(_DWORD *)(a1 + 60))
        {
          *(_BYTE *)(a1 + 53) = 7;
LABEL_31:
          v18 = *(unsigned __int16 *)(a1 + 56);
          if (v18 != 1)
          {
            ++*(_DWORD *)(a1 + 216);
            v19 = *(unsigned __int8 **)(a1 + 80);
            if ((*v19 & 1) != 0)
            {
              b2p_process_received_nominal_packet((unsigned __int16 *)a1, v19, v18, 0);
            }
            else
            {
              v20 = *(unsigned __int8 *)(a1 + 55) == *(unsigned __int8 *)(a1 + 52)
                 && *(_DWORD *)(a1 + 68) == *(_DWORD *)(a1 + 64);
              b2p_process_received_nominal_packet((unsigned __int16 *)a1, v19, v18, v20);
              *(_BYTE *)(a1 + 55) = *(_BYTE *)(a1 + 52);
              *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 64);
            }
          }
LABEL_38:
          v7 = 0;
          *(_BYTE *)(a1 + 53) = 0;
          goto LABEL_39;
        }
        v7 = 0;
        *(_BYTE *)(a1 + 53) = 0;
        ++*(_DWORD *)(a1 + 220);
        v5 = 7;
      }
      else
      {
        v7 = 6;
      }
LABEL_39:
      if (!--v6)
      {
        if (v7)
          goto LABEL_41;
        goto LABEL_42;
      }
    }
    if (v7 != 7)
    {
      if (*(unsigned __int8 *)(a1 + 72) == 178)
      {
        *(_DWORD *)(a1 + 64) = b2p_crc32_get(*(_DWORD *)(a1 + 64), v8);
        v7 = *(unsigned __int8 *)(a1 + 53);
      }
      switch(v7)
      {
        case 0:
          if (*(unsigned __int8 *)(a1 + 54) == 255)
            goto LABEL_27;
          v7 = 0;
          goto LABEL_39;
        case 1:
          v10 = *(unsigned __int8 *)(a1 + 54);
          *(_BYTE *)(a1 + 72) = v10;
          if (v10 == 178)
          {
            *(_WORD *)(a1 + 56) = 0;
            v11 = b2p_crc32_get(0, 255);
            *(_DWORD *)(a1 + 64) = v11;
            *(_DWORD *)(a1 + 64) = b2p_crc32_get(v11, 178);
            v7 = 2;
          }
          else
          {
            *(_BYTE *)(a1 + 72) = 0;
            if (v10 != 255)
              goto LABEL_38;
LABEL_27:
            v7 = 1;
          }
LABEL_28:
          *(_BYTE *)(a1 + 53) = v7;
          goto LABEL_39;
        case 2:
          *(_WORD *)(a1 + 56) = *(unsigned __int8 *)(a1 + 54);
          v7 = 3;
          goto LABEL_28;
        case 3:
          *(_BYTE *)(a1 + 53) = 4;
          v12 = *(unsigned __int16 *)(a1 + 56) | (*(unsigned __int8 *)(a1 + 54) << 8);
          *(_WORD *)(a1 + 56) |= *(unsigned __int8 *)(a1 + 54) << 8;
          if (v12 < 9 || *(_DWORD *)(a1 + 76) < v12)
            goto LABEL_38;
          *(_WORD *)(a1 + 56) = v12 - 9;
          v7 = 4;
          goto LABEL_39;
        case 4:
          *(_BYTE *)(a1 + 52) = *(_BYTE *)(a1 + 54);
          v7 = 5;
          *(_BYTE *)(a1 + 53) = 5;
          goto LABEL_19;
        case 5:
          v13 = *(_BYTE *)(a1 + 54);
          v14 = *(_QWORD *)(a1 + 80);
          v15 = *(unsigned __int16 *)(a1 + 58);
          *(_WORD *)(a1 + 58) = v15 + 1;
          *(_BYTE *)(v14 + v15) = v13;
          if (*(unsigned __int16 *)(a1 + 56) == *(unsigned __int16 *)(a1 + 58))
          {
            v7 = 6;
            *(_BYTE *)(a1 + 53) = 6;
            *(_DWORD *)(a1 + 60) = 0;
LABEL_19:
            *(_WORD *)(a1 + 58) = 0;
            goto LABEL_39;
          }
          v7 = *(unsigned __int8 *)(a1 + 53);
LABEL_30:
          if (v7 == 7)
            goto LABEL_31;
          goto LABEL_39;
        case 6:
          v8 = *(unsigned __int8 *)(a1 + 54);
          goto LABEL_21;
        default:
          goto LABEL_30;
      }
    }
    goto LABEL_31;
  }
  v5 = 0;
  if (*(_BYTE *)(a1 + 53))
LABEL_41:
    b2p_timer_start(a1, 0, *(unsigned __int16 *)(a1 + 160));
LABEL_42:
  if ((*(_WORD *)a1 & 0x300) == 0x100)
  {
    b2p_send_data(a1, *(_QWORD *)(a1 + 24), *(unsigned __int16 *)(*(_QWORD *)(a1 + 24) + 2));
    ++*(_DWORD *)(a1 + 224);
    *(_WORD *)a1 &= 0xFCFFu;
  }
  if (*(__int16 *)(a1 + 4) == -1
    && (*(_DWORD *)(a1 + 100) != *(_DWORD *)(a1 + 96)
     || *(_DWORD *)(a1 + 124) != *(_DWORD *)(a1 + 120)
     || *(_DWORD *)(a1 + 148) != *(_DWORD *)(a1 + 144)))
  {
    b2p_link_send_next_packet(a1);
  }
  *(_BYTE *)(a1 + 51) &= ~1u;
  return v5;
}

uint64_t b2p_crc32_get(unsigned int a1, int a2)
{
  return b2p_crc32tab[a2 ^ HIBYTE(a1)] ^ (a1 << 8);
}

unint64_t b2p_crc32_calc(unint64_t result, int a2)
{
  unsigned __int8 *v2;
  unsigned int v3;
  int v4;

  if (a2 < 1)
    return 0;
  v2 = (unsigned __int8 *)result;
  LODWORD(result) = 0;
  v3 = a2 + 1;
  do
  {
    v4 = *v2++;
    result = (b2p_crc32tab[v4 ^ BYTE3(result)] ^ ((_DWORD)result << 8));
    --v3;
  }
  while (v3 > 1);
  return result;
}

uint64_t b2p_crc32_calc_cont(uint64_t result, unsigned __int8 *a2, int a3)
{
  unsigned int v3;
  int v4;

  if (a3 >= 1)
  {
    v3 = a3 + 1;
    do
    {
      v4 = *a2++;
      result = (b2p_crc32tab[v4 ^ BYTE3(result)] ^ ((_DWORD)result << 8));
      --v3;
    }
    while (v3 > 1);
  }
  return result;
}

uint64_t b2p_crc32_calc_done(int a1)
{
  return ~a1;
}

void triggerSystemPanic_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_24BC99000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to trigger system panic: %d", (uint8_t *)v1, 8u);
}

void triggerSystemPanic_cold_2(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "void triggerSystemPanic(NSString * _Nonnull __strong)";
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl(&dword_24BC99000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: %@", (uint8_t *)&v1, 0x16u);
}

void logSystemFatal_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_24BC99000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

void UARPPersonalizationTSSRequestWithSigningServer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "UARP: TSS Request failed customer path / auth listed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void UARPPersonalizationTSSRequestWithSigningServer_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "UARP: TSS Request passed customer path / auth listed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void UARPPersonalizationTSSRequestWithSigningServer_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_24BC99000, v0, v1, "UARP: TSS Request to server %{public}@ with options %{public}@");
}

void TSSRequestWithSigningServer_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "UARP: Failed to create authinstall reference", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void TSSRequestWithSigningServer_cold_2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_24BC99000, a2, OS_LOG_TYPE_ERROR, "UARP: Failed personalization response, error = %u", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2();
}

void TSSRequestWithSigningServer_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "UARP: Failed to enable sso", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void TSSRequestWithSigningServer_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "UARP: Failed to initialize sso", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void TSSRequestWithSigningServer_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "UARP: Failed to set signing server", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void UARPPersonalizationTSSRequestWithSigningServerSSO_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_24BC99000, v0, v1, "UARP: TSS Request failed sso modes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void UARPPersonalizationTSSRequestWithSigningServerSSO_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_24BC99000, v0, v1, "UARP: TSS Request to server %{public}@ with SSO and options %{public}@");
}

void uarpLogError_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void uarpLogDebug_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_24BC99000, a1, a3, "%s\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void uarpLogFault_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void uarpPlatformDarwinLogError_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BC99000, a1, a3, "%s\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void uarpPlatformDarwinLogDebug_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_2(&dword_24BC99000, a1, a3, "%s\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void uarpPlatformDarwinLogFault_cold_1(os_log_t log)
{
  int v1;
  void *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = &uarpPlatformDarwinLogFault_logBuffer;
  _os_log_fault_impl(&dword_24BC99000, log, OS_LOG_TYPE_FAULT, "%s\n", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

void UarpRestoreLayer3LogError_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl(&dword_24BC99000, a2, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void UarpRestoreLayer3LogDebug_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_24BC99000, a2, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void UarpRestoreLayer3LogFault_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_fault_impl(&dword_24BC99000, a2, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

uint64_t AMAuthInstallApCreatePersonalizedResponse()
{
  return MEMORY[0x24BEDA688]();
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x24BEDA6C8]();
}

uint64_t AMAuthInstallLogSetHandler()
{
  return MEMORY[0x24BEDA6D0]();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return MEMORY[0x24BEDA6F0]();
}

uint64_t AMAuthInstallSsoEnable()
{
  return MEMORY[0x24BEDA6F8]();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return MEMORY[0x24BEDA700]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC380](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC388](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC390](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A0](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A8](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC3B0](c, data, *(_QWORD *)&len);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE50](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x24BDBC110](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x24BDD7F90](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return MEMORY[0x24BDD7FD0](interface);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return MEMORY[0x24BDD86D8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return MEMORY[0x24BDD88C8](*(_QWORD *)&entry, plane, child);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x24BDD88E0](*(_QWORD *)&entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetParentIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88F8](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFB8](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x24BDAF3D8]();
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x24BDAF4F0]();
}

int reboot_np(int howto, const char *message)
{
  return MEMORY[0x24BDAFAD8](*(_QWORD *)&howto, message);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF78](__s1, __n);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

