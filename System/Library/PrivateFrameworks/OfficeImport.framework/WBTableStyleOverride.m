@implementation WBTableStyleOverride

+ (void)readFrom:(id)a3 wrdStyle:(void *)a4 style:(id)a5 part:(int)a6 tableStyleOverride:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t *ParaPropsReference;
  void *v16;
  uint64_t *CharPropsReference;
  void *v18;
  uint64_t TableProps;
  uint64_t *v20;
  void *v21;
  void *v22;
  id v23;

  v8 = *(_QWORD *)&a6;
  v23 = a3;
  v11 = a5;
  v12 = a7;
  objc_msgSend(v12, "setStyle:", v11);
  objc_msgSend(v12, "setPart:", v8);
  objc_msgSend(v11, "styleSheet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "document");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (WrdStyle::isTablePartDefinedForParagraphProperties((uint64_t)a4, v8))
  {
    ParaPropsReference = WrdStyle::getParaPropsReference((uint64_t)a4, v8);
    objc_msgSend(v12, "mutableParagraphProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBParagraphProperties readFrom:wrdProperties:tracked:document:properties:](WBParagraphProperties, "readFrom:wrdProperties:tracked:document:properties:", v23, ParaPropsReference, 0, v14, v16);

  }
  if (WrdStyle::isTablePartDefinedForCharacterProperties((uint64_t)a4, v8))
  {
    CharPropsReference = WrdStyle::getCharPropsReference((uint64_t)a4, v8);
    objc_msgSend(v12, "mutableCharacterProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBCharacterProperties readFrom:wrdProperties:tracked:document:properties:](WBCharacterProperties, "readFrom:wrdProperties:tracked:document:properties:", v23, CharPropsReference, 0, v14, v18);

  }
  if (WrdStyle::isTablePartDefinedForTableProperties((uint64_t)a4, v8))
  {
    TableProps = WrdStyle::getTableProps((uint64_t)a4, v8);
    v20 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)TableProps + 24))(TableProps);
    WrdStyle::takeTableProps((uint64_t)a4, v8, v20);
    objc_msgSend(v12, "mutableTableRowProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBTableRowProperties readFrom:wrdProperties:tracked:properties:](WBTableRowProperties, "readFrom:wrdProperties:tracked:properties:", v23, v20, 0, v21);

    objc_msgSend(v12, "mutableTableCellStyleProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBTableCellStyleProperties readFrom:properties:](WBTableCellStyleProperties, "readFrom:properties:", v20, v22);

  }
}

+ (void)prepareForWriting:(id)a3 tableStyleOverride:(id)a4 wrdProperties:(WrdCharacterProperties *)a5 tracked:(WrdCharacterProperties *)a6
{
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a4, "characterProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBCharacterProperties prepareForWriting:properties:wrdProperties:tracked:](WBCharacterProperties, "prepareForWriting:properties:wrdProperties:tracked:", v10, v9, a5, a6);

}

@end
