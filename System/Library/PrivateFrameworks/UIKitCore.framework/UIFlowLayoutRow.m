@implementation UIFlowLayoutRow

void __46___UIFlowLayoutRow_indexOfNearestItemAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CGFloat *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double MaxX;
  double v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double MaxY;
  CGFloat *v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v7 = a2;
  v32 = v7;
  if (v7)
  {
    v9 = v7[4];
    v8 = v7[5];
    v11 = v7[6];
    v10 = v7[7];
  }
  else
  {
    v8 = 0.0;
    v11 = 0.0;
    v10 = 0.0;
    v9 = 0.0;
  }
  if (!*(_BYTE *)(a1 + 64))
  {
    v23 = *(double *)(a1 + 48);
    v35.origin.x = v9;
    v35.origin.y = v8;
    v35.size.width = v11;
    v35.size.height = v10;
    if (v23 < CGRectGetMinX(v35))
    {
      if (a3)
      {
        v36.origin.x = v9;
        v36.origin.y = v8;
        v36.size.width = v11;
        v36.size.height = v10;
        v13 = CGRectGetMinX(v36) - *(double *)(a1 + 48);
        v14 = a3 - 1;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectAtIndexedSubscript:", a3 - 1);
        v24 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v16 = v24;
        v17 = *(double *)(a1 + 48);
        if (v24)
        {
          v25 = v24[4];
          v26 = v24[5];
          v27 = v24[6];
          v28 = v24[7];
        }
        else
        {
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v25 = 0;
        }
        MaxX = CGRectGetMaxX(*(CGRect *)&v25);
        goto LABEL_14;
      }
      goto LABEL_22;
    }
    v30 = *(double *)(a1 + 48);
    v38.origin.x = v9;
    v38.origin.y = v8;
    v38.size.width = v11;
    v38.size.height = v10;
    MaxY = CGRectGetMaxX(v38);
LABEL_20:
    if (v30 >= MaxY)
      goto LABEL_24;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
LABEL_23:
    *a4 = 1;
    goto LABEL_24;
  }
  v12 = *(double *)(a1 + 56);
  v33.origin.x = v9;
  v33.origin.y = v8;
  v33.size.width = v11;
  v33.size.height = v10;
  if (v12 >= CGRectGetMinY(v33))
  {
    v30 = *(double *)(a1 + 56);
    v37.origin.x = v9;
    v37.origin.y = v8;
    v37.size.width = v11;
    v37.size.height = v10;
    MaxY = CGRectGetMaxY(v37);
    goto LABEL_20;
  }
  if (!a3)
  {
LABEL_22:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_23;
  }
  v34.origin.x = v9;
  v34.origin.y = v8;
  v34.size.width = v11;
  v34.size.height = v10;
  v13 = CGRectGetMinY(v34) - *(double *)(a1 + 56);
  v14 = a3 - 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectAtIndexedSubscript:", a3 - 1);
  v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = *(double *)(a1 + 56);
  if (v15)
  {
    v18 = v15[4];
    v19 = v15[5];
    v20 = v15[6];
    v21 = v15[7];
  }
  else
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v18 = 0;
  }
  MaxX = CGRectGetMaxY(*(CGRect *)&v18);
LABEL_14:
  if (v17 - MaxX <= v13)
    v29 = a3;
  else
    v29 = v14;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v29;
  *a4 = 1;

LABEL_24:
}

@end
