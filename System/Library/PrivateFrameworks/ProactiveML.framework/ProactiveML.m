void sub_2159BDC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_2159BE150(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2159BE504(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AWDProactiveModelFittingEvaluationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  AWDProactiveModelFittingModelInfo *v24;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 48) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_41;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_43:
        *(_QWORD *)(a1 + 8) = v19;
        goto LABEL_44;
      case 2u:
        v24 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 32), v24);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v24, a2))
          goto LABEL_46;
        goto LABEL_39;
      case 3u:
        v24 = objc_alloc_init(AWDProactiveModelFittingMinibatchStats);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_46;
        }
        goto LABEL_39;
      case 4u:
        v24 = objc_alloc_init(AWDProactiveModelFittingEvalMetrics);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingEvalMetricsReadFrom((uint64_t)v24, a2) & 1) == 0)
        {
          goto LABEL_46;
        }
        goto LABEL_39;
      case 5u:
        v24 = objc_alloc_init(AWDProactiveModelFittingPrecisionAtKPair);
        objc_msgSend((id)a1, "addPrecisionAtK:", v24);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingPrecisionAtKPairReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_44:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_46:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_44;
    }
  }
}

uint64_t AWDProactiveModelFittingLogRegWeightsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  AWDProactiveModelFittingModelInfo *v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 72) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_53;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_55;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_55:
        *(_QWORD *)(a1 + 8) = v20;
        goto LABEL_61;
      case 2u:
        v26 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v26, a2))
          goto LABEL_63;
        goto LABEL_51;
      case 3u:
        v26 = objc_alloc_init(AWDProactiveModelFittingSparseFloatVector);
        objc_storeStrong((id *)(a1 + 48), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingSparseFloatVectorReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_63;
        }
        goto LABEL_51;
      case 4u:
        v26 = objc_alloc_init(AWDProactiveModelFittingMinibatchStats);
        objc_storeStrong((id *)(a1 + 32), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_63;
        }
        goto LABEL_51;
      case 5u:
        v26 = objc_alloc_init(AWDProactiveModelFittingEvalMetrics);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingEvalMetricsReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_63;
        }
        goto LABEL_51;
      case 6u:
        v26 = objc_alloc_init(AWDProactiveModelFittingQuantizedSparseVector);
        objc_storeStrong((id *)(a1 + 56), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingQuantizedSparseVectorReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_63;
        }
        goto LABEL_51;
      case 7u:
        *(_BYTE *)(a1 + 72) |= 4u;
        v27 = *v3;
        v28 = *(_QWORD *)(a2 + v27);
        if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v29 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v29 = 0;
        }
        v32 = 68;
        goto LABEL_60;
      case 8u:
        *(_BYTE *)(a1 + 72) |= 2u;
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v29 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v31);
          *(_QWORD *)(a2 + v30) = v31 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v29 = 0;
        }
        v32 = 64;
LABEL_60:
        *(_DWORD *)(a1 + v32) = v29;
        goto LABEL_61;
      case 9u:
        v26 = objc_alloc_init(AWDProactiveModelFittingQuantizedDenseVector);
        objc_storeStrong((id *)(a1 + 16), v26);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingQuantizedDenseVectorReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_51:
          PBReaderRecallMark();

LABEL_61:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_63:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_61;
    }
  }
}

void sub_2159C2734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__307(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__308(uint64_t a1)
{

}

uint64_t AWDProactiveModelFittingLinRegObjectiveFeaturesReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  AWDProactiveModelFittingModelInfo *v25;
  uint64_t result;
  uint64_t v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 56) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_47;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_49;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_49:
        *(_QWORD *)(a1 + 8) = v20;
        goto LABEL_55;
      case 2u:
        v25 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 32), v25);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v25, a2))
          goto LABEL_57;
        goto LABEL_39;
      case 3u:
        v25 = objc_alloc_init(AWDProactiveModelFittingSparseFloatVector);
        objc_storeStrong((id *)(a1 + 40), v25);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingSparseFloatVectorReadFrom((uint64_t)v25, a2) & 1) == 0)
        {
          goto LABEL_57;
        }
        goto LABEL_39;
      case 4u:
        v25 = objc_alloc_init(AWDProactiveModelFittingMinibatchStats);
        objc_storeStrong((id *)(a1 + 24), v25);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)v25, a2) & 1) == 0)
        {
          goto LABEL_57;
        }
        goto LABEL_39;
      case 6u:
        v25 = objc_alloc_init(AWDProactiveModelFittingQuantizedSparseVector);
        objc_storeStrong((id *)(a1 + 48), v25);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingQuantizedSparseVectorReadFrom((uint64_t)v25, a2) & 1) != 0)
        {
LABEL_39:
          PBReaderRecallMark();

LABEL_55:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_57:

        return 0;
      case 7u:
        *(_BYTE *)(a1 + 56) |= 4u;
        v27 = *v3;
        v28 = *(_QWORD *)(a2 + v27);
        if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v29 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v29 = 0;
        }
        v32 = 20;
        goto LABEL_54;
      case 8u:
        *(_BYTE *)(a1 + 56) |= 2u;
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v29 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v31);
          *(_QWORD *)(a2 + v30) = v31 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v29 = 0;
        }
        v32 = 16;
LABEL_54:
        *(_DWORD *)(a1 + v32) = v29;
        goto LABEL_55;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_55;
    }
  }
}

uint64_t AWDProactiveModelFittingQuantizedSparseVectorReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  int v17;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  unint64_t v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    v17 = v10 & 7;
    if (v16 || v17 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        if (v17 != 2)
        {
          v46 = 0;
          v47 = 0;
          v48 = 0;
          while (1)
          {
            v49 = *v3;
            v50 = *(_QWORD *)(a2 + v49);
            v51 = v50 + 1;
            if (v50 == -1 || v51 > *(_QWORD *)(a2 + *v4))
              break;
            v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v50);
            *(_QWORD *)(a2 + v49) = v51;
            v48 |= (unint64_t)(v52 & 0x7F) << v46;
            if (v52 < 0)
            {
              v46 += 7;
              v15 = v47++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_80;
          }
LABEL_79:
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_80:
          PBRepeatedUInt32Add();
LABEL_86:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
        result = PBReaderPlaceMark();
        if ((_DWORD)result)
        {
          while (1)
          {
            if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4) || *(_BYTE *)(a2 + *v5))
              goto LABEL_60;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            while (1)
            {
              v23 = *v3;
              v24 = *(_QWORD *)(a2 + v23);
              v25 = v24 + 1;
              if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
                break;
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v15 = v21++ >= 9;
                if (!v15)
                  continue;
              }
              goto LABEL_31;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedUInt32Add();
          }
        }
        return result;
      case 2u:
        if (v17 != 2)
        {
          v53 = 0;
          v54 = 0;
          v55 = 0;
          while (1)
          {
            v56 = *v3;
            v57 = *(_QWORD *)(a2 + v56);
            v58 = v57 + 1;
            if (v57 == -1 || v58 > *(_QWORD *)(a2 + *v4))
              goto LABEL_79;
            v59 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
            *(_QWORD *)(a2 + v56) = v58;
            v55 |= (unint64_t)(v59 & 0x7F) << v53;
            if (v59 < 0)
            {
              v53 += 7;
              v15 = v54++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_80;
          }
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (1)
          {
            v30 = *v3;
            v31 = *(_QWORD *)(a2 + v30);
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
              break;
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if (v33 < 0)
            {
              v27 += 7;
              v15 = v28++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_46;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
          PBRepeatedUInt32Add();
        }
LABEL_60:
        PBReaderRecallMark();
        goto LABEL_86;
      case 3u:
        v34 = 0;
        v35 = 0;
        v36 = 0;
        *(_BYTE *)(a1 + 68) |= 2u;
        while (2)
        {
          v37 = *v3;
          v38 = *(_QWORD *)(a2 + v37);
          v39 = v38 + 1;
          if (v38 == -1 || v39 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              v15 = v35++ >= 9;
              if (v15)
              {
                LODWORD(v36) = 0;
                goto LABEL_64;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v36) = 0;
LABEL_64:
        *(_DWORD *)(a1 + 60) = v36;
        goto LABEL_86;
      case 4u:
        *(_BYTE *)(a1 + 68) |= 4u;
        v41 = *v3;
        v42 = *(_QWORD *)(a2 + v41);
        if (v42 <= 0xFFFFFFFFFFFFFFFBLL && v42 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v43 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v42);
          *(_QWORD *)(a2 + v41) = v42 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v43 = 0;
        }
        v60 = 64;
        goto LABEL_85;
      case 5u:
        *(_BYTE *)(a1 + 68) |= 1u;
        v44 = *v3;
        v45 = *(_QWORD *)(a2 + v44);
        if (v45 <= 0xFFFFFFFFFFFFFFFBLL && v45 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v43 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v45);
          *(_QWORD *)(a2 + v44) = v45 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v43 = 0;
        }
        v60 = 56;
LABEL_85:
        *(_DWORD *)(a1 + v60) = v43;
        goto LABEL_86;
      default:
        if ((PBReaderSkipValueWithTag() & 1) != 0)
          goto LABEL_86;
        return 0;
    }
  }
}

BOOL AWDProactiveModelFittingModelInfoStatsPairReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  AWDProactiveModelFittingModelInfo *v17;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v17, a2))
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(AWDProactiveModelFittingMinibatchStats);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark()
      || (AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2159C6B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__661(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__662(uint64_t a1)
{

}

uint64_t AWDProactiveModelFittingLinRegFeatureMatrixReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  AWDProactiveModelFittingModelInfo *v25;
  uint64_t result;
  uint64_t v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 56) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_47;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_49;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_49:
        *(_QWORD *)(a1 + 8) = v20;
        goto LABEL_55;
      case 2u:
        v25 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 32), v25);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v25, a2))
          goto LABEL_57;
        goto LABEL_37;
      case 3u:
        v25 = objc_alloc_init(AWDProactiveModelFittingSparseFloatMatrix);
        objc_storeStrong((id *)(a1 + 40), v25);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingSparseFloatMatrixReadFrom((uint64_t)v25, a2) & 1) == 0)
        {
          goto LABEL_57;
        }
        goto LABEL_37;
      case 4u:
        v25 = objc_alloc_init(AWDProactiveModelFittingMinibatchStats);
        objc_storeStrong((id *)(a1 + 24), v25);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)v25, a2) & 1) == 0)
        {
          goto LABEL_57;
        }
        goto LABEL_37;
      case 5u:
        v25 = objc_alloc_init(AWDProactiveModelFittingQuantizedSparseMatrix);
        objc_storeStrong((id *)(a1 + 48), v25);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingQuantizedSparseMatrixReadFrom((uint64_t)v25, a2) & 1) != 0)
        {
LABEL_37:
          PBReaderRecallMark();

LABEL_55:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_57:

        return 0;
      case 8u:
        *(_BYTE *)(a1 + 56) |= 4u;
        v27 = *v3;
        v28 = *(_QWORD *)(a2 + v27);
        if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v29 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v29 = 0;
        }
        v32 = 20;
        goto LABEL_54;
      case 9u:
        *(_BYTE *)(a1 + 56) |= 2u;
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v29 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v31);
          *(_QWORD *)(a2 + v30) = v31 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v29 = 0;
        }
        v32 = 16;
LABEL_54:
        *(_DWORD *)(a1 + v32) = v29;
        goto LABEL_55;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_55;
    }
  }
}

uint64_t AWDProactiveModelFittingSparseFloatVectorReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  int v18;
  unint64_t v20;
  uint64_t result;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  unint64_t v48;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *v5;
          v17 = *(unsigned __int8 *)(a2 + v16);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *v5;
      v17 = *(unsigned __int8 *)(a2 + v16);
      if (*(_BYTE *)(a2 + v16))
        v10 = 0;
LABEL_14:
      v18 = v10 & 7;
      if (v17 || v18 == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v20 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v29 = 0;
        v30 = 0;
        v31 = 0;
        *(_BYTE *)(a1 + 64) |= 1u;
        while (1)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          v34 = v33 + 1;
          if (v33 == -1 || v34 > *(_QWORD *)(a2 + *v4))
            break;
          v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
          *(_QWORD *)(a2 + v32) = v34;
          v31 |= (unint64_t)(v35 & 0x7F) << v29;
          if ((v35 & 0x80) == 0)
            goto LABEL_54;
          v29 += 7;
          v15 = v30++ >= 9;
          if (v15)
          {
            v31 = 0;
            goto LABEL_56;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_54:
        if (*(_BYTE *)(a2 + *v5))
          v31 = 0;
LABEL_56:
        *(_QWORD *)(a1 + 56) = v31;
        goto LABEL_71;
      }
      if ((_DWORD)v20 == 2)
        break;
      if ((_DWORD)v20 == 1)
      {
        if (v18 != 2)
        {
          v40 = 0;
          v41 = 0;
          v42 = 0;
          while (1)
          {
            v43 = *v3;
            v44 = *(_QWORD *)(a2 + v43);
            v45 = v44 + 1;
            if (v44 == -1 || v45 > *(_QWORD *)(a2 + *v4))
              break;
            v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
            *(_QWORD *)(a2 + v43) = v45;
            v42 |= (unint64_t)(v46 & 0x7F) << v40;
            if (v46 < 0)
            {
              v40 += 7;
              v15 = v41++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_68;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_68:
          PBRepeatedUInt64Add();
          goto LABEL_71;
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v22 = 0;
          v23 = 0;
          v24 = 0;
          while (1)
          {
            v25 = *v3;
            v26 = *(_QWORD *)(a2 + v25);
            v27 = v26 + 1;
            if (v26 == -1 || v27 > *(_QWORD *)(a2 + *v4))
              break;
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if (v28 < 0)
            {
              v22 += 7;
              v15 = v23++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_33;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
          PBRepeatedUInt64Add();
        }
LABEL_52:
        PBReaderRecallMark();
        goto LABEL_71;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_71:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    if (v18 != 2)
    {
      v47 = *v3;
      v48 = *(_QWORD *)(a2 + v47);
      if (v48 <= 0xFFFFFFFFFFFFFFFBLL && v48 + 4 <= *(_QWORD *)(a2 + *v4))
        *(_QWORD *)(a2 + v47) = v48 + 4;
      else
        *(_BYTE *)(a2 + v16) = 1;
      PBRepeatedFloatAdd();
      goto LABEL_71;
    }
    result = PBReaderPlaceMark();
    if (!(_DWORD)result)
      return result;
    while (1)
    {
      v36 = (unint64_t *)(a2 + *v3);
      v37 = *v36;
      v38 = *(_QWORD *)(a2 + *v4);
      if (*v36 >= v38)
        break;
      v39 = *v5;
      if (*(_BYTE *)(a2 + v39))
        break;
      if (v37 > 0xFFFFFFFFFFFFFFFBLL || v37 + 4 > v38)
        *(_BYTE *)(a2 + v39) = 1;
      else
        *v36 = v37 + 4;
      PBRepeatedFloatAdd();
    }
    goto LABEL_52;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2159CAA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_2159CAC5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2159CAF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_2159CB2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

void sub_2159CB4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_2159CB7A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_2159CBB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_2159CBE74(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2159CC0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2159CC214(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2159CC934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2159CCC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2159CCF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__998(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__999(uint64_t a1)
{

}

void sub_2159CD7AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2159CF68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t AWDProactiveModelFittingSparseFloatMatrixReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  unint64_t *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  uint64_t v67;
  unint64_t v68;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *v5;
        v17 = *(unsigned __int8 *)(a2 + v16);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *v5;
    v17 = *(unsigned __int8 *)(a2 + v16);
    if (*(_BYTE *)(a2 + v16))
      v10 = 0;
LABEL_14:
    v18 = v10 & 7;
    if (v17 || v18 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        if (v18 != 2)
        {
          v53 = 0;
          v54 = 0;
          v55 = 0;
          while (1)
          {
            v56 = *v3;
            v57 = *(_QWORD *)(a2 + v56);
            v58 = v57 + 1;
            if (v57 == -1 || v58 > *(_QWORD *)(a2 + *v4))
              break;
            v59 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v57);
            *(_QWORD *)(a2 + v56) = v58;
            v55 |= (unint64_t)(v59 & 0x7F) << v53;
            if (v59 < 0)
            {
              v53 += 7;
              v15 = v54++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_95;
          }
LABEL_94:
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_95:
          PBRepeatedUInt64Add();
LABEL_101:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
        result = PBReaderPlaceMark();
        if ((_DWORD)result)
        {
          while (1)
          {
            if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4) || *(_BYTE *)(a2 + *v5))
              goto LABEL_70;
            v21 = 0;
            v22 = 0;
            v23 = 0;
            while (1)
            {
              v24 = *v3;
              v25 = *(_QWORD *)(a2 + v24);
              v26 = v25 + 1;
              if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
                break;
              v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
              *(_QWORD *)(a2 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                v15 = v22++ >= 9;
                if (!v15)
                  continue;
              }
              goto LABEL_31;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedUInt64Add();
          }
        }
        return result;
      case 2u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        *(_BYTE *)(a1 + 96) |= 1u;
        while (2)
        {
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          v33 = v32 + 1;
          if (v32 == -1 || v33 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v33;
            v30 |= (unint64_t)(v34 & 0x7F) << v28;
            if (v34 < 0)
            {
              v28 += 7;
              v15 = v29++ >= 9;
              if (v15)
              {
                v30 = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_74:
        v52 = 80;
        goto LABEL_79;
      case 3u:
        if (v18 != 2)
        {
          v60 = 0;
          v61 = 0;
          v62 = 0;
          while (1)
          {
            v63 = *v3;
            v64 = *(_QWORD *)(a2 + v63);
            v65 = v64 + 1;
            if (v64 == -1 || v65 > *(_QWORD *)(a2 + *v4))
              goto LABEL_94;
            v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v64);
            *(_QWORD *)(a2 + v63) = v65;
            v62 |= (unint64_t)(v66 & 0x7F) << v60;
            if (v66 < 0)
            {
              v60 += 7;
              v15 = v61++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_95;
          }
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v35 = 0;
          v36 = 0;
          v37 = 0;
          while (1)
          {
            v38 = *v3;
            v39 = *(_QWORD *)(a2 + v38);
            v40 = v39 + 1;
            if (v39 == -1 || v40 > *(_QWORD *)(a2 + *v4))
              break;
            v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v40;
            v37 |= (unint64_t)(v41 & 0x7F) << v35;
            if (v41 < 0)
            {
              v35 += 7;
              v15 = v36++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_53;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
          PBRepeatedUInt64Add();
        }
        goto LABEL_70;
      case 4u:
        v42 = 0;
        v43 = 0;
        v30 = 0;
        *(_BYTE *)(a1 + 96) |= 2u;
        while (2)
        {
          v44 = *v3;
          v45 = *(_QWORD *)(a2 + v44);
          v46 = v45 + 1;
          if (v45 == -1 || v46 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
            *(_QWORD *)(a2 + v44) = v46;
            v30 |= (unint64_t)(v47 & 0x7F) << v42;
            if (v47 < 0)
            {
              v42 += 7;
              v15 = v43++ >= 9;
              if (v15)
              {
                v30 = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_78:
        v52 = 88;
LABEL_79:
        *(_QWORD *)(a1 + v52) = v30;
        goto LABEL_101;
      case 5u:
        if (v18 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v48 = (unint64_t *)(a2 + *v3);
            v49 = *v48;
            v50 = *(_QWORD *)(a2 + *v4);
            if (*v48 >= v50)
              break;
            v51 = *v5;
            if (*(_BYTE *)(a2 + v51))
              break;
            if (v49 > 0xFFFFFFFFFFFFFFFBLL || v49 + 4 > v50)
              *(_BYTE *)(a2 + v51) = 1;
            else
              *v48 = v49 + 4;
            PBRepeatedFloatAdd();
          }
LABEL_70:
          PBReaderRecallMark();
        }
        else
        {
          v67 = *v3;
          v68 = *(_QWORD *)(a2 + v67);
          if (v68 <= 0xFFFFFFFFFFFFFFFBLL && v68 + 4 <= *(_QWORD *)(a2 + *v4))
            *(_QWORD *)(a2 + v67) = v68 + 4;
          else
            *(_BYTE *)(a2 + v16) = 1;
          PBRepeatedFloatAdd();
        }
        goto LABEL_101;
      default:
        if ((PBReaderSkipValueWithTag() & 1) != 0)
          goto LABEL_101;
        return 0;
    }
  }
}

uint64_t AWDProactiveModelFittingQuantizedSparseMatrixReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  int v17;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  unint64_t v55;
  int v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  uint64_t v81;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    v17 = v10 & 7;
    if (v16 || v17 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        if (v17 != 2)
        {
          v60 = 0;
          v61 = 0;
          v62 = 0;
          while (1)
          {
            v63 = *v3;
            v64 = *(_QWORD *)(a2 + v63);
            v65 = v64 + 1;
            if (v64 == -1 || v65 > *(_QWORD *)(a2 + *v4))
              break;
            v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v64);
            *(_QWORD *)(a2 + v63) = v65;
            v62 |= (unint64_t)(v66 & 0x7F) << v60;
            if (v66 < 0)
            {
              v60 += 7;
              v15 = v61++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_112;
          }
LABEL_111:
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_112:
          PBRepeatedUInt32Add();
LABEL_118:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
        result = PBReaderPlaceMark();
        if ((_DWORD)result)
        {
          while (1)
          {
            if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4) || *(_BYTE *)(a2 + *v5))
              goto LABEL_74;
            v20 = 0;
            v21 = 0;
            v22 = 0;
            while (1)
            {
              v23 = *v3;
              v24 = *(_QWORD *)(a2 + v23);
              v25 = v24 + 1;
              if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
                break;
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v15 = v21++ >= 9;
                if (!v15)
                  continue;
              }
              goto LABEL_31;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedUInt32Add();
          }
        }
        return result;
      case 2u:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        *(_BYTE *)(a1 + 96) |= 2u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          v32 = v31 + 1;
          if (v31 == -1 || v32 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if (v33 < 0)
            {
              v27 += 7;
              v15 = v28++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_84;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v29) = 0;
LABEL_84:
        v59 = 84;
        goto LABEL_89;
      case 3u:
        if (v17 != 2)
        {
          v67 = 0;
          v68 = 0;
          v69 = 0;
          while (1)
          {
            v70 = *v3;
            v71 = *(_QWORD *)(a2 + v70);
            v72 = v71 + 1;
            if (v71 == -1 || v72 > *(_QWORD *)(a2 + *v4))
              goto LABEL_111;
            v73 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v71);
            *(_QWORD *)(a2 + v70) = v72;
            v69 |= (unint64_t)(v73 & 0x7F) << v67;
            if (v73 < 0)
            {
              v67 += 7;
              v15 = v68++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_112;
          }
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v34 = 0;
          v35 = 0;
          v36 = 0;
          while (1)
          {
            v37 = *v3;
            v38 = *(_QWORD *)(a2 + v37);
            v39 = v38 + 1;
            if (v38 == -1 || v39 > *(_QWORD *)(a2 + *v4))
              break;
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v38);
            *(_QWORD *)(a2 + v37) = v39;
            v36 |= (unint64_t)(v40 & 0x7F) << v34;
            if (v40 < 0)
            {
              v34 += 7;
              v15 = v35++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_53;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
          PBRepeatedUInt32Add();
        }
        goto LABEL_74;
      case 4u:
        v41 = 0;
        v42 = 0;
        v29 = 0;
        *(_BYTE *)(a1 + 96) |= 8u;
        while (2)
        {
          v43 = *v3;
          v44 = *(_QWORD *)(a2 + v43);
          v45 = v44 + 1;
          if (v44 == -1 || v45 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
            *(_QWORD *)(a2 + v43) = v45;
            v29 |= (unint64_t)(v46 & 0x7F) << v41;
            if (v46 < 0)
            {
              v41 += 7;
              v15 = v42++ >= 9;
              if (v15)
              {
                LODWORD(v29) = 0;
                goto LABEL_88;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v29) = 0;
LABEL_88:
        v59 = 92;
LABEL_89:
        *(_DWORD *)(a1 + v59) = v29;
        goto LABEL_118;
      case 5u:
        if (v17 != 2)
        {
          v74 = 0;
          v75 = 0;
          v76 = 0;
          while (1)
          {
            v77 = *v3;
            v78 = *(_QWORD *)(a2 + v77);
            v79 = v78 + 1;
            if (v78 == -1 || v79 > *(_QWORD *)(a2 + *v4))
              goto LABEL_111;
            v80 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v78);
            *(_QWORD *)(a2 + v77) = v79;
            v76 |= (unint64_t)(v80 & 0x7F) << v74;
            if (v80 < 0)
            {
              v74 += 7;
              v15 = v75++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_112;
          }
        }
        result = PBReaderPlaceMark();
        if (!(_DWORD)result)
          return result;
        while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
        {
          v47 = 0;
          v48 = 0;
          v49 = 0;
          while (1)
          {
            v50 = *v3;
            v51 = *(_QWORD *)(a2 + v50);
            v52 = v51 + 1;
            if (v51 == -1 || v52 > *(_QWORD *)(a2 + *v4))
              break;
            v53 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v51);
            *(_QWORD *)(a2 + v50) = v52;
            v49 |= (unint64_t)(v53 & 0x7F) << v47;
            if (v53 < 0)
            {
              v47 += 7;
              v15 = v48++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_73;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_73:
          PBRepeatedUInt32Add();
        }
LABEL_74:
        PBReaderRecallMark();
        goto LABEL_118;
      case 6u:
        *(_BYTE *)(a1 + 96) |= 4u;
        v54 = *v3;
        v55 = *(_QWORD *)(a2 + v54);
        if (v55 <= 0xFFFFFFFFFFFFFFFBLL && v55 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v56 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v55);
          *(_QWORD *)(a2 + v54) = v55 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v56 = 0;
        }
        v81 = 88;
        goto LABEL_117;
      case 7u:
        *(_BYTE *)(a1 + 96) |= 1u;
        v57 = *v3;
        v58 = *(_QWORD *)(a2 + v57);
        if (v58 <= 0xFFFFFFFFFFFFFFFBLL && v58 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v56 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v58);
          *(_QWORD *)(a2 + v57) = v58 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v56 = 0;
        }
        v81 = 80;
LABEL_117:
        *(_DWORD *)(a1 + v81) = v56;
        goto LABEL_118;
      default:
        if ((PBReaderSkipValueWithTag() & 1) != 0)
          goto LABEL_118;
        return 0;
    }
  }
}

uint64_t internChunk(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a2;
  v4 = a1;
  v5 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "addObject:", v4);

  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
}

id arrayFromFloats(int *a1, int a2)
{
  void *v4;
  double v5;
  uint64_t v6;
  int v7;
  void *v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a2);
  if (a2 >= 1)
  {
    v6 = a2;
    do
    {
      v7 = *a1++;
      LODWORD(v5) = v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

      --v6;
    }
    while (v6);
  }
  return v4;
}

id PMLBuildChunkFile(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  objc_msgSend(v1, "toPlistWithChunks:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[PMLDataChunkPlist chunkWithPlist:](PMLDataChunkPlist, "chunkWithPlist:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v2, "addObject:", v4);

  }
  +[PMLDataChunk serializeChunks:](PMLDataChunk, "serializeChunks:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void PMLWriteChunkFile(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a1;
  v3 = a2;
  v4 = (void *)MEMORY[0x2199EA600]();
  PMLBuildChunkFile(v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeToFile:atomically:", v3, 1);

  objc_autoreleasePoolPop(v4);
}

id PMLReadChunkFile(uint64_t a1, objc_class *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[PMLDataChunk chunksFromFileAtPath:](PMLDataChunk, "chunksFromFileAtPath:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  loadChunkFileChunks(v6, a2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id loadChunkFileChunks(void *a1, objc_class *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a1;
  v6 = a3;
  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "plist");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = (void *)objc_msgSend([a2 alloc], "initWithPlist:chunks:context:", v8, v5, v6);
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id PMLReadChunkData(uint64_t a1, objc_class *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[PMLDataChunk chunksFromData:](PMLDataChunk, "chunksFromData:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  loadChunkFileChunks(v6, a2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_2159D74FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2159D781C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2159D7AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2159D7E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t ixvalCompareIndex(_QWORD *a1, _QWORD *a2)
{
  if (*a1 < *a2)
    return 0xFFFFFFFFLL;
  else
    return *a1 > *a2;
}

char *appendIxval(unint64_t *a1, uint64_t a2, float a3)
{
  unint64_t v6;
  unint64_t v7;
  char *result;
  unint64_t v9;
  float *v10;

  v6 = *a1;
  v7 = a1[1];
  if (*a1 >= v7)
  {
    v9 = v7 + (v7 >> 1);
    if (v9 <= 8)
      v9 = 8;
    a1[1] = v9;
    result = (char *)reallocf((void *)a1[2], 16 * v9);
    a1[2] = (unint64_t)result;
    v6 = *a1;
  }
  else
  {
    result = (char *)a1[2];
  }
  *a1 = v6 + 1;
  v10 = (float *)&result[16 * v6];
  *(_QWORD *)v10 = a2;
  v10[2] = a3;
  return result;
}

BOOL AWDProactiveModelFittingModelInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 8;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void migrateSessionsToFloats(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v2 = a2;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __migrateSessionsToFloats_block_invoke;
  v4[3] = &unk_24D3DB818;
  v5 = v2;
  v3 = v2;
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id, covariatesValues FROM sessions"), 0, v4, &__block_literal_global_265);

}

uint64_t __migrateSessionsToFloats_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  double *v5;
  unint64_t v6;
  float *v7;
  uint64_t v8;
  float *v9;
  double v10;
  float v11;
  void *v12;
  unsigned __int8 *v13;
  _QWORD v15[6];
  _QWORD v16[5];
  id v17;
  _QWORD v18[3];
  uint64_t v19;

  v3 = a2;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v19 = objc_msgSend(v3, "getInt64ForColumn:", 0);
  objc_msgSend(v3, "getNSDataForColumn:", 1);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (double *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  v7 = (float *)malloc_type_malloc(4 * (v6 >> 3), 0x100004052888210uLL);
  if (v6 >= 8)
  {
    if (v6 >> 3 <= 1)
      v8 = 1;
    else
      v8 = v6 >> 3;
    v9 = v7;
    do
    {
      v10 = *v5++;
      v11 = v10;
      *v9++ = v11;
      --v8;
    }
    while (v8);
  }
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1971;
  v16[4] = __Block_byref_object_dispose__1972;
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, 4 * (v6 >> 3), 1);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __migrateSessionsToFloats_block_invoke_258;
  v15[3] = &unk_24D3DB770;
  v15[4] = v16;
  v15[5] = v18;
  objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE sessions SET covariatesValues = :data WHERE id = :rowId"), v15, &__block_literal_global_1973, &__block_literal_global_264);
  v13 = (unsigned __int8 *)MEMORY[0x24BE7A6A8];
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
  return *v13;
}

void sub_2159DA22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __migrateSessionsToFloats_block_invoke_4()
{
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __Block_byref_object_copy__1971(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1972(uint64_t a1)
{

}

void __migrateSessionsToFloats_block_invoke_258(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNSData:", ":data", v3);
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rowId", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

}

uint64_t __migrateSessionsToFloats_block_invoke_3()
{
  return *MEMORY[0x24BE7A6B0];
}

uint64_t __migrateSessionsToFloats_block_invoke_2()
{
  return *MEMORY[0x24BE7A6A8];
}

void sub_2159DAE3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AWDProactiveModelFittingEvalMetricsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  unint64_t *v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          v15 = v9++ >= 9;
          if (v15)
          {
            v10 = 0;
            v16 = *v5;
            v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *v5;
        v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(_BYTE *)(a2 + v16))
          v10 = 0;
LABEL_14:
        v18 = v10 & 7;
        if (!v17 && v18 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              *(_BYTE *)(a1 + 100) |= 0x20u;
              v20 = *v3;
              v21 = *(_QWORD *)(a2 + v20);
              if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v22 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v21);
                *(_QWORD *)(a2 + v20) = v21 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v22 = 0;
              }
              v63 = 92;
              goto LABEL_103;
            case 2u:
              *(_BYTE *)(a1 + 100) |= 0x10u;
              v23 = *v3;
              v24 = *(_QWORD *)(a2 + v23);
              if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v22 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v24);
                *(_QWORD *)(a2 + v23) = v24 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v22 = 0;
              }
              v63 = 88;
              goto LABEL_103;
            case 3u:
              v25 = 0;
              v26 = 0;
              v27 = 0;
              *(_BYTE *)(a1 + 100) |= 8u;
              while (2)
              {
                v28 = *v3;
                v29 = *(_QWORD *)(a2 + v28);
                v30 = v29 + 1;
                if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
                  *(_QWORD *)(a2 + v28) = v30;
                  v27 |= (unint64_t)(v31 & 0x7F) << v25;
                  if (v31 < 0)
                  {
                    v25 += 7;
                    v15 = v26++ >= 9;
                    if (v15)
                    {
                      v27 = 0;
                      goto LABEL_80;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v27 = 0;
LABEL_80:
              v60 = 80;
              goto LABEL_93;
            case 4u:
              v32 = 0;
              v33 = 0;
              v27 = 0;
              *(_BYTE *)(a1 + 100) |= 4u;
              while (2)
              {
                v34 = *v3;
                v35 = *(_QWORD *)(a2 + v34);
                v36 = v35 + 1;
                if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
                  *(_QWORD *)(a2 + v34) = v36;
                  v27 |= (unint64_t)(v37 & 0x7F) << v32;
                  if (v37 < 0)
                  {
                    v32 += 7;
                    v15 = v33++ >= 9;
                    if (v15)
                    {
                      v27 = 0;
                      goto LABEL_84;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v27 = 0;
LABEL_84:
              v60 = 72;
              goto LABEL_93;
            case 5u:
              v38 = 0;
              v39 = 0;
              v27 = 0;
              *(_BYTE *)(a1 + 100) |= 2u;
              while (2)
              {
                v40 = *v3;
                v41 = *(_QWORD *)(a2 + v40);
                v42 = v41 + 1;
                if (v41 == -1 || v42 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
                  *(_QWORD *)(a2 + v40) = v42;
                  v27 |= (unint64_t)(v43 & 0x7F) << v38;
                  if (v43 < 0)
                  {
                    v38 += 7;
                    v15 = v39++ >= 9;
                    if (v15)
                    {
                      v27 = 0;
                      goto LABEL_88;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v27 = 0;
LABEL_88:
              v60 = 64;
              goto LABEL_93;
            case 6u:
              v44 = 0;
              v45 = 0;
              v27 = 0;
              *(_BYTE *)(a1 + 100) |= 1u;
              while (2)
              {
                v46 = *v3;
                v47 = *(_QWORD *)(a2 + v46);
                v48 = v47 + 1;
                if (v47 == -1 || v48 > *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
                  *(_QWORD *)(a2 + v46) = v48;
                  v27 |= (unint64_t)(v49 & 0x7F) << v44;
                  if (v49 < 0)
                  {
                    v44 += 7;
                    v15 = v45++ >= 9;
                    if (v15)
                    {
                      v27 = 0;
                      goto LABEL_92;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v27 = 0;
LABEL_92:
              v60 = 56;
LABEL_93:
              *(_QWORD *)(a1 + v60) = v27;
              goto LABEL_106;
            case 7u:
              if (v18 != 2)
                goto LABEL_94;
              result = PBReaderPlaceMark();
              if (!(_DWORD)result)
                return result;
              while (1)
              {
                v50 = (unint64_t *)(a2 + *v3);
                v51 = *v50;
                v52 = *(_QWORD *)(a2 + *v4);
                if (*v50 >= v52)
                  break;
                v53 = *v5;
                if (*(_BYTE *)(a2 + v53))
                  break;
                if (v51 > 0xFFFFFFFFFFFFFFFBLL || v51 + 4 > v52)
                  *(_BYTE *)(a2 + v53) = 1;
                else
                  *v50 = v51 + 4;
                PBRepeatedFloatAdd();
              }
              goto LABEL_76;
            case 8u:
              if (v18 == 2)
              {
                result = PBReaderPlaceMark();
                if (!(_DWORD)result)
                  return result;
                while (1)
                {
                  v54 = (unint64_t *)(a2 + *v3);
                  v55 = *v54;
                  v56 = *(_QWORD *)(a2 + *v4);
                  if (*v54 >= v56)
                    break;
                  v57 = *v5;
                  if (*(_BYTE *)(a2 + v57))
                    break;
                  if (v55 > 0xFFFFFFFFFFFFFFFBLL || v55 + 4 > v56)
                    *(_BYTE *)(a2 + v57) = 1;
                  else
                    *v54 = v55 + 4;
                  PBRepeatedFloatAdd();
                }
LABEL_76:
                PBReaderRecallMark();
              }
              else
              {
LABEL_94:
                v61 = *v3;
                v62 = *(_QWORD *)(a2 + v61);
                if (v62 <= 0xFFFFFFFFFFFFFFFBLL && v62 + 4 <= *(_QWORD *)(a2 + *v4))
                  *(_QWORD *)(a2 + v61) = v62 + 4;
                else
                  *(_BYTE *)(a2 + v16) = 1;
                PBRepeatedFloatAdd();
              }
LABEL_106:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
            case 9u:
              *(_BYTE *)(a1 + 100) |= 0x40u;
              v58 = *v3;
              v59 = *(_QWORD *)(a2 + v58);
              if (v59 <= 0xFFFFFFFFFFFFFFFBLL && v59 + 4 <= *(_QWORD *)(a2 + *v4))
              {
                v22 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v59);
                *(_QWORD *)(a2 + v58) = v59 + 4;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v22 = 0;
              }
              v63 = 96;
LABEL_103:
              *(_DWORD *)(a1 + v63) = v22;
              goto LABEL_106;
            default:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                goto LABEL_106;
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2159DD2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPFLPrivatizeSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!PrivateFederatedLearningLibraryCore_frameworkLibrary)
    PrivateFederatedLearningLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = (void *)PrivateFederatedLearningLibraryCore_frameworkLibrary;
  if (!PrivateFederatedLearningLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PrivateFederatedLearningLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PMLSeparatedDPNoiseStrategy.m"), 18, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "PFLPrivatize");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getPFLPrivatizeSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

void sub_2159DE154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2159DE200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2159DFFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 160), 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2735(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2736(uint64_t a1)
{

}

void sub_2159E1460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v7 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2159E162C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t AWDProactiveModelFittingSessionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  AWDProactiveModelFittingModelInfo *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  unint64_t v40;
  int v41;
  uint64_t v42;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 56) |= 4u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_52;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_54;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_52:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_54:
        v42 = 24;
        goto LABEL_63;
      case 2u:
        v26 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 40), v26);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v26, a2))
          goto LABEL_68;
        goto LABEL_40;
      case 3u:
        v27 = 0;
        v28 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 56) |= 1u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v31;
            v20 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v15 = v28++ >= 9;
              if (v15)
              {
                v20 = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_58:
        v42 = 8;
        goto LABEL_63;
      case 4u:
        v26 = objc_alloc_init(AWDProactiveModelFittingSparseFloatVector);
        objc_storeStrong((id *)(a1 + 48), v26);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingSparseFloatVectorReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_40:
          PBReaderRecallMark();

LABEL_66:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_68:

        return 0;
      case 5u:
        v33 = 0;
        v34 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 56) |= 2u;
        while (2)
        {
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          v37 = v36 + 1;
          if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v37;
            v20 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              v15 = v34++ >= 9;
              if (v15)
              {
                v20 = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_62:
        v42 = 16;
LABEL_63:
        *(_QWORD *)(a1 + v42) = v20;
        goto LABEL_66;
      case 6u:
        *(_BYTE *)(a1 + 56) |= 8u;
        v39 = *v3;
        v40 = *(_QWORD *)(a2 + v39);
        if (v40 <= 0xFFFFFFFFFFFFFFFBLL && v40 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v41 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v40);
          *(_QWORD *)(a2 + v39) = v40 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v41 = 0;
        }
        *(_DWORD *)(a1 + 32) = v41;
        goto LABEL_66;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_66;
    }
  }
}

uint64_t AWDProactiveModelFittingLabelSupportPairReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        *(_BYTE *)(a1 + 20) |= 2u;
        v25 = *v3;
        v26 = *(_QWORD *)(a2 + v25);
        if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v27 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v26);
          *(_QWORD *)(a2 + v25) = v26 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v27 = 0;
        }
        *(_DWORD *)(a1 + 16) = v27;
      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_33;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_35:
        *(_QWORD *)(a1 + 8) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t DescribeTensorDescriptor(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t last_error_message;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  NSObject *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  unsigned int v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  unsigned __int8 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint8_t v116[128];
  uint8_t buf[4];
  uint64_t v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Printing tensor information for %s"), a1);
  objc_msgSend(v2, "addObject:", v3);

  v110 = 0;
  if (e5rt_tensor_desc_dtype_get_num_components())
  {
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v107;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v107 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * v8);
          PML_LogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v118 = v9;
            _os_log_fault_impl(&dword_2159BB000, v10, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
      }
      while (v6);
    }

    last_error_message = e5rt_get_last_error_message();
    PML_LogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_70;
    *(_DWORD *)buf = 136315138;
    v118 = last_error_message;
LABEL_69:
    _os_log_fault_impl(&dword_2159BB000, v12, OS_LOG_TYPE_FAULT, "E5RT operation failed with message = %s", buf, 0xCu);
LABEL_70:

    v52 = 0xFFFFFFFFLL;
    goto LABEL_71;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Num components per element = %u"), v110);
  objc_msgSend(v2, "addObject:", v13);

  v105 = 0;
  if (e5rt_tensor_desc_dtype_get_component_dtype())
  {
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v14 = v2;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v102;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v102 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v18);
          PML_LogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v118 = v19;
            _os_log_fault_impl(&dword_2159BB000, v20, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
      }
      while (v16);
    }

    v21 = e5rt_get_last_error_message();
    PML_LogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_70;
    *(_DWORD *)buf = 136315138;
    v118 = v21;
    goto LABEL_69;
  }
  switch(v105)
  {
    case 0u:
      v22 = CFSTR("Component data type is UINT");
      goto LABEL_32;
    case 1u:
      v22 = CFSTR("Component data type is INT");
      goto LABEL_32;
    case 2u:
      v22 = CFSTR("Component data type is UNORM");
      goto LABEL_32;
    case 3u:
      v22 = CFSTR("Component data type is SNORM");
      goto LABEL_32;
    case 4u:
      v22 = CFSTR("Component data type is FLOAT");
LABEL_32:
      objc_msgSend(v2, "addObject:", v22);
      break;
    default:
      v23 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v105);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("Component data type is UNKNOWN w/ ctype %@"), v24);
      objc_msgSend(v2, "addObject:", v25);

      break;
  }
  v100 = 0;
  if (e5rt_tensor_desc_dtype_get_component_size())
  {
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v26 = v2;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v96, v115, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v97;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v97 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * v30);
          PML_LogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v118 = v31;
            _os_log_fault_impl(&dword_2159BB000, v32, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v96, v115, 16);
      }
      while (v28);
    }

    v33 = e5rt_get_last_error_message();
    PML_LogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_70;
    *(_DWORD *)buf = 136315138;
    v118 = v33;
    goto LABEL_69;
  }
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Component size is %zu bytes"), v100);
  objc_msgSend(v2, "addObject:", v34);

  v95 = 0;
  if (e5rt_tensor_desc_dtype_get_element_size())
  {
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v35 = v2;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v91, v114, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v92;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v92 != v38)
            objc_enumerationMutation(v35);
          v40 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * v39);
          PML_LogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v118 = v40;
            _os_log_fault_impl(&dword_2159BB000, v41, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }

          ++v39;
        }
        while (v37 != v39);
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v91, v114, 16);
      }
      while (v37);
    }

    v42 = e5rt_get_last_error_message();
    PML_LogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_70;
    *(_DWORD *)buf = 136315138;
    v118 = v42;
    goto LABEL_69;
  }
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Element size is %zu bytes"), v95);
  objc_msgSend(v2, "addObject:", v43);

  v90 = 0;
  if (e5rt_tensor_desc_get_rank())
  {
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v44 = v2;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v86, v113, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v87;
      do
      {
        v48 = 0;
        do
        {
          if (*(_QWORD *)v87 != v47)
            objc_enumerationMutation(v44);
          v49 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v48);
          PML_LogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v118 = v49;
            _os_log_fault_impl(&dword_2159BB000, v50, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }

          ++v48;
        }
        while (v46 != v48);
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v86, v113, 16);
      }
      while (v46);
    }

    v51 = e5rt_get_last_error_message();
    PML_LogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_70;
    *(_DWORD *)buf = 136315138;
    v118 = v51;
    goto LABEL_69;
  }
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Tensor rank is %zu"), v90);
  objc_msgSend(v2, "addObject:", v54);

  v85 = 0;
  if (e5rt_tensor_desc_get_shape())
  {
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v55 = v2;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v81, v112, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v82;
      do
      {
        v59 = 0;
        do
        {
          if (*(_QWORD *)v82 != v58)
            objc_enumerationMutation(v55);
          v60 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v59);
          PML_LogHandle();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v118 = v60;
            _os_log_fault_impl(&dword_2159BB000, v61, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
          }

          ++v59;
        }
        while (v57 != v59);
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v81, v112, 16);
      }
      while (v57);
    }

    v62 = e5rt_get_last_error_message();
    PML_LogHandle();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v118 = v62;
      _os_log_fault_impl(&dword_2159BB000, v63, OS_LOG_TYPE_FAULT, "E5RT operation failed with message = %s", buf, 0xCu);
    }
    v52 = 0xFFFFFFFFLL;
  }
  else
  {
    v63 = objc_opt_new();
    -[NSObject appendString:](v63, "appendString:", CFSTR("Tensor shape is { "));
    v52 = 0;
    -[NSObject appendString:](v63, "appendString:", CFSTR("}"));
    objc_msgSend(v2, "addObject:", v63);
    v80 = 0;
    if (e5rt_tensor_desc_get_strides())
    {
      v75 = v63;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v64 = v2;
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v76, v111, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v77;
        do
        {
          v68 = 0;
          do
          {
            if (*(_QWORD *)v77 != v67)
              objc_enumerationMutation(v64);
            v69 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v68);
            PML_LogHandle();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v118 = v69;
              _os_log_fault_impl(&dword_2159BB000, v70, OS_LOG_TYPE_FAULT, "%@", buf, 0xCu);
            }

            ++v68;
          }
          while (v66 != v68);
          v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v76, v111, 16);
        }
        while (v66);
      }

      v71 = e5rt_get_last_error_message();
      PML_LogHandle();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v118 = v71;
        _os_log_fault_impl(&dword_2159BB000, v72, OS_LOG_TYPE_FAULT, "E5RT operation failed with message = %s", buf, 0xCu);
      }
      v52 = 0xFFFFFFFFLL;
      v63 = v75;
    }
    else
    {
      v72 = objc_opt_new();
      -[NSObject appendString:](v72, "appendString:", CFSTR("Tensor strides is { "));
      -[NSObject appendString:](v72, "appendString:", CFSTR("} \n\n"));
      objc_msgSend(v2, "addObject:", v72);
      PML_LogHandle();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v2, "componentsJoinedByString:", CFSTR("; "));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v118 = (uint64_t)v74;
        _os_log_debug_impl(&dword_2159BB000, v73, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }

  }
LABEL_71:

  return v52;
}

void hashingVectorizeTokens(void *a1, _QWORD *a2, int a3, int a4, int a5, void *a6, int a7, int a8, char a9, char a10)
{
  id v17;
  id v18;
  int v19;
  void *v20;
  size_t v21;
  char *v22;
  __CFString *v23;
  int v24;
  _QWORD *v25;
  __CFStringTokenizer *v26;
  CFMutableStringRef MutableWithExternalCharactersNoCopy;
  CFCharacterSetPredefinedSet v28;
  const __CFCharacterSet *Predefined;
  const __CFCharacterSet *InvertedSet;
  __CFString *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  __CFString *v36;
  uint64_t v37;
  const UniChar *CharactersPtr;
  void *v39;
  CFRange CurrentTokenRange;
  unint64_t Length;
  uint64_t v42;
  _BOOL4 v43;
  int v44;
  id v45;
  uint64_t v46;
  CFAllocatorRef v47;
  int v48;
  unint64_t v49;
  char *v50;
  id v51;
  CFLocaleRef v52;
  _QWORD *v53;
  id v54;
  _QWORD v55[7];
  int v56;
  int v57;
  int v58;
  char v59;
  char v60;
  _QWORD v61[3];
  int v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  char *v68;
  uint64_t v69;
  uint64_t v70;
  CFRange v71;
  CFRange v72;

  v70 = *MEMORY[0x24BDAC8D0];
  v17 = a1;
  v18 = a6;
  if (!a4 || a5 == a4)
  {
LABEL_45:

    return;
  }
  v53 = a2;
  v54 = v18;
  v68 = 0;
  v69 = 0;
  v49 = (4 * (a5 - 1)) | 3;
  LODWORD(v51) = a8;
  v48 = a7;
  if (v49 > 0x200)
  {
    v44 = malloc_type_posix_memalign((void **)&v68, 8uLL, 4 * (a5 - 1), 0x270294DDuLL);
    LOBYTE(v69) = 0;
    if (v44)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], CFSTR("malloc failed"), 0);
      v45 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v45);
    }
    v19 = a3;
    v20 = v17;
    v22 = v68;
  }
  else
  {
    v19 = a3;
    v20 = v17;
    MEMORY[0x24BDAC7A8]();
    v22 = (char *)&v46 - ((v21 + 15) & 0x7FFFFFFF0);
    bzero(v22, v21);
  }
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  v62 = 0;
  bzero(v22, 4 * (a5 - 1));
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = __hashingVectorizeTokens_block_invoke;
  v55[3] = &unk_24D3DBB60;
  v50 = v22;
  v55[4] = v61;
  v55[5] = v22;
  v56 = a5;
  v57 = a4;
  v59 = a10;
  v55[6] = v53;
  v58 = v19;
  v60 = a9;
  v17 = v20;
  v23 = v20;
  v52 = (CFLocaleRef)v54;
  v53 = v55;
  objc_opt_class();
  v24 = (int)v51;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = v53;
    v72.length = CFStringGetLength(v23);
    v72.location = 0;
    v26 = CFStringTokenizerCreate(0, v23, v72, 4 * (v52 != 0), v52);
    if (v26)
    {
      bzero(&v68, 0x3E8uLL);
      v47 = (CFAllocatorRef)*MEMORY[0x24BDBD258];
      MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(0, (UniChar *)&v68, 0, 500, v47);
      if (v52)
      {
        if (v48)
          v28 = kCFCharacterSetWhitespace;
        else
          v28 = kCFCharacterSetWhitespaceAndNewline;
        Predefined = CFCharacterSetGetPredefined(v28);
        InvertedSet = CFCharacterSetCreateInvertedSet(0, Predefined);
      }
      else
      {
        InvertedSet = 0;
      }
      while (CFStringTokenizerAdvanceToNextToken(v26))
      {
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v26);
        if (CurrentTokenRange.length <= 500
          && (!InvertedSet || CFStringFindCharacterFromSet(v23, InvertedSet, CurrentTokenRange, 0, 0)))
        {
          CFStringGetCharacters(v23, CurrentTokenRange, (UniChar *)&v68);
          CFStringSetExternalCharactersNoCopy(MutableWithExternalCharactersNoCopy, (UniChar *)&v68, CurrentTokenRange.length, 500);
          if (v24)
          {
            CFStringFold(MutableWithExternalCharactersNoCopy, 0x181uLL, 0);
            CFStringNormalize(MutableWithExternalCharactersNoCopy, kCFStringNormalizationFormKC);
          }
          if (CFStringGetCharactersPtr(MutableWithExternalCharactersNoCopy) == (const UniChar *)&v68)
          {
            Length = CFStringGetLength(MutableWithExternalCharactersNoCopy);
            if (Length >= 0x1F4)
              v42 = 500;
            else
              v42 = Length;
            getHashOfUTF16((uint64_t)&v68, v42, v25);
          }
          else
          {
            CFRelease(MutableWithExternalCharactersNoCopy);
            MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(0, (UniChar *)&v68, 0, 500, v47);
          }
        }
      }
      if (InvertedSet)
        CFRelease(InvertedSet);
      CFRelease(MutableWithExternalCharactersNoCopy);
      CFRelease(v26);
    }

    v39 = v50;
LABEL_42:
    v43 = v49 > 0x200;

    if (v43)
      free(v39);
    _Block_object_dispose(v61, 8);
    v18 = v54;
    goto LABEL_45;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = v23;
    v32 = v53;
    bzero(&v68, 0x3E8uLL);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v33 = -[__CFString countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    v51 = v17;
    if (v33)
    {
      v34 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v64 != v34)
            objc_enumerationMutation(v31);
          v36 = *(__CFString **)(*((_QWORD *)&v63 + 1) + 8 * i);
          v37 = -[__CFString length](v36, "length");
          if ((int)v37 <= 500)
          {
            CharactersPtr = CFStringGetCharactersPtr(v36);
            if (!CharactersPtr)
            {
              v71.length = (int)v37;
              CharactersPtr = (const UniChar *)&v68;
              v71.location = 0;
              CFStringGetCharacters(v36, v71, (UniChar *)&v68);
            }
            getHashOfUTF16((uint64_t)CharactersPtr, v37, v32);
          }
        }
        v33 = -[__CFString countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      }
      while (v33);
    }

    v39 = v50;
    v17 = v51;

    goto LABEL_42;
  }
  __break(1u);
}

void sub_2159E8B44(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 + 144), 8);
  _Unwind_Resume(a1);
}

void hashingVectorizeCharacters(void *a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, int a6, char a7, char a8)
{
  __CFString *v15;
  __CFString *v16;
  unsigned int v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  const UniChar *CharactersPtr;
  id v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  id v34;
  __CFString *v35;
  _QWORD v36[5];
  int v37;
  char v38;
  char v39;

  v15 = a1;
  if (a4)
  {
    if (a5 != a4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (a6)
        {
          v16 = (__CFString *)-[__CFString mutableCopy](v15, "mutableCopy");
          CFStringFold(v16, 0x181uLL, 0);
          CFStringNormalize(v16, kCFStringNormalizationFormKC);

          v15 = v16;
        }
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __hashingVectorizeCharacters_block_invoke;
        v36[3] = &__block_descriptor_46_e8_v12__0I8l;
        v38 = a8;
        v36[4] = a2;
        v37 = a3;
        v39 = a7;
        v15 = v15;
        v17 = -[__CFString length](v15, "length");
        if (v17)
        {
          v18 = v15;
          v19 = -[__CFString length](v18, "length");
          v20 = 2 * v19;
          CharactersPtr = CFStringGetCharactersPtr(v18);
          v35 = v15;
          if (CharactersPtr)
          {
            v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", CharactersPtr, v20, 0);
          }
          else
          {
            v22 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v20));
            -[__CFString getCharacters:range:](v18, "getCharacters:range:", objc_msgSend(v22, "mutableBytes"), 0, v19);
          }

          v34 = objc_retainAutorelease(v22);
          v23 = objc_msgSend(v34, "bytes");
          v24 = 0;
          do
          {
            v25 = 0;
            v26 = v24;
            do
            {
              if ((*(_WORD *)(v23 + 2 * v26) & 0xFC00) == 0xD800)
                v27 = 2;
              else
                v27 = 1;
              v28 = v27 + v26;
              if (v28 >= v17)
                v26 = v17;
              else
                v26 = v28;
              ++v25;
            }
            while (v25 < a4 && v28 < v17);
            if (v25 != a4)
              break;
            if (a5 > a4)
            {
              v29 = a5 - a4;
              do
              {
                getHashOfUTF16(v23 + 2 * v24, v26 - v24, v36);
                if (v26 >= v17)
                  break;
                v30 = (*(_WORD *)(v23 + 2 * v26) & 0xFC00) == 0xD800 ? 2 : 1;
                v31 = v30 + v26;
                v26 = v31 >= v17 ? v17 : v31;
                --v29;
              }
              while (v29);
            }
            v32 = (*(_WORD *)(v23 + 2 * v24) & 0xFC00) == 0xD800 ? 2 : 1;
            v33 = v32 + v24;
            v24 = v33 >= v17 ? v17 : v33;
          }
          while (v33 < v17);

          v15 = v35;
        }

      }
    }
  }

}

char *__hashingVectorizeCharacters_block_invoke(uint64_t a1, char *a2)
{
  unsigned int *v3;
  unsigned int v4;

  v3 = *(unsigned int **)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 44))
    return appendHashToVector(a2, v3, v4);
  else
    return applyHashToVector(a2, v3, v4, *(_BYTE *)(a1 + 45));
}

void getHashOfUTF16(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void (**v4)(id, uint64_t);

  v4 = a3;
  v3 = _PASMurmur3_x86_32();
  v4[2](v4, v3);

}

char *applyHashToVector(char *result, unsigned int *a2, unsigned int a3, unsigned __int8 a4)
{
  int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;

  if ((((result & 1) == 0) & a4) != 0)
    v5 = -1;
  else
    v5 = 1;
  v6 = (result >> 1) % a3;
  v7 = *a2;
  if ((_DWORD)v7)
  {
    v8 = 0;
    v9 = (int *)*((_QWORD *)a2 + 1);
    while (1)
    {
      v10 = *v9;
      v9 += 2;
      if (v10 == v6)
        break;
      if (v7 == ++v8)
        goto LABEL_8;
    }
    *(_DWORD *)(*((_QWORD *)a2 + 1) + 8 * v8 + 4) += v5;
  }
  else
  {
LABEL_8:
    v11 = a2[1];
    if (v7 >= v11)
    {
      v12 = 2 * v11;
      if (2 * v11 <= 8)
        v12 = 8;
      a2[1] = v12;
      result = (char *)reallocf(*((void **)a2 + 1), 8 * v12);
      *((_QWORD *)a2 + 1) = result;
      LODWORD(v7) = *a2;
    }
    else
    {
      result = (char *)*((_QWORD *)a2 + 1);
    }
    *a2 = v7 + 1;
    v13 = (unsigned int *)&result[8 * v7];
    *v13 = v6;
    v13[1] = v5;
  }
  return result;
}

char *appendHashToVector(unsigned int a1, unsigned int *a2, unsigned int a3)
{
  unsigned int v6;
  unsigned int v7;
  char *result;
  unsigned int v9;
  int *v10;

  v6 = *a2;
  v7 = a2[1];
  if (*a2 >= v7)
  {
    v9 = 2 * v7;
    if (2 * v7 <= 8)
      v9 = 8;
    a2[1] = v9;
    result = (char *)reallocf(*((void **)a2 + 1), 8 * v9);
    *((_QWORD *)a2 + 1) = result;
    v6 = *a2;
  }
  else
  {
    result = (char *)*((_QWORD *)a2 + 1);
  }
  *a2 = v6 + 1;
  v10 = (int *)&result[8 * v6];
  *v10 = (a1 >> 1) % a3;
  v10[1] = 1;
  return result;
}

uint64_t __hashingVectorizeTokens_block_invoke(uint64_t result, int a2)
{
  _DWORD *v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int *v11;
  unsigned int v12;
  _QWORD v13[2];
  char *(*v14)(uint64_t, char *);
  void *v15;
  uint64_t v16;
  int v17;
  char v18;
  char v19;

  v2 = *(_DWORD **)(result + 40);
  v3 = (*(_DWORD *)(result + 56) - 2);
  if (*(_DWORD *)(result + 56) != 2)
  {
    do
    {
      LODWORD(v4) = a2 ^ __ROR4__(v2[(v3 - 1)], 9);
      HIDWORD(v4) = v4;
      v2[v3--] = (v4 >> 5) + a2;
    }
    while ((_DWORD)v3);
  }
  *v2 = a2;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  v6 = *(_DWORD *)(result + 56);
  v5 = *(_DWORD *)(result + 60);
  v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v14 = __hashingVectorizeTokens_block_invoke_2;
  v15 = &__block_descriptor_46_e8_v12__0I8l;
  v18 = *(_BYTE *)(result + 68);
  v16 = *(_QWORD *)(result + 48);
  v17 = *(_DWORD *)(result + 64);
  v19 = *(_BYTE *)(result + 69);
  v8 = v5 - 1;
  v9 = v6 - 1;
  if (v9 >= v7)
    v9 = v7;
  if (v8 < v9)
  {
    v10 = v9 - v5 + 1;
    v11 = &v2[v8];
    do
    {
      v12 = *v11++;
      result = (uint64_t)v14((uint64_t)v13, (char *)v12);
      --v10;
    }
    while (v10);
  }
  return result;
}

char *__hashingVectorizeTokens_block_invoke_2(uint64_t a1, char *a2)
{
  unsigned int *v3;
  unsigned int v4;

  v3 = *(unsigned int **)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 44))
    return appendHashToVector(a2, v3, v4);
  else
    return applyHashToVector(a2, v3, v4, *(_BYTE *)(a1 + 45));
}

uint64_t compareHashAndCounts(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

id PML_LogHandle()
{
  if (PML_LogHandle__pasOnceToken0 != -1)
    dispatch_once(&PML_LogHandle__pasOnceToken0, &__block_literal_global_3912);
  return (id)PML_LogHandle__pasExprOnceResult;
}

void sub_2159EC51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AWDProactiveModelFittingQuantizedDenseVectorReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  int v17;
  unint64_t v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      v17 = v10 & 7;
      if (v16 || v17 == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v19 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v19 == 2)
      {
        *(_BYTE *)(a1 + 40) |= 2u;
        v31 = *v3;
        v32 = *(_QWORD *)(a2 + v31);
        if (v32 <= 0xFFFFFFFFFFFFFFFBLL && v32 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v30 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v32);
          *(_QWORD *)(a2 + v31) = v32 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v30 = 0;
        }
        v40 = 36;
LABEL_56:
        *(_DWORD *)(a1 + v40) = v30;
        goto LABEL_57;
      }
      if ((_DWORD)v19 == 1)
      {
        if (v17 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v21 = 0;
            v22 = 0;
            v23 = 0;
            while (1)
            {
              v24 = *v3;
              v25 = *(_QWORD *)(a2 + v24);
              v26 = v25 + 1;
              if (v25 == -1 || v26 > *(_QWORD *)(a2 + *v4))
                break;
              v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
              *(_QWORD *)(a2 + v24) = v26;
              v23 |= (unint64_t)(v27 & 0x7F) << v21;
              if (v27 < 0)
              {
                v21 += 7;
                v15 = v22++ >= 9;
                if (!v15)
                  continue;
              }
              goto LABEL_33;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
            PBRepeatedUInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
          while (1)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            v38 = v37 + 1;
            if (v37 == -1 || v38 > *(_QWORD *)(a2 + *v4))
              break;
            v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v38;
            v35 |= (unint64_t)(v39 & 0x7F) << v33;
            if (v39 < 0)
            {
              v33 += 7;
              v15 = v34++ >= 9;
              if (!v15)
                continue;
            }
            goto LABEL_51;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_51:
          PBRepeatedUInt32Add();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
LABEL_57:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    *(_BYTE *)(a1 + 40) |= 1u;
    v28 = *v3;
    v29 = *(_QWORD *)(a2 + v28);
    if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(_QWORD *)(a2 + *v4))
    {
      v30 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v29);
      *(_QWORD *)(a2 + v28) = v29 + 4;
    }
    else
    {
      *(_BYTE *)(a2 + *v5) = 1;
      v30 = 0;
    }
    v40 = 32;
    goto LABEL_56;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_2159F06C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2159F0E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t AWDProactiveModelFittingMinibatchStatsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  AWDProactiveModelFittingLabelSupportPair *v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v22 = objc_alloc_init(AWDProactiveModelFittingLabelSupportPair);
        objc_msgSend((id)a1, "addPerLabelSupport:", v22);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingLabelSupportPairReadFrom((uint64_t)v22, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v18 == 2)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          v28 = v27 + 1;
          if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v28;
          v25 |= (unint64_t)(v29 & 0x7F) << v23;
          if ((v29 & 0x80) == 0)
            goto LABEL_37;
          v23 += 7;
          v15 = v24++ >= 9;
          if (v15)
          {
            v25 = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_39:
        *(_QWORD *)(a1 + 8) = v25;
      }
      else if ((_DWORD)v18 == 1)
      {
        *(_BYTE *)(a1 + 28) |= 2u;
        v19 = *v3;
        v20 = *(_QWORD *)(a2 + v19);
        if (v20 <= 0xFFFFFFFFFFFFFFFBLL && v20 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v21 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v20);
          *(_QWORD *)(a2 + v19) = v20 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v21 = 0;
        }
        *(_DWORD *)(a1 + 24) = v21;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL AWDProactiveModelFittingParsecFeedbackEnvelopeReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  AWDProactiveModelFittingEvaluation *v17;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(AWDProactiveModelFittingEvaluation);
        objc_storeStrong(a1 + 1, v17);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingEvaluationReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
          goto LABEL_35;
        }
        goto LABEL_39;
      case 2u:
        v17 = objc_alloc_init(AWDProactiveModelFittingLogRegWeights);
        objc_storeStrong(a1 + 5, v17);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingLogRegWeightsReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 3u:
        v17 = objc_alloc_init(AWDProactiveModelFittingLogRegGradient);
        objc_storeStrong(a1 + 4, v17);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingLogRegGradientReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 4u:
        v17 = objc_alloc_init(AWDProactiveModelFittingLinRegFeatureMatrix);
        objc_storeStrong(a1 + 2, v17);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingLinRegFeatureMatrixReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_39;
        }
        goto LABEL_35;
      case 5u:
        v17 = objc_alloc_init(AWDProactiveModelFittingLinRegObjectiveFeatures);
        objc_storeStrong(a1 + 3, v17);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingLinRegObjectiveFeaturesReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_35:
          PBReaderRecallMark();

LABEL_36:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_39:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_36;
    }
  }
}

void sub_2159F4590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2159F4CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2159F4E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2159F53C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5506(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5507(uint64_t a1)
{

}

void sub_2159F6D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void collectPerLabelCounts(void *a1, unint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  float v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = (float)a2;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "label"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "unsignedIntegerValue");

        objc_msgSend(v12, "support");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v15 + vcvtas_u32_f32(v16 * v10));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "label"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v18);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

}

uint64_t AWDProactiveModelFittingPrecisionAtKPairReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        *(_BYTE *)(a1 + 20) |= 2u;
        v25 = *v3;
        v26 = *(_QWORD *)(a2 + v25);
        if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v27 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v26);
          *(_QWORD *)(a2 + v25) = v26 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v27 = 0;
        }
        *(_DWORD *)(a1 + 16) = v27;
      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_33;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_35:
        *(_QWORD *)(a1 + 8) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t AWDProactiveModelFittingLogRegGradientReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  AWDProactiveModelFittingModelInfo *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 80) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_60;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_62;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_60:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_62:
        v38 = 16;
        goto LABEL_67;
      case 2u:
        v26 = objc_alloc_init(AWDProactiveModelFittingModelInfo);
        objc_storeStrong((id *)(a1 + 56), v26);
        if (!PBReaderPlaceMark() || !AWDProactiveModelFittingModelInfoReadFrom((uint64_t)v26, a2))
          goto LABEL_75;
        goto LABEL_58;
      case 3u:
        v26 = objc_alloc_init(AWDProactiveModelFittingSparseFloatVector);
        objc_storeStrong((id *)(a1 + 64), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingSparseFloatVectorReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_75;
        }
        goto LABEL_58;
      case 4u:
        v26 = objc_alloc_init(AWDProactiveModelFittingMinibatchStats);
        objc_storeStrong((id *)(a1 + 48), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingMinibatchStatsReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_75;
        }
        goto LABEL_58;
      case 5u:
        v26 = objc_alloc_init(AWDProactiveModelFittingEvalMetrics);
        objc_storeStrong((id *)(a1 + 32), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingEvalMetricsReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_75;
        }
        goto LABEL_58;
      case 6u:
        v27 = 0;
        v28 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 80) |= 1u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v31;
            v20 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v15 = v28++ >= 9;
              if (v15)
              {
                v20 = 0;
                goto LABEL_66;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_66:
        v38 = 8;
LABEL_67:
        *(_QWORD *)(a1 + v38) = v20;
        goto LABEL_73;
      case 7u:
        v26 = objc_alloc_init(AWDProactiveModelFittingQuantizedSparseVector);
        objc_storeStrong((id *)(a1 + 72), v26);
        if (!PBReaderPlaceMark()
          || (AWDProactiveModelFittingQuantizedSparseVectorReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_75;
        }
        goto LABEL_58;
      case 8u:
        *(_BYTE *)(a1 + 80) |= 8u;
        v33 = *v3;
        v34 = *(_QWORD *)(a2 + v33);
        if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v35 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v34);
          *(_QWORD *)(a2 + v33) = v34 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v35 = 0;
        }
        v39 = 44;
        goto LABEL_72;
      case 9u:
        *(_BYTE *)(a1 + 80) |= 4u;
        v36 = *v3;
        v37 = *(_QWORD *)(a2 + v36);
        if (v37 <= 0xFFFFFFFFFFFFFFFBLL && v37 + 4 <= *(_QWORD *)(a2 + *v4))
        {
          v35 = *(_DWORD *)(*(_QWORD *)(a2 + *v7) + v37);
          *(_QWORD *)(a2 + v36) = v37 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v35 = 0;
        }
        v39 = 40;
LABEL_72:
        *(_DWORD *)(a1 + v39) = v35;
        goto LABEL_73;
      case 0xAu:
        v26 = objc_alloc_init(AWDProactiveModelFittingQuantizedDenseVector);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (PBReaderPlaceMark()
          && (AWDProactiveModelFittingQuantizedDenseVectorReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_58:
          PBReaderRecallMark();

LABEL_73:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_75:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_73;
    }
  }
}

uint64_t AWDPostMetric()
{
  return MEMORY[0x24BEC2B08]();
}

uint64_t CFBurstTrieAdd()
{
  return MEMORY[0x24BDBBAF8]();
}

uint64_t CFBurstTrieCreate()
{
  return MEMORY[0x24BDBBB18]();
}

uint64_t CFBurstTrieGetCount()
{
  return MEMORY[0x24BDBBB58]();
}

uint64_t CFBurstTrieRelease()
{
  return MEMORY[0x24BDBBB60]();
}

uint64_t CFBurstTrieSerialize()
{
  return MEMORY[0x24BDBBB68]();
}

CFCharacterSetRef CFCharacterSetCreateInvertedSet(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBBF8](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC20](theSetIdentifier);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x24BDBBC38](theSet, *(_QWORD *)&theChar);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC548](alloc, chars, numChars, capacity, externalCharactersAllocator);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC588](alloc, chars, numChars, contentsDeallocator);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E0](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
  MEMORY[0x24BDBC5F0](theString, theFlags, theLocale);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x24BDBC628](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x24BDBC6D0](theString, theForm);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
  MEMORY[0x24BDBC6E8](theString, replacement);
}

void CFStringSetExternalCharactersNoCopy(CFMutableStringRef theString, UniChar *chars, CFIndex length, CFIndex capacity)
{
  MEMORY[0x24BDBC6F0](theString, chars, length, capacity);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x24BDBC6F8](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x24BDBC710](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDBC718](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x24BE29F80]();
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x24BE7AF70]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x24BE7AF78]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x24BE7AFA0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x24BE7B090]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x24BE7B098]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x24BE7B0A0]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x24BE7B0A8]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x24BE7B0B0]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x24BE7B0B8]();
}

uint64_t PBRepeatedFloatSet()
{
  return MEMORY[0x24BE7B0C0]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x24BE7B138]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x24BE7B148]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x24BE7B160]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x24BE7B170]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x24BE7B178]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x24BE7B190]();
}

uint64_t PBRepeatedUInt32Set()
{
  return MEMORY[0x24BE7B198]();
}

uint64_t PBRepeatedUInt64Add()
{
  return MEMORY[0x24BE7B1A8]();
}

uint64_t PBRepeatedUInt64Clear()
{
  return MEMORY[0x24BE7B1B0]();
}

uint64_t PBRepeatedUInt64Copy()
{
  return MEMORY[0x24BE7B1B8]();
}

uint64_t PBRepeatedUInt64Hash()
{
  return MEMORY[0x24BE7B1C0]();
}

uint64_t PBRepeatedUInt64IsEqual()
{
  return MEMORY[0x24BE7B1C8]();
}

uint64_t PBRepeatedUInt64NSArray()
{
  return MEMORY[0x24BE7B1D0]();
}

uint64_t PBRepeatedUInt64Set()
{
  return MEMORY[0x24BE7B1D8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _PASIterateLongChars()
{
  return MEMORY[0x24BE7A680]();
}

uint64_t _PASMurmur3_x86_32()
{
  return MEMORY[0x24BE7A690]();
}

uint64_t _PASRngSeed64()
{
  return MEMORY[0x24BE7A6A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void catlas_saxpby(const int __N, const float __alpha, const float *__X, const int __incX, const float __beta, float *__Y, const int __incY)
{
  MEMORY[0x24BDB2A90](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY, __alpha, __beta);
}

int cblas_isamax(const int __N, const float *__X, const int __incX)
{
  return MEMORY[0x24BDB2B80](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX);
}

float cblas_sasum(const int __N, const float *__X, const int __incX)
{
  float result;

  MEMORY[0x24BDB2B90](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX);
  return result;
}

void cblas_saxpy(const int __N, const float __alpha, const float *__X, const int __incX, float *__Y, const int __incY)
{
  MEMORY[0x24BDB2B98](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY, __alpha);
}

float cblas_sdot(const int __N, const float *__X, const int __incX, const float *__Y, const int __incY)
{
  float result;

  MEMORY[0x24BDB2BB8](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY);
  return result;
}

float cblas_snrm2(const int __N, const float *__X, const int __incX)
{
  float result;

  MEMORY[0x24BDB2C08](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX);
  return result;
}

void cblas_sscal(const int __N, const float __alpha, float *__X, const int __incX)
{
  MEMORY[0x24BDB2C18](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __alpha);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t e5rt_buffer_object_get_data_ptr()
{
  return MEMORY[0x24BE2F700]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x24BE2F720]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x24BE2F7A0]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x24BE2F7B0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x24BE2F7C0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x24BE2F7D0]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x24BE2F830]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x24BE2F840]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x24BE2F850]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x24BE2F870]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x24BE2F8A0]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x24BE2F8A8]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x24BE2F8E8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x24BE2F908]();
}

uint64_t e5rt_tensor_desc_alloc_buffer_object()
{
  return MEMORY[0x24BE2FA20]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x24BE2FA40]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_size()
{
  return MEMORY[0x24BE2FA50]();
}

uint64_t e5rt_tensor_desc_dtype_get_element_size()
{
  return MEMORY[0x24BE2FA58]();
}

uint64_t e5rt_tensor_desc_dtype_get_num_components()
{
  return MEMORY[0x24BE2FA60]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x24BE2FA68]();
}

uint64_t e5rt_tensor_desc_get_rank()
{
  return MEMORY[0x24BE2FA78]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x24BE2FA88]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x24BE2FA98]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x24BE2FAA8]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x24BE2FAB8]();
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x24BE2FAF0]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x24BE2FB88]();
}

uint64_t espresso_network_declare_input()
{
  return MEMORY[0x24BE2FC10]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x24BE2FC18]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x24BE2FC70]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x24BE2FC80]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x24BE2FC90]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x24BE2FCA0]();
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

sparse_status sparse_commit(void *A)
{
  return MEMORY[0x24BDB3030](A);
}

sparse_status sparse_extract_sparse_row_float(sparse_matrix_float A, sparse_index row, sparse_index column_start, sparse_index *column_end, sparse_dimension nz, float *val, sparse_index *jndx)
{
  return MEMORY[0x24BDB3038](A, row, column_start, column_end, nz, val, jndx);
}

uint64_t sparse_get_matrix_nonzero_count(void *A)
{
  return MEMORY[0x24BDB3040](A);
}

uint64_t sparse_get_matrix_nonzero_count_for_row(void *A, sparse_index i)
{
  return MEMORY[0x24BDB3048](A, i);
}

sparse_dimension sparse_get_matrix_number_of_columns(void *A)
{
  return MEMORY[0x24BDB3050](A);
}

sparse_dimension sparse_get_matrix_number_of_rows(void *A)
{
  return MEMORY[0x24BDB3058](A);
}

float sparse_inner_product_dense_float(sparse_dimension nz, const float *x, const sparse_index *indx, const float *y, sparse_stride incy)
{
  float result;

  MEMORY[0x24BDB3060](nz, x, indx, y, incy);
  return result;
}

sparse_status sparse_insert_entry_float(sparse_matrix_float A, float val, sparse_index i, sparse_index j)
{
  return MEMORY[0x24BDB3068](A, i, j, val);
}

sparse_status sparse_insert_row_float(sparse_matrix_float A, sparse_index i, sparse_dimension nz, const float *val, const sparse_index *jndx)
{
  return MEMORY[0x24BDB3070](A, i, nz, val, jndx);
}

sparse_matrix_float sparse_matrix_create_float(sparse_dimension M, sparse_dimension N)
{
  return (sparse_matrix_float)MEMORY[0x24BDB3078](M, N);
}

sparse_status sparse_matrix_destroy(void *A)
{
  return MEMORY[0x24BDB3080](A);
}

sparse_status sparse_matrix_vector_product_dense_float(CBLAS_TRANSPOSE transa, float alpha, sparse_matrix_float A, const float *x, sparse_stride incx, float *y, sparse_stride incy)
{
  return MEMORY[0x24BDB3088](*(_QWORD *)&transa, A, x, incx, y, incy, alpha);
}

void sparse_vector_add_with_scale_dense_float(sparse_dimension nz, float alpha, const float *x, const sparse_index *indx, float *y, sparse_stride incy)
{
  MEMORY[0x24BDB3090](nz, x, indx, y, incy, alpha);
}

