@implementation OAXParagraph

+ (void)readParagraph:(_xmlNode *)a3 paragraph:(id)a4 drawingState:(id)a5
{
  id v7;
  CXNamespace *v8;
  uint64_t v9;
  void *v10;
  CXNamespace *v11;
  uint64_t v12;
  void **p_vtable;
  void *v14;
  _xmlNode *v15;
  void *v16;
  CXNamespace *v17;
  uint64_t v18;
  void *v19;
  CXNamespace *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CXNamespace *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  CXNamespace *v31;
  uint64_t v32;
  void *v33;
  CXNamespace *v34;
  uint64_t v35;
  void *v36;
  CXNamespace *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;

  v41 = a4;
  v7 = a5;
  objc_msgSend(v7, "OAXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = OCXFindChild(a3, v8, "pPr");

  if (v9)
  {
    objc_msgSend(v41, "properties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextParaPropertyBag readParagraphProperties:paragraphProperties:drawingState:](OAXTextParaPropertyBag, "readParagraphProperties:paragraphProperties:drawingState:", v9, v10, v7);

  }
  objc_msgSend(v7, "OAXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v11, "endParaRPr");

  p_vtable = OAXFillOverlayEffect.vtable;
  if (v12)
  {
    objc_msgSend(v41, "paragraphEndCharacterProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextCharPropertyBag readCharacterProperties:characterProperties:drawingState:](OAXTextCharPropertyBag, "readCharacterProperties:characterProperties:drawingState:", v12, v14, v7);

  }
  v15 = OCXFirstChild(a3);
  v40 = *MEMORY[0x24BDBCA98];
  while (v15)
  {
    if (xmlStrEqual(v15->name, (const xmlChar *)"r"))
    {
      objc_msgSend(v41, "addRegularTextRun");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "OAXMainNamespace");
      v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v18 = OCXFindChild(v15, v17, "rPr");

      objc_msgSend(v16, "properties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_vtable + 207, "readCharacterProperties:characterProperties:drawingState:", v18, v19, v7);

      objc_msgSend(v7, "OAXMainNamespace");
      v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v21 = OCXFindChild(v15, v20, "t");

      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v21);
      if (v22)
      {
        objc_msgSend(v16, "text");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setString:", v22);
        goto LABEL_10;
      }
      goto LABEL_13;
    }
    if (xmlStrEqual(v15->name, (const xmlChar *)"br"))
    {
      objc_msgSend(v41, "addTextLineBreak");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "OAXMainNamespace");
      v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v25 = OCXFindChild(v15, v24, "rPr");

      objc_msgSend(v16, "properties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(p_vtable + 207, "readCharacterProperties:characterProperties:drawingState:", v25, v22, v7);
      goto LABEL_13;
    }
    if (xmlStrEqual(v15->name, (const xmlChar *)"fld"))
    {
      CXRequiredStringAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"type");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CXRequiredStringAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"id");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXTextFieldIdentity identityWithGuid:type:](OAXTextFieldIdentity, "identityWithGuid:type:", v23, v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (OAXDateTimeIdentityToFormatMap(void)::once != -1)
        dispatch_once(&OAXDateTimeIdentityToFormatMap(void)::once, &__block_literal_global_50);
      v27 = (id)OAXDateTimeIdentityToFormatMap(void)::theMap;
      objc_msgSend(v27, "objectForKeyedSubscript:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v29 = (id)objc_msgSend(v41, "addDateTimeFieldWithFormat:", objc_msgSend(v28, "intValue"));
        v16 = 0;
      }
      else
      {
        objc_msgSend(v7, "client");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "readClientTextField:identity:paragraph:state:", v15, v26, v41, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16
          || (objc_msgSend(v41, "addGenericTextFieldWithGuid:type:", v23, v22),
              (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(v7, "OAXMainNamespace", v40);
          v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v32 = OCXFindChild(v15, v31, "rPr");

          objc_msgSend(v16, "properties");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[OAXTextCharPropertyBag readCharacterProperties:characterProperties:drawingState:](OAXTextCharPropertyBag, "readCharacterProperties:characterProperties:drawingState:", v32, v33, v7);

          objc_msgSend(v7, "OAXMainNamespace");
          v34 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v35 = OCXFindChild(v15, v34, "pPr");

          objc_msgSend(v16, "paragraphProperties");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[OAXTextParaPropertyBag readParagraphProperties:paragraphProperties:drawingState:](OAXTextParaPropertyBag, "readParagraphProperties:paragraphProperties:drawingState:", v35, v36, v7);

          objc_msgSend(v7, "OAXMainNamespace");
          v37 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v38 = OCXFindChild(v15, v37, "t");

          if (v38)
          {
            v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v38);
            objc_msgSend(v16, "setText:", v39);
            p_vtable = (void **)(OAXFillOverlayEffect + 24);

          }
          else
          {
            p_vtable = (void **)(OAXFillOverlayEffect + 24);
          }
        }
      }

LABEL_10:
LABEL_13:

      goto LABEL_14;
    }
    if (xmlStrEqual(v15->name, (const xmlChar *)"m"))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v40, CFSTR("Cannot read math content"));
LABEL_14:
    v15 = OCXNextSibling(v15);
  }

}

@end
