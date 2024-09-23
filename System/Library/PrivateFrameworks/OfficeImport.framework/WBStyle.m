@implementation WBStyle

+ (void)readFrom:(id)a3 wrdStyle:(void *)a4 style:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v8 = a5;
  objc_msgSend(v8, "setHidden:", (*((unsigned __int8 *)a4 + 164) >> 1) & 1);
  v9 = *((unsigned __int16 *)a4 + 79);
  if ((_DWORD)v9 != 4095)
  {
    objc_msgSend(v26, "styleAtIndex:expectedType:", v9, objc_msgSend(v8, "type"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
      while (v12 != v8)
      {
        objc_msgSend(v12, "baseStyle");
        v13 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v13;
        if (!v13)
          goto LABEL_8;
      }

      v11 = 0;
    }
LABEL_8:
    objc_msgSend(v8, "setBaseStyle:", v11);

  }
  v14 = *((unsigned __int16 *)a4 + 80);
  if ((_DWORD)v14 != 4095)
  {
    objc_msgSend(v26, "styleAtIndex:expectedType:", v14, objc_msgSend(v8, "type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNextStyle:", v15);

  }
  objc_msgSend(v8, "styleSheet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "document");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *((_QWORD *)a4 + 4);
  v19 = *((_QWORD *)a4 + 5);
  objc_msgSend(v8, "paragraphProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBParagraphProperties readFrom:wrdProperties:tracked:document:properties:](WBParagraphProperties, "readFrom:wrdProperties:tracked:document:properties:", v26, v18, v19, v17, v20);

  v21 = *((_QWORD *)a4 + 6);
  v22 = *((_QWORD *)a4 + 7);
  objc_msgSend(v8, "characterProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBCharacterProperties readFrom:wrdProperties:tracked:document:properties:](WBCharacterProperties, "readFrom:wrdProperties:tracked:document:properties:", v26, v21, v22, v17, v23);

  objc_msgSend(v8, "characterProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "clearBaseStyle");

  objc_msgSend(v8, "paragraphProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "clearBaseStyle");

  objc_msgSend(a1, "readTableProperties:style:from:", v26, v8, a4);
}

+ (void)readTableProperties:(id)a3 style:(id)a4 from:(void *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "type") == 3)
  {
    v8 = *((_QWORD *)a5 + 8);
    objc_msgSend(v7, "tableRowProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBTableRowProperties readFrom:wrdProperties:tracked:properties:](WBTableRowProperties, "readFrom:wrdProperties:tracked:properties:", v13, v8, 0, v9);

    objc_msgSend(v7, "tableCellProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBTableCellStyleProperties readFrom:properties:](WBTableCellStyleProperties, "readFrom:properties:", v8, v10);

    v11 = 0;
    do
    {
      objc_msgSend(v7, "tableStyleOverrideForPart:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBTableStyleOverride readFrom:wrdStyle:style:part:tableStyleOverride:](WBTableStyleOverride, "readFrom:wrdStyle:style:part:tableStyleOverride:", v13, a5, v7, v11, v12);

      v11 = (v11 + 1);
    }
    while ((_DWORD)v11 != 12);
  }

}

@end
