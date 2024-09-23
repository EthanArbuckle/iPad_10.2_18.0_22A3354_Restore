@implementation WBTableRow

+ (void)readFrom:(id)a3 textRuns:(id)a4 to:(id)a5 index:(unint64_t)a6 row:(id)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  WrdCharacterProperties *var5;
  WrdCharacterProperties *var4;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  WrdCharacterTextRun v32;

  v31 = a3;
  v11 = a4;
  v30 = a5;
  v28 = a7;
  v29 = v11;
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "pointerValue");

  v14 = *(_QWORD *)(v13 + 24);
  v15 = *(_QWORD *)(v13 + 40);
  v16 = *(_QWORD *)(v13 + 48);
  objc_msgSend(v28, "properties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBTableRowProperties readFrom:wrdProperties:tracked:properties:](WBTableRowProperties, "readFrom:wrdProperties:tracked:properties:", v31, v15, v16, v17);

  WrdCharacterTextRun::WrdCharacterTextRun(&v32);
  v18 = *(_DWORD *)(v13 + 12) + *(_DWORD *)(v13 + 16) - 1;
  v32.var1 = *(_DWORD *)(v13 + 8);
  v32.var2 = v18;
  v32.var3 = 1;
  v19 = objc_msgSend(v31, "wrdReader");
  (*(void (**)(uint64_t, WrdCharacterTextRun *))(*(_QWORD *)v19 + 192))(v19, &v32);
  var4 = v32.var4;
  var5 = v32.var5;
  objc_msgSend(v30, "properties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "document");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "properties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "characterProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBCharacterProperties readFrom:wrdProperties:tracked:document:properties:](WBCharacterProperties, "readFrom:wrdProperties:tracked:document:properties:", v31, var4, var5, v23, v25);

  v26 = *(_QWORD *)(v14 + 16);
  if ((v26 & 0x1000000000000) != 0)
    v27 = *(unsigned int *)(v14 + 244);
  else
    v27 = (v26 >> 1) & 1;
  objc_msgSend(a1, "readCellsFrom:textRuns:level:to:properties:tracked:", v31, v29, v27, v28, v15, v16);
  WrdCharacterTextRun::~WrdCharacterTextRun(&v32);

}

+ (void)readCellsFrom:(id)a3 textRuns:(id)a4 level:(int)a5 to:(id)a6 properties:(void *)a7 tracked:(void *)a8
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  _BYTE v32[12];
  int v33;
  int v34;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = objc_msgSend(v13, "count");
  objc_msgSend(v14, "table");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  WrdTextRun::WrdTextRun((uint64_t)v32, objc_msgSend(v17, "textType"), 0);
  v18 = v15 - 1;

  if (v18)
  {
    v19 = 0;
    v20 = 1;
    do
    {
      objc_msgSend(v13, "objectAtIndex:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "pointerValue");

      if ((v20 & 1) != 0)
      {
        v23 = 0;
        v33 = *(_DWORD *)(v22 + 12);
        v34 = 0;
      }
      else
      {
        v23 = v34;
      }
      v34 = *(_DWORD *)(v22 + 16) + v23;
      if (a5 == 1)
      {
        v24 = (*(_DWORD *)(v22 + 16) + *(_DWORD *)(v22 + 12));
        objc_msgSend(v12, "readCharactersFrom:to:textType:", (v24 - 1), v24, *(unsigned int *)(v22 + 8));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("\a"));

        if ((v26 & 1) == 0)
          goto LABEL_15;
      }
      else
      {
        v28 = *(_QWORD *)(v22 + 24);
        v29 = *(_QWORD *)(v28 + 16);
        if ((v29 & 0x1000000000000) != 0)
          v30 = *(_DWORD *)(v28 + 244);
        else
          v30 = (v29 >> 1) & 1;
        v20 = 0;
        if ((v29 & 0x2000000000000) == 0 || v30 != a5)
          goto LABEL_16;
        if ((*(_BYTE *)(v28 + 296) & 0x10) == 0)
        {
LABEL_15:
          v20 = 0;
          goto LABEL_16;
        }
      }
      objc_msgSend(v14, "addCell");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBTableCell readFrom:textRun:with:tracked:row:index:cell:](WBTableCell, "readFrom:textRun:with:tracked:row:index:cell:", v12, v32, a7, a8, v14, objc_msgSend(v14, "cellCount") - 1, v27);

      v20 = 1;
LABEL_16:
      ++v19;
    }
    while (v18 != v19);
  }

}

+ (void)collectCellProperties:(void *)a3 tracked:(void *)a4 for:(id)a5
{
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;

  v11 = a5;
  v7 = objc_msgSend(v11, "cellCount");
  WrdTableProperties::insertCells((WrdTableProperties *)a3, 0, (__int16)v7, 0);
  WrdTableProperties::insertCells((WrdTableProperties *)a4, 0, (__int16)v7, 0);
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v11, "cellAt:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "properties");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBTableCellBodyProperties write:wrdProperties:tracked:index:](WBTableCellBodyProperties, "write:wrdProperties:tracked:index:", v10, a3, a4, i);

    }
  }

}

@end
