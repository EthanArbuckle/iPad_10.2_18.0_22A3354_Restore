@implementation PBHyperlink

+ (void)readHyperlinksWithPresentationState:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t DocumentRef;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const void *v18;
  unsigned int *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _BYTE v26[768];
  uint64_t v27;
  uint64_t v28;

  v3 = a3;
  OcSummary::OcSummary((OcSummary *)v26);
  v4 = objc_msgSend(v3, "reader");
  (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v4 + 120))(v4, v26);
  DocumentRef = PptBinaryReader::getDocumentRef((PptBinaryReader *)objc_msgSend(v3, "reader"));
  objc_opt_class();
  objc_msgSend(v3, "documentRoot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pbReferenceWithID:", DocumentRef);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  TCVerifyInputMeetsCondition(isKindOfClass & 1);
  objc_msgSend(v7, "firstChildOfType:", 1033);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "childCount");
    if (v11 >= 2)
    {
      v12 = 0;
      v13 = 1;
      v24 = v7;
      v25 = v3;
      do
      {
        objc_msgSend(v10, "childAt:", v13, v24, v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "eshObject");
        if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15) == 4055)
        {
          objc_msgSend(v14, "firstChildOfType:", 4051);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v18 = (const void *)objc_msgSend(v16, "eshObject");
            if (v18)
            {
              if (v19)
              {
                if (v12 < ((unint64_t)(v28 - v27) >> 3))
                {
                  v20 = *(_QWORD *)(v27 + 8 * v12);
                  objc_msgSend(v3, "hyperlinkInfoWithId:createIfAbsent:", v19[12], 1);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if (*(_DWORD *)(v20 + 40))
                  {
                    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", v20 + 24);
                    objc_msgSend(v21, "setHyperlink1:", v22);

                  }
                  if (*(_DWORD *)(v20 + 64))
                  {
                    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", v20 + 48);
                    objc_msgSend(v21, "setHyperlink2:", v23);

                  }
                  v7 = v24;
                  v3 = v25;
                }
                ++v12;
              }
            }
          }

        }
        ++v13;
      }
      while (v11 != v13);
    }
  }

  OcSummary::~OcSummary((OcSummary *)v26);
}

+ (id)readAnimationInfoContainerHolder:(id)a3 presentationState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  OADHyperlink *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "firstChildOfType:", 4083);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "eshObject");

  if (!v8)
  {
    v13 = 0;
    goto LABEL_39;
  }
  v31 = v6;
  objc_msgSend(v6, "hyperlinkInfoWithId:createIfAbsent:", *(unsigned int *)(v8 + 52), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screenTip");
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hyperlink1");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hyperlink2");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_DWORD *)(v8 + 56);
  if (v11 == 4)
    v12 = *(_DWORD *)(v8 + 72);
  else
    v12 = 255;
  v14 = *(_DWORD *)(v8 + 64);
  v30 = v10;
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v15, "count") < 2)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v15, "objectAtIndex:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intValue");

    if ((unint64_t)objc_msgSend(v15, "count") >= 3)
    {
      objc_msgSend(v15, "objectAtIndex:", 2);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
  v34 = &stru_24F3BFFF8;
LABEL_11:
  v18 = 0;
  v19 = 1;
  v20 = v11 - 2;
  v21 = 0;
  switch(v20)
  {
    case 0:
      if (v12)
        goto LABEL_31;
      objc_msgSend(v5, "childOfType:instance:", 4026, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "eshObject");

      if (v23 && *(_DWORD *)(v23 + 64))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCsString:", v23 + 48);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)v32;
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v24);
        v26 = objc_claimAutoreleasedReturnValue();

        v19 = 1;
        v27 = CFSTR("ppaction://program");
        goto LABEL_37;
      }
      v18 = 0;
      goto LABEL_27;
    case 1:
      if ((v14 - 1) < 6)
      {
        v19 = 0;
        v26 = 0;
        v27 = off_24F3B5140[v14 - 1];
        v25 = (void *)v32;
        goto LABEL_37;
      }
      v18 = 0;
      v19 = 0;
      goto LABEL_32;
    case 2:
      switch(v12)
      {
        case 7:
          v18 = 0;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ppaction://hlinksldjump?slideindex=%d"), v17);
          v21 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        case 8:
          v25 = (void *)v32;
          if (!v33)
            goto LABEL_31;
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = 0;
            goto LABEL_37;
          }
          objc_msgSend(v33, "tc_escapedPath");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v29);
          v18 = objc_claimAutoreleasedReturnValue();

          break;
        case 9:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ppaction://hlinkpres?slideindex=%d&slidetitle=%@"), v17, v34);
          v21 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v33);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_33;
        case 10:
          v27 = CFSTR("ppaction://hlinkfile");
          v25 = (void *)v32;
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v33);
          v26 = objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        default:
          goto LABEL_31;
      }
LABEL_27:
      v21 = 0;
      v19 = 1;
      goto LABEL_33;
    case 3:
    case 4:
      goto LABEL_33;
    case 5:
      if (v12 == 6 && -[__CFString length](v34, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ppaction://customshow?id=%d"), 0);
        v21 = objc_claimAutoreleasedReturnValue();
        v18 = 0;
LABEL_23:
        v19 = 0;
      }
      else
      {
LABEL_31:
        v18 = 0;
LABEL_32:
        v21 = 0;
      }
LABEL_33:
      v26 = v18;
      v27 = (__CFString *)v21;
      v25 = (void *)v32;
      if (v26 | v21)
      {
LABEL_37:
        v13 = objc_alloc_init(OADHyperlink);
        -[OADHyperlink setTargetLocation:](v13, "setTargetLocation:", v26);
        -[OADHyperlink setTargetMode:](v13, "setTargetMode:", v19);
        -[OADHyperlink setTargetFrame:](v13, "setTargetFrame:", 0);
        -[OADHyperlink setAction:](v13, "setAction:", v27);
        -[OADHyperlink setTooltip:](v13, "setTooltip:", v25);
        -[OADHyperlink setInvalidUrl:](v13, "setInvalidUrl:", 0);
        -[OADHyperlink setDoEndSound:](v13, "setDoEndSound:", *(unsigned __int8 *)(v8 + 69));
        -[OADHyperlink setIsVisited:](v13, "setIsVisited:", *(unsigned __int8 *)(v8 + 71));
        -[OADHyperlink setDoAddToHistory:](v13, "setDoAddToHistory:", 1);

      }
      else
      {
        v13 = 0;
      }

      v6 = v31;
      break;
    default:
      v21 = 0;
      goto LABEL_33;
  }
LABEL_39:

  return v13;
}

@end
