@implementation WXNote

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 skipNextSib:(BOOL *)a5 state:(id)a6
{
  OCXState *v9;
  CXNamespace *v10;
  _xmlAttr *v11;
  _xmlNode *v12;
  void *v13;
  CXNamespace *v14;
  int v15;
  CXNamespace *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _xmlNode *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  OCPPackagePart *v32;
  id v33;

  v33 = a4;
  v9 = (OCXState *)a6;
  -[OCXState WXMainNamespace](v9, "WXMainNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = CXRequiredLongAttribute(a3, v10, (xmlChar *)"id");

  -[OCXState packagePart](v9, "packagePart");
  v32 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
  if (xmlStrEqual(a3->name, (const xmlChar *)"footnoteReference"))
  {
    v12 = (_xmlNode *)-[OCXState xmlFootnoteWithID:](v9, "xmlFootnoteWithID:", v11);
    OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v32, v9, (objc_selector *)sel_OCXFootnotesRelationshipType);
  }
  else
  {
    v12 = (_xmlNode *)-[OCXState xmlEndnoteWithID:](v9, "xmlEndnoteWithID:", v11);
    OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v32, v9, (objc_selector *)sel_OCXEndnotesRelationshipType);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCXState WXMainNamespace](v9, "WXMainNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = CXDefaultBoolAttribute(v12, v14, (xmlChar *)"suppressRef", 0);

  objc_msgSend(v33, "setAutomaticNumbering:", v15 ^ 1u);
  -[OCXState WXMainNamespace](v9, "WXMainNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = CXDefaultBoolAttribute(a3, v16, (xmlChar *)"customMarkFollows", 0);

  if ((objc_msgSend(v33, "automaticNumbering") & v17) == 1)
    objc_msgSend(v33, "setAutomaticNumbering:", 0);
  if (objc_msgSend(v33, "automaticNumbering"))
  {
    objc_msgSend(v33, "reference");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXCharacterRun readFromString:source:to:](WXCharacterRun, "readFromString:source:to:", CFSTR("\x02"), a3, v18);

  }
  -[OCXState wxoavState](v9, "wxoavState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "packagePart");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPackagePart:", v13);
  -[OCXState drawingState](v9, "drawingState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "packagePart");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPackagePart:", v13);
  v29 = -[OCXState isNewSectionRequested](v9, "isNewSectionRequested");
  -[OCXState setNewSectionRequested:](v9, "setNewSectionRequested:", 0);
  -[OCXState packagePart](v9, "packagePart");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCXState setPackagePart:](v9, "setPackagePart:", v13);
  if (v17)
  {
    v22 = OCXNextSibling(a3);
    objc_msgSend(v33, "reference");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setString:", &stru_24F3BFFF8);
    if (xmlStrEqual(v22->name, (const xmlChar *)"sym"))
      +[WXSymbol readFrom:to:state:](WXSymbol, "readFrom:to:state:", v22, v23, v9);
    else
      +[WXCharacterRun readFrom:to:](WXCharacterRun, "readFrom:to:", v22, v23);
    objc_msgSend(v23, "string", v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "length"))
    {

    }
    else
    {
      objc_msgSend(v23, "properties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isSymbolCharacterOverridden");

      if (!v26)
      {
LABEL_16:

        v13 = v28;
        goto LABEL_17;
      }
    }
    *a5 = 1;
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend(v33, "text");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[WXText readFrom:baseStyle:to:state:](WXText, "readFrom:baseStyle:to:state:", v12, 0, v27, v9);

  objc_msgSend(v19, "setPackagePart:", v31);
  objc_msgSend(v20, "setPackagePart:", v30);
  -[OCXState setPackagePart:](v9, "setPackagePart:", v21);
  -[OCXState setNewSectionRequested:](v9, "setNewSectionRequested:", v29);

}

@end
