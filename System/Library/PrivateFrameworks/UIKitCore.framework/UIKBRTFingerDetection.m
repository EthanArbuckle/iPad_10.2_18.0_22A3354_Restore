@implementation UIKBRTFingerDetection

void __54___UIKBRTFingerDetection_touchIdentifiersForFingerId___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(a3, "identity") == *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }

}

void __54___UIKBRTFingerDetection_touchIdentifiersForFingerId___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "identity") == *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __51___UIKBRTFingerDetection_touchLocationForFingerId___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "identity") == *(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

BOOL __93___UIKBRTFingerDetection_fingerIdsRelatedToTouchWithIdentifier_sinceTimestamp_includeThumbs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  double v7;

  v3 = a2;
  if (objc_msgSend(v3, "identity") == *(_QWORD *)(a1 + 40))
  {
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "identity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", v6))
    {
      objc_msgSend(v3, "lastSeenTimestamp");
      v4 = v7 > *(double *)(a1 + 48);
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

uint64_t __102___UIKBRTFingerDetection__linkTouchesInArray_withIndexes_opposingHandIndexes_unassignedIndexes_thumb___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  double v6;

  result = objc_msgSend(a2, "location");
  if (a3)
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = vabdd_f64(v6, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24))+ *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 24);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  return result;
}

void __99___UIKBRTFingerDetection__updateTouchInfoFromOutsideInWithArray_indexes_newIdentityDict_fakeIndex___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    *a4 = 1;
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v13);
    v8 = *(void **)(a1 + 48);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "intValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addIndex:", v7);

    objc_msgSend(*(id *)(a1 + 56), "removeIndex:", v7);
  }

}

uint64_t __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "location");
  v7 = v6;
  objc_msgSend(v5, "location");
  v9 = v7 - v8;
  if (v9 < 0.0)
  {
LABEL_5:
    v10 = -1;
    goto LABEL_6;
  }
  if (v9 <= 0.0)
  {
    objc_msgSend(v5, "location");
    v12 = v11;
    objc_msgSend(v4, "location");
    if (v12 - v13 >= 0.0)
    {
      v10 = v12 - v13 > 0.0;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v10 = 1;
LABEL_6:

  return v10;
}

double __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "location");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

double __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  double result;

  objc_msgSend(a2, "location");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = (v3 - *(double *)(a1 + 40)) * (v3 - *(double *)(a1 + 40)) + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

BOOL __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_4(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "location");
  return v3 >= *(double *)(a1 + 32);
}

BOOL __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_5(uint64_t a1, void *a2)
{
  double v3;
  double v4;

  objc_msgSend(a2, "location");
  v4 = v3 - *(double *)(a1 + 32);
  return v4 > 0.0 && v4 * v4 > *(double *)(a1 + 40) * 3.0;
}

void __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_6(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (a2 < a2 + a3)
  {
    v17 = v6;
    v18 = v5;
    v19 = v4;
    v20 = v3;
    v21 = v7;
    v22 = v8;
    v9 = a3;
    v10 = a2;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v10, v17, v18, v19, v20, v21, v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "location");
      v14 = vabdd_f64(v13, *(double *)(a1 + 72));
      v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      if (v14 >= v15)
      {
        if (v14 < *(double *)(v16 + 24))
        {
          *(double *)(v16 + 24) = v14;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
        }
      }
      else
      {
        *(double *)(v16 + 24) = v15;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                + 24);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v10;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v14;
      }

      ++v10;
      --v9;
    }
    while (v9);
  }
}

BOOL __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == a2
      || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == a2;
}

void __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectAtIndex:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentity:", (int)objc_msgSend(v6, "intValue"));

}

void *__54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  void *v7;
  double v8;
  id *v9;
  void *result;
  double v11;

  objc_msgSend(a2, "location");
  v6 = v5;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v7, "location");
    if (v6 < v8)
    {
      v9 = (id *)(a1 + 40);
      return (void *)objc_msgSend(*v9, "addIndex:", a3);
    }
  }
  result = *(void **)(a1 + 48);
  if (result)
  {
    result = (void *)objc_msgSend(result, "location");
    if (v6 > v11)
    {
      v9 = (id *)(a1 + 56);
      return (void *)objc_msgSend(*v9, "addIndex:", a3);
    }
  }
  return result;
}

uint64_t __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  double v6;
  id *v7;

  result = objc_msgSend(a2, "location");
  if (v6 >= *(double *)(a1 + 48))
  {
    if (v6 <= *(double *)(a1 + 56))
      return result;
    v7 = (id *)(a1 + 40);
  }
  else
  {
    v7 = (id *)(a1 + 32);
  }
  return objc_msgSend(*v7, "addIndex:", a3);
}

void __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (int)objc_msgSend(v7, "intValue");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_12;
    v8[3] = &unk_1E16D8860;
    v9 = *(id *)(a1 + 32);
    v10 = v6;
    objc_msgSend(v5, "enumerateRangesUsingBlock:", v8);

  }
}

void __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_12(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2 < a2 + a3)
  {
    v16 = v8;
    v17 = v7;
    v18 = v6;
    v19 = v5;
    v20 = v4;
    v21 = v3;
    v22 = v9;
    v23 = v10;
    v11 = a3;
    v12 = a2;
    do
    {
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v12, v16, v17, v18, v19, v20, v21, v22, v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setIdentity:", v14);

      ++v12;
      --v11;
    }
    while (v11);
  }
}

BOOL __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_13(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a2, "location");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "location");
  return v4 > v5;
}

BOOL __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_14(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(a2, "location");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "location");
  return v4 < v5;
}

@end
