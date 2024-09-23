@implementation WBText

+ (void)readFrom:(id)a3 text:(id)a4 textRun:(WrdTextRun *)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  objc_msgSend(a1, "readBlocksFrom:textRun:to:", v9, a5, v8);

}

+ (void)readBlocksFrom:(id)a3 textRun:(WrdTextRun *)a4 to:(id)a5
{
  id v7;
  id v8;
  unsigned int var2;
  unsigned int var3;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  WrdParagraphProperties *var4;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  char v23;
  int v24;
  void *v25;
  uint64_t v26;
  int v27;
  int v28;
  NSMutableArray *v29;
  WrdParagraphTextRun v30;

  v7 = a3;
  v8 = a5;
  var2 = a4->var2;
  var3 = a4->var3;
  v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = objc_msgSend(v8, "tableNestingLevel");
  WrdParagraphTextRun::WrdParagraphTextRun(&v30);
  v12 = objc_msgSend(v8, "textType");
  v13 = var3 + var2;
  v14 = a4->var2;
  v30.var1 = v12;
  v30.var2 = v14;
  if (v14 < var3 + var2)
  {
    v15 = 0;
    v16 = 0;
    v28 = v11;
    while (1)
    {
      v17 = objc_msgSend(v7, "wrdReader");
      (*(void (**)(uint64_t, WrdParagraphTextRun *))(*(_QWORD *)v17 + 184))(v17, &v30);
      if (!v30.var3)
        goto LABEL_33;
      if (v30.var2 + v30.var3 > v13)
        v30.var3 = v13 - v30.var2;
      v18 = objc_msgSend(v7, "reportProgress");
      objc_msgSend(v7, "setReportProgress:", 0);
      if ((_DWORD)v18)
        +[TCProgressContext setProgress:](TCProgressContext, "setProgress:", (double)(v30.var3 + v30.var2));
      var4 = v30.var4;
      v20 = *((_QWORD *)v30.var4 + 2);
      if ((v20 & 2) != 0
        && (*((_BYTE *)v30.var4 + 294) & 1) != 0
        && v12 != 4
        && ((v20 & 0x1000000000000) != 0 ? (v24 = *((_DWORD *)v30.var4 + 61)) : (v24 = 1), v24 >= v11))
      {
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", WrdParagraphTextRun::clone(&v30));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v29, "addObject:", v25);

        if (v28 == 1)
        {
          if ((*((_QWORD *)var4 + 2) & 4) != 0 && (*((_BYTE *)var4 + 294) & 2) != 0)
            goto LABEL_28;
        }
        else if (*((_DWORD *)var4 + 61) == v28
               && (*((_QWORD *)var4 + 2) & 0x4000000000000) != 0
               && (*((_BYTE *)var4 + 296) & 0x20) != 0)
        {
LABEL_28:
          v11 = v28;
          if (!v15
            || !+[WBTable tryToReadRowFrom:textRuns:to:](WBTable, "tryToReadRowFrom:textRuns:to:", v7, v29, v15))
          {
            objc_msgSend(v8, "addTable");
            v26 = objc_claimAutoreleasedReturnValue();

            v15 = (void *)v26;
            +[WBTable readFrom:textRuns:table:](WBTable, "readFrom:textRuns:table:", v7, v29, v26);
          }
          purgeTextRuns(v29);
          goto LABEL_12;
        }
        v11 = v28;
      }
      else
      {

        objc_msgSend(v8, "addParagraph");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[WBParagraph readFrom:textRun:paragraph:](WBParagraph, "readFrom:textRun:paragraph:", v7, &v30, v15);
        ++v16;
        HIDWORD(v21) = -858993459 * v16 + 429496728;
        LODWORD(v21) = HIDWORD(v21);
        if ((v21 >> 2) <= 0xCCCCCCC)
        {
          objc_msgSend(v7, "cancelDelegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isCancelled");

          if ((v23 & 1) != 0)
          {
            v27 = 1;
            goto LABEL_34;
          }
        }

        v15 = 0;
      }
LABEL_12:
      objc_msgSend(v7, "setReportProgress:", v18);
      v30.var2 += v30.var3;
      if (v30.var2 >= v13)
        goto LABEL_33;
    }
  }
  v15 = 0;
LABEL_33:
  v27 = 0;
LABEL_34:

  WrdParagraphTextRun::~WrdParagraphTextRun(&v30);
  purgeTextRuns(v29);
  if (v27)
    +[TCMessageException raiseUntaggedMessage:](TCMessageException, "raiseUntaggedMessage:", CFSTR("TCUserCancelled"), 0);

}

@end
