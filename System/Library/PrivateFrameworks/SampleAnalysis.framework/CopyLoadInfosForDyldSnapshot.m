@implementation CopyLoadInfosForDyldSnapshot

void ___CopyLoadInfosForDyldSnapshot_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  NSObject *v10;
  int *v11;
  int v12;
  const char *v13;
  _QWORD v14[7];
  _QWORD v15[5];
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (!*(_DWORD *)(a1 + 96))
      goto LABEL_4;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = ___CopyLoadInfosForDyldSnapshot_block_invoke_2;
    v15[3] = &unk_1E7148D90;
    v16 = *(_OWORD *)(a1 + 56);
    v15[4] = &v17;
    DyldImageEnumerateSegments(a2, v15);
    v4 = *((unsigned __int8 *)v18 + 24);
    _Block_object_dispose(&v17, 8);
    if (!v4)
    {
LABEL_4:
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 0;
      v5 = *(_QWORD *)(a1 + 48);
      if (!*(_BYTE *)(*(_QWORD *)(v5 + 8) + 24))
      {
        v6 = *(_QWORD *)(a1 + 80);
        if (*(_OWORD *)(a1 + 72) != 0)
        {
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = ___CopyLoadInfosForDyldSnapshot_block_invoke_3;
          v14[3] = &unk_1E7148DB8;
          v14[4] = &v17;
          v14[5] = v5;
          v14[6] = v6;
          MEMORY[0x1BCCCBCE8](a2, "__TEXT", v14);
        }
      }
      v7 = *(void **)(a1 + 32);
      if (v7)
      {
        +[SABinaryLoadInfo addBinaryLoadInfoForDyldImage:toLoadInfos:isKernel:dataGatheringOptions:]((uint64_t)SABinaryLoadInfo, a2, v7, *(_DWORD *)(a1 + 96) == 0, *(_QWORD *)(a1 + 88));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v9 = *__error();
          _sa_logt();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v12 = *(_DWORD *)(a1 + 96);
            v13 = DyldImagePath(a2);
            *(_DWORD *)buf = 67109378;
            v22 = v12;
            v23 = 2080;
            v24 = v13;
            _os_log_error_impl(&dword_1B9BE0000, v10, OS_LOG_TYPE_ERROR, "[%d] Failed to create SABinary for %s", buf, 0x12u);
          }

          v11 = __error();
          v8 = 0;
          *v11 = v9;
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;
          goto LABEL_19;
        }
        if (*((_BYTE *)v18 + 24) && *(_QWORD *)(a1 + 72))
          goto LABEL_15;
      }
      else
      {
        if (!*(_BYTE *)(a1 + 100) && (!*((_BYTE *)v18 + 24) || !*(_QWORD *)(a1 + 72)))
          goto LABEL_20;
        +[SABinary binaryForDyldImage:options:]((uint64_t)SABinary, a2, *(_QWORD *)(a1 + 88));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (*((_BYTE *)v18 + 24) && *(_QWORD *)(a1 + 72))
        {
LABEL_15:
          v8 = objc_retainAutorelease(v8);
          **(_QWORD **)(a1 + 72) = v8;
        }
      }
LABEL_19:

LABEL_20:
      _Block_object_dispose(&v17, 8);
    }
  }
}

_QWORD *___CopyLoadInfosForDyldSnapshot_block_invoke_2(_QWORD *result, uint64_t a2, unint64_t a3)
{
  if (result[5] <= a3 && result[6] > a3)
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
  return result;
}

_QWORD *___CopyLoadInfosForDyldSnapshot_block_invoke_3(_QWORD *result, unsigned int *a2, uint64_t a3, unint64_t a4)
{
  unint64_t *v4;

  if (a2 && a4 >= 0x1C && a2[3] == 2)
  {
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
    v4 = (unint64_t *)result[6];
    *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 1;
    if (v4)
      *v4 = a2[1] | ((unint64_t)(a2[2] & 0xFFFFFF) << 32);
  }
  return result;
}

@end
