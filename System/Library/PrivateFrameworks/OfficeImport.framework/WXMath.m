@implementation WXMath

+ (void)readMathRootFrom:(_xmlNode *)a3 paragraphNamespace:(_xmlNs *)a4 to:(id)a5 targetRun:(id)a6 state:(id)a7
{
  id v12;
  id v13;
  void *v14;
  CXNamespace *v15;
  _xmlNode *v16;
  _xmlNode *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _xmlNode *i;
  id v23;

  v23 = a5;
  v12 = a6;
  v13 = a7;
  objc_msgSend(v13, "drawingState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "OAXMathNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();

  if (-[CXNamespace containsNode:](v15, "containsNode:", a3))
  {
    if (xmlStrEqual(a3->name, (const xmlChar *)"oMathPara"))
    {
      v16 = (_xmlNode *)OCXFindChild(a3, v15, "oMathParaPr");
      if (v16)
      {
        v17 = (_xmlNode *)OCXFindChild(v16, v15, "jc");
        if (v17)
        {
          CXDefaultStringAttribute(v17, v15, (xmlChar *)"val", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "length"))
          {
            WXMathJustificationEnumMap();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "valueForString:", v18);

            if (v20 == -130883970)
              v21 = 1;
            else
              v21 = v20;
          }
          else
          {
            v21 = 1;
          }

        }
        else
        {
          v21 = 1;
        }
      }
      else
      {
        v21 = 0;
      }
      for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
      {
        if (-[CXNamespace containsNode:](v15, "containsNode:", i))
        {
          if (xmlStrEqual(i->name, (const xmlChar *)"oMath"))
          {
            objc_msgSend(a1, "readMathRunFrom:to:justification:state:", i, v23, v21, v13);
            +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", i, a4, v23, v12, v13);
          }
        }
      }
    }
    else if (xmlStrEqual(a3->name, (const xmlChar *)"oMath"))
    {
      objc_msgSend(a1, "readMathRunFrom:to:justification:state:", a3, v23, 0, v13);
      +[WXParagraph readRunsFrom:paragraphNamespace:to:targetRun:state:](WXParagraph, "readRunsFrom:paragraphNamespace:to:targetRun:state:", a3, a4, v23, v12, v13);
    }
  }

}

+ (void)readMathRunFrom:(_xmlNode *)a3 to:(id)a4 justification:(int)a5 state:(id)a6
{
  uint64_t v7;
  id v9;
  xmlNode *v10;
  void *v11;
  void *v12;
  WDCharacterProperties *v13;
  void *v14;
  WDCharacterProperties *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;

  v7 = *(_QWORD *)&a5;
  v20 = a4;
  v9 = a6;
  v10 = xmlCopyNode(a3, 1);
  sfaxmlNodeDescription(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  xmlFreeNode(v10);
  objc_msgSend(v20, "addMath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setJustification:", v7);
  v13 = [WDCharacterProperties alloc];
  objc_msgSend(v20, "document");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WDCharacterProperties initWithDocument:](v13, "initWithDocument:", v14);

  objc_msgSend(v20, "properties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isCharacterPropertiesOverridden");

  if (v17)
  {
    objc_msgSend(v20, "properties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "characterProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "copyPropertiesInto:", v15);

  }
  objc_msgSend(v12, "setProperties:", v15);
  -[WDCharacterProperties setResolveMode:](v15, "setResolveMode:", 0);
  -[WDCharacterProperties setDeleted:](v15, "setDeleted:", 0);
  -[WDCharacterProperties setDeletionDate:](v15, "setDeletionDate:", 0);
  -[WDCharacterProperties setIndexToAuthorIDOfDeletion:](v15, "setIndexToAuthorIDOfDeletion:", 0);
  -[WDCharacterProperties setEdited:](v15, "setEdited:", 0);
  -[WDCharacterProperties setEditDate:](v15, "setEditDate:", 0);
  -[WDCharacterProperties setIndexToAuthorIDOfEdit:](v15, "setIndexToAuthorIDOfEdit:", 0);
  -[WDCharacterProperties setResolveMode:](v15, "setResolveMode:", 2);
  +[WXCharacterProperties applyDeletionInsertionProperties:state:](WXCharacterProperties, "applyDeletionInsertionProperties:state:", v15, v9);

}

@end
