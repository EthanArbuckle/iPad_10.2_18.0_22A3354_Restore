@implementation UITintColorVisitor

uint64_t __34___UITintColorVisitor__visitView___block_invoke(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v1 = result;
  if ((*(_BYTE *)(*(_QWORD *)(result + 32) + 24) & 1) != 0)
  {
    result = objc_msgSend(*(id *)(result + 40), "_interactionTintColor");
    if (result)
    {
      if (*(_BYTE *)(v1 + 80))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
      v2 = *(_QWORD **)(v1 + 48);
      if (!v2)
        goto LABEL_9;
      if (qword_1ECD7C6D8 != -1)
        dispatch_once(&qword_1ECD7C6D8, &__block_literal_global_675);
      result = objc_opt_isKindOfClass();
      if ((result & 1) == 0)
      {
        v3 = 0x100000000000;
        if ((v2[14] & 0x100000000000) == 0)
        {
          result = objc_msgSend(v2, "_definesTintColor");
          if (!(_DWORD)result)
            v3 = 0;
        }
      }
      else
      {
LABEL_9:
        v3 = 0;
      }
      v4 = *(_QWORD *)(v1 + 40);
      if (v4)
      {
        v5 = (uint64_t *)(v4 + 104);
        v6 = v5[1] & 0xFFFFEFFFFFFFFFFFLL | v3;
        v7 = *v5;
        *((_DWORD *)v5 + 4) = *((_DWORD *)v5 + 4);
        *v5 = v7;
        v5[1] = v6;
      }
    }
  }
  if ((*(_BYTE *)(*(_QWORD *)(v1 + 32) + 24) & 2) != 0)
  {
    v8 = *(_QWORD *)(v1 + 40);
    if (v8 && ((*(_QWORD *)(v8 + 112) & 0x1800000000) != 0 || *(_WORD *)(v8 + 216)))
    {
      if (*(_BYTE *)(v1 + 80))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
      v9 = *(_QWORD *)(v1 + 48);
      if (!v9)
        goto LABEL_22;
      if (qword_1ECD7C6D8 != -1)
        dispatch_once(&qword_1ECD7C6D8, &__block_literal_global_675);
      result = objc_opt_isKindOfClass();
      if ((result & 1) == 0)
      {
        v21 = *(_QWORD *)(v9 + 112);
        if ((v21 & 0x200000000000) != 0)
        {
          v10 = 0x200000000000;
        }
        else
        {
          v22 = (v21 >> 35) & 3;
          if (!v22)
            v22 = 2 * (*(_WORD *)(v9 + 216) != 0);
          v10 = (unint64_t)(v22 != 0) << 45;
        }
      }
      else
      {
LABEL_22:
        v10 = 0;
      }
      v11 = *(_QWORD *)(v1 + 40);
      if (v11)
      {
        v12 = (uint64_t *)(v11 + 104);
        v13 = v12[1] & 0xFFFFDFFFFFFFFFFFLL | v10;
        v14 = *v12;
        *((_DWORD *)v12 + 4) = *((_DWORD *)v12 + 4);
        *v12 = v14;
        v12[1] = v13;
      }
    }
  }
  v15 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 24);
  if ((v15 & 4) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24) = 1;
    v15 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 24);
  }
  if ((v15 & 8) != 0)
  {
    if (objc_msgSend(*(id *)(v1 + 40), "accessibilityIgnoresInvertColors"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 24) = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 24) = 1;
    }
    result = *(_QWORD *)(v1 + 48);
    if (result)
    {
      v16 = 0x400000000000;
      if ((*(_QWORD *)(result + 112) & 0x400000000000) == 0)
      {
        result = objc_msgSend((id)result, "accessibilityIgnoresInvertColors");
        if (!(_DWORD)result)
          v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
    v17 = *(_QWORD *)(v1 + 40);
    if (v17)
    {
      v18 = (uint64_t *)(v17 + 104);
      v19 = v18[1] & 0xFFFFBFFFFFFFFFFFLL | v16;
      v20 = *v18;
      *((_DWORD *)v18 + 4) = *((_DWORD *)v18 + 4);
      *v18 = v20;
      v18[1] = v19;
    }
  }
  return result;
}

@end
