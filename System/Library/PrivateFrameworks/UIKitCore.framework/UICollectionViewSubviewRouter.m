@implementation UICollectionViewSubviewRouter

void __72___UICollectionViewSubviewRouter_addControlledSubview_zIndex_orderMode___block_invoke(uint64_t a1, _QWORD *obj, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (obj)
  {
    v9 = obj[3];
    if (v9 == -10000)
      return;
  }
  else
  {
    v9 = 0;
  }
  v10 = *(_QWORD *)(a1 + 56);
  if (v10 < v9)
  {
LABEL_4:
    *a5 = 1;
    return;
  }
  if (v10 == v9)
  {
    if (obj)
    {
      v11 = obj[2];
      v12 = *(_QWORD *)(a1 + 64);
      if (v11 == v12)
        goto LABEL_8;
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 64);
      if (!v12)
      {
LABEL_8:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
        if (*(_BYTE *)(a1 + 72))
        {
          if (obj)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = obj[1] + a4;
            ++obj[1];
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
          }
        }
        else
        {
          if (obj)
            v13 = obj[1];
          else
            v13 = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4 + v13 - 1;
        }
        goto LABEL_4;
      }
      v11 = 0;
    }
    if (v12 < v11)
      goto LABEL_4;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3 + 1;
  if (obj)
    v14 = obj[1];
  else
    v14 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v14 + a4;
}

_QWORD *__101___UICollectionViewSubviewRouter_shouldAddSubview_atPosition_relativeTo_creatingBookmarkIfNecessary___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4, BOOL *a5)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;

  v6 = result;
  v7 = *(_QWORD *)(result[7] + 8);
  if ((*(_QWORD *)(v7 + 24) & 0x8000000000000000) != 0 && result[4] == a2)
    *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_QWORD *)(result[8] + 8);
  if ((*(_QWORD *)(v8 + 24) & 0x8000000000000000) != 0)
  {
    v9 = result[10];
    switch(v9)
    {
      case 0xFFFFFFFFFFFFFFFDLL:
        if (result[6] != a2)
          goto LABEL_26;
        *(_QWORD *)(v8 + 24) = a3;
        break;
      case 0xFFFFFFFFFFFFFFFELL:
        if (result[6] != a2)
          goto LABEL_26;
        *(_QWORD *)(v8 + 24) = a3 + 1;
        if (a2)
          v10 = *(_QWORD *)(a2 + 8);
        else
          v10 = 0;
        a4 += v10;
        break;
      case 0xFFFFFFFFFFFFFFFFLL:
        result = (_QWORD *)objc_msgSend(*(id *)(result[5] + 8), "count");
        *(_QWORD *)(*(_QWORD *)(v6[8] + 8) + 24) = result;
        a4 = v6[11];
        break;
      default:
        if (a2)
        {
          if (v9 < a4)
            goto LABEL_26;
          v11 = *(_QWORD *)(a2 + 8);
          v12 = v11 + a4;
          v13 = v11 + a4 - 1;
          if (v13 < v9)
            goto LABEL_26;
        }
        else
        {
          if (v9 < a4)
            goto LABEL_26;
          v13 = a4 - 1;
          if (a4 - 1 < v9)
            goto LABEL_26;
          v11 = 0;
          v12 = a4;
        }
        v14 = result[4];
        if (v14)
          v14 = *(_QWORD *)(v14 + 8);
        if (v11 == v14)
          v9 = *(_QWORD *)(*(_QWORD *)(result[7] + 8) + 24) >> 63;
        else
          LODWORD(v9) = v9 - a4 <= v13 - v9;
        *(_QWORD *)(v8 + 24) = (v9 ^ 1) + a3;
        if (!(_DWORD)v9)
          a4 = v12;
        break;
    }
    *(_QWORD *)(*(_QWORD *)(v6[9] + 8) + 24) = a4;
  }
LABEL_26:
  v15 = (*(_QWORD *)(*(_QWORD *)(v6[7] + 8) + 24) & 0x8000000000000000) == 0
     && *(_QWORD *)(*(_QWORD *)(v6[8] + 8) + 24) >= 0;
  *a5 = v15;
  return result;
}

_QWORD *__82___UICollectionViewSubviewRouter_shouldExchangeSubviewAtIndex_withSubviewAtIndex___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  v5 = *(_QWORD *)(result[6] + 8);
  v8 = *(_QWORD *)(v5 + 24);
  v6 = (_QWORD *)(v5 + 24);
  v7 = v8;
  if (v8 < 0 && result[4] == a2
    || (v9 = *(_QWORD *)(result[7] + 8), v10 = *(_QWORD *)(v9 + 24), v6 = (_QWORD *)(v9 + 24), v10 < 0)
    && result[5] == a2)
  {
    *v6 = a3;
    v7 = *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24);
  }
  v11 = (v7 & 0x8000000000000000) == 0 && *(_QWORD *)(*(_QWORD *)(result[7] + 8) + 24) >= 0;
  *a5 = v11;
  return result;
}

@end
