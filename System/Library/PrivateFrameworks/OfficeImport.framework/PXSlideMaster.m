@implementation PXSlideMaster

+ (id)readFromPackagePart:(id)a3 presentationState:(id)a4
{
  OCPPackagePart *v6;
  id v7;
  PDSlideMaster *v8;
  void *v9;
  _xmlDoc *v10;
  xmlNodePtr v11;
  _xmlNode *v12;
  OCXState *v13;
  void *v14;
  CXNamespace *v15;
  uint64_t v16;
  void *v17;
  CXNamespace *v18;
  _xmlNode *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CXNamespace *v28;
  uint64_t v29;
  CXNamespace *v30;
  _xmlNode *v31;
  CXNamespace *v32;
  unsigned int v33;
  CXNamespace *v34;
  _xmlNode *Child;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  CXNamespace *v48;
  void *v50;
  OCXState *v51;
  void *v52;
  PDSlideMaster *v53;

  v6 = (OCPPackagePart *)a3;
  v7 = a4;
  v8 = [PDSlideMaster alloc];
  objc_msgSend(v7, "tgtPresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[PDSlideMaster initWithPresentation:](v8, "initWithPresentation:", v9);

  v10 = -[OCPPackagePart xmlDocument](v6, "xmlDocument");
  if (!v10)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v11 = OCXGetRootElement(v10);
  v12 = v11;
  if (!v11 || !xmlStrEqual(v11->name, (const xmlChar *)"sldMaster"))
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v7, "officeArtState");
  v13 = (OCXState *)objc_claimAutoreleasedReturnValue();
  OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v6, v13, (objc_selector *)sel_OCXThemeRelationshipType);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  -[PDSlideMaster theme](v53, "theme");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXTheme readFromPackagePart:toTheme:state:](OAXTheme, "readFromPackagePart:toTheme:state:", v14);
  objc_msgSend(v7, "PXPresentationMLNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = OCXFindChild(v12, v15, "clrMap");

  if (!v16)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  -[PDSlideMaster colorMap](v53, "colorMap");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColorMap readFromXmlNode:toColorMap:](OAXColorMap, "readFromXmlNode:toColorMap:", v16, v17);

  -[OCXState setPackagePart:](v13, "setPackagePart:", v6);
  objc_msgSend(v7, "PXPresentationMLNamespace");
  v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v19 = (_xmlNode *)OCXFindChild(v12, v18, "hf");

  if (v19)
  {
    CXDefaultStringAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"hdr", (NSString *)CFSTR("1"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
      -[PDSlideMaster setHeaderPlaceholderIsVisible:](v53, "setHeaderPlaceholderIsVisible:", objc_msgSend(v20, "isEqualToString:", CFSTR("0")) ^ 1);

    CXDefaultStringAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"ftr", (NSString *)CFSTR("1"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      -[PDSlideMaster setFooterPlaceholderIsVisible:](v53, "setFooterPlaceholderIsVisible:", objc_msgSend(v22, "isEqualToString:", CFSTR("0")) ^ 1);

    CXDefaultStringAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"dt", (NSString *)CFSTR("1"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      -[PDSlideMaster setDateTimePlaceholderIsVisible:](v53, "setDateTimePlaceholderIsVisible:", objc_msgSend(v24, "isEqualToString:", CFSTR("0")) ^ 1);

    CXDefaultStringAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"sldNum", (NSString *)CFSTR("1"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
      -[PDSlideMaster setSlideNumberPlaceholderIsVisible:](v53, "setSlideNumberPlaceholderIsVisible:", objc_msgSend(v26, "isEqualToString:", CFSTR("0")) ^ 1);

  }
  objc_msgSend(v7, "PXPresentationMLNamespace");
  v28 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v29 = OCXFindChild(v12, v28, "txStyles");

  if (v29)
    objc_msgSend(a1, "readTextStylesFromNode:slideMaster:state:", v29, v53, v7);
  +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read master slide"), 1.0, 0.1);
  +[PXSlideBase readFromPackagePart:toSlideBase:presentationState:](PXSlideBase, "readFromPackagePart:toSlideBase:presentationState:", v6, v53, v7);
  +[TCProgressContext endStage](TCProgressContext, "endStage");
  objc_msgSend(v7, "resetOfficeArtState");
  objc_msgSend(v7, "PXPresentationMLNamespace");
  v30 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v31 = (_xmlNode *)OCXFindChild(v12, v30, "sldLayoutIdLst");

  if (v31)
  {
    objc_msgSend(v7, "PXPresentationMLNamespace");
    v32 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v33 = CXCountChildren(v31, v32, (xmlChar *)"sldLayoutId");

    +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read layout slide"), (double)v33, 0.9);
    objc_msgSend(v7, "PXPresentationMLNamespace");
    v34 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v50 = v14;
    v51 = v13;
    Child = (_xmlNode *)OCXFindChild(v31, v34, "sldLayoutId");

    while (Child)
    {
      v36 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v7, "OCXRelationshipsNamespace");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v36, "tc_initFromXmlNode:nsWithFallbackNs:attributeName:", Child, v37, "id");

      if (!v38)
        +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
      -[OCPPackagePart relationshipForIdentifier:](v6, "relationshipForIdentifier:", v38, v50, v51);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[OCPPackagePart package](v6, "package");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "targetLocation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "partForLocation:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      -[PDSlideMaster addSlideLayout](v53, "addSlideLayout");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSlideLayout readFromPackagePart:toSlideLayout:presentationState:](PXSlideLayout, "readFromPackagePart:toSlideLayout:presentationState:", v42, v43, v7);
      objc_msgSend(v43, "setSlideId:", CXDefaultUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"id", 0));
      objc_msgSend(v43, "transition");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDSlideBase transition](v53, "transition");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setParent:", v45);

      objc_msgSend(v7, "resetOfficeArtState");
      -[OCPPackagePart package](v6, "package");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "targetLocation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "resetPartForLocation:", v47);

      objc_msgSend(v7, "PXPresentationMLNamespace");
      v48 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = OCXFindNextChild(Child, v48, (xmlChar *)"sldLayoutId");

    }
    v14 = v50;
    v13 = v51;
    +[TCProgressContext endStage](TCProgressContext, "endStage", v50, v51);
  }

  return v53;
}

+ (void)readTextStylesFromNode:(_xmlNode *)a3 slideMaster:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  CXNamespace *v9;
  uint64_t v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  void *v14;
  CXNamespace *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a4;
  v7 = a5;
  objc_msgSend(v7, "officeArtState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "PXPresentationMLNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "titleStyle");

  if (v10)
  {
    objc_msgSend(v18, "titleTextStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextListStyle readNode:textListStyle:state:](OAXTextListStyle, "readNode:textListStyle:state:", v10, v11, v8);

  }
  objc_msgSend(v7, "PXPresentationMLNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "bodyStyle");

  if (v13)
  {
    objc_msgSend(v18, "bodyTextStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextListStyle readNode:textListStyle:state:](OAXTextListStyle, "readNode:textListStyle:state:", v13, v14, v8);

  }
  objc_msgSend(v7, "PXPresentationMLNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = OCXFindChild(a3, v15, "otherStyle");

  if (v16)
  {
    objc_msgSend(v18, "otherTextStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextListStyle readNode:textListStyle:state:](OAXTextListStyle, "readNode:textListStyle:state:", v16, v17, v8);

  }
}

@end
