@implementation WBTextBox

+ (void)readFrom:(void *)a3 parent:(id)a4 reader:(id)a5
{
  id v7;
  EshTextBox *v8;
  int isTextIDSet;
  EshShapeImageData *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unsigned int NextTextbox;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *i;
  objc_class *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int TextID;
  WDATextBox *v41;
  id v42;

  v42 = a4;
  v7 = a5;
  v8 = (EshTextBox *)((char *)a3 + 272);
  isTextIDSet = EshTextBox::isTextIDSet((EshTextBox *)((char *)a3 + 272));
  if (isTextIDSet)
  {
    TextID = EshTextBox::getTextID((EshTextBox *)((char *)a3 + 272));
  }
  else
  {
    v10 = (EshShapeImageData *)((char *)a3 + 480);
    if (!EshShapeImageData::isOLEIDSet(v10))
      goto LABEL_19;
    TextID = EshShapeImageData::getOLEID(v10);
  }
  if (TextID != -1)
  {
    v41 = objc_alloc_init(WDATextBox);
    objc_msgSend(v7, "targetDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTextBox:document:", v41, v11);

    -[WDATextBox setOle:](v41, "setOle:", isTextIDSet ^ 1u);
    -[WDATextBox setParent:](v41, "setParent:", v42);
    objc_msgSend(v7, "targetDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDATextBox setDocument:](v41, "setDocument:", v12);

    objc_msgSend(v42, "drawable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "id");

    if (EshTextBox::isNextTextboxSet(v8))
    {
      NextTextbox = EshTextBox::getNextTextbox(v8);
      if (NextTextbox == v14)
        v16 = 0;
      else
        v16 = NextTextbox;
    }
    else
    {
      v16 = 0;
    }
    -[WDATextBox setNextTextBoxId:](v41, "setNextTextBoxId:", v16);
    objc_msgSend(v42, "drawable");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previousFlowElement");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[WDATextBox nextTextBoxId](v41, "nextTextBoxId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

    objc_msgSend(v7, "previousFlowElement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v42, "drawable");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithUnsignedInt:", objc_msgSend(v22, "id"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v25 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v42, "drawable");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "numberWithUnsignedInt:", objc_msgSend(v26, "id"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDATextBox setFlowId:](v41, "setFlowId:", v27);

      -[WDATextBox setFlowSequence:](v41, "setFlowSequence:", &unk_24F46A948);
      objc_msgSend(v42, "drawable");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v24, "clientData");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "textBox");
    for (i = (void *)objc_claimAutoreleasedReturnValue(); ; i = v34)
    {
      v29 = (objc_class *)objc_opt_class();
      objc_msgSend(v7, "officeArtState");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "drawableForShapeId:", objc_msgSend(i, "nextTextBoxId"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      TSUCheckedDynamicCast(v29, (uint64_t)v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
        break;
      objc_msgSend(v32, "clientData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "textBox");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "flowId");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFlowId:", v35);

      v36 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(i, "flowSequence");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "numberWithUnsignedInt:", objc_msgSend(v37, "unsignedIntValue") + 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setFlowSequence:", v38);

    }
    if (!(_WORD)TextID)
      objc_msgSend(v7, "cacheTextBox:withChainIndex:", v41, HIWORD(TextID));

  }
LABEL_19:

}

+ (void)readTextFrom:(id)a3 to:(id)a4 chain:(unsigned __int16)a5
{
  int v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  WrdBookmarkTable *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  WDText *v18;
  void *v19;
  WDText *v20;
  void *v21;
  void (**v22)(WrdTextRun *__hidden);
  int v23;
  uint64_t v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "parent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "textType");

  if (v11 == 2)
    v12 = (WrdBookmarkTable *)objc_msgSend(v8, "headerStoryTable");
  else
    v12 = (WrdBookmarkTable *)objc_msgSend(v8, "storyTable");
  if (v5 - 1 < ((*((_QWORD *)v12 + 3) - *((_QWORD *)v12 + 2)) >> 3))
  {
    v13 = *(_QWORD *)(WrdBookmarkTable::getBookmark(v12, v5 - 1) + 8);
    v22 = &off_24F3B1BC0;
    objc_msgSend(v9, "parent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "textType");

    if (v15 == 2)
      v16 = 7;
    else
      v16 = 6;
    v23 = v16;
    v24 = v13;
    objc_msgSend(v9, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v18 = [WDText alloc];
      objc_msgSend(v9, "document");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[WDText initWithDocument:textType:](v18, "initWithDocument:textType:", v19, v16);

      objc_msgSend(v9, "setText:", v20);
    }
    objc_msgSend(v9, "text");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBText readFrom:text:textRun:](WBText, "readFrom:text:textRun:", v8, v21, &v22);

    objc_msgSend(a1, "checkForOleObject:", v9);
  }

}

+ (void)checkForOleObject:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  if ((objc_msgSend(v23, "isOle") & 1) != 0)
  {
    objc_msgSend(v23, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "blockCount");

    if (v4 == 1)
      goto LABEL_3;
    objc_msgSend(v23, "text");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "blockCount");

    if (v19 == 2)
    {
      objc_msgSend(v23, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "blockAt:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "blockType"))
        goto LABEL_38;
      v7 = v6;
      if ((unint64_t)objc_msgSend(v7, "runCount") > 1)
        goto LABEL_37;
      if (objc_msgSend(v7, "runCount") == 1)
      {
        objc_msgSend(v7, "runAt:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "runType"))
        {
LABEL_36:

          goto LABEL_37;
        }
        objc_msgSend(v11, "string");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length");

        if (v22)
        {
LABEL_37:

          v6 = v7;
          goto LABEL_38;
        }
      }

LABEL_3:
      objc_msgSend(v23, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "blockAt:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v6, "blockType"))
      {
        v7 = v6;
        v8 = objc_msgSend(v7, "runCount");
        if (v8)
        {
          v9 = 0;
          v10 = 0;
          v11 = 0;
          while (2)
          {
            objc_msgSend(v7, "runAt:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "runType");
            switch(v10)
            {
              case 0:
                if (v13 == 7 && objc_msgSend(v12, "fieldMarkerType") == 19)
                  goto LABEL_14;
                goto LABEL_27;
              case 1:
                if (v13)
                {
                  if (v13 != 7 || objc_msgSend(v12, "fieldMarkerType") != 20)
                    goto LABEL_27;
LABEL_19:
                  v10 = 2;
                }
                else
                {
LABEL_14:
                  v10 = 1;
                }
LABEL_22:

                if (++v9 < v8)
                  continue;
                if (v10 == 3 && v11)
                {
                  objc_msgSend(v23, "parent");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "drawable");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v11, "drawable");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "ole");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "setOle:", v17);

                  }
LABEL_27:

                }
                break;
              case 2:
                switch(v13)
                {
                  case 12:
                    goto LABEL_19;
                  case 7:
                    if (objc_msgSend(v12, "fieldMarkerType") != 21)
                      goto LABEL_27;
                    v10 = 3;
                    break;
                  case 5:
                    v14 = v12;

                    v10 = 2;
                    v11 = v14;
                    break;
                  default:
                    goto LABEL_27;
                }
                goto LABEL_22;
              case 3:
                goto LABEL_27;
              default:
                goto LABEL_22;
            }
            break;
          }
        }
        else
        {
          v11 = 0;
        }
        goto LABEL_36;
      }
LABEL_38:

    }
  }

}

@end
