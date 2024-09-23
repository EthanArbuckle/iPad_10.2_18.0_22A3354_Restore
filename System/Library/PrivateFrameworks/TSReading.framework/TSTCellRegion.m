@implementation TSTCellRegion

- (TSTCellRegion)init
{
  TSTCellRegion *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTCellRegion;
  result = -[TSTCellRegion init](&v3, sel_init);
  if (result)
  {
    result->mCellRangesCount = 0;
    result->mCellRanges = 0;
    *(_OWORD *)&result->mBoundingCellRange.origin.row = xmmword_217C2BDD0;
  }
  return result;
}

- (void)dealloc
{
  $CA3468F20078D5D2DB35E78E73CA60DA *mCellRanges;
  objc_super v4;

  mCellRanges = self->mCellRanges;
  if (mCellRanges)
  {
    free(mCellRanges);
    self->mCellRanges = 0;
  }
  self->mCellRangesCount = 0;
  *(_OWORD *)&self->mBoundingCellRange.origin.row = xmmword_217C2BDD0;

  self->mIntersectingColumnsIndexSet = 0;
  self->mIntersectingRowsIndexSet = 0;
  v4.receiver = self;
  v4.super_class = (Class)TSTCellRegion;
  -[TSTCellRegion dealloc](&v4, sel_dealloc);
}

+ (id)regionFromRange:(id)a3
{
  __int16 v4;
  TSTCellRegion *v5;
  TSTCellRegion *v6;

  v4 = ~a3.var0.var0;
  v5 = objc_alloc_init(TSTCellRegion);
  v6 = v5;
  if (v4
    && (*(_QWORD *)&a3 & 0xFF0000) != 0xFF0000
    && HIWORD(*(unint64_t *)&a3)
    && (*(_QWORD *)&a3 & 0xFFFF00000000) != 0)
  {
    -[TSTCellRegion p_insertRangeIntoRegion:](v5, "p_insertRangeIntoRegion:", a3);
  }
  -[TSTCellRegion p_calculateAncillaryInformation](v6, "p_calculateAncillaryInformation");
  return v6;
}

+ (id)regionFromCellMap:(id)a3
{
  unint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  TSTCellRegion *v43;

  v38 = 0;
  v39 = &v38;
  v40 = 0x3052000000;
  v41 = __Block_byref_object_copy__27;
  v42 = __Block_byref_object_dispose__27;
  v43 = 0;
  v3 = 0;
  v4 = 0;
  v25 = 0;
  v26 = 0;
  v5 = 0;
  v22 = 0;
  v23 = 0;
  v21 = 0;
  v6 = 0;
  v43 = objc_alloc_init(TSTCellRegion);
  v7 = 255;
  v8 = 0xFFFF;
  v24 = 0xFFFF;
  v9 = 255;
  while (v3 < objc_msgSend(a3, "count", v21) + 1)
  {
    if (v3 >= objc_msgSend(a3, "count"))
    {
      v12 = 0;
      v11 = 255;
      LOWORD(v10) = -1;
    }
    else
    {
      v10 = objc_msgSend(a3, "cellIDAtIndex:", v3);
      v11 = HIWORD(v10);
      v12 = v10 & 0xFF000000;
    }
    if (((unsigned __int16)v12 | (unsigned __int16)v10) != -1
      && ((v12 | (v11 << 16)) & 0xFF0000) != 0xFF0000
      && (v8 == 0xFFFF || (_DWORD)v7 == 255 || !(_WORD)v5 || !(_WORD)v26))
    {
      goto LABEL_42;
    }
    if ((unsigned __int16)v10 == v8)
    {
      if (v11 == (_DWORD)v7 + (unsigned __int16)v5)
      {
        v13 = (v5 + 1);
        v14 = v7;
      }
      else
      {
        if (v4)
          objc_msgSend(v4, "p_insertRangeIntoRegion:", ((unint64_t)(unsigned __int16)v5 << 32) | (v26 << 48) | (v25 << 24) | ((unint64_t)v7 << 16) | v8);
        else
          v4 = +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", ((unint64_t)(unsigned __int16)v5 << 32) | (v26 << 48) | (v25 << 24) | ((unint64_t)v7 << 16) | v8);
LABEL_42:
        v8 = (unsigned __int16)v10;
        v14 = v11;
        v25 = HIBYTE(v12);
        v13 = 1;
        v26 = 1;
      }
      v7 = v9;
      v5 = v6;
      goto LABEL_50;
    }
    if (v4)
    {
      v15 = objc_msgSend(v4, "regionByAddingRange:", ((unint64_t)(unsigned __int16)v5 << 32) | (v26 << 48) | (v25 << 24) | ((unint64_t)v7 << 16) | v8);
      if (v24 == 0xFFFF
        || (_DWORD)v9 == 255
        || !(_WORD)v6
        || !(((v22 << 48) | (v21 << 24) | ((unint64_t)(unsigned __int16)v6 << 32) | v24 | ((unint64_t)v9 << 16)) >> 48))
      {
        goto LABEL_49;
      }
      if (!v23)
      {
        objc_msgSend((id)v39[5], "p_insertRangeIntoRegion:");
        goto LABEL_49;
      }
      if (v24 + (unsigned __int16)v22 != v8)
        goto LABEL_44;
      v16 = v23[1];
      if (v16 != *(_QWORD *)(v15 + 8))
        goto LABEL_44;
      if (v16)
      {
        v17 = (unsigned __int16 *)(v23[2] + 4);
        v18 = (unsigned __int16 *)(*(_QWORD *)(v15 + 16) + 4);
        while (*((unsigned __int8 *)v17 - 2) == *((unsigned __int8 *)v18 - 2) && *v17 == *v18)
        {
          v17 += 4;
          v18 += 4;
          if (!--v16)
            goto LABEL_28;
        }
LABEL_44:
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __35__TSTCellRegion_regionFromCellMap___block_invoke_2;
        v30[3] = &unk_24D82F048;
        v30[4] = &v38;
        objc_msgSend(v23, "enumerateCellRangesUsingBlock:", v30);
        goto LABEL_49;
      }
LABEL_28:
      v32 = 0;
      v33 = &v32;
      v34 = 0x3052000000;
      v35 = __Block_byref_object_copy__27;
      v36 = __Block_byref_object_dispose__27;
      v37 = 0;
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __35__TSTCellRegion_regionFromCellMap___block_invoke;
      v31[3] = &unk_24D82F048;
      v31[4] = &v32;
      objc_msgSend(v23, "enumerateCellRangesUsingBlock:", v31);
      v15 = v33[5];
      _Block_object_dispose(&v32, 8);
    }
    else if (v24 == 0xFFFF
           || (_DWORD)v9 == 255
           || !(_WORD)v6
           || !(((v22 << 48) | (v21 << 24) | ((unint64_t)(unsigned __int16)v6 << 32) | v24 | ((unint64_t)v9 << 16)) >> 48))
    {
      v15 = (uint64_t)v23;
    }
    else
    {
      if (v23)
      {
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __35__TSTCellRegion_regionFromCellMap___block_invoke_3;
        v29[3] = &unk_24D82F048;
        v29[4] = &v38;
        objc_msgSend(v23, "enumerateCellRangesUsingBlock:", v29);
        goto LABEL_48;
      }
      if (v24 + (unsigned __int16)v22 != v8 || (_DWORD)v7 != (_DWORD)v9 || (unsigned __int16)v5 != (unsigned __int16)v6)
      {
        objc_msgSend((id)v39[5], "p_insertRangeIntoRegion:");
LABEL_48:
        v15 = 0;
        goto LABEL_49;
      }
      v15 = 0;
      v8 = v24;
      v25 = v21;
      v26 = (v22 + 1);
    }
LABEL_49:
    v22 = v26;
    v23 = (_QWORD *)v15;
    v21 = v25;
    v24 = v8;
    v8 = (unsigned __int16)v10;
    v14 = v11;
    v25 = HIBYTE(v12);
    v13 = 1;
    v26 = 1;
    v4 = 0;
LABEL_50:
    v6 = v5;
    v9 = v7;
    ++v3;
    v7 = v14;
    v5 = v13;
  }
  if (v23)
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __35__TSTCellRegion_regionFromCellMap___block_invoke_4;
    v28[3] = &unk_24D82F048;
    v28[4] = &v38;
    objc_msgSend(v23, "enumerateCellRangesUsingBlock:", v28);
  }
  else
  {
    objc_msgSend((id)v39[5], "p_insertRangeIntoRegion:", ((unint64_t)(unsigned __int16)v6 << 32) | (v22 << 48) | (v21 << 24) | ((unint64_t)v9 << 16) | v24);
  }
  objc_msgSend((id)v39[5], "p_calculateAncillaryInformation");
  v19 = (void *)v39[5];
  _Block_object_dispose(&v38, 8);
  return v19;
}

id __35__TSTCellRegion_regionFromCellMap___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id result;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v3)
    return (id)objc_msgSend(v3, "p_insertRangeIntoRegion:", a2 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(HIWORD(a2) + 1) << 48));
  result = +[TSTCellRegion regionFromRange:](TSTCellRegion, "regionFromRange:", a2 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(HIWORD(a2) + 1) << 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __35__TSTCellRegion_regionFromCellMap___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "p_insertRangeIntoRegion:", a2);
}

uint64_t __35__TSTCellRegion_regionFromCellMap___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "p_insertRangeIntoRegion:", a2);
}

uint64_t __35__TSTCellRegion_regionFromCellMap___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "p_insertRangeIntoRegion:", a2);
}

+ (id)region:(id)a3 addingRange:(id)a4
{
  TSTCellRegion *v6;
  TSTCellRegion *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  unsigned int v24;
  unsigned __int16 v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v29;
  _QWORD v30[7];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;

  v6 = objc_alloc_init(TSTCellRegion);
  v7 = v6;
  if (!a3)
  {
    -[TSTCellRegion p_insertRangeIntoRegion:](v6, "p_insertRangeIntoRegion:", a4);
    goto LABEL_44;
  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v38 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  *($CA3468F20078D5D2DB35E78E73CA60DA *)v36[3] = a4;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __36__TSTCellRegion_region_addingRange___block_invoke;
  v30[3] = &unk_24D82F070;
  v30[5] = &v31;
  v30[6] = &v35;
  v30[4] = v7;
  objc_msgSend(a3, "enumerateCellRangesUsingBlock:", v30);
  LODWORD(v8) = *((_DWORD *)v32 + 6);
  if ((int)v8 <= 1)
    goto LABEL_39;
  v9 = 1;
  v10 = 8;
  do
  {
    v11 = 0;
    do
    {
      v29 = 0xFFFFFFLL;
      v12 = v36[3];
      v13 = (uint64_t *)(v12 + 8 * v9);
      v14 = *v13;
      v15 = (_QWORD *)(v12 + v11);
      v16 = *(_QWORD *)(v12 + v11);
      v17 = HIWORD(*v13);
      if (v17)
        v18 = (*v13 & 0xFFFF00000000) == 0;
      else
        v18 = 1;
      if (!v18 && HIWORD(v16) != 0 && (v16 & 0xFFFF00000000) != 0)
      {
        if ((unsigned __int16)*v13 <= (unsigned __int16)v16
          && (unsigned __int16)(v14 + v17 - 1) >= (unsigned __int16)v16
          && BYTE2(v16) >= BYTE2(v14))
        {
          v24 = (BYTE4(v14) + BYTE2(v14) - 1);
          if (v24 >= BYTE2(v16)
            && v24 >= (BYTE4(v16) + BYTE2(v16) - 1)
            && (unsigned __int16)(v14 + v17 - 1) >= (unsigned __int16)(v16 + HIWORD(v16) - 1))
          {
            *v15 = 0xFFFFFFLL;
            goto LABEL_22;
          }
        }
        if ((unsigned __int16)v16 <= (unsigned __int16)v14)
        {
          v25 = v16 + HIWORD(v16) - 1;
          if (v25 >= (unsigned __int16)v14 && BYTE2(v14) >= BYTE2(v16))
          {
            v26 = (BYTE4(v16) + BYTE2(v16) - 1);
            if (v26 >= BYTE2(v14)
              && v26 >= (BYTE4(v14) + BYTE2(v14) - 1)
              && v25 >= (unsigned __int16)(v14 + v17 - 1))
            {
              *v13 = 0xFFFFFFLL;
              goto LABEL_22;
            }
          }
        }
      }
      if (p_TSTCellRangeSplitForAdding((uint64_t)v15, (uint64_t)v13, &v29))
      {
        v21 = v29;
        if ((_WORD)v29 != 0xFFFF && (v29 & 0xFF0000) != 0xFF0000 && HIWORD(v29) && (v29 & 0xFFFF00000000) != 0)
        {
          v22 = *((int *)v32 + 6) + 1;
          *((_DWORD *)v32 + 6) = v22;
          v23 = malloc_type_realloc((void *)v36[3], 8 * v22, 0x100004000313F17uLL);
          v36[3] = (uint64_t)v23;
          v23[*((int *)v32 + 6) - 1] = v21;
        }
      }
LABEL_22:
      v11 += 8;
    }
    while (v10 != v11);
    ++v9;
    v8 = *((int *)v32 + 6);
    v10 += 8;
  }
  while (v9 < v8);
LABEL_39:
  if ((int)v8 >= 1)
  {
    v27 = 0;
    do
      -[TSTCellRegion p_insertRangeIntoRegion:](v7, "p_insertRangeIntoRegion:", *(_QWORD *)(v36[3] + 8 * v27++), v29);
    while (v27 < *((int *)v32 + 6));
  }
  free((void *)v36[3]);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
LABEL_44:
  -[TSTCellRegion p_calculateAncillaryInformation](v7, "p_calculateAncillaryInformation", v29);
  return v7;
}

uint64_t __36__TSTCellRegion_region_addingRange___block_invoke(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  int v3;
  BOOL v4;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned __int16 v11;
  unsigned int v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;

  v2 = result;
  v21 = a2;
  if (*(int *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) >= 1)
  {
    v3 = 0;
    while (1)
    {
      a2 = v21;
      if ((_WORD)v21 == 0xFFFF)
        break;
      v4 = (v21 & 0xFF0000) == 0xFF0000 || HIWORD(v21) == 0;
      if (v4 || (v21 & 0xFFFF00000000) == 0)
        break;
      v20 = 0xFFFFFFLL;
      v6 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) + 8 * v3);
      v7 = *v6;
      v8 = HIWORD(*v6);
      if (v8)
        v9 = (*v6 & 0xFFFF00000000) == 0;
      else
        v9 = 1;
      if (!v9)
      {
        if ((unsigned __int16)v21 <= (unsigned __int16)v7
          && (unsigned __int16)(v21 + HIWORD(v21) - 1) >= (unsigned __int16)v7
          && BYTE2(v7) >= BYTE2(v21))
        {
          v10 = (BYTE4(v21) + BYTE2(v21) - 1);
          if (v10 >= BYTE2(v7)
            && v10 >= (BYTE4(v7) + BYTE2(v7) - 1)
            && (unsigned __int16)(v21 + HIWORD(v21) - 1) >= (unsigned __int16)(v7 + v8 - 1))
          {
            *v6 = 0xFFFFFFLL;
            v14 = v3 + 1;
            v15 = *(_QWORD *)(*(_QWORD *)(v2 + 40) + 8);
            v16 = *(_DWORD *)(v15 + 24);
            if (v3 + 1 < v16)
            {
              v17 = v14;
              v18 = ((uint64_t)v14 << 32) - 0x100000000;
              do
              {
                v19 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) + 8 * v17);
                *(v19 - 1) = *v19;
                ++v17;
                v18 += 0x100000000;
              }
              while (v17 < *(int *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24));
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) + (v18 >> 29)) = 0xFFFFFFLL;
              v15 = *(_QWORD *)(*(_QWORD *)(v2 + 40) + 8);
              v16 = *(_DWORD *)(v15 + 24);
            }
            --v3;
            *(_DWORD *)(v15 + 24) = v16 - 1;
            goto LABEL_33;
          }
        }
        if ((unsigned __int16)*v6 <= (unsigned __int16)v21)
        {
          v11 = v7 + v8 - 1;
          if (v11 >= (unsigned __int16)v21 && BYTE2(v21) >= BYTE2(v7))
          {
            v12 = (BYTE4(v7) + BYTE2(v7) - 1);
            if (v12 >= BYTE2(v21)
              && v12 >= (BYTE4(v21) + BYTE2(v21) - 1)
              && v11 >= (unsigned __int16)(v21 + HIWORD(v21) - 1))
            {
              return result;
            }
          }
        }
      }
      result = p_TSTCellRangeSplitForAdding((uint64_t)&v21, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) + 8 * v3, &v20);
      if ((_DWORD)result)
      {
        v13 = v20;
        if ((_WORD)v20 != 0xFFFF && (v20 & 0xFF0000) != 0xFF0000 && HIWORD(v20) && (v20 & 0xFFFF00000000) != 0)
        {
          result = (uint64_t)malloc_type_realloc(*(void **)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24), 8 * (int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24), 0x100004000313F17uLL);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = result;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24)
                    + 8 * *(int *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24)
                    - 8) = v13;
        }
      }
LABEL_33:
      if (++v3 >= *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24))
      {
        a2 = v21;
        break;
      }
    }
  }
  if ((_WORD)a2 != 0xFFFF && (a2 & 0xFF0000) != 0xFF0000 && HIWORD(a2) && (a2 & 0xFFFF00000000) != 0)
    return objc_msgSend(*(id *)(v2 + 32), "p_insertRangeIntoRegion:", a2);
  return result;
}

+ (id)region:(id)a3 subtractingRange:(id)a4
{
  TSTCellRegion *v6;
  TSTCellRegion *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[8];
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = objc_alloc_init(TSTCellRegion);
  v7 = v6;
  if (a3)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v12 = 0;
    v13 = (int *)&v12;
    v14 = 0x2020000000;
    v15 = 0;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __41__TSTCellRegion_region_subtractingRange___block_invoke;
    v11[3] = &unk_24D82F098;
    v11[6] = &v16;
    v11[7] = a4;
    v11[4] = v6;
    v11[5] = &v12;
    objc_msgSend(a3, "enumerateCellRangesUsingBlock:", v11);
    if (v13[6] >= 1)
    {
      v8 = 0;
      do
        -[TSTCellRegion p_insertRangeIntoRegion:](v7, "p_insertRangeIntoRegion:", *(_QWORD *)(v17[3] + 8 * v8++));
      while (v8 < v13[6]);
    }
    v9 = (void *)v17[3];
    if (v9)
      free(v9);
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  -[TSTCellRegion p_calculateAncillaryInformation](v7, "p_calculateAncillaryInformation");
  return v7;
}

uint64_t __41__TSTCellRegion_region_subtractingRange___block_invoke(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  unint64_t v6;
  _BOOL4 v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  unsigned int v22;
  uint64_t i;
  unint64_t v24;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = result;
  v31 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(result + 56);
  v4 = v3 & 0xFFFF00000000;
  if (HIWORD(v3))
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = HIWORD(a2);
  if (!v5
    && v6 != 0
    && (a2 & 0xFFFF00000000) != 0
    && (unsigned __int16)*(_QWORD *)(result + 56) <= (unsigned __int16)a2
    && (unsigned __int16)(v3 + HIWORD(v3) - 1) >= (unsigned __int16)a2
    && BYTE2(a2) >= BYTE2(v3))
  {
    v16 = (BYTE4(v3) + BYTE2(v3) - 1);
    if (v16 >= BYTE2(a2)
      && v16 >= (BYTE4(a2) + BYTE2(a2) - 1)
      && (unsigned __int16)(v3 + HIWORD(v3) - 1) >= (unsigned __int16)(a2 + HIWORD(a2) - 1))
    {
      return result;
    }
  }
  v9 = (~(_DWORD)a2 & 0xFF0000) != 0 && (_WORD)a2 != 0xFFFF;
  if (!v9)
  {
    v10 = 0;
    v13 = 0;
    v11 = 16711680;
    v12 = 0xFFFFLL;
    goto LABEL_45;
  }
  v10 = 0;
  v11 = 16711680;
  v12 = 0xFFFFLL;
  if (!v6)
    goto LABEL_44;
  v13 = 0;
  if ((a2 & 0xFFFF00000000) == 0)
    goto LABEL_45;
  v10 = 0;
  v11 = 16711680;
  v12 = 0xFFFFLL;
  if ((_WORD)v3 == 0xFFFF)
  {
LABEL_44:
    v13 = 0;
    goto LABEL_45;
  }
  v13 = 0;
  if ((v3 & 0xFF0000) != 0xFF0000)
  {
    v10 = 0;
    v11 = 16711680;
    v12 = 0xFFFFLL;
    if (HIWORD(v3))
    {
      v13 = 0;
      if (v4)
      {
        v12 = 0;
        v14 = BYTE2(a2);
        if (BYTE2(a2) <= BYTE2(v3))
          v14 = BYTE2(v3);
        if ((unsigned __int16)a2 <= (unsigned __int16)v3)
          v15 = (unsigned __int16)*(_QWORD *)(result + 56);
        else
          v15 = (unsigned __int16)a2;
        if ((BYTE4(a2) + BYTE2(a2) - 1) >= (BYTE4(v3) + BYTE2(v3) - 1))
          result = (BYTE4(v3) + BYTE2(v3) - 1);
        else
          result = (BYTE4(a2) + BYTE2(a2) - 1);
        LOWORD(v3) = v3 + HIWORD(v3) - 1;
        if ((unsigned __int16)(a2 + HIWORD(a2) - 1) >= (unsigned __int16)v3)
          LODWORD(v3) = (unsigned __int16)v3;
        else
          LODWORD(v3) = (unsigned __int16)(a2 + HIWORD(a2) - 1);
        v11 = 0;
        v10 = 0;
        v13 = 0;
        if (v15 <= v3 && v14 <= result)
        {
          v13 = ((unint64_t)(v3 - v15) << 48) + 0x1000000000000;
          v10 = (unint64_t)(unsigned __int16)(result - v14 + 1) << 32;
          v11 = v14 << 16;
          v12 = v15;
        }
      }
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_45:
  v17 = v11 | v13 | v12 | v10;
  if ((_WORD)v17 == 0xFFFF || (v17 & 0xFF0000) == 0xFF0000 || !HIWORD(v17) || (v17 & 0xFFFF00000000) == 0)
  {
    if (v9 && v6 && (a2 & 0xFFFF00000000) != 0)
      return objc_msgSend(*(id *)(v2 + 32), "p_insertRangeIntoRegion:", a2);
  }
  else
  {
    if ((unsigned __int16)(v11 | v13 | v12 | v10) <= (unsigned __int16)a2)
    {
      v27 = 0xFFFFFFLL;
      v18 = a2;
    }
    else
    {
      LOWORD(v27) = a2;
      *(_DWORD *)((char *)&v27 + 2) = a2 >> 16;
      HIWORD(v27) = v17 - a2;
      LOWORD(v6) = HIWORD(a2) - (v17 - a2);
      v18 = v11 | v13 | v12 | v10;
    }
    v19 = a2 & 0xFFFFFFFF0000;
    v20 = HIWORD(v13);
    v21 = v17 + HIWORD(v13) - 1;
    if ((unsigned __int16)(v18 + v6 - 1) <= (unsigned __int16)v21)
    {
      v28 = 0xFFFFFFLL;
    }
    else
    {
      *(_DWORD *)((char *)&v28 + 2) = a2 >> 16;
      LOWORD(v28) = v17 + v20;
      HIWORD(v28) = v18 + v6 - 1 - v21;
      LOWORD(v6) = v21 - (v18 - 1);
    }
    if (BYTE2(v17) <= BYTE2(v19))
    {
      v29 = 0xFFFFFFLL;
    }
    else
    {
      LOWORD(v29) = v18;
      WORD1(v29) = WORD1(a2);
      HIWORD(v29) = v6;
      WORD2(v29) = BYTE2(v17) - BYTE2(v19);
    }
    v22 = HIDWORD(v17) + WORD1(v17) + 255;
    LODWORD(v19) = HIDWORD(v19) + WORD1(a2) + 255;
    if (v22 >= (BYTE4(v19) + BYTE2(a2) - 1))
    {
      v30 = 0xFFFFFFLL;
    }
    else
    {
      LOWORD(v30) = v18;
      BYTE3(v30) = BYTE3(a2);
      HIWORD(v30) = v6;
      BYTE2(v30) = v22 + 1;
      WORD2(v30) = v19 - v22;
    }
    for (i = 0; i != 32; i += 8)
    {
      v24 = *(uint64_t *)((char *)&v27 + i);
      if (*(_WORD *)((char *)&v27 + i) != 0xFFFF
        && (v24 & 0xFF0000) != 0xFF0000
        && HIWORD(v24) != 0
        && (v24 & 0xFFFF00000000) != 0)
      {
        result = (uint64_t)malloc_type_realloc(*(void **)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24), 8 * (int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24), 0x100004000313F17uLL);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24) = result;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8) + 24)
                  + 8 * *(int *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24)
                  - 8) = v24;
      }
    }
  }
  return result;
}

+ (id)region:(id)a3 intersectingRange:(id)a4
{
  TSTCellRegion *v6;
  TSTCellRegion *v7;
  _QWORD v9[6];

  v6 = objc_alloc_init(TSTCellRegion);
  v7 = v6;
  if (a3)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __42__TSTCellRegion_region_intersectingRange___block_invoke;
    v9[3] = &unk_24D82F0C0;
    v9[4] = v6;
    v9[5] = a4;
    objc_msgSend(a3, "enumerateCellRangesUsingBlock:", v9);
  }
  -[TSTCellRegion p_calculateAncillaryInformation](v7, "p_calculateAncillaryInformation");
  return v7;
}

uint64_t __42__TSTCellRegion_region_intersectingRange___block_invoke(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;

  v2 = 0;
  v3 = 16711680;
  v4 = 0xFFFFLL;
  if ((_WORD)a2 == 0xFFFF)
    goto LABEL_23;
  v5 = 0;
  if ((a2 & 0xFF0000) == 0xFF0000)
    goto LABEL_24;
  v2 = 0;
  v3 = 16711680;
  v4 = 0xFFFFLL;
  if (!HIWORD(a2))
    goto LABEL_23;
  v5 = 0;
  if ((a2 & 0xFFFF00000000) == 0)
    goto LABEL_24;
  v2 = 0;
  v6 = *(_QWORD *)(result + 40);
  v3 = 16711680;
  v4 = 0xFFFFLL;
  if (*(_WORD *)(result + 40) == 0xFFFF)
    goto LABEL_23;
  v5 = 0;
  if ((v6 & 0xFF0000) == 0xFF0000)
    goto LABEL_24;
  v2 = 0;
  v3 = 16711680;
  v4 = 0xFFFFLL;
  if (!HIWORD(v6))
  {
LABEL_23:
    v5 = 0;
  }
  else
  {
    v5 = 0;
    if ((v6 & 0xFFFF00000000) != 0)
    {
      v4 = 0;
      if (BYTE2(a2) <= BYTE2(v6))
        v7 = BYTE2(v6);
      else
        v7 = BYTE2(a2);
      if ((unsigned __int16)a2 <= (unsigned __int16)v6)
        v8 = (unsigned __int16)*(_QWORD *)(result + 40);
      else
        v8 = (unsigned __int16)a2;
      if ((BYTE4(a2) + BYTE2(a2) - 1) >= (BYTE4(v6) + BYTE2(v6) - 1))
        v9 = (BYTE4(v6) + BYTE2(v6) - 1);
      else
        v9 = (BYTE4(a2) + BYTE2(a2) - 1);
      v10 = (unsigned __int16)(v6 + HIWORD(v6) - 1);
      if ((unsigned __int16)(a2 + HIWORD(a2) - 1) < v10)
        v10 = (unsigned __int16)(a2 + HIWORD(a2) - 1);
      v3 = 0;
      v2 = 0;
      v5 = 0;
      if (v8 <= v10 && v7 <= v9)
      {
        v5 = ((unint64_t)(v10 - v8) << 48) + 0x1000000000000;
        v2 = (unint64_t)(unsigned __int16)(v9 - v7 + 1) << 32;
        v3 = v7 << 16;
        v4 = v8;
      }
    }
  }
LABEL_24:
  v11 = v3 | v5 | v4 | v2;
  if ((_WORD)v11 != 0xFFFF && (v11 & 0xFF0000) != 0xFF0000 && HIWORD(v11) != 0 && (v11 & 0xFFFF00000000) != 0)
    return objc_msgSend(*(id *)(result + 32), "p_insertRangeIntoRegion:");
  return result;
}

+ (id)unionEveryRangeInRegion:(id)a3 withRange:(id)a4
{
  TSTCellRegion *v6;
  TSTCellRegion *v7;
  _QWORD v9[6];

  v6 = objc_alloc_init(TSTCellRegion);
  v7 = v6;
  if (a3)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__TSTCellRegion_unionEveryRangeInRegion_withRange___block_invoke;
    v9[3] = &unk_24D82F0C0;
    v9[4] = v6;
    v9[5] = a4;
    objc_msgSend(a3, "enumerateCellRangesUsingBlock:", v9);
  }
  else
  {
    -[TSTCellRegion p_insertRangeIntoRegion:](v6, "p_insertRangeIntoRegion:", a4);
  }
  -[TSTCellRegion p_calculateAncillaryInformation](v7, "p_calculateAncillaryInformation");
  return v7;
}

unint64_t __51__TSTCellRegion_unionEveryRangeInRegion_withRange___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t result;

  result = TSTCellRangeUnionCellRange(a2, *(_QWORD *)(a1 + 40));
  if ((_WORD)result != 0xFFFF
    && (result & 0xFF0000) != 0xFF0000
    && HIWORD(result) != 0
    && (result & 0xFFFF00000000) != 0)
  {
    return objc_msgSend(*(id *)(a1 + 32), "p_insertRangeIntoRegion:");
  }
  return result;
}

+ (id)region:(id)a3 addingRegion:(id)a4
{
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__27;
  v13 = __Block_byref_object_dispose__27;
  v14 = 0;
  v14 = (id)objc_msgSend(a3, "copy");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__TSTCellRegion_region_addingRegion___block_invoke;
  v8[3] = &unk_24D82F0E8;
  v8[4] = a1;
  v8[5] = &v9;
  objc_msgSend(a4, "enumerateCellRangesUsingBlock:", v8);
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __37__TSTCellRegion_region_addingRegion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "region:addingRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)region:(id)a3 subtractingRegion:(id)a4
{
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__27;
  v13 = __Block_byref_object_dispose__27;
  v14 = 0;
  v14 = (id)objc_msgSend(a3, "copy");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__TSTCellRegion_region_subtractingRegion___block_invoke;
  v8[3] = &unk_24D82F0E8;
  v8[4] = a1;
  v8[5] = &v9;
  objc_msgSend(a4, "enumerateCellRangesUsingBlock:", v8);
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __42__TSTCellRegion_region_subtractingRegion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "region:subtractingRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)invalidRegion
{
  TSTCellRegion *v2;

  v2 = objc_alloc_init(TSTCellRegion);
  -[TSTCellRegion p_calculateAncillaryInformation](v2, "p_calculateAncillaryInformation");
  return v2;
}

+ (id)regionFillingColumnsFromRegion:(id)a3
{
  TSTCellRegion *v4;
  __int16 v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t (*v13)();
  void *v14;
  __int16 v15;

  if (!a3)
    return 0;
  if ((objc_msgSend(a3, "isEmpty") & 1) != 0)
    return a3;
  v4 = objc_alloc_init(TSTCellRegion);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3812000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__4;
  v14 = &unk_217C8B239;
  v15 = 0;
  v5 = objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration"), "maxNumberOfRows");
  *((_WORD *)v10 + 27) = v5;
  v6 = (void *)*((_QWORD *)a3 + 5);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__TSTCellRegion_regionFillingColumnsFromRegion___block_invoke;
  v8[3] = &unk_24D82F110;
  v8[4] = v4;
  v8[5] = &v9;
  objc_msgSend(v6, "enumerateRangesUsingBlock:", v8);
  -[TSTCellRegion p_calculateAncillaryInformation](v4, "p_calculateAncillaryInformation");
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __48__TSTCellRegion_regionFillingColumnsFromRegion___block_invoke(uint64_t a1, char a2, __int16 a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 50) = a2;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 52) = a3;
  return objc_msgSend(*(id *)(a1 + 32), "p_insertRangeIntoRegion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
}

+ (id)regionFillingRowsFromRegion:(id)a3
{
  TSTCellRegion *v4;
  __int16 v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t (*v13)();
  void *v14;
  char v15;

  if (!a3)
    return 0;
  if ((objc_msgSend(a3, "isEmpty") & 1) != 0)
    return a3;
  v4 = objc_alloc_init(TSTCellRegion);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3812000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__4;
  v14 = &unk_217C8B239;
  v15 = 0;
  v5 = objc_msgSend(+[TSTConfiguration sharedTableConfiguration](TSTConfiguration, "sharedTableConfiguration"), "maxNumberOfColumns");
  *((_WORD *)v10 + 26) = v5;
  v6 = (void *)*((_QWORD *)a3 + 6);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__TSTCellRegion_regionFillingRowsFromRegion___block_invoke;
  v8[3] = &unk_24D82F110;
  v8[4] = v4;
  v8[5] = &v9;
  objc_msgSend(v6, "enumerateRangesUsingBlock:", v8);
  -[TSTCellRegion p_calculateAncillaryInformation](v4, "p_calculateAncillaryInformation");
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __45__TSTCellRegion_regionFillingRowsFromRegion___block_invoke(uint64_t a1, __int16 a2, __int16 a3)
{
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = a2;
  *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 54) = a3;
  return objc_msgSend(*(id *)(a1 + 32), "p_insertRangeIntoRegion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
}

+ (id)regionFromRowIndices:(id)a3
{
  TSTCellRegion *v4;
  _QWORD v6[5];

  v4 = objc_alloc_init(TSTCellRegion);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__TSTCellRegion_regionFromRowIndices___block_invoke;
  v6[3] = &unk_24D82F138;
  v6[4] = v4;
  objc_msgSend(a3, "enumerateRangesUsingBlock:", v6);
  -[TSTCellRegion p_calculateAncillaryInformation](v4, "p_calculateAncillaryInformation");
  return v4;
}

uint64_t __38__TSTCellRegion_regionFromRowIndices___block_invoke(uint64_t a1, unsigned __int16 a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_insertRangeIntoRegion:", a2 | (unint64_t)(a3 << 48) | 0xFF00000000);
}

+ (id)regionFromColumnIndices:(id)a3
{
  TSTCellRegion *v4;
  _QWORD v6[5];

  v4 = objc_alloc_init(TSTCellRegion);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__TSTCellRegion_regionFromColumnIndices___block_invoke;
  v6[3] = &unk_24D82F138;
  v6[4] = v4;
  objc_msgSend(a3, "enumerateRangesUsingBlock:", v6);
  -[TSTCellRegion p_calculateAncillaryInformation](v4, "p_calculateAncillaryInformation");
  return v4;
}

uint64_t __41__TSTCellRegion_regionFromColumnIndices___block_invoke(uint64_t a1, unsigned __int8 a2, unsigned __int16 a3)
{
  uint64_t v3;

  if (a3 >= 0xFFu)
    v3 = 255;
  else
    v3 = a3;
  return objc_msgSend(*(id *)(a1 + 32), "p_insertRangeIntoRegion:", ((unint64_t)a2 << 16) | (v3 << 32) | 0xFFFF000000000000);
}

- (id)regionByAddingRange:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "region:addingRange:", self, a3);
}

- (id)regionBySubtractingRange:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "region:subtractingRange:", self, a3);
}

- (id)regionByIntersectingRange:(id)a3
{
  $CA3468F20078D5D2DB35E78E73CA60DA v5;
  unsigned int v6;

  v5 = -[TSTCellRegion boundingCellRange](self, "boundingCellRange");
  if (HIWORD(*(unint64_t *)&a3)
    && (*(_QWORD *)&a3 & 0xFFFF00000000) != 0
    && HIWORD(*(unint64_t *)&v5)
    && (*(_QWORD *)&v5 & 0xFFFF00000000) != 0
    && a3.var0.var0 <= v5.var0.var0
    && (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1) >= v5.var0.var0
    && v5.var0.var1 >= a3.var0.var1
    && (v6 = (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1), v6 >= v5.var0.var1)
    && v6 >= (LOBYTE(v5.var1.var0) + v5.var0.var1 - 1)
    && (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1) >= (unsigned __int16)(v5.var0.var0
                                                                                             + v5.var1.var1
                                                                                             - 1))
  {
    return self;
  }
  else
  {
    return (id)objc_msgSend((id)objc_opt_class(), "region:intersectingRange:", self, a3);
  }
}

- (id)regionByUnioningEveryRangeInRegionWithRange:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "unionEveryRangeInRegion:withRange:", self, a3);
}

- (id)regionByAddingRegion:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "region:addingRegion:", self, a3);
}

- (id)regionBySubtractingRegion:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "region:subtractingRegion:", self, a3);
}

- (id)regionOffsetBy:(id)a3
{
  _QWORD *v5;
  void *v6;
  unint64_t mCellRangesCount;
  $5CFCD363C99B2F51819B67AD7AD2E060 origin;
  int v9;
  BOOL v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0;
  int v16;
  int v17;
  BOOL v19;
  int v20;

  v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    v6 = malloc_type_malloc(8 * self->mCellRangesCount, 0x100004000313F17uLL);
    mCellRangesCount = self->mCellRangesCount;
    v5[1] = mCellRangesCount;
    v5[2] = v6;
    v5[4] = self->mCellCount;
    origin = self->mBoundingCellRange.origin;
    v9 = a3.var1 + origin.row;
    v11 = v9 <= 0xFFFF && v9 >= 0 && ((a3.var0 + origin.column) & 0xFFFF0000) == 0;
    v12 = ((LOBYTE(a3.var0) + origin.column) << 16) | v9;
    if (!v11)
      v12 = 0xFFFFFF;
    *((_DWORD *)v5 + 6) = v12;
    *((_DWORD *)v5 + 7) = self->mBoundingCellRange.size;
    if (mCellRangesCount)
    {
      v13 = 0;
      v14 = 0;
      do
      {
        var0 = self->mCellRanges[v13].var0;
        v16 = a3.var0 + var0.var1;
        v17 = a3.var1 + var0.var0;
        v19 = v17 <= 0xFFFF && v17 >= 0 && (v16 & 0xFFFF0000) == 0;
        v20 = (v16 << 16) | v17;
        if (!v19)
          v20 = 0xFFFFFF;
        *(_DWORD *)(v5[2] + v13 * 8) = v20;
        *($201E9A47BE70A2B12CCA2F48B75AA2F7 *)(v5[2] + v13 * 8 + 4) = self->mCellRanges[v13].var1;
        ++v14;
        ++v13;
      }
      while (v14 < v5[1]);
    }
  }
  objc_msgSend(v5, "p_calculateAncillaryInformation");
  return v5;
}

- (id)regionByRemovingRows:(id)a3
{
  TSTCellRegion *v5;
  $CA3468F20078D5D2DB35E78E73CA60DA v6;
  void *v7;
  _QWORD v9[8];
  _QWORD v10[3];
  int v11;
  _QWORD v12[4];

  if (a3)
  {
    v5 = objc_alloc_init(TSTCellRegion);
    v6 = -[TSTCellRegion boundingCellRange](self, "boundingCellRange");
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", 0, (unsigned __int16)(v6.var0.var0 + v6.var1.var1 - 1) + 1);
    objc_msgSend(v7, "removeIndexes:", a3);
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__TSTCellRegion_regionByRemovingRows___block_invoke;
    v9[3] = &unk_24D82F188;
    v9[6] = v10;
    v9[7] = v12;
    v9[4] = self;
    v9[5] = v5;
    objc_msgSend(v7, "enumerateRangesUsingBlock:", v9);
    -[TSTCellRegion p_calculateAncillaryInformation](v5, "p_calculateAncillaryInformation");
    self = v5;
    _Block_object_dispose(v10, 8);
    _Block_object_dispose(v12, 8);
  }
  return self;
}

uint64_t __38__TSTCellRegion_regionByRemovingRows___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _QWORD v6[5];

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                           + 24)
                                                               - a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2 + a3;
  v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "regionByIntersectingRange:", (unsigned __int16)a2 | (unint64_t)(a3 << 48) | 0xFF00000000), "regionOffsetBy:", (unint64_t)*(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) << 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__TSTCellRegion_regionByRemovingRows___block_invoke_2;
  v6[3] = &unk_24D82F160;
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v4, "enumerateCellRangesUsingBlock:", v6);
}

uint64_t __38__TSTCellRegion_regionByRemovingRows___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_insertRangeIntoRegion:", a2);
}

- (id)regionByRemovingColumns:(id)a3
{
  TSTCellRegion *v5;
  $CA3468F20078D5D2DB35E78E73CA60DA v6;
  void *v7;
  _QWORD v9[8];
  _QWORD v10[3];
  int v11;
  _QWORD v12[4];

  if (a3)
  {
    v5 = objc_alloc_init(TSTCellRegion);
    v6 = -[TSTCellRegion boundingCellRange](self, "boundingCellRange");
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", 0, (LOBYTE(v6.var1.var0) + v6.var0.var1 - 1) + 1);
    objc_msgSend(v7, "removeIndexes:", a3);
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __41__TSTCellRegion_regionByRemovingColumns___block_invoke;
    v9[3] = &unk_24D82F188;
    v9[6] = v10;
    v9[7] = v12;
    v9[4] = self;
    v9[5] = v5;
    objc_msgSend(v7, "enumerateRangesUsingBlock:", v9);
    -[TSTCellRegion p_calculateAncillaryInformation](v5, "p_calculateAncillaryInformation");
    self = v5;
    _Block_object_dispose(v10, 8);
    _Block_object_dispose(v12, 8);
  }
  return self;
}

uint64_t __41__TSTCellRegion_regionByRemovingColumns___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                           + 24)
                                                               - a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2 + a3;
  if ((unsigned __int16)a3 >= 0xFFu)
    v4 = 255;
  else
    v4 = (unsigned __int16)a3;
  v5 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "regionByIntersectingRange:", ((unint64_t)a2 << 16) | (v4 << 32) | 0xFFFF000000000000), "regionOffsetBy:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__TSTCellRegion_regionByRemovingColumns___block_invoke_2;
  v7[3] = &unk_24D82F160;
  v7[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v5, "enumerateCellRangesUsingBlock:", v7);
}

uint64_t __41__TSTCellRegion_regionByRemovingColumns___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_insertRangeIntoRegion:", a2);
}

- (id)regionByIntersectingRowIndices:(id)a3
{
  TSTCellRegion *v5;
  _QWORD v7[6];

  v5 = objc_alloc_init(TSTCellRegion);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__TSTCellRegion_regionByIntersectingRowIndices___block_invoke;
  v7[3] = &unk_24D82F1B0;
  v7[4] = self;
  v7[5] = v5;
  objc_msgSend(a3, "enumerateRangesUsingBlock:", v7);
  -[TSTCellRegion p_calculateAncillaryInformation](v5, "p_calculateAncillaryInformation");
  return v5;
}

uint64_t __48__TSTCellRegion_regionByIntersectingRowIndices___block_invoke(uint64_t a1, unsigned __int16 a2, uint64_t a3)
{
  void *v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__TSTCellRegion_regionByIntersectingRowIndices___block_invoke_2;
  v5[3] = &unk_24D82F0C0;
  v3 = *(void **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v5[5] = a2 | (unint64_t)(a3 << 48) | 0xFF00000000;
  return objc_msgSend(v3, "enumerateCellRangesUsingBlock:", v5);
}

uint64_t __48__TSTCellRegion_regionByIntersectingRowIndices___block_invoke_2(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;

  v2 = 0;
  v3 = 16711680;
  v4 = 0xFFFFLL;
  if ((_WORD)a2 == 0xFFFF)
    goto LABEL_23;
  v5 = 0;
  if ((a2 & 0xFF0000) == 0xFF0000)
    goto LABEL_24;
  v2 = 0;
  v3 = 16711680;
  v4 = 0xFFFFLL;
  if (!HIWORD(a2))
    goto LABEL_23;
  v5 = 0;
  if ((a2 & 0xFFFF00000000) == 0)
    goto LABEL_24;
  v2 = 0;
  v6 = *(_QWORD *)(result + 40);
  v3 = 16711680;
  v4 = 0xFFFFLL;
  if (*(_WORD *)(result + 40) == 0xFFFF)
    goto LABEL_23;
  v5 = 0;
  if ((v6 & 0xFF0000) == 0xFF0000)
    goto LABEL_24;
  v2 = 0;
  v3 = 16711680;
  v4 = 0xFFFFLL;
  if (!HIWORD(v6))
  {
LABEL_23:
    v5 = 0;
  }
  else
  {
    v5 = 0;
    if ((v6 & 0xFFFF00000000) != 0)
    {
      v4 = 0;
      if (BYTE2(a2) <= BYTE2(v6))
        v7 = BYTE2(v6);
      else
        v7 = BYTE2(a2);
      if ((unsigned __int16)a2 <= (unsigned __int16)v6)
        v8 = (unsigned __int16)*(_QWORD *)(result + 40);
      else
        v8 = (unsigned __int16)a2;
      if ((BYTE4(a2) + BYTE2(a2) - 1) >= (BYTE4(v6) + BYTE2(v6) - 1))
        v9 = (BYTE4(v6) + BYTE2(v6) - 1);
      else
        v9 = (BYTE4(a2) + BYTE2(a2) - 1);
      v10 = (unsigned __int16)(v6 + HIWORD(v6) - 1);
      if ((unsigned __int16)(a2 + HIWORD(a2) - 1) < v10)
        v10 = (unsigned __int16)(a2 + HIWORD(a2) - 1);
      v3 = 0;
      v2 = 0;
      v5 = 0;
      if (v8 <= v10 && v7 <= v9)
      {
        v5 = ((unint64_t)(v10 - v8) << 48) + 0x1000000000000;
        v2 = (unint64_t)(unsigned __int16)(v9 - v7 + 1) << 32;
        v3 = v7 << 16;
        v4 = v8;
      }
    }
  }
LABEL_24:
  v11 = v3 | v5 | v4 | v2;
  if ((_WORD)v11 != 0xFFFF && (v11 & 0xFF0000) != 0xFF0000 && HIWORD(v11) != 0 && (v11 & 0xFFFF00000000) != 0)
    return objc_msgSend(*(id *)(result + 32), "p_insertRangeIntoRegion:");
  return result;
}

- (id)regionByIntersectingColumnIndices:(id)a3
{
  TSTCellRegion *v5;
  _QWORD v7[6];

  v5 = objc_alloc_init(TSTCellRegion);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__TSTCellRegion_regionByIntersectingColumnIndices___block_invoke;
  v7[3] = &unk_24D82F1B0;
  v7[4] = self;
  v7[5] = v5;
  objc_msgSend(a3, "enumerateRangesUsingBlock:", v7);
  -[TSTCellRegion p_calculateAncillaryInformation](v5, "p_calculateAncillaryInformation");
  return v5;
}

uint64_t __51__TSTCellRegion_regionByIntersectingColumnIndices___block_invoke(uint64_t a1, unsigned __int8 a2, unsigned __int16 a3)
{
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  if (a3 >= 0xFFu)
    v3 = 255;
  else
    v3 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__TSTCellRegion_regionByIntersectingColumnIndices___block_invoke_2;
  v6[3] = &unk_24D82F0C0;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v6[5] = ((unint64_t)a2 << 16) | (v3 << 32) | 0xFFFF000000000000;
  return objc_msgSend(v4, "enumerateCellRangesUsingBlock:", v6);
}

uint64_t __51__TSTCellRegion_regionByIntersectingColumnIndices___block_invoke_2(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;

  v2 = 0;
  v3 = 16711680;
  v4 = 0xFFFFLL;
  if ((_WORD)a2 == 0xFFFF)
    goto LABEL_23;
  v5 = 0;
  if ((a2 & 0xFF0000) == 0xFF0000)
    goto LABEL_24;
  v2 = 0;
  v3 = 16711680;
  v4 = 0xFFFFLL;
  if (!HIWORD(a2))
    goto LABEL_23;
  v5 = 0;
  if ((a2 & 0xFFFF00000000) == 0)
    goto LABEL_24;
  v2 = 0;
  v6 = *(_QWORD *)(result + 40);
  v3 = 16711680;
  v4 = 0xFFFFLL;
  if (*(_WORD *)(result + 40) == 0xFFFF)
    goto LABEL_23;
  v5 = 0;
  if ((v6 & 0xFF0000) == 0xFF0000)
    goto LABEL_24;
  v2 = 0;
  v3 = 16711680;
  v4 = 0xFFFFLL;
  if (!HIWORD(v6))
  {
LABEL_23:
    v5 = 0;
  }
  else
  {
    v5 = 0;
    if ((v6 & 0xFFFF00000000) != 0)
    {
      v4 = 0;
      if (BYTE2(a2) <= BYTE2(v6))
        v7 = BYTE2(v6);
      else
        v7 = BYTE2(a2);
      if ((unsigned __int16)a2 <= (unsigned __int16)v6)
        v8 = (unsigned __int16)*(_QWORD *)(result + 40);
      else
        v8 = (unsigned __int16)a2;
      if ((BYTE4(a2) + BYTE2(a2) - 1) >= (BYTE4(v6) + BYTE2(v6) - 1))
        v9 = (BYTE4(v6) + BYTE2(v6) - 1);
      else
        v9 = (BYTE4(a2) + BYTE2(a2) - 1);
      v10 = (unsigned __int16)(v6 + HIWORD(v6) - 1);
      if ((unsigned __int16)(a2 + HIWORD(a2) - 1) < v10)
        v10 = (unsigned __int16)(a2 + HIWORD(a2) - 1);
      v3 = 0;
      v2 = 0;
      v5 = 0;
      if (v8 <= v10 && v7 <= v9)
      {
        v5 = ((unint64_t)(v10 - v8) << 48) + 0x1000000000000;
        v2 = (unint64_t)(unsigned __int16)(v9 - v7 + 1) << 32;
        v3 = v7 << 16;
        v4 = v8;
      }
    }
  }
LABEL_24:
  v11 = v3 | v5 | v4 | v2;
  if ((_WORD)v11 != 0xFFFF && (v11 & 0xFF0000) != 0xFF0000 && HIWORD(v11) != 0 && (v11 & 0xFFFF00000000) != 0)
    return objc_msgSend(*(id *)(result + 32), "p_insertRangeIntoRegion:");
  return result;
}

- (id)regionByAddingRows:(id)a3
{
  TSTCellRegion *v3;
  _QWORD v6[7];
  _QWORD v7[4];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v3 = self;
  if (a3)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3052000000;
    v11 = __Block_byref_object_copy__27;
    v12 = __Block_byref_object_dispose__27;
    v13 = 0;
    v13 = -[TSTCellRegion copy](self, "copy");
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v7[3] = 0;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __36__TSTCellRegion_regionByAddingRows___block_invoke;
    v6[3] = &unk_24D82F200;
    v6[5] = v7;
    v6[6] = &v8;
    v6[4] = v3;
    objc_msgSend(a3, "enumerateRangesUsingBlock:", v6);
    objc_msgSend((id)v9[5], "p_calculateAncillaryInformation");
    v3 = (TSTCellRegion *)(id)v9[5];
    _Block_object_dispose(v7, 8);
    _Block_object_dispose(&v8, 8);
  }
  return v3;
}

void __36__TSTCellRegion_regionByAddingRows___block_invoke(_QWORD *a1, __int16 a2, uint64_t a3)
{
  __int16 v3;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  TSTCellRegion *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[6];
  __int16 v12;
  __int16 v13;

  v3 = a3;
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(_QWORD *)(v5 + 24);
  v7 = v6 + a2;
  *(_QWORD *)(v5 + 24) = v6 + a3;
  v8 = objc_alloc_init(TSTCellRegion);
  v9 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __36__TSTCellRegion_regionByAddingRows___block_invoke_2;
  v11[3] = &unk_24D82F1D8;
  v12 = v7;
  v10 = a1[4];
  v13 = v3;
  v11[4] = v10;
  v11[5] = v8;
  objc_msgSend(v9, "enumerateCellRangesUsingBlock:", v11);

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = v8;
}

uint64_t __36__TSTCellRegion_regionByAddingRows___block_invoke_2(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int16 v12;
  _QWORD v14[5];

  v4 = HIWORD(a2);
  v5 = *(unsigned __int16 *)(a1 + 48);
  if (v5 > (unsigned __int16)a2)
    v6 = 1;
  else
    v6 = 2;
  if (v5 > (unsigned __int16)(a2 + HIWORD(a2) - 1))
    v6 = 0;
  if (v6 == 2)
  {
    v12 = *(_WORD *)(a1 + 50) + a2;
    return objc_msgSend(*(id *)(a1 + 40), "p_insertRangeIntoRegion:", a2 & 0xFFFFFFFF0000 | (v4 << 48) | v12);
  }
  if (v6 == 1)
  {
LABEL_13:
    v4 += *(unsigned __int16 *)(a1 + 50);
    goto LABEL_14;
  }
  v7 = (unsigned __int16)(a2 + HIWORD(a2) - 1) + 1;
  if (v7 == v5)
  {
    v8 = a2 & 0xFF0000 | v7;
    if (WORD2(a2) >= 0xFFu)
      v9 = 255;
    else
      v9 = WORD2(a2);
    v10 = v8 | (v9 << 32) | 0x1000000000000;
    v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "regionByIntersectingRange:", v10);
    if (!objc_msgSend(v11, "equalsCellRange:", v10))
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __36__TSTCellRegion_regionByAddingRows___block_invoke_3;
      v14[3] = &unk_24D82F160;
      v14[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v11, "enumerateCellRangesUsingBlock:", v14);
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_14:
  v12 = a2;
  return objc_msgSend(*(id *)(a1 + 40), "p_insertRangeIntoRegion:", a2 & 0xFFFFFFFF0000 | (v4 << 48) | v12);
}

uint64_t __36__TSTCellRegion_regionByAddingRows___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_insertRangeIntoRegion:", a2);
}

- (id)regionByAddingColumns:(id)a3
{
  TSTCellRegion *v3;
  _QWORD v6[7];
  _QWORD v7[4];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v3 = self;
  if (a3)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3052000000;
    v11 = __Block_byref_object_copy__27;
    v12 = __Block_byref_object_dispose__27;
    v13 = 0;
    v13 = -[TSTCellRegion copy](self, "copy");
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v7[3] = 0;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __39__TSTCellRegion_regionByAddingColumns___block_invoke;
    v6[3] = &unk_24D82F200;
    v6[5] = v7;
    v6[6] = &v8;
    v6[4] = v3;
    objc_msgSend(a3, "enumerateRangesUsingBlock:", v6);
    objc_msgSend((id)v9[5], "p_calculateAncillaryInformation");
    v3 = (TSTCellRegion *)(id)v9[5];
    _Block_object_dispose(v7, 8);
    _Block_object_dispose(&v8, 8);
  }
  return v3;
}

void __39__TSTCellRegion_regionByAddingColumns___block_invoke(_QWORD *a1, char a2, uint64_t a3)
{
  __int16 v3;
  uint64_t v5;
  uint64_t v6;
  char v7;
  TSTCellRegion *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[6];
  __int16 v12;
  char v13;

  v3 = a3;
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(_QWORD *)(v5 + 24);
  v7 = v6 + a2;
  *(_QWORD *)(v5 + 24) = v6 + a3;
  v8 = objc_alloc_init(TSTCellRegion);
  v9 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39__TSTCellRegion_regionByAddingColumns___block_invoke_2;
  v11[3] = &unk_24D82F228;
  v13 = v7;
  v10 = a1[4];
  v12 = v3;
  v11[4] = v10;
  v11[5] = v8;
  objc_msgSend(v9, "enumerateCellRangesUsingBlock:", v11);

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = v8;
}

uint64_t __39__TSTCellRegion_regionByAddingColumns___block_invoke_2(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;
  int v7;
  int v8;
  unint64_t v9;
  void *v10;
  _QWORD v12[5];

  v4 = a2 >> 16;
  v5 = HIDWORD(a2);
  v6 = *(unsigned __int8 *)(a1 + 50);
  if (v6 > BYTE2(a2))
    v7 = 1;
  else
    v7 = 2;
  if (v6 > (BYTE4(a2) + BYTE2(a2) - 1))
    v7 = 0;
  if (v7 == 2)
  {
    LOWORD(v4) = WORD1(a2) + *(_WORD *)(a1 + 48);
    return objc_msgSend(*(id *)(a1 + 40), "p_insertRangeIntoRegion:", a2 & 0xFFFF0000FF00FFFFLL | ((unint64_t)v4 << 16) & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)v5 << 32));
  }
  if (v7 == 1)
    goto LABEL_10;
  v8 = (BYTE4(a2) + BYTE2(a2) - 1) + 1;
  if (v8 == v6)
  {
    v9 = a2 & 0xFFFF000000000000 | (unsigned __int16)a2 | (v8 << 16) | 0x100000000;
    v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "regionByIntersectingRange:", v9);
    if (!objc_msgSend(v10, "equalsCellRange:", v9))
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __39__TSTCellRegion_regionByAddingColumns___block_invoke_3;
      v12[3] = &unk_24D82F160;
      v12[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v10, "enumerateCellRangesUsingBlock:", v12);
      return objc_msgSend(*(id *)(a1 + 40), "p_insertRangeIntoRegion:", a2 & 0xFFFF0000FF00FFFFLL | ((unint64_t)v4 << 16) & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)v5 << 32));
    }
LABEL_10:
    LOWORD(v5) = *(_WORD *)(a1 + 48) + v5;
  }
  return objc_msgSend(*(id *)(a1 + 40), "p_insertRangeIntoRegion:", a2 & 0xFFFF0000FF00FFFFLL | ((unint64_t)v4 << 16) & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)v5 << 32));
}

uint64_t __39__TSTCellRegion_regionByAddingColumns___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_insertRangeIntoRegion:", a2);
}

- (id)regionByApplyingRowMapping:(id)a3
{
  TSTCellRegion *v5;
  _QWORD v7[6];

  v5 = objc_alloc_init(TSTCellRegion);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__TSTCellRegion_regionByApplyingRowMapping___block_invoke;
  v7[3] = &unk_24D82F250;
  v7[4] = a3;
  v7[5] = v5;
  -[TSTCellRegion enumerateCellRangesUsingBlock:](self, "enumerateCellRangesUsingBlock:", v7);
  -[TSTCellRegion p_calculateAncillaryInformation](v5, "p_calculateAncillaryInformation");
  return v5;
}

uint64_t __44__TSTCellRegion_regionByApplyingRowMapping___block_invoke(uint64_t result, unint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  v3 = a2 + HIWORD(a2) - 1;
  if ((unsigned __int16)(a2 + HIWORD(a2) - 1) >= (unsigned __int16)a2)
  {
    v4 = result;
    if (WORD2(a2) >= 0xFFu)
      v5 = 255;
    else
      v5 = WORD2(a2);
    v6 = a2 & 0xFF0000 | (v5 << 32) | 0x1000000000000;
    do
      result = objc_msgSend(*(id *)(v4 + 40), "p_insertRangeIntoRegion:", v6 | objc_msgSend(*(id *)(v4 + 32), "mapIndex:", (unsigned __int16)v2++));
    while ((unsigned __int16)v2 <= (unsigned __int16)v3);
  }
  return result;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)upperLeftCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mUpperLeftCellID;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)bottomRightCellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mBottomRightCellID;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)boundingCellRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mBoundingCellRange;
}

- (unint64_t)cellCount
{
  return self->mCellCount;
}

- (BOOL)isEmpty
{
  return self->mCellRangesCount == 0;
}

- (BOOL)isRectangle
{
  return self->mCellRangesCount == 1;
}

- (BOOL)containsCellID:(id)a3
{
  BOOL v3;
  unint64_t mCellRangesCount;
  uint64_t v5;
  $CA3468F20078D5D2DB35E78E73CA60DA v6;
  BOOL v7;
  BOOL v8;

  v3 = 0;
  if (a3.var0 != 0xFFFF && (*(_QWORD *)&a3.var0 & 0xFF0000) != 0xFF0000)
  {
    mCellRangesCount = self->mCellRangesCount;
    if (mCellRangesCount)
    {
      v5 = 0;
      v3 = 1;
      do
      {
        v6 = self->mCellRanges[v5];
        if (HIWORD(*(unint64_t *)&v6))
          v7 = (*(_QWORD *)&v6 & 0xFFFF00000000) == 0;
        else
          v7 = 1;
        if (!v7 && (unsigned __int16)*(_QWORD *)&self->mCellRanges[v5] <= a3.var0)
        {
          v8 = (unsigned __int16)(v6.var0.var0 + v6.var1.var1 - 1) < a3.var0
            || v6.var0.var1 > a3.var1;
          if (!v8 && a3.var1 <= (LOBYTE(v6.var1.var0) + v6.var0.var1 - 1))
            break;
        }
        v3 = ++v5 < mCellRangesCount;
      }
      while (mCellRangesCount != v5);
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (BOOL)containsCellRange:(id)a3
{
  unint64_t v3;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 var0;
  BOOL result;
  int v7;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mBoundingCellRange;
  unsigned __int16 v9;
  unsigned int v10;
  unint64_t v11;
  int v12;
  unsigned int v13;
  int var1;
  unsigned int v15;
  int v16;
  int v17;

  var0 = a3.var0;
  result = 0;
  if (a3.var0.var0 != 0xFFFF && (*(_QWORD *)&a3 & 0xFF0000) != 0xFF0000)
  {
    result = 0;
    if (a3.var1.var1)
    {
      if ((*(_QWORD *)&a3 & 0xFFFF00000000) != 0)
      {
        v7 = a3.var1.var0;
        if (self->mCellCount < a3.var1.var0 * a3.var1.var1)
          return 0;
        if (self->mCellRangesCount != 1)
        {
          v11 = *(unint64_t *)&a3 >> 16;
          v12 = a3.var0.var0;
          v13 = a3.var1.var1 + a3.var0.var0;
          var1 = a3.var0.var1;
          v15 = a3.var1.var0 + a3.var0.var1;
          while (1)
          {
            v16 = var1;
            v17 = v11;
            if (v7)
              break;
LABEL_21:
            ++*(_DWORD *)&var0;
            v12 = var0.var0;
            result = 1;
            if (v13 <= var0.var0)
              return result;
          }
          while (1)
          {
            v3 = v3 & 0xFFFFFFFF00000000 | v12 | (v16 << 16);
            if (!-[TSTCellRegion containsCellID:](self, "containsCellID:", v3))
              return 0;
            v16 = ++v17;
            if (v15 <= v17)
              goto LABEL_21;
          }
        }
        result = 0;
        mBoundingCellRange = self->mBoundingCellRange;
        if (HIWORD(*(unint64_t *)&mBoundingCellRange)
          && (*(_QWORD *)&mBoundingCellRange & 0xFFFF00000000) != 0)
        {
          if ((unsigned __int16)*(_QWORD *)&self->mBoundingCellRange > a3.var0.var0)
            return 0;
          result = 0;
          if (mBoundingCellRange.origin.column <= a3.var0.var1)
          {
            v9 = mBoundingCellRange.origin.row + mBoundingCellRange.size.numberOfRows - 1;
            if (v9 >= a3.var0.var0)
            {
              v10 = (LOBYTE(mBoundingCellRange.size.numberOfColumns)
                                    + mBoundingCellRange.origin.column
                                    - 1);
              if (v10 >= a3.var0.var1 && v10 >= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1))
                return v9 >= (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1);
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

- (BOOL)containsCellRegion:(id)a3
{
  $6C2899CC353BE70625C5C4ACBB5C74E2 mBoundingCellRange;
  unint64_t v7;
  unsigned __int16 v9;
  unsigned int v10;
  BOOL result;
  unint64_t v12;

  if (!a3)
    return 0;
  if (self->mCellCount < *((_QWORD *)a3 + 4))
    return 0;
  mBoundingCellRange = self->mBoundingCellRange;
  if (!HIWORD(*(unint64_t *)&mBoundingCellRange) || (*(_QWORD *)&mBoundingCellRange & 0xFFFF00000000) == 0)
    return 0;
  v7 = *((_QWORD *)a3 + 3);
  if (!HIWORD(v7) || (v7 & 0xFFFF00000000) == 0)
    return 0;
  if ((unsigned __int16)*(_QWORD *)&self->mBoundingCellRange > (unsigned __int16)v7)
    return 0;
  v9 = mBoundingCellRange.origin.row + mBoundingCellRange.size.numberOfRows - 1;
  if (v9 < (unsigned __int16)v7)
    return 0;
  if (BYTE2(v7) < mBoundingCellRange.origin.column)
    return 0;
  v10 = (LOBYTE(mBoundingCellRange.size.numberOfColumns) + mBoundingCellRange.origin.column - 1);
  if (v10 < BYTE2(v7)
    || v10 < (BYTE4(v7) + BYTE2(v7) - 1)
    || v9 < (unsigned __int16)(v7 + HIWORD(v7) - 1))
  {
    return 0;
  }
  if (!*((_QWORD *)a3 + 1))
    return 1;
  v12 = 0;
  do
  {
    result = -[TSTCellRegion containsCellRange:](self, "containsCellRange:", *(_QWORD *)(*((_QWORD *)a3 + 2) + 8 * v12));
    if (!result)
      break;
    ++v12;
  }
  while (v12 < *((_QWORD *)a3 + 1));
  return result;
}

- (BOOL)equalsCellRegion:(id)a3
{
  BOOL result;
  unint64_t v6;

  if (!a3)
    return 0;
  if (self->mCellCount != *((_QWORD *)a3 + 4)
    || ((*((_QWORD *)a3 + 3) ^ *(_QWORD *)&self->mBoundingCellRange) & 0xFFFFFFFF00FFFFFFLL) != 0)
  {
    return 0;
  }
  if (!*((_QWORD *)a3 + 1))
    return 1;
  v6 = 0;
  do
  {
    result = -[TSTCellRegion containsCellRange:](self, "containsCellRange:", *(_QWORD *)(*((_QWORD *)a3 + 2) + 8 * v6));
    if (!result)
      break;
    ++v6;
  }
  while (v6 < *((_QWORD *)a3 + 1));
  return result;
}

- (BOOL)equalsCellRange:(id)a3
{
  return self->mCellCount == a3.var1.var0 * (unint64_t)a3.var1.var1
      && ((*(_QWORD *)&self->mBoundingCellRange ^ *(_QWORD *)&a3) & 0xFFFFFFFF00FFFFFFLL) == 0;
}

- (BOOL)intersectsCellRange:(id)a3
{
  unint64_t mCellRangesCount;
  uint64_t v4;
  $CA3468F20078D5D2DB35E78E73CA60DA *mCellRanges;
  _BOOL4 v6;
  BOOL v7;
  int v8;
  BOOL v9;
  unint64_t v10;
  $CA3468F20078D5D2DB35E78E73CA60DA v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  BOOL v15;
  unsigned int var1;
  uint64_t var0;
  unsigned int v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  BOOL v23;

  mCellRangesCount = self->mCellRangesCount;
  if (mCellRangesCount)
  {
    v4 = 0;
    mCellRanges = self->mCellRanges;
    v6 = (~*(_DWORD *)&a3.var0 & 0xFF0000) != 0 && a3.var0.var0 != 0xFFFF;
    v7 = (*(_QWORD *)&a3 & 0xFFFF00000000) == 0 || a3.var1.var1 == 0;
    v8 = !v7;
    v9 = 1;
    do
    {
      v10 = 0;
      v11 = mCellRanges[v4];
      if (mCellRanges[v4].var0.var0 == 0xFFFF)
      {
        v12 = 0xFFFFLL;
        v13 = 16711680;
        v14 = 0;
      }
      else
      {
        v12 = 0xFFFFLL;
        v13 = 16711680;
        v14 = 0;
        if ((*(_QWORD *)&v11 & 0xFF0000) != 0xFF0000)
        {
          if (HIWORD(*(unint64_t *)&v11))
            v15 = (*(_QWORD *)&v11 & 0xFFFF00000000) == 0;
          else
            v15 = 1;
          if (!v15 && v6 && v8)
          {
            v12 = 0;
            var1 = v11.var0.var1;
            if (v11.var0.var1 <= a3.var0.var1)
              var1 = a3.var0.var1;
            if ((unsigned __int16)*(_QWORD *)&mCellRanges[v4] <= a3.var0.var0)
              var0 = a3.var0.var0;
            else
              var0 = (unsigned __int16)*(_QWORD *)&mCellRanges[v4];
            if ((LOBYTE(v11.var1.var0) + v11.var0.var1 - 1) >= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1))
              v18 = (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1);
            else
              v18 = (LOBYTE(v11.var1.var0) + v11.var0.var1 - 1);
            if ((unsigned __int16)(v11.var0.var0 + v11.var1.var1 - 1) >= (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1))
              v19 = (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1);
            else
              v19 = (unsigned __int16)(v11.var0.var0 + v11.var1.var1 - 1);
            v13 = 0;
            v10 = 0;
            v14 = 0;
            if (var0 <= v19 && var1 <= v18)
            {
              v14 = ((unint64_t)(v19 - var0) << 48) + 0x1000000000000;
              v10 = (unint64_t)(unsigned __int16)(v18 - var1 + 1) << 32;
              v13 = var1 << 16;
              v12 = var0;
            }
          }
          else
          {
            v10 = 0;
            v14 = 0;
            v12 = 0xFFFFLL;
            v13 = 16711680;
          }
        }
      }
      v20 = v13 | v14 | v12 | v10;
      if ((_WORD)v20 != 0xFFFF)
      {
        v7 = (v20 & 0xFF0000) == 16711680;
        v21 = v20 & 0xFFFF00000000;
        v22 = HIWORD(v20);
        v23 = v7 || v22 == 0;
        if (!v23 && v21 != 0)
          break;
      }
      v9 = ++v4 < mCellRangesCount;
    }
    while (mCellRangesCount != v4);
  }
  else
  {
    return 0;
  }
  return v9;
}

- (BOOL)partiallyIntersectsCellRange:(id)a3
{
  $CA3468F20078D5D2DB35E78E73CA60DA v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int var1;
  uint64_t var0;
  unsigned int v12;
  unsigned int v13;
  BOOL result;
  unint64_t v15;
  unint64_t mCellRangesCount;
  char v17;
  unint64_t v18;
  $CA3468F20078D5D2DB35E78E73CA60DA *mCellRanges;
  unint64_t v20;
  _BOOL4 v21;
  BOOL v22;
  _BOOL4 v23;
  int v24;
  unsigned int v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unsigned int v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  unint64_t v39;
  unint64_t v40;

  v5 = -[TSTCellRegion boundingCellRange](self, "boundingCellRange");
  v6 = 0;
  v7 = 16711680;
  v8 = 0xFFFFLL;
  if (v5.var0.var0 == 0xFFFF)
    goto LABEL_23;
  v9 = 0;
  if ((*(_QWORD *)&v5 & 0xFF0000) == 0xFF0000)
    goto LABEL_24;
  v6 = 0;
  v7 = 16711680;
  v8 = 0xFFFFLL;
  if (!HIWORD(*(unint64_t *)&v5))
    goto LABEL_23;
  v9 = 0;
  if ((*(_QWORD *)&v5 & 0xFFFF00000000) == 0)
    goto LABEL_24;
  v6 = 0;
  v7 = 16711680;
  v8 = 0xFFFFLL;
  if (a3.var0.var0 == 0xFFFF)
    goto LABEL_23;
  v9 = 0;
  if ((*(_QWORD *)&a3 & 0xFF0000) == 0xFF0000)
    goto LABEL_24;
  v6 = 0;
  v7 = 16711680;
  v8 = 0xFFFFLL;
  if (!HIWORD(*(unint64_t *)&a3))
  {
LABEL_23:
    v9 = 0;
    goto LABEL_24;
  }
  v9 = 0;
  if ((*(_QWORD *)&a3 & 0xFFFF00000000) != 0)
  {
    v8 = 0;
    if (v5.var0.var1 <= a3.var0.var1)
      var1 = a3.var0.var1;
    else
      var1 = v5.var0.var1;
    if (v5.var0.var0 <= a3.var0.var0)
      var0 = a3.var0.var0;
    else
      var0 = v5.var0.var0;
    if ((LOBYTE(v5.var1.var0) + v5.var0.var1 - 1) >= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1))
      v12 = (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1);
    else
      v12 = (LOBYTE(v5.var1.var0) + v5.var0.var1 - 1);
    v13 = (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1);
    if ((unsigned __int16)(v5.var0.var0 + v5.var1.var1 - 1) < v13)
      v13 = (unsigned __int16)(v5.var0.var0 + v5.var1.var1 - 1);
    v7 = 0;
    v6 = 0;
    v9 = 0;
    if (var0 <= v13 && var1 <= v12)
    {
      v9 = ((unint64_t)(v13 - var0) << 48) + 0x1000000000000;
      v6 = (unint64_t)(unsigned __int16)(v12 - var1 + 1) << 32;
      v7 = var1 << 16;
      v8 = var0;
    }
  }
LABEL_24:
  result = 0;
  v15 = v7 | v9 | v8 | v6;
  if ((_WORD)v15 != 0xFFFF && (v15 & 0xFF0000) != 0xFF0000)
  {
    result = 0;
    if (HIWORD(v15))
    {
      if ((v15 & 0xFFFF00000000) != 0)
      {
        mCellRangesCount = self->mCellRangesCount;
        if (mCellRangesCount)
        {
          v17 = 0;
          v18 = (v15 ^ *(_QWORD *)&a3) & 0xFFFFFFFF00FFFFFFLL;
          mCellRanges = self->mCellRanges;
          v20 = HIWORD(*(unint64_t *)&a3);
          v21 = (~*(_DWORD *)&a3.var0 & 0xFF0000) != 0 && a3.var0.var0 != 0xFFFF;
          v22 = v20 == 0;
          v23 = v20 == 0;
          v24 = !v22;
          if ((*(_QWORD *)&a3 & 0xFFFF00000000) == 0)
            v23 = 1;
          v25 = a3.var0.var1;
          if ((*(_QWORD *)&a3 & 0xFFFF00000000) == 0)
            v24 = 0;
          if (a3.var0.var1 <= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1))
            v25 = (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1);
          while (1)
          {
            v27 = (unint64_t)*mCellRanges++;
            v26 = v27;
            v28 = HIWORD(v27);
            v29 = HIWORD(v27) == 0;
            v30 = v27 & 0xFFFF00000000;
            if ((v27 & 0xFFFF00000000) == 0)
              v29 = 1;
            if (!v29
              && !v23
              && (unsigned __int16)v26 <= a3.var0.var0
              && (unsigned __int16)(v26 + v28 - 1) >= a3.var0.var0
              && BYTE2(v26) <= a3.var0.var1
              && v25 <= (BYTE4(v26) + BYTE2(v26) - 1)
              && (unsigned __int16)(v26 + v28 - 1) >= (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1))
            {
              return 0;
            }
            v31 = 0;
            if ((_WORD)v26 != 0xFFFF)
            {
              v32 = 0xFFFFLL;
              v33 = 16711680;
              v34 = 0;
              if ((v26 & 0xFF0000) == 0xFF0000)
                goto LABEL_71;
              v31 = 0;
              if (v28)
              {
                v32 = 0xFFFFLL;
                v33 = 16711680;
                v34 = 0;
                if (v30)
                {
                  if (v21 && v24)
                  {
                    v32 = 0;
                    if (BYTE2(v26) <= a3.var0.var1)
                      v35 = a3.var0.var1;
                    else
                      v35 = BYTE2(v26);
                    if ((unsigned __int16)v26 <= a3.var0.var0)
                      v36 = a3.var0.var0;
                    else
                      v36 = (unsigned __int16)v26;
                    if ((BYTE4(v26) + BYTE2(v26) - 1) >= (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1))
                      v37 = (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1);
                    else
                      v37 = (BYTE4(v26) + BYTE2(v26) - 1);
                    v38 = (unsigned __int16)(v26 + v28 - 1);
                    if (v38 >= (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1))
                      v38 = (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1);
                    v33 = 0;
                    v31 = 0;
                    v34 = 0;
                    if (v36 <= v38 && v35 <= v37)
                    {
                      v34 = ((unint64_t)(v38 - v36) << 48) + 0x1000000000000;
                      v31 = (unint64_t)(unsigned __int16)(v37 - v35 + 1) << 32;
                      v33 = v35 << 16;
                      v32 = v36;
                    }
                  }
                  else
                  {
                    v31 = 0;
                    v34 = 0;
                    v32 = 0xFFFFLL;
                    v33 = 16711680;
                  }
                }
                goto LABEL_71;
              }
            }
            v32 = 0xFFFFLL;
            v33 = 16711680;
            v34 = 0;
LABEL_71:
            v39 = v33 | v34 | v32 | v31;
            if ((_WORD)v39 != 0xFFFF && (v39 & 0xFF0000) != 0xFF0000)
            {
              if (HIWORD(v39))
              {
                if ((v39 & 0xFFFF00000000) != 0)
                {
                  v40 = v39 & 0xFFFFFFFF00FFFFFFLL;
                  v17 |= v40 != 0;
                  if (v40)
                  {
                    if (v18)
                      return 1;
                  }
                }
              }
            }
            if (!--mCellRangesCount)
            {
              if ((v17 & 1) == 0)
                return 0;
              return !-[TSTCellRegion containsCellRange:](self, "containsCellRange:", a3);
            }
          }
        }
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)intersectsColumn:(unsigned __int8)a3
{
  return a3 != 255 && -[NSIndexSet containsIndex:](self->mIntersectingColumnsIndexSet, "containsIndex:", a3);
}

- (BOOL)intersectsRow:(unsigned __int16)a3
{
  return a3 != 0xFFFF && -[NSIndexSet containsIndex:](self->mIntersectingRowsIndexSet, "containsIndex:", a3);
}

- (unsigned)numberOfIntersectingColumns
{
  return -[NSIndexSet count](self->mIntersectingColumnsIndexSet, "count");
}

- (unsigned)numberOfIntersectingRows
{
  return -[NSIndexSet count](self->mIntersectingRowsIndexSet, "count");
}

- (id)intersectingColumnsIndexSet
{
  return self->mIntersectingColumnsIndexSet;
}

- (id)intersectingRowsIndexSet
{
  return self->mIntersectingRowsIndexSet;
}

- (BOOL)isValid
{
  return self->mCellRangesCount != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSTCellRegion *v5;
  TSTCellRegion *v6;
  unint64_t mCellRangesCount;
  $CA3468F20078D5D2DB35E78E73CA60DA *v8;

  v5 = -[TSTCellRegion init](+[TSTCellRegion allocWithZone:](TSTCellRegion, "allocWithZone:"), "init");
  v6 = v5;
  v5->mCellRangesCount = self->mCellRangesCount;
  mCellRangesCount = self->mCellRangesCount;
  if (mCellRangesCount)
  {
    v8 = ($CA3468F20078D5D2DB35E78E73CA60DA *)malloc_type_malloc(8 * mCellRangesCount, 0x100004000313F17uLL);
    v6->mCellRanges = v8;
    memcpy(v8, self->mCellRanges, 8 * self->mCellRangesCount);
  }
  else
  {
    v5->mCellRanges = 0;
  }
  v6->mBoundingCellRange = self->mBoundingCellRange;
  v6->mCellCount = self->mCellCount;
  v6->mIntersectingColumnsIndexSet = (NSIndexSet *)-[NSIndexSet copyWithZone:](self->mIntersectingColumnsIndexSet, "copyWithZone:", a3);
  v6->mIntersectingRowsIndexSet = (NSIndexSet *)-[NSIndexSet copyWithZone:](self->mIntersectingRowsIndexSet, "copyWithZone:", a3);
  v6->mUpperLeftCellID = self->mUpperLeftCellID;
  v6->mBottomRightCellID = self->mBottomRightCellID;
  return v6;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)suitableAnchor
{
  $CA3468F20078D5D2DB35E78E73CA60DA *mCellRanges;

  if (self->mCellRangesCount)
    mCellRanges = self->mCellRanges;
  else
    mCellRanges = ($CA3468F20078D5D2DB35E78E73CA60DA *)&TSTInvalidCellID;
  return mCellRanges->var0;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)suitableCursor
{
  if (self->mCellRangesCount)
    return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)((*(_QWORD *)self->mCellRanges
                                              + ((*(unint64_t *)self->mCellRanges >> 16) & 0xFF0000)
                                              + 16711680) & 0xFF0000 | (unsigned __int16)(*(_QWORD *)self->mCellRanges
                                                                                        + HIWORD(*(unint64_t *)self->mCellRanges)
                                                                                        - 1));
  else
    return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)0xFFFFFF;
}

- (id)iterator
{
  return -[TSTCellRegionRowMajorIterator initWithCellRegion:]([TSTCellRegionRowMajorIterator alloc], "initWithCellRegion:", self);
}

- (id)rightToLeftIterator
{
  return -[TSTCellRegionRowMajorReverseIterator initWithCellRegion:]([TSTCellRegionRowMajorReverseIterator alloc], "initWithCellRegion:", self);
}

- (id)topToBottomIterator
{
  return -[TSTCellRegionColMajorIterator initWithCellRegion:]([TSTCellRegionColMajorIterator alloc], "initWithCellRegion:", self);
}

- (void)enumerateCellIDsUsingBlock:(id)a3
{
  unint64_t v3;
  id v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  char v10;

  v10 = 0;
  v5 = -[TSTCellRegion iterator](self, "iterator");
  v6 = objc_msgSend(v5, "getNext");
  if ((_WORD)v6 != 0xFFFF)
  {
    v7 = v6;
    if ((v6 & 0xFF0000) != 0xFF0000)
    {
      do
      {
        v3 = v3 & 0xFFFFFFFF00000000 | v7;
        (*((void (**)(id, unint64_t, char *))a3 + 2))(a3, v3, &v10);
        v8 = objc_msgSend(v5, "getNext");
        if ((_WORD)v8 == 0xFFFF)
          break;
        v7 = v8;
      }
      while ((v8 & 0xFF0000) != 0xFF0000 && v10 == 0);
    }
  }
}

- (void)enumerateCellRangesUsingBlock:(id)a3
{
  unint64_t v5;
  char v7;

  v7 = 0;
  if (self->mCellRangesCount)
  {
    v5 = 0;
    do
      (*((void (**)(id, _QWORD, char *))a3 + 2))(a3, *(_QWORD *)&self->mCellRanges[v5++], &v7);
    while (v5 < self->mCellRangesCount && v7 == 0);
  }
}

- (void)enumerateColumnsUsingBlock:(id)a3
{
  NSIndexSet *mIntersectingColumnsIndexSet;
  _QWORD v4[5];

  mIntersectingColumnsIndexSet = self->mIntersectingColumnsIndexSet;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__TSTCellRegion_enumerateColumnsUsingBlock___block_invoke;
  v4[3] = &unk_24D82B230;
  v4[4] = a3;
  -[NSIndexSet enumerateIndexesUsingBlock:](mIntersectingColumnsIndexSet, "enumerateIndexesUsingBlock:", v4);
}

uint64_t __44__TSTCellRegion_enumerateColumnsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  NSIndexSet *mIntersectingRowsIndexSet;
  _QWORD v4[5];

  mIntersectingRowsIndexSet = self->mIntersectingRowsIndexSet;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__TSTCellRegion_enumerateRowsUsingBlock___block_invoke;
  v4[3] = &unk_24D82B230;
  v4[4] = a3;
  -[NSIndexSet enumerateIndexesUsingBlock:](mIntersectingRowsIndexSet, "enumerateIndexesUsingBlock:", v4);
}

uint64_t __41__TSTCellRegion_enumerateRowsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateInDirection:(int)a3 usingBlock:(id)a4
{
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v4 = 48;
  if (a3 == 1)
    v4 = 40;
  v5 = *(Class *)((char *)&self->super.isa + v4);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__TSTCellRegion_enumerateInDirection_usingBlock___block_invoke;
  v6[3] = &unk_24D82B230;
  v6[4] = a4;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v6);
}

uint64_t __49__TSTCellRegion_enumerateInDirection_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateRowRangesUsingBlock:(id)a3
{
  -[NSIndexSet enumerateRangesUsingBlock:](self->mIntersectingRowsIndexSet, "enumerateRangesUsingBlock:", a3);
}

- (void)enumerateColumnRangesUsingBlock:(id)a3
{
  -[NSIndexSet enumerateRangesUsingBlock:](self->mIntersectingColumnsIndexSet, "enumerateRangesUsingBlock:", a3);
}

- (void)p_insertRangeIntoRegion:(id)a3
{
  unsigned int var1;
  $CA3468F20078D5D2DB35E78E73CA60DA *mCellRanges;
  unint64_t mCellRangesCount;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 var0;
  unint64_t v14;
  BOOL v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  $CA3468F20078D5D2DB35E78E73CA60DA *v25;
  unint64_t v26;
  unint64_t v27;

  if (a3.var0.var0 == 0xFFFF)
    return;
  if ((*(_QWORD *)&a3 & 0xFF0000) == 0xFF0000)
    return;
  var1 = a3.var1.var1;
  if (!a3.var1.var1 || (*(_QWORD *)&a3 & 0xFFFF00000000) == 0)
    return;
  mCellRangesCount = self->mCellRangesCount;
  mCellRanges = self->mCellRanges;
  if (mCellRangesCount)
  {
    v8 = 0;
    v9 = mCellRangesCount - 1;
    v10 = (unint64_t)mCellRanges[mCellRangesCount - 1];
    v11 = 16711680;
    v12 = 0xFFFFLL;
    var0 = a3.var1.var0;
    if (mCellRanges[mCellRangesCount - 1].var0.var0 == 0xFFFF)
    {
      v14 = 0;
    }
    else
    {
      v14 = 0;
      if ((v10 & 0xFF0000) != 0xFF0000)
      {
        if (HIWORD(v10))
          v15 = (v10 & 0xFFFF00000000) == 0;
        else
          v15 = 1;
        if (v15)
        {
          v8 = 0;
          v14 = 0;
          v11 = 16711680;
          v12 = 0xFFFFLL;
        }
        else
        {
          v12 = 0;
          v16 = a3.var0.var1;
          if (BYTE2(v10) > a3.var0.var1)
            v16 = BYTE2(v10);
          if ((unsigned __int16)*(_QWORD *)&mCellRanges[mCellRangesCount - 1] <= a3.var0.var0)
            v17 = a3.var0.var0;
          else
            v17 = (unsigned __int16)*(_QWORD *)&mCellRanges[mCellRangesCount - 1];
          if ((BYTE4(v10) + BYTE2(v10) - 1) >= (LOBYTE(a3.var1.var0)
                                                                                               + a3.var0.var1
                                                                                               - 1))
            v18 = (LOBYTE(a3.var1.var0) + a3.var0.var1 - 1);
          else
            v18 = (BYTE4(v10) + BYTE2(v10) - 1);
          if ((unsigned __int16)(v10 + HIWORD(v10) - 1) >= (unsigned __int16)(a3.var0.var0
                                                                                           + a3.var1.var1
                                                                                           - 1))
            v19 = (unsigned __int16)(a3.var0.var0 + a3.var1.var1 - 1);
          else
            v19 = (unsigned __int16)(v10 + HIWORD(v10) - 1);
          v11 = 0;
          v8 = 0;
          v14 = 0;
          if (v17 <= v19 && v16 <= v18)
          {
            v14 = ((unint64_t)(v19 - v17) << 48) + 0x1000000000000;
            v8 = (unint64_t)(unsigned __int16)(v18 - v16 + 1) << 32;
            v11 = v16 << 16;
            v12 = v17;
          }
        }
      }
    }
    v20 = v11 | v14 | v12 | v8;
    if ((_WORD)v20 != 0xFFFF && (v20 & 0xFF0000) != 0xFF0000 && HIWORD(v20) && (v20 & 0xFFFF00000000) != 0)
    {
      v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSTCellRegion p_insertRangeIntoRegion:]");
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellRegion.mm"), 1254, CFSTR("should never overlap."));
      mCellRangesCount = self->mCellRangesCount;
      mCellRanges = self->mCellRanges;
      v9 = mCellRangesCount - 1;
      v10 = (unint64_t)mCellRanges[mCellRangesCount - 1];
    }
    v23 = TSTCellRangeUnionCellRange(v10, *(_QWORD *)&a3);
    if (WORD2(v23) * HIWORD(v23) == a3.var1.var0 * var1 + WORD2(v10) * HIWORD(v10))
    {
      mCellRanges[v9] = ($CA3468F20078D5D2DB35E78E73CA60DA)v23;
      v24 = self->mCellRangesCount;
      goto LABEL_38;
    }
  }
  else
  {
    var0 = a3.var1.var0;
  }
  v25 = ($CA3468F20078D5D2DB35E78E73CA60DA *)malloc_type_realloc(mCellRanges, 8 * mCellRangesCount + 8, 0x100004000313F17uLL);
  self->mCellRanges = v25;
  v25[self->mCellRangesCount] = a3;
  v24 = self->mCellRangesCount + 1;
  self->mCellRangesCount = v24;
LABEL_38:
  v26 = TSTCellRangeUnionCellRange(*(_QWORD *)&self->mBoundingCellRange, *(_QWORD *)&a3);
  v27 = self->mCellCount + var0 * (unint64_t)var1;
  self->mBoundingCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)v26;
  self->mCellCount = v27;
  if (v24 >= 2 && v27 == WORD2(v26) * HIWORD(v26))
  {
    *self->mCellRanges = ($CA3468F20078D5D2DB35E78E73CA60DA)v26;
    self->mCellRangesCount = 1;
  }
}

- (void)p_calculateAncillaryInformation
{
  -[TSTCellRegion p_calculateIntersectingColumns](self, "p_calculateIntersectingColumns");
  -[TSTCellRegion p_calculateIntersectingRows](self, "p_calculateIntersectingRows");
  -[TSTCellRegion p_calculateUpperLeftAndBottomRightCellID](self, "p_calculateUpperLeftAndBottomRightCellID");
}

- (void)p_calculateIntersectingColumns
{
  NSIndexSet *v3;
  uint64_t v4;
  unint64_t v5;
  NSIndexSet *v6;

  v3 = (NSIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
  v6 = v3;
  if (self->mCellRangesCount)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      -[NSIndexSet addIndexesInRange:](v6, "addIndexesInRange:", self->mCellRanges[v4].var0.var1, self->mCellRanges[v4].var1.var0);
      v3 = v6;
      ++v5;
      ++v4;
    }
    while (v5 < self->mCellRangesCount);
  }
  if (-[NSIndexSet count](v3, "count"))
    self->mIntersectingColumnsIndexSet = v6;
  else

}

- (void)p_calculateIntersectingRows
{
  NSIndexSet *v3;
  uint64_t v4;
  unint64_t v5;
  NSIndexSet *v6;

  v3 = (NSIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
  v6 = v3;
  if (self->mCellRangesCount)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      -[NSIndexSet addIndexesInRange:](v6, "addIndexesInRange:", self->mCellRanges[v4].var0.var0, self->mCellRanges[v4].var1.var1);
      v3 = v6;
      ++v5;
      ++v4;
    }
    while (v5 < self->mCellRangesCount);
  }
  if (-[NSIndexSet count](v3, "count"))
    self->mIntersectingRowsIndexSet = v6;
  else

}

- (void)p_calculateUpperLeftAndBottomRightCellID
{
  _QWORD v3[6];
  uint64_t v4;
  $5CFCD363C99B2F51819B67AD7AD2E060 *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t (*v8)();
  void *v9;
  int v10;
  uint64_t v11;
  $5CFCD363C99B2F51819B67AD7AD2E060 *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t (*v15)();
  void *v16;
  int v17;

  v11 = 0;
  v12 = ($5CFCD363C99B2F51819B67AD7AD2E060 *)&v11;
  v13 = 0x3812000000;
  v14 = __Block_byref_object_copy__17;
  v15 = __Block_byref_object_dispose__18;
  v16 = &unk_217C8B239;
  v17 = 0xFFFFFF;
  v4 = 0;
  v5 = ($5CFCD363C99B2F51819B67AD7AD2E060 *)&v4;
  v6 = 0x3812000000;
  v7 = __Block_byref_object_copy__17;
  v8 = __Block_byref_object_dispose__18;
  v9 = &unk_217C8B239;
  v10 = 0xFFFFFF;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__TSTCellRegion_p_calculateUpperLeftAndBottomRightCellID__block_invoke;
  v3[3] = &unk_24D82F278;
  v3[4] = &v11;
  v3[5] = &v4;
  -[TSTCellRegion enumerateCellRangesUsingBlock:](self, "enumerateCellRangesUsingBlock:", v3);
  self->mUpperLeftCellID = v12[12];
  self->mBottomRightCellID = v5[12];
  _Block_object_dispose(&v4, 8);
  _Block_object_dispose(&v11, 8);
}

uint64_t __57__TSTCellRegion_p_calculateUpperLeftAndBottomRightCellID__block_invoke(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  BOOL v8;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v3 = *(_DWORD *)(v2 + 48);
  if (*(_WORD *)(v2 + 48) == 0xFFFF
    || (*(_QWORD *)&v3 & 0xFF0000) == 0xFF0000
    || (unsigned __int16)a2 < (unsigned __int16)v3
    || (unsigned __int16)a2 == (unsigned __int16)*(_DWORD *)(v2 + 48) && BYTE2(a2) < BYTE2(v3))
  {
    *(_WORD *)(v2 + 48) = a2;
    *(_BYTE *)(v2 + 50) = BYTE2(a2);
    *(_BYTE *)(v2 + 51) = BYTE3(a2);
  }
  v4 = a2 + ((a2 >> 16) & 0xFF0000) + 16711680;
  v5 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v6 = *(_DWORD *)(v5 + 48);
  if (*(_WORD *)(v5 + 48) == 0xFFFF
    || (*(_QWORD *)&v6 & 0xFF0000) == 0xFF0000
    || (unsigned __int16)(a2 + HIWORD(a2) - 1) > (unsigned __int16)v6
    || ((v7 = BYTE2(v6), (unsigned __int16)(a2 + HIWORD(a2) - 1) == (unsigned __int16)*(_DWORD *)(v5 + 48))
      ? (v8 = BYTE2(v4) > v7)
      : (v8 = 0),
        v8))
  {
    *(_WORD *)(v5 + 48) = a2 + HIWORD(a2) - 1;
    *(_BYTE *)(v5 + 50) = BYTE2(v4);
    *(_BYTE *)(v5 + 51) = 0;
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mBoundingCellRange;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  $CA3468F20078D5D2DB35E78E73CA60DA v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  mBoundingCellRange = self->mBoundingCellRange;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), mBoundingCellRange.origin.column, mBoundingCellRange.origin.row);
  v9 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p boundingbox=%@"), v5, self, objc_msgSend(v7, "stringWithFormat:", CFSTR("(%@, %@)"), v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hux%hu"), mBoundingCellRange.size.numberOfColumns, HIWORD(*(unint64_t *)&mBoundingCellRange))));
  v10 = v9;
  if (self->mCellRanges)
  {
    objc_msgSend(v9, "appendString:", CFSTR(" cellRanges={"));
    if (self->mCellRangesCount)
    {
      v11 = 0;
      do
      {
        v12 = self->mCellRanges[v11];
        v13 = (void *)MEMORY[0x24BDD17C8];
        v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), v12.var0.var1, v12.var0.var0);
        objc_msgSend(v10, "appendFormat:", CFSTR("\n  { %@ }"), objc_msgSend(v13, "stringWithFormat:", CFSTR("(%@, %@)"), v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hux%hu"), v12.var1.var0, HIWORD(*(unint64_t *)&v12))));
        ++v11;
      }
      while (v11 < self->mCellRangesCount);
    }
    v15 = CFSTR("}>");
  }
  else
  {
    v15 = CFSTR(" cellRanges={empty}>");
  }
  objc_msgSend(v10, "appendString:", v15);
  return v10;
}

- (void)fillCellRangeRowMajorSet:(void *)a3 leftToRight:(BOOL)a4
{
  unint64_t mCellRangesCount;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  $CA3468F20078D5D2DB35E78E73CA60DA v10;

  mCellRangesCount = self->mCellRangesCount;
  if (a4)
  {
    if (mCellRangesCount)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        std::__tree<TSUColumnRowRect,TSTCellRangeRowMajorLess,std::allocator<TSUColumnRowRect>>::__emplace_unique_key_args<TSUColumnRowRect,TSUColumnRowRect const&>((uint64_t **)a3, (unsigned __int16 *)&self->mCellRanges[v7], (uint64_t *)&self->mCellRanges[v7]);
        ++v8;
        ++v7;
      }
      while (v8 < self->mCellRangesCount);
    }
  }
  else if (mCellRangesCount)
  {
    v9 = 0;
    do
    {
      v10 = self->mCellRanges[v9];
      v10.var0.var1 = ~(*(_DWORD *)&v10.var1 + HIWORD(*(_DWORD *)&v10.var0));
      std::__tree<TSUColumnRowRect,TSTCellRangeRowMajorLess,std::allocator<TSUColumnRowRect>>::__emplace_unique_key_args<TSUColumnRowRect,TSUColumnRowRect const&>((uint64_t **)a3, (unsigned __int16 *)&v10, (uint64_t *)&v10);
      ++v9;
    }
    while (v9 < self->mCellRangesCount);
  }
  std::__tree<TSUColumnRowRect,TSTCellRangeRowMajorLess,std::allocator<TSUColumnRowRect>>::__emplace_unique_key_args<TSUColumnRowRect,TSUColumnRowRect const&>((uint64_t **)a3, (unsigned __int16 *)&TSTInvalidCellRange, &TSTInvalidCellRange);
}

- (void)fillCellRangeColMajorSet:(void *)a3 leftToRight:(BOOL)a4
{
  unint64_t mCellRangesCount;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  $CA3468F20078D5D2DB35E78E73CA60DA v10;

  mCellRangesCount = self->mCellRangesCount;
  if (a4)
  {
    if (mCellRangesCount)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        std::__tree<TSUColumnRowRect,TSTCellRangeColumnMajorLess,std::allocator<TSUColumnRowRect>>::__emplace_unique_key_args<TSUColumnRowRect,TSUColumnRowRect const&>((uint64_t **)a3, (unsigned __int16 *)&self->mCellRanges[v7], (uint64_t *)&self->mCellRanges[v7]);
        ++v8;
        ++v7;
      }
      while (v8 < self->mCellRangesCount);
    }
  }
  else if (mCellRangesCount)
  {
    v9 = 0;
    do
    {
      v10 = self->mCellRanges[v9];
      v10.var0.var1 = ~(*(_DWORD *)&v10.var1 + HIWORD(*(_DWORD *)&v10.var0));
      std::__tree<TSUColumnRowRect,TSTCellRangeColumnMajorLess,std::allocator<TSUColumnRowRect>>::__emplace_unique_key_args<TSUColumnRowRect,TSUColumnRowRect const&>((uint64_t **)a3, (unsigned __int16 *)&v10, (uint64_t *)&v10);
      ++v9;
    }
    while (v9 < self->mCellRangesCount);
  }
  std::__tree<TSUColumnRowRect,TSTCellRangeColumnMajorLess,std::allocator<TSUColumnRowRect>>::__emplace_unique_key_args<TSUColumnRowRect,TSUColumnRowRect const&>((uint64_t **)a3, (unsigned __int16 *)&TSTInvalidCellRange, &TSTInvalidCellRange);
}

@end
