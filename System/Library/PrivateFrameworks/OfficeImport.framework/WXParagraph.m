@implementation WXParagraph

+ (void)readFrom:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  CXNamespace *v15;
  _xmlNode *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  CXNamespace *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (!a3)
    goto LABEL_18;
  if (v10)
  {
    v33 = 0;
    if (CXOptionalUnsignedAttributeFromHex8X(a3, (CXNamespace *)WXWord2010Namespace, (xmlChar *)"paraId", &v33))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v33);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[OCXSTValidator isValidValue:simpleType:](OCXSTValidator, "isValidValue:simpleType:", v12, 10);

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v33);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setIdentifier:", objc_msgSend(v14, "unsignedIntegerValue"));

      }
    }
  }
  objc_msgSend(v11, "WXMainNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = (_xmlNode *)OCXFindChild(a3, v15, "pPr");

  if (v16)
  {
    objc_msgSend(v10, "properties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v9)
    {
      objc_msgSend(v17, "setBaseStyle:", v9);
    }
    else
    {
      objc_msgSend(v10, "document");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "styleSheet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "defaultParagraphStyle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setBaseStyle:", v21);

    }
    +[WXParagraphProperties readFrom:to:readBaseStyle:state:](WXParagraphProperties, "readFrom:to:readBaseStyle:state:", v16, v18, 1, v11);
  }
  else if (v9)
  {
    objc_msgSend(v10, "properties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBaseStyle:", v9);
  }
  else
  {
    objc_msgSend(v10, "document");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "styleSheet");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "defaultParagraphStyle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
      goto LABEL_14;
    objc_msgSend(v10, "properties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "document");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "styleSheet");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "defaultParagraphStyle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBaseStyle:", v32);

  }
LABEL_14:
  +[WXParagraph readRunsTo:state:](WXParagraph, "readRunsTo:state:", v10, v11);
  +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", a3, a3->ns, v10, 0, v11);
  v22 = objc_msgSend(v10, "runCount");
  if (v16)
  {
    if (!v22)
    {
      objc_msgSend(v11, "WXMainNamespace");
      v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v24 = OCXFindChild(v16, v23, "rPr");

      if (v24)
      {
        objc_msgSend(v10, "addCharacterRun");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "properties");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[WXCharacterProperties readFrom:to:state:](WXCharacterProperties, "readFrom:to:state:", v24, v26, v11);

      }
    }
  }
LABEL_18:

}

+ (void)readRunsTo:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  objc_msgSend(v12, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodesToBeAdded:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  while (1)
  {
    objc_msgSend(v7, "nextObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    v10 = objc_msgSend(v9, "longValue");
    v8 = v9;
    if (xmlStrEqual(*(const xmlChar **)(v10 + 16), (const xmlChar *)"annotation"))
    {
      +[WXParagraph readAnnotationFrom:paragraphNamespace:to:state:](WXParagraph, "readAnnotationFrom:paragraphNamespace:to:state:", v10, 0, v12, v5);
      v8 = v9;
    }
  }
  objc_msgSend(v12, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearOutNodesToBeAdded:", v11);

}

+ (void)readRunsFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 targetRun:(id)a6 state:(id)a7
{
  id v11;
  id v12;
  _xmlNode *i;
  CXNamespace *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  CXNamespace *v20;
  uint64_t v21;
  id v22;

  v22 = a5;
  v11 = a6;
  v12 = a7;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (!sfaxmlNsEqual((uint64_t)i->ns, (uint64_t)a4))
    {
      objc_msgSend(v12, "drawingState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "OAXMathNamespace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "containsNode:", i))
      {
        v18 = objc_msgSend(v12, "readingMath");

        if ((v18 & 1) == 0)
        {
          objc_msgSend(v12, "setReadingMath:", 1);
          +[WXMath readMathRootFrom:paragraphNamespace:to:targetRun:state:](WXMath, "readMathRootFrom:paragraphNamespace:to:targetRun:state:", i, a4, v22, v11, v12);
          objc_msgSend(v12, "setReadingMath:", 0);
          continue;
        }
      }
      else
      {

      }
LABEL_14:
      +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", i, a4, v22, v11, v12);
      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"smartTag"))
      goto LABEL_14;
    if (xmlStrEqual(i->name, (const xmlChar *)"bdo"))
    {
      objc_msgSend(v12, "WXMainNamespace");
      v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      CXRequiredStringAttribute(i, v14, (xmlChar *)"dir");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("rtl")) & 1) != 0
        || objc_msgSend(v15, "isEqualToString:", CFSTR("ltr")))
      {
        +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", i, a4, v22, v11, v12);
      }
      goto LABEL_9;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"r"))
    {
      +[WXParagraph readRFrom:to:targetRun:state:](WXParagraph, "readRFrom:to:targetRun:state:", i, v22, v11, v12);
      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"fldSimple"))
    {
      +[WXParagraph readSimpleFieldFrom:paragraphNamespace:to:state:](WXParagraph, "readSimpleFieldFrom:paragraphNamespace:to:state:", i, a4, v22, v12);
      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"hyperlink"))
    {
      +[WXHyperlinkFieldMarker readFrom:paragraphNamespace:to:state:](WXHyperlinkFieldMarker, "readFrom:paragraphNamespace:to:state:", i, a4, v22, v12);
      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"commentRangeStart"))
    {
      v19 = 0;
LABEL_28:
      +[WXAnnotation readFrom:to:type:state:](WXAnnotation, "readFrom:to:type:state:", i, v22, v19, v12);
      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"commentRangeEnd"))
    {
      v19 = 1;
      goto LABEL_28;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"commentReference"))
    {
      v19 = 2;
      goto LABEL_28;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"bookmarkStart") || xmlStrEqual(i->name, (const xmlChar *)"bookmarkEnd"))
    {
      objc_msgSend(v22, "addBookmark");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXBookmark readFrom:to:state:](WXBookmark, "readFrom:to:state:", i, v15, v12);
LABEL_9:

      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"ins") || xmlStrEqual(i->name, (const xmlChar *)"del"))
    {
      +[WXParagraph readTrackingFrom:paragraphNamespace:to:state:](WXParagraph, "readTrackingFrom:paragraphNamespace:to:state:", i, a4, v22, v12);
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"sdt"))
    {
      +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", WXFormsNotSupported);
      objc_msgSend(v12, "WXMainNamespace");
      v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v21 = OCXFindChild(i, v20, "sdtContent");

      if (v21)
        +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", v21, a4, v22, v11, v12);
    }
  }

}

+ (void)readRFrom:(_xmlNode *)a3 to:(id)a4 targetRun:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  CXNamespace *v11;
  uint64_t v12;
  _xmlNode *i;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  WDRubyRun *v19;
  WDCharacterProperties *v20;
  WDCharacterProperties *v21;
  void *v22;
  void *v23;
  BOOL v24;
  WDPicture *v25;
  void *v26;
  void *v27;
  WDOleObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  WDCharacterProperties *v37;
  void *v38;
  WDOfficeArt *p_super;
  id v40;
  char v41;

  v40 = a4;
  v9 = a5;
  v10 = a6;
  objc_msgSend(v10, "WXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v11, "rPr");

  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"rPr"))
      goto LABEL_4;
    if (xmlStrEqual(i->name, (const xmlChar *)"t")
      || xmlStrEqual(i->name, (const xmlChar *)"tab")
      || xmlStrEqual(i->name, (const xmlChar *)"ptab")
      || xmlStrEqual(i->name, (const xmlChar *)"br")
      || xmlStrEqual(i->name, (const xmlChar *)"delText"))
    {
      if (v9)
      {
        v15 = v9;
      }
      else
      {
        objc_msgSend(v40, "addCharacterRun");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v15;
      +[WXCharacterRun readFrom:to:](WXCharacterRun, "readFrom:to:", i, v15);
      objc_msgSend(v16, "properties");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (xmlStrEqual(i->name, (const xmlChar *)"commentReference"))
      {
        v14 = 0;
        +[WXAnnotation readFrom:to:type:state:](WXAnnotation, "readFrom:to:type:state:", i, v40, 2, v10);
        goto LABEL_5;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"footnoteReference")
        || xmlStrEqual(i->name, (const xmlChar *)"endnoteReference"))
      {
        if (xmlStrEqual(i->name, (const xmlChar *)"footnoteReference"))
          objc_msgSend(v40, "addFootnote");
        else
          objc_msgSend(v40, "addEndnote");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        +[WXNote readFrom:to:skipNextSib:state:](WXNote, "readFrom:to:skipNextSib:state:", i, v16, &v41, v10);
        objc_msgSend(v16, "reference");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "properties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
          i = OCXNextSibling(i);
        goto LABEL_16;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"footnoteRef") || xmlStrEqual(i->name, (const xmlChar *)"endnoteRef"))
      {
        objc_msgSend(v40, "addSpecialCharacter");
        v19 = (WDRubyRun *)objc_claimAutoreleasedReturnValue();
        -[WDRubyRun setCharacterType:](v19, "setCharacterType:", 2);
        if (v12)
          goto LABEL_31;
LABEL_49:

        goto LABEL_4;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"pict")
        || xmlStrEqual(i->name, (const xmlChar *)"drawing")
        || xmlStrEqual(i->name, (const xmlChar *)"object"))
      {
        p_super = -[WDOfficeArt initWithParagraph:]([WDOfficeArt alloc], "initWithParagraph:", v40);
        v21 = [WDCharacterProperties alloc];
        objc_msgSend(v40, "document");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[WDCharacterProperties initWithDocument:](v21, "initWithDocument:", v22);

        +[WXCharacterProperties applyDeletionInsertionProperties:state:](WXCharacterProperties, "applyDeletionInsertionProperties:state:", v20, v10);
        if (v12)
          +[WXCharacterProperties readFrom:to:state:](WXCharacterProperties, "readFrom:to:state:", v12, v20, v10);
        -[WDRunWithCharacterProperties setProperties:](p_super, "setProperties:", v20);
        +[WXOfficeArt readFrom:parentRElement:parentParagraph:state:to:](WXOfficeArt, "readFrom:parentRElement:parentParagraph:state:to:", i, a3, v40, v10, p_super);
        if (-[WDOfficeArt isDrawableOverridden](p_super, "isDrawableOverridden"))
        {
          -[WDOfficeArt drawable](p_super, "drawable");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v20;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_41;
          v24 = -[WDOfficeArt isFloating](p_super, "isFloating");

          if (!v24)
          {
            v25 = -[WDOfficeArt initWithParagraph:]([WDPicture alloc], "initWithParagraph:", v40);
            v23 = p_super;
            -[WDRunWithCharacterProperties properties](p_super, "properties");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[WDRunWithCharacterProperties setProperties:](v25, "setProperties:", v26);

            -[WDOfficeArt drawable](p_super, "drawable");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[WDOfficeArt setDrawable:](v25, "setDrawable:", v27);

            -[WDOfficeArt setFloating:](v25, "setFloating:", 0);
            p_super = &v25->super;
LABEL_41:

          }
          p_super = p_super;
          -[WDOfficeArt drawable](p_super, "drawable");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v28 = (WDOleObject *)p_super;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = v38;
            objc_msgSend(v29, "ole");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = (WDOleObject *)p_super;
            if (v30)
            {
              v28 = -[WDOfficeArt initWithParagraph:]([WDOleObject alloc], "initWithParagraph:", v40);
              -[WDRunWithCharacterProperties properties](p_super, "properties");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[WDRunWithCharacterProperties setProperties:](v28, "setProperties:", v31);

              -[WDOfficeArt drawable](p_super, "drawable");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[WDOfficeArt setDrawable:](v28, "setDrawable:", v32);

              -[WDOfficeArt setFloating:](v28, "setFloating:", -[WDOfficeArt isFloating](p_super, "isFloating"));
            }
          }
          objc_msgSend(v40, "addRun:", v28);
          -[WDOfficeArt propagateTextTypeToDrawables](p_super, "propagateTextTypeToDrawables");

          v20 = v37;
LABEL_46:

        }
        v19 = (WDRubyRun *)p_super;
LABEL_48:

        goto LABEL_49;
      }
      if (xmlStrEqual(i->name, (const xmlChar *)"contentPart"))
      {
        objc_msgSend(v10, "packagePart");
        p_super = (WDOfficeArt *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "OCXReadRequiredRelationshipForNode:packagePart:", i, p_super);
        v20 = (WDCharacterProperties *)objc_claimAutoreleasedReturnValue();
        -[WDCharacterProperties targetLocation](v20, "targetLocation");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "relativeString");
        v28 = (WDOleObject *)objc_claimAutoreleasedReturnValue();

        +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", OAUnsupportedMediaType, v28);
        goto LABEL_46;
      }
      if (!xmlStrEqual(i->name, (const xmlChar *)"fldChar"))
      {
        if (!xmlStrEqual(i->name, (const xmlChar *)"instrText"))
        {
          if (xmlStrEqual(i->name, (const xmlChar *)"annotation"))
            goto LABEL_4;
          if (xmlStrEqual(i->name, (const xmlChar *)"sym"))
          {
            objc_msgSend(v10, "readSymbolTo");
            v19 = (WDRubyRun *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_msgSend(v10, "setReadSymbolTo:", 0);
              +[WXSymbol readFrom:to:state:](WXSymbol, "readFrom:to:state:", i, v19, v10);
              if (v12)
              {
                -[WDRunWithCharacterProperties properties](v19, "properties");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                +[WXCharacterProperties readFrom:to:state:](WXCharacterProperties, "readFrom:to:state:", v12, v35, v10);

              }
            }
            objc_msgSend(v40, "addSymbol");
            v20 = (WDCharacterProperties *)objc_claimAutoreleasedReturnValue();
            +[WXSymbol readFrom:parentRElement:to:state:](WXSymbol, "readFrom:parentRElement:to:state:", i, a3, v20, v10);
          }
          else
          {
            if (!xmlStrEqual(i->name, (const xmlChar *)"pgNum"))
            {
              if (xmlStrEqual(i->name, (const xmlChar *)"ruby"))
              {
                v19 = -[WDRubyRun initWithParagraph:]([WDRubyRun alloc], "initWithParagraph:", v40);
                +[WXRubyRun readFrom:to:state:](WXRubyRun, "readFrom:to:state:", i, v19, v10);
                objc_msgSend(v40, "addRun:", v19);
                goto LABEL_49;
              }
LABEL_4:
              v14 = 0;
              goto LABEL_5;
            }
            objc_msgSend(v40, "addSpecialCharacter");
            v19 = (WDRubyRun *)objc_claimAutoreleasedReturnValue();
            -[WDRubyRun setCharacterType:](v19, "setCharacterType:", 0);
            if (!v12)
              goto LABEL_49;
LABEL_31:
            -[WDRunWithCharacterProperties properties](v19, "properties");
            v20 = (WDCharacterProperties *)objc_claimAutoreleasedReturnValue();
            +[WXCharacterProperties readFrom:to:state:](WXCharacterProperties, "readFrom:to:state:", v12, v20, v10);
          }
          goto LABEL_48;
        }
        if (v9)
        {
          v34 = v9;
        }
        else
        {
          objc_msgSend(v40, "addCharacterRun");
          v34 = (id)objc_claimAutoreleasedReturnValue();
        }
        v16 = v34;
        objc_msgSend(v34, "properties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", i);
        objc_msgSend(v16, "setString:", v36);

        goto LABEL_16;
      }
      objc_msgSend(v40, "addFieldMarker");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[WXFieldMarker readFrom:to:](WXFieldMarker, "readFrom:to:", i, v16);
      objc_msgSend(v16, "properties");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v17;
LABEL_16:

    if (v14)
    {
      +[WXCharacterProperties applyDeletionInsertionProperties:state:](WXCharacterProperties, "applyDeletionInsertionProperties:state:", v14, v10);
      if (v12)
        +[WXCharacterProperties readFrom:to:state:](WXCharacterProperties, "readFrom:to:state:", v12, v14, v10);
    }
LABEL_5:

  }
}

+ (void)readFromString:(id)a3 to:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a4, "addCharacterRun");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", v6);

}

+ (void)readSimpleFieldFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  void *v11;
  CXNamespace *v12;
  void *v13;
  id v14;
  id v15;
  id v16;

  v16 = a5;
  v9 = a6;
  v10 = (id)objc_msgSend(v16, "addFieldMarker:", 19);
  objc_msgSend(v16, "addCharacterRun");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "WXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  CXRequiredStringAttribute(a3, v12, (xmlChar *)"instr");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setString:", v13);

  v14 = (id)objc_msgSend(v16, "addFieldMarker:", 20);
  +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", a3, a4, v16, 0, v9);
  v15 = (id)objc_msgSend(v16, "addFieldMarker:", 21);

}

+ (void)readTrackingFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 state:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  v9 = a6;
  wmxmlGetAuthorProperty(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  wmxmlGetDateProperty(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (xmlStrEqual(a3->name, (const xmlChar *)"ins"))
  {
    objc_msgSend(v9, "pushEditAuthor:date:", v10, v11);
    +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", a3, a4, v12, 0, v9);
    objc_msgSend(v9, "popEditAuthorDate");
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"del"))
  {
    objc_msgSend(v9, "pushDeleteAuthor:date:", v10, v11);
    +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", a3, a4, v12, 0, v9);
    objc_msgSend(v9, "popDeleteAuthorDate");
  }

}

+ (void)readAnnotationFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 state:(id)a6
{
  id v8;
  CXNamespace *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a5;
  v8 = a6;
  objc_msgSend(v8, "WXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  CXRequiredStringAttribute(a3, v9, (xmlChar *)"type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "hasPrefix:", CFSTR("wordBookmark")))
  {
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("wordCommentStart")) & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("wordCommentEnd")))
        goto LABEL_8;
      v12 = 1;
    }
    +[WXAnnotation readFrom:to:type:state:](WXAnnotation, "readFrom:to:type:state:", a3, v13, v12, v8);
    goto LABEL_8;
  }
  objc_msgSend(v13, "addBookmark");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WXBookmark readFrom:to:state:](WXBookmark, "readFrom:to:state:", a3, v11, v8);

LABEL_8:
}

@end
