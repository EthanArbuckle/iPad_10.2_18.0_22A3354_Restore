@implementation WBTable

+ (void)readFrom:(id)a3 textRuns:(id)a4 table:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = a5;
  +[WBTable initPropertiesFrom:to:in:](WBTable, "initPropertiesFrom:to:in:", v7, v8, v9);
  +[WBTable readRowFrom:textRuns:to:](WBTable, "readRowFrom:textRuns:to:", v9, v7, v8);

}

+ (void)initPropertiesFrom:(id)a3 to:(id)a4 in:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v16, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pointerValue");

  v11 = *(_QWORD *)(v10 + 40);
  v12 = *(_QWORD *)(v10 + 48);
  objc_msgSend(v7, "properties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBTableProperties readFrom:wrdProperties:tracked:properties:](WBTableProperties, "readFrom:wrdProperties:tracked:properties:", v8, v11, v12, v13);
  objc_msgSend(v13, "setResolveMode:", 0);
  objc_msgSend(v13, "clearShading");
  objc_msgSend(v13, "setResolveMode:", 1);
  objc_msgSend(v13, "clearShading");
  objc_msgSend(v13, "setResolveMode:", 2);
  if ((unint64_t)objc_msgSend(v16, "count") >= 2)
  {
    objc_msgSend(v16, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "pointerValue");

    objc_msgSend(v8, "setLastRowParagraphProperties:", (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v15 + 24) + 24))(*(_QWORD *)(v15 + 24)));
  }

}

+ (void)readRowFrom:(id)a3 textRuns:(id)a4 to:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "addRow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBTableRow readFrom:textRuns:to:index:row:](WBTableRow, "readFrom:textRuns:to:index:row:", v10, v7, v8, objc_msgSend(v8, "rowCount"), v9);

}

+ (BOOL)tryToReadRowFrom:(id)a3 textRuns:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  int v37;
  BOOL v38;
  BOOL v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "pointerValue");

  v13 = *(_QWORD *)(v12 + 40);
  v14 = *(_QWORD *)(v12 + 48);
  objc_msgSend(v10, "properties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isBaseStyleOverridden");
  if ((*(_DWORD *)(v14 + 24) & 0x10000000) != 0)
    v17 = v14;
  else
    v17 = v13;
  if ((*(_DWORD *)(v17 + 24) & 0x10000000) != 0)
    v18 = 0;
  else
    v18 = v16 ^ 1;
  if (((v16 ^ 1) & 1) == 0 && (*(_DWORD *)(v17 + 24) & 0x10000000) != 0)
  {
    objc_msgSend(v8, "styleAtIndex:expectedType:", *(unsigned __int16 *)(v17 + 328), 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "baseStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19 == v20;

  }
  v21 = objc_msgSend(v8, "lastRowParagraphProperties");
  if (!v18)
    goto LABEL_81;
  v22 = v21;
  if ((objc_msgSend(a1, "isTableFloating:tracked:", v13, v14) & 1) == 0
    && (objc_msgSend(v15, "isTableFloating") & 1) == 0)
  {
    if (!v22 || (unint64_t)objc_msgSend(v9, "count") < 2)
      goto LABEL_58;
    objc_msgSend(v9, "objectAtIndex:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "pointerValue");

    v28 = *(_QWORD *)(v27 + 24);
    v29 = *(_QWORD *)(v28 + 16);
    v30 = *(_QWORD *)(v22 + 16);
    if ((v29 & 0x2000000) != 0)
    {
      if ((v30 & 0x2000000) == 0 || *(unsigned __int8 *)(v28 + 298) != *(unsigned __int8 *)(v22 + 298))
        goto LABEL_81;
    }
    else if ((v30 & 0x2000000) != 0)
    {
      goto LABEL_81;
    }
    if ((v29 & 0x200000) != 0)
    {
      if ((v30 & 0x200000) == 0 || *(_DWORD *)(v28 + 228) != *(_DWORD *)(v22 + 228))
        goto LABEL_81;
    }
    else if ((v30 & 0x200000) != 0)
    {
      goto LABEL_81;
    }
    if ((v29 & 0x800000) != 0)
    {
      if ((v30 & 0x800000) == 0 || *(_DWORD *)(v28 + 152) != *(_DWORD *)(v22 + 152))
        goto LABEL_81;
    }
    else if ((v30 & 0x800000) != 0)
    {
      goto LABEL_81;
    }
    if ((v29 & 0x100000) != 0)
    {
      if ((v30 & 0x100000) == 0 || *(_DWORD *)(v28 + 224) != *(_DWORD *)(v22 + 224))
        goto LABEL_81;
    }
    else if ((v30 & 0x100000) != 0)
    {
      goto LABEL_81;
    }
    if ((v29 & 0x1000000) != 0)
    {
      if ((v30 & 0x1000000) != 0 && *(_DWORD *)(v28 + 156) == *(_DWORD *)(v22 + 156))
        goto LABEL_58;
    }
    else if ((v30 & 0x1000000) == 0)
    {
LABEL_58:
      objc_msgSend(a1, "readRowFrom:textRuns:to:", v8, v9, v10);
      v39 = 1;
      goto LABEL_82;
    }
LABEL_81:
    v39 = 0;
    goto LABEL_82;
  }
  if ((*(_QWORD *)(v14 + 16) & 0x400000000000) != 0)
    v23 = v14;
  else
    v23 = v13;
  if ((*(_QWORD *)(v23 + 16) & 0x400000000000) != 0)
    goto LABEL_19;
  if (objc_msgSend(v15, "isVerticalPositionOverridden"))
  {
    if ((*(_QWORD *)(v23 + 16) & 0x400000000000) == 0)
    {
LABEL_21:
      v25 = 0;
      goto LABEL_28;
    }
LABEL_19:
    if (objc_msgSend(v15, "isVerticalPositionOverridden"))
    {
      v24 = *(int *)(v23 + 308);
      v25 = objc_msgSend(v15, "verticalPosition") == v24;
      goto LABEL_28;
    }
    goto LABEL_21;
  }
  v25 = 1;
LABEL_28:
  if ((*(_QWORD *)(v14 + 16) & 0x8000000000) != 0)
    v31 = v14;
  else
    v31 = v13;
  if ((*(_QWORD *)(v31 + 16) & 0x8000000000) != 0)
    goto LABEL_34;
  if (objc_msgSend(v15, "isVerticalAnchorOverridden"))
  {
    if ((*(_QWORD *)(v31 + 16) & 0x8000000000) == 0)
    {
LABEL_36:
      v33 = 0;
      goto LABEL_38;
    }
LABEL_34:
    if (objc_msgSend(v15, "isVerticalAnchorOverridden"))
    {
      v32 = *(_DWORD *)(v31 + 228);
      v33 = v32 == objc_msgSend(v15, "verticalAnchor");
      goto LABEL_38;
    }
    goto LABEL_36;
  }
  v33 = 1;
LABEL_38:
  if ((*(_QWORD *)(v14 + 16) & 0x200000000000) != 0)
    v34 = v14;
  else
    v34 = v13;
  if ((*(_QWORD *)(v34 + 16) & 0x200000000000) != 0)
    goto LABEL_44;
  if (objc_msgSend(v15, "isHorizontalPositionOverridden"))
  {
    if ((*(_QWORD *)(v34 + 16) & 0x200000000000) == 0)
    {
LABEL_46:
      v36 = 0;
      goto LABEL_48;
    }
LABEL_44:
    if (objc_msgSend(v15, "isHorizontalPositionOverridden"))
    {
      v35 = *(int *)(v34 + 304);
      v36 = objc_msgSend(v15, "horizontalPosition") == v35;
      goto LABEL_48;
    }
    goto LABEL_46;
  }
  v36 = 1;
LABEL_48:
  if ((*(_QWORD *)(v14 + 16) & 0x10000000000) != 0)
    v13 = v14;
  if ((*(_QWORD *)(v13 + 16) & 0x10000000000) == 0)
  {
    if (!objc_msgSend(v15, "isHorizontalAnchorOverridden"))
    {
      v38 = 1;
      goto LABEL_56;
    }
    if ((*(_QWORD *)(v13 + 16) & 0x10000000000) == 0)
      goto LABEL_81;
  }
  if (!objc_msgSend(v15, "isHorizontalAnchorOverridden"))
    goto LABEL_81;
  v37 = *(_DWORD *)(v13 + 232);
  v38 = v37 == objc_msgSend(v15, "horizontalAnchor");
LABEL_56:
  v39 = 0;
  if (v25 && v33 && v36 && v38)
    goto LABEL_58;
LABEL_82:

  return v39;
}

+ (BOOL)isTableFloating:(const void *)a3 tracked:(const void *)a4
{
  uint64_t v4;
  int v5;
  BOOL result;

  v4 = *((_QWORD *)a4 + 2);
  if ((v4 & 0x10000000000) != 0)
  {
    if (*((_DWORD *)a4 + 58))
      return 1;
  }
  else if ((*((_QWORD *)a3 + 2) & 0x10000000000) != 0 && *((_DWORD *)a3 + 58))
  {
    return 1;
  }
  if ((v4 & 0x8000000000) != 0)
  {
    v5 = *((_DWORD *)a4 + 57);
  }
  else
  {
    if ((*((_QWORD *)a3 + 2) & 0x8000000000) == 0)
      goto LABEL_11;
    v5 = *((_DWORD *)a3 + 57);
  }
  if (v5 != 2)
    return 1;
LABEL_11:
  if ((v4 & 0x200000000000) != 0)
  {
    if (!*((_DWORD *)a4 + 76))
      goto LABEL_14;
    return 1;
  }
  if ((*((_QWORD *)a3 + 2) & 0x200000000000) != 0 && *((_DWORD *)a3 + 76))
    return 1;
LABEL_14:
  result = ((v4 & 0x400000000000) != 0 || (a4 = a3, (*((_QWORD *)a3 + 2) & 0x400000000000) != 0))
        && *((_DWORD *)a4 + 77) != 0;
  return result;
}

@end
