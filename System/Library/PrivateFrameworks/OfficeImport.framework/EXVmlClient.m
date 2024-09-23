@implementation EXVmlClient

+ (int)vmlSupportLevel
{
  return 0;
}

+ (void)readClientDataFromShape:(_xmlNode *)a3 toGraphic:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  EDOfficeArtClient *v10;
  id v11;
  void *v12;
  void *v13;
  _xmlNode *v14;
  _xmlNode *v15;
  BOOL v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(EDOfficeArtClient);
  objc_msgSend(v8, "setClientData:", v10);
  objc_opt_class();
  v11 = v9;
  objc_msgSend(v11, "exState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentSheet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDOfficeArtClient setSheet:](v10, "setSheet:", v13);

  v14 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)EXVmlNamespace, "ClientData");
  v15 = v14;
  if (!v14)
  {
    v18 = 0;
    goto LABEL_19;
  }
  v26 = 0;
  v16 = CXOptionalStringAttribute(v14, (void *)CXNoNamespace, (xmlChar *)"ObjectType", &v26);
  v17 = v26;
  v18 = v17;
  if (v16
    && (objc_msgSend(v17, "isEqualToString:", CFSTR("Checkbox")) & 1) == 0
    && (objc_msgSend(v18, "isEqualToString:", CFSTR("Radio")) & 1) == 0
    && (objc_msgSend(v18, "isEqualToString:", CFSTR("Button")) & 1) == 0
    && (objc_msgSend(v18, "isEqualToString:", CFSTR("GBox")) & 1) == 0
    && (objc_msgSend(v18, "isEqualToString:", CFSTR("List")) & 1) == 0
    && (objc_msgSend(v18, "isEqualToString:", CFSTR("Scroll")) & 1) == 0
    && (objc_msgSend(v18, "isEqualToString:", CFSTR("Spin")) & 1) == 0
    && (objc_msgSend(v18, "isEqualToString:", CFSTR("Drop")) & 1) == 0
    && (objc_msgSend(v18, "isEqualToString:", CFSTR("Label")) & 1) == 0
    && (objc_msgSend(v18, "isEqualToString:", CFSTR("Dialog")) & 1) == 0
    && (objc_msgSend(v18, "isEqualToString:", CFSTR("Edit")) & 1) == 0)
  {
    +[EXVmlClient readAnchor:to:](EXVmlClient, "readAnchor:to:", v15, v10);
    if (v18 && objc_msgSend(v18, "isEqualToString:", CFSTR("Note")))
    {
      objc_msgSend(a1, "readComment:to:state:", v15, v10, v12);
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        v22 = 0;
        goto LABEL_23;
      }
      v20 = (void *)v19;
      goto LABEL_21;
    }
LABEL_19:
    objc_msgSend(a1, "edTextBoxForVmlTextInShape:to:state:", a3, v10, v12);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (!v21)
    {
LABEL_23:

      goto LABEL_24;
    }
    v20 = (void *)v21;
    if (!v15)
    {
LABEL_22:
      -[EDOfficeArtClient setTextBox:](v10, "setTextBox:", v22);
      goto LABEL_23;
    }
LABEL_21:
    +[EXAlignmentInfo edAlignmentInfoFromVmlAlignmentInfoElement:state:](EXAlignmentInfo, "edAlignmentInfoFromVmlAlignmentInfoElement:state:", v15, v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlignmentInfo:", v23);

    objc_msgSend(v11, "exState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[EXProtection edProtectionFromXmlElement:state:](EXProtection, "edProtectionFromXmlElement:state:", v15, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setProtection:", v25);

    v22 = v20;
    goto LABEL_22;
  }
LABEL_24:

}

+ (void)readAnchor:(_xmlNode *)a3 to:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  EDTwoCellAnchor *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  unsigned int v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a4;
  v5 = OCXFindChild(a3, (CXNamespace *)EXVmlNamespace, "Anchor");
  if (v5)
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v5);
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v7;
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") != 8)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v9, "intValue");

    objc_msgSend(v8, "objectAtIndex:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    objc_msgSend(v8, "objectAtIndex:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    objc_msgSend(v8, "objectAtIndex:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    objc_msgSend(v8, "objectAtIndex:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intValue");

    objc_msgSend(v8, "objectAtIndex:", 5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = objc_msgSend(v18, "intValue");

    objc_msgSend(v8, "objectAtIndex:", 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend(v19, "intValue");

    objc_msgSend(v8, "objectAtIndex:", 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v20, "intValue");

    v21 = objc_alloc_init(EDTwoCellAnchor);
    *(float *)&v22 = (double)v11 / 100.0 * 72.0;
    *(float *)&v23 = (double)v15 / 100.0 * 72.0;
    -[EDTwoCellAnchor setFrom:](v21, "setFrom:", v27 | ((unint64_t)v22 << 32), v13 | ((unint64_t)v23 << 32));
    *(float *)&v24 = (double)(int)v16 / 100.0 * 72.0;
    *(float *)&v25 = (double)(int)v19 / 100.0 * 72.0;
    -[EDTwoCellAnchor setTo:](v21, "setTo:", v17 | ((unint64_t)v24 << 32), v18 | ((unint64_t)v25 << 32));
    -[EDTwoCellAnchor setRelative:](v21, "setRelative:", 0);
    if (OCXFindChild(a3, (CXNamespace *)EXVmlNamespace, "SizeWithCells"))
    {
      if (OCXFindChild(a3, (CXNamespace *)EXVmlNamespace, "MoveWithCells"))
        v26 = 2;
      else
        v26 = 1;
    }
    else
    {
      v26 = 0;
    }
    -[EDTwoCellAnchor setEditAs:](v21, "setEditAs:", v26);
    objc_msgSend(v30, "setAnchor:", v21);

  }
}

+ (id)edTextBoxForVmlTextInShape:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v6;
  _xmlNode *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a5;
  v7 = (_xmlNode *)OCXFindChild(a3, (CXNamespace *)OAVOfficeMainNamespace, "textbox");
  if (v7 && (v8 = OCXFindChild(v7, (CXNamespace *)CXNoNamespace, "div")) != 0)
  {
    +[EDTextBox textBox](EDTextBox, "textBox");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[EXString edStringWithRunsFromXmlDivElement:state:](EXString, "edStringWithRunsFromXmlDivElement:state:", v8, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)readComment:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  EDComment *v17;
  void *v18;

  v7 = a4;
  v8 = a5;
  v9 = OCXFindChild(a3, (CXNamespace *)EXVmlNamespace, "Row");
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v9);
    v11 = objc_msgSend(v10, "intValue");

  }
  else
  {
    v11 = 0xFFFFFFFFLL;
  }
  v12 = OCXFindChild(a3, (CXNamespace *)EXVmlNamespace, "Column");
  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v12);
    v14 = objc_msgSend(v13, "intValue");

    v15 = 0;
    if ((_DWORD)v11 != -1 && (_DWORD)v14 != -1)
    {
      +[EDReference referenceWithFirstRow:lastRow:firstColumn:lastColumn:](EDReference, "referenceWithFirstRow:lastRow:firstColumn:lastColumn:", v11, v11, v14, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init(EDComment);
      -[EDComment setRowIndex:](v17, "setRowIndex:", v11);
      -[EDComment setColumnIndex:](v17, "setColumnIndex:", v14);
      objc_msgSend(v8, "authorForReference:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDComment setAuthor:](v17, "setAuthor:", v18);

      -[EDComment setVisible:](v17, "setVisible:", OCXFindChild(a3, (CXNamespace *)EXVmlNamespace, "Visible") != 0);
      objc_msgSend(v7, "setComment:", v17);
      objc_msgSend(v8, "textBoxForReference:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
