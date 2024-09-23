@implementation WXText

+ (void)readFrom:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
  +[WXText createChildren:baseStyle:to:state:](WXText, "createChildren:baseStyle:to:state:", a3, a4, a5, a6);
}

+ (void)createChildren:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  _xmlNode *v11;
  int v12;
  uint64_t v13;
  const xmlChar *name;
  unint64_t v15;
  void *v16;
  int v17;
  CXNamespace *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a4;
  v9 = a5;
  v10 = a6;
  v11 = OCXFirstChild(a3);
  v12 = 0;
  while (v11)
  {
    if (objc_msgSend(v10, "isNewSectionRequested"))
    {
      +[WXText addNewSectionTo:state:](WXText, "addNewSectionTo:state:", v9, v10);
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v13;
    }
    name = v11->name;
    if (xmlStrEqual(name, (const xmlChar *)"p"))
    {
      +[WXText readFromParagraph:baseStyle:to:state:](WXText, "readFromParagraph:baseStyle:to:state:", v11, v25, v9, v10);
      ++v12;
      HIDWORD(v15) = 429496728 - 858993459 * v12;
      LODWORD(v15) = HIDWORD(v15);
      if ((v15 >> 2) <= 0xCCCCCCC)
      {
        objc_msgSend(v10, "cancelDelegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isCancelled");

        if (v17)
          +[TCMessageException raiseUntaggedMessage:](TCMessageException, "raiseUntaggedMessage:", CFSTR("TCUserCancelled"), 0);
      }
    }
    else
    {
      if (xmlStrEqual(name, (const xmlChar *)"tbl"))
      {
        +[WXText readFromTable:baseStyle:to:state:](WXText, "readFromTable:baseStyle:to:state:", v11, v25, v9, v10);
        goto LABEL_11;
      }
      if (xmlStrEqual(name, (const xmlChar *)"sdt"))
      {
        +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", WXFormsNotSupported);
        objc_msgSend(v10, "WXMainNamespace");
        v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v19 = OCXFindChild(v11, v18, "sdtContent");

        if (v19)
          +[WXText createChildren:baseStyle:to:state:](WXText, "createChildren:baseStyle:to:state:", v19, v25, v9, v10);
      }
      else
      {
        if (xmlStrEqual(name, (const xmlChar *)"subSection") || xmlStrEqual(name, (const xmlChar *)"pBdrGroup"))
        {
          +[WXText createChildren:baseStyle:to:state:](WXText, "createChildren:baseStyle:to:state:", v11, v25, v9, v10);
          goto LABEL_11;
        }
        if (xmlStrEqual(name, (const xmlChar *)"annotation"))
        {
          objc_msgSend(v10, "addText:node:", v9, v11);
          goto LABEL_11;
        }
        if (xmlStrEqual(name, (const xmlChar *)"sectPr"))
        {
          objc_msgSend(v10, "cancelDelegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isCancelled");

          if (v21)
            +[TCMessageException raiseUntaggedMessage:](TCMessageException, "raiseUntaggedMessage:", CFSTR("TCUserCancelled"), 0);
          objc_msgSend(v10, "document");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lastSection");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[WXSection readFrom:to:state:](WXSection, "readFrom:to:state:", v11, v22, v10);
LABEL_24:

          v23 = v24;
          goto LABEL_25;
        }
        if (xmlStrEqual(name, (const xmlChar *)"bookmarkStart"))
        {
          objc_msgSend(v10, "addPendingBookmark:", v11);
        }
        else if (xmlStrEqual(name, (const xmlChar *)"bookmarkEnd"))
        {
          objc_msgSend(v9, "lastBlock");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = v23;
            objc_msgSend(v23, "addBookmark");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[WXBookmark readFrom:to:state:](WXBookmark, "readFrom:to:state:", v11, v22, v10);
            goto LABEL_24;
          }
          objc_msgSend(v10, "addPendingBookmark:", v11);
LABEL_25:

        }
      }
    }
LABEL_11:
    v11 = OCXNextSibling(v11);
  }

}

+ (void)readFromStream:(_xmlTextReader *)a3 state:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WXText readFromStream:baseStyle:to:state:](WXText, "readFromStream:baseStyle:to:state:", a3, 0, v7, v8);

  +[WXText updateTextBoxIdsFromState:](WXText, "updateTextBoxIdsFromState:", v8);
}

+ (void)readFromStream:(_xmlTextReader *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
  +[WXText createChildrenFromStream:baseStyle:to:state:](WXText, "createChildrenFromStream:baseStyle:to:state:", a3, a4, a5, a6);
}

+ (void)createChildrenFromStream:(_xmlTextReader *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  OCXSStream *v11;
  uint64_t v12;
  int v13;
  const xmlChar *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  int v18;
  OCXSStream *v19;
  uint64_t v20;
  const xmlChar *v21;
  void *v22;
  int v23;
  xmlNodePtr v24;
  uint64_t v25;
  xmlNodePtr v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;

  v32 = a4;
  v9 = a5;
  v10 = a6;
  v11 = objc_alloc_init(OCXSStream);
  v12 = xmlTextReaderDepth(a3);
  -[OCXSStream pushLevel:name:](v11, "pushLevel:name:", v12, xmlTextReaderConstLocalName(a3));
  v13 = 0;
  while (+[OCXStreamUtility readStream:streamState:](OCXStreamUtility, "readStream:streamState:", a3, v11))
  {
    v14 = xmlTextReaderConstLocalName(a3);
    if (objc_msgSend(v10, "isNewSectionRequested"))
    {
      +[WXText addNewSectionTo:state:](WXText, "addNewSectionTo:state:", v9, v10);
      v15 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v15;
    }
    if (xmlStrEqual(v14, (const xmlChar *)"p"))
    {
      +[WXText readFromParagraph:baseStyle:to:state:](WXText, "readFromParagraph:baseStyle:to:state:", xmlTextReaderExpand(a3), v32, v9, v10);
      ++v13;
      HIDWORD(v16) = -858993459 * v13 + 429496728;
      LODWORD(v16) = HIDWORD(v16);
      if ((v16 >> 2) <= 0xCCCCCCC)
      {
        objc_msgSend(v10, "cancelDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isCancelled");

        if (v18)
          +[TCMessageException raiseUntaggedMessage:](TCMessageException, "raiseUntaggedMessage:", CFSTR("TCUserCancelled"), 0);
      }
    }
    else if (xmlStrEqual(v14, (const xmlChar *)"tbl"))
    {
      +[WXText readFromTable:baseStyle:to:state:](WXText, "readFromTable:baseStyle:to:state:", xmlTextReaderExpand(a3), v32, v9, v10);
    }
    else
    {
      if (xmlStrEqual(v14, (const xmlChar *)"sdt"))
      {
        +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", WXFormsNotSupported);
        v19 = objc_alloc_init(OCXSStream);
        v20 = xmlTextReaderDepth(a3);
        -[OCXSStream pushLevel:name:](v19, "pushLevel:name:", v20, xmlTextReaderConstLocalName(a3));
        while (+[OCXStreamUtility readStream:streamState:](OCXStreamUtility, "readStream:streamState:", a3, v19))
        {
          v21 = xmlTextReaderConstLocalName(a3);
          if (xmlStrEqual(v21, (const xmlChar *)"sdtContent"))
          {
            +[WXText createChildrenFromStream:baseStyle:to:state:](WXText, "createChildrenFromStream:baseStyle:to:state:", a3, v32, v9, v10);
            goto LABEL_16;
          }
        }
        goto LABEL_16;
      }
      if (xmlStrEqual(v14, (const xmlChar *)"subSection") || xmlStrEqual(v14, (const xmlChar *)"pBdrGroup"))
      {
        +[WXText createChildrenFromStream:baseStyle:to:state:](WXText, "createChildrenFromStream:baseStyle:to:state:", a3, v32, v9, v10);
      }
      else if (xmlStrEqual(v14, (const xmlChar *)"annotation"))
      {
        objc_msgSend(v10, "addText:node:", v9, xmlTextReaderExpand(a3));
      }
      else
      {
        if (xmlStrEqual(v14, (const xmlChar *)"sectPr"))
        {
          objc_msgSend(v10, "cancelDelegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isCancelled");

          if (v23)
            +[TCMessageException raiseUntaggedMessage:](TCMessageException, "raiseUntaggedMessage:", CFSTR("TCUserCancelled"), 0);
          v24 = xmlTextReaderExpand(a3);
          objc_msgSend(v10, "document");
          v19 = (OCXSStream *)objc_claimAutoreleasedReturnValue();
          -[OCXSStream lastSection](v19, "lastSection");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v24;
          v27 = (void *)v25;
          +[WXSection readFrom:to:state:](WXSection, "readFrom:to:state:", v26, v25, v10);
          goto LABEL_26;
        }
        if (xmlStrEqual(v14, (const xmlChar *)"bookmarkStart"))
        {
          objc_msgSend(v10, "addPendingBookmark:", xmlTextReaderExpand(a3));
        }
        else if (xmlStrEqual(v14, (const xmlChar *)"bookmarkEnd"))
        {
          objc_msgSend(v9, "lastBlock");
          v19 = (OCXSStream *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[OCXSStream addBookmark](v19, "addBookmark");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[WXBookmark readFrom:to:state:](WXBookmark, "readFrom:to:state:", xmlTextReaderExpand(a3), v27, v10);
LABEL_26:

            goto LABEL_16;
          }
          objc_msgSend(v10, "addPendingBookmark:", xmlTextReaderExpand(a3));
LABEL_16:

        }
        else
        {
          if (xmlStrEqual(v14, (const xmlChar *)"commentRangeStart"))
          {
            v28 = objc_opt_class();
            objc_msgSend(v9, "lastBlock");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            TSUDynamicCast(v28, (uint64_t)v29);
            v19 = (OCXSStream *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              objc_msgSend(v9, "addParagraph");
              v19 = (OCXSStream *)objc_claimAutoreleasedReturnValue();
            }
            +[WXAnnotation readFrom:to:type:state:](WXAnnotation, "readFrom:to:type:state:", xmlTextReaderExpand(a3), v19, 0, v10);
            goto LABEL_16;
          }
          if (xmlStrEqual(v14, (const xmlChar *)"commentRangeEnd"))
          {
            v30 = objc_opt_class();
            objc_msgSend(v9, "lastBlock");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            TSUDynamicCast(v30, (uint64_t)v31);
            v19 = (OCXSStream *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              objc_msgSend(v9, "addParagraph");
              v19 = (OCXSStream *)objc_claimAutoreleasedReturnValue();
            }
            +[WXAnnotation readFrom:to:type:state:](WXAnnotation, "readFrom:to:type:state:", xmlTextReaderExpand(a3), v19, 1, v10);
            goto LABEL_16;
          }
        }
      }
    }
  }

}

+ (void)readFromParagraph:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  _xmlNode *v23;
  void *v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v25 = a5;
  v10 = a6;
  v26 = v9;
  if (objc_msgSend(v9, "type") != 1)
  {

    v26 = 0;
  }
  if (a3)
  {
    objc_msgSend(v25, "addParagraph");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pendingComments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v12, "copy");
    v23 = a3;

    objc_msgSend(v10, "clearPendingComments");
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v24;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v13);
          +[WXAnnotation readFrom:to:type:state:](WXAnnotation, "readFrom:to:type:state:", objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "pointerValue", v23), v11, 0, v10);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v14);
    }

    objc_msgSend(v10, "pendingBookmarks");
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v17);
          v21 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "pointerValue", v23);
          objc_msgSend(v11, "addBookmark");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[WXBookmark readFrom:to:state:](WXBookmark, "readFrom:to:state:", v21, v22, v10);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v18);
    }

    objc_msgSend(v10, "clearPendingBookmarks");
    +[WXParagraph readFrom:baseStyle:to:state:](WXParagraph, "readFrom:baseStyle:to:state:", v23, v26, v11, v10);

  }
}

+ (id)addNewSectionTo:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(a3, "lastBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "blockType"))
    objc_msgSend(v6, "blockType");
  else
    +[WXParagraph readFromString:to:](WXParagraph, "readFromString:to:", CFSTR("\f"), v6);
  objc_msgSend(v5, "setNewSectionRequested:", 0);
  objc_msgSend(v5, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)readFromTable:(_xmlNode *)a3 baseStyle:(id)a4 to:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a5;
  v10 = a6;
  if (!a3)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v9, "addTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WXTable readFrom:to:state:](WXTable, "readFrom:to:state:", a3, v11, v10);

}

+ (void)updateTextBoxIdsFromState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v28 = a3;
  objc_msgSend(v28, "wxoavState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextVmlShapeIdToTextBoxMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1;
  while (1)
  {

    objc_msgSend(v5, "nextObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      break;
    objc_msgSend(v28, "wxoavState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextVmlShapeIdToTextBoxMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "wxoavState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "officeArtShapeIdWithVmlShapeId:", v3);

    objc_msgSend(v4, "setNextTextBoxId:", v10);
    v11 = objc_opt_class();
    objc_msgSend(v28, "drawingState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "drawableForShapeId:", objc_msgSend(v4, "nextTextBoxId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v11, (uint64_t)v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_opt_class();
    objc_msgSend(v15, "textBox");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v16, (uint64_t)v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_msgSend(v4, "nextTextBoxId");
    objc_msgSend(v4, "parent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "drawable");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "id");

    if (v19 == v22 || v18 == v4)
      objc_msgSend(v4, "setNextTextBoxId:", 0);
    objc_msgSend(v4, "flowId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v4, "flowSequence");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == 0;

      v6 &= v25;
    }

  }
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v28, "wxoavState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "nextVmlShapeIdToTextBoxMap");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __45__WXText_Private__updateTextBoxIdsFromState___block_invoke;
    v29[3] = &unk_24F3B24A8;
    v30 = v28;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v29);

  }
}

+ (void)readFrom:(_xmlNode *)a3 state:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WXText readFrom:baseStyle:to:state:](WXText, "readFrom:baseStyle:to:state:", a3, 0, v7, v8);

  +[WXText updateTextBoxIdsFromState:](WXText, "updateTextBoxIdsFromState:", v8);
}

+ (void)readFromString:(id)a3 to:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a4, "addParagraph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WXParagraph readFromString:to:](WXParagraph, "readFromString:to:", v6, v5);

}

void __45__WXText_Private__updateTextBoxIdsFromState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a2;
  v5 = a3;
  objc_msgSend(v5, "flowId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (objc_msgSend(v5, "flowSequence"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    v8 = v5;
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v8, "parent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "drawable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInt:", objc_msgSend(v11, "id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFlowId:", v12);

    objc_msgSend(v8, "setFlowSequence:", &unk_24F46A978);
    while (objc_msgSend(v8, "nextTextBoxId"))
    {
      v13 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "drawingState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "drawableForShapeId:", objc_msgSend(v8, "nextTextBoxId"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clientData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      TSUDynamicCast(v13, (uint64_t)v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_opt_class();
      objc_msgSend(v17, "textBox");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      TSUDynamicCast(v18, (uint64_t)v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v8, "flowSequence");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithUnsignedInt:", objc_msgSend(v22, "unsignedIntValue") + 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setFlowSequence:", v23);

        objc_msgSend(v8, "flowId");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setFlowId:", v24);

      }
      v8 = v20;
    }

  }
}

@end
