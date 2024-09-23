@implementation WBStyleSheet

+ (void)readFrom:(id)a3 styleSheet:(id)a4
{
  id v6;
  WrdObject *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = +[WBObjectFactory create:](WBObjectFactory, "create:", 57);
  if (v7)
  else
    v8 = 0;
  v9 = objc_msgSend(v15, "wrdReader");
  (*(void (**)(uint64_t, unsigned __int16 *))(*(_QWORD *)v9 + 208))(v9, v8);
  objc_msgSend(a1, "initializeStyles:with:reader:", v6, v8, v15);
  objc_msgSend(v6, "defaultCharacterProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResolveMode:", 0);
  objc_msgSend(v15, "fontAtIndex:", v8[4]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);
  objc_msgSend(v15, "fontAtIndex:", v8[7]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setExtendedFont:", v12);
  objc_msgSend(v15, "fontAtIndex:", v8[5]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFarEastFont:", v13);
  objc_msgSend(v15, "fontAtIndex:", v8[6]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setSymbolFont:", v14);
  (*(void (**)(unsigned __int16 *))(*(_QWORD *)v8 + 8))(v8);

}

+ (void)initializeStyles:(id)a3 with:(void *)a4 reader:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t StyleReference;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  const __CFString *v27;
  int v28;
  id v29;

  v29 = a3;
  v7 = a5;
  v28 = (unsigned __int16)((*((_DWORD *)a4 + 8) - *((_DWORD *)a4 + 6)) >> 3);
  if ((unsigned __int16)((*((_DWORD *)a4 + 8) - *((_DWORD *)a4 + 6)) >> 3))
  {
    v8 = 0;
    v27 = CFSTR("Normal");
    do
    {
      StyleReference = WrdStyleSheet::getStyleReference((WrdStyleSheet *)a4, (unsigned __int16)v8);
      v10 = StyleReference;
      if (!*(_DWORD *)(StyleReference + 24))
      {
        v12 = CFSTR("__WB_UNKNOWN_DEFAULT_STYLE_NAME__");
        switch((int)v8)
        {
          case 0:
            v13 = (__CFString *)v27;
            goto LABEL_21;
          case 1:
            v13 = CFSTR("Heading 1");
            goto LABEL_21;
          case 2:
            v13 = CFSTR("Heading 2");
            goto LABEL_21;
          case 3:
            v13 = CFSTR("Heading 3");
            goto LABEL_21;
          case 4:
            v13 = CFSTR("Heading 4");
            goto LABEL_21;
          case 5:
            v13 = CFSTR("Heading 5");
            goto LABEL_21;
          case 6:
            v13 = CFSTR("Heading 6");
            goto LABEL_21;
          case 7:
            v13 = CFSTR("Heading 7");
            goto LABEL_21;
          case 8:
            v13 = CFSTR("Heading 8");
            goto LABEL_21;
          case 9:
            v13 = CFSTR("Heading 9");
            goto LABEL_21;
          case 10:
            v13 = CFSTR("Default Paragraph Font");
            goto LABEL_21;
          case 11:
            v13 = CFSTR("Table Normal");
            goto LABEL_21;
          case 12:
            v13 = CFSTR("No List");
            goto LABEL_21;
          case 13:
            goto LABEL_23;
          case 14:
            v13 = CFSTR("Document Map");
LABEL_21:
            v11 = v13;
            goto LABEL_22;
          default:
            v12 = &stru_24F3BFFF8;
            goto LABEL_23;
        }
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCsString:", StyleReference + 8);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_22:
      v12 = v11;
LABEL_23:
      objc_msgSend(v29, "styleNameToUniqueId:", v12, v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "styleWithId:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(unsigned int *)(v10 + 152);
      if (v15)
      {
        objc_msgSend(v29, "styleNameToUniqueId:", v14);
        v17 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "createStyleWithId:type:", v17, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)v17;
        v19 = v18;
        objc_msgSend(v18, "setName:", v12);
      }
      else
      {
        objc_msgSend(v29, "createStyleWithId:type:", v14, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setName:", v12);
      }
      if ((_DWORD)v8 || (_DWORD)v16 != 1)
      {
        if ((_DWORD)v8 == 10 && (_DWORD)v16 == 2)
        {
          objc_msgSend(v29, "setDefaultCharacterStyle:", v19);
        }
        else if ((_DWORD)v8 == 11 && (_DWORD)v16 == 3)
        {
          objc_msgSend(v29, "setDefaultTableStyle:", v19);
        }
        else if ((_DWORD)v8 == 12 && (_DWORD)v16 == 4)
        {
          objc_msgSend(v29, "setDefaultListStyle:", v19);
        }
      }
      else
      {
        objc_msgSend(v29, "setDefaultParagraphStyle:", v19);
      }
      objc_msgSend(v7, "addStyle:index:", v19, v8);

      v8 = (v8 + 1);
    }
    while (v28 != (_DWORD)v8);
    v20 = 0;
    do
    {
      objc_msgSend(v7, "styleAtIndex:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBStyle readFrom:wrdStyle:style:](WBStyle, "readFrom:wrdStyle:style:", v7, WrdStyleSheet::getStyleReference((WrdStyleSheet *)a4, (unsigned __int16)v20), v21);
      objc_msgSend(v21, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsSeparatedByString:", CFSTR(","));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v23, "count") >= 2)
      {
        v24 = objc_msgSend(v23, "count");
        if (v24)
        {
          for (i = 0; i != v24; ++i)
          {
            objc_msgSend(v23, "objectAtIndex:", i);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v26, "length"))
              objc_msgSend(v29, "addStyle:name:", v21, v26);

          }
        }
      }

      v20 = (v20 + 1);
    }
    while ((_DWORD)v20 != v28);
  }

}

@end
