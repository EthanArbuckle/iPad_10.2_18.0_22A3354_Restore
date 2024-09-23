@implementation WBTableCell

+ (void)readFrom:(id)a3 textRun:(WrdTextRun *)a4 with:(void *)a5 tracked:(void *)a6 row:(id)a7 index:(unint64_t)a8 cell:(id)a9
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v14 = a7;
  v15 = a9;
  objc_msgSend(v15, "properties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBTableCellBodyProperties readFrom:tracked:properties:index:](WBTableCellBodyProperties, "readFrom:tracked:properties:index:", a5, a6, v16, a8);

  objc_msgSend(v14, "table");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBText readFrom:text:textRun:](WBText, "readFrom:text:textRun:", v20, v18, a4);
  if (objc_msgSend(v17, "nestingLevel") == 1)
    v19 = 7;
  else
    v19 = 13;
  objc_msgSend(v18, "removeLastCharacter:", v19);

}

@end
