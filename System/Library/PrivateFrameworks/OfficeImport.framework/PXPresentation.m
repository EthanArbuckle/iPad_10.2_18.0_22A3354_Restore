@implementation PXPresentation

+ (id)readFromPackage:(id)a3 fileName:(id)a4 reader:(id)a5 cancel:(id)a6 isThumbnail:(BOOL)a7 delegate:(id)a8
{
  id v13;
  OADGraphicStyleCache *v14;
  PXPresentationState *v15;
  void *v16;
  _xmlDoc *v17;
  _xmlNode *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _xmlNode *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v40;
  CXNamespace *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  CXNamespace *v45;
  _xmlNode *v46;
  CXNamespace *v47;
  unsigned int v48;
  CXNamespace *v49;
  _xmlNode *Child;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  CXNamespace *v59;
  CXNamespace *v60;
  _xmlNode *v61;
  CXNamespace *v62;
  unsigned int v63;
  CXNamespace *v64;
  _xmlNode *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  CXNamespace *v70;
  void *v71;
  CXNamespace *v72;
  _xmlNode *v73;
  CXNamespace *v74;
  unsigned int v75;
  CXNamespace *v76;
  _xmlNode *v77;
  unint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  CXNamespace *v85;
  _BOOL4 v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  _xmlNode *v97;
  unint64_t v98;
  id v99;
  PDPresentation *v100;
  void *v101;
  void *v102;
  id v103;

  v87 = a7;
  v13 = a3;
  v91 = a4;
  v92 = a5;
  v93 = a6;
  v99 = a8;
  v100 = objc_alloc_init(PDPresentation);
  v14 = objc_alloc_init(OADGraphicStyleCache);
  -[OCDDocument setGraphicStyleCache:](v100, "setGraphicStyleCache:", v14);

  v15 = objc_alloc_init(PXPresentationState);
  -[PXPresentationState setCancelDelegate:](v15, "setCancelDelegate:", v93);
  -[PXPresentationState setTgtPresentation:](v15, "setTgtPresentation:", v100);
  -[OCDDocument setReader:](v100, "setReader:", v92);
  -[OCDDocument summary](v100, "summary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[OCXSummary readSummary:package:](OCXSummary, "readSummary:package:", v16, v13);

  objc_msgSend(v13, "mainDocumentPart");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v101)
  {

    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    v15 = 0;
  }
  v17 = (_xmlDoc *)objc_msgSend(v101, "xmlDocument");
  if (!v17)
  {

    v15 = 0;
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  }
  v18 = OCXGetRootElement(v17);
  if (!v18)
  {

    v15 = 0;
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    v18 = 0;
  }
  v103 = 0;
  v97 = v18;
  CXOptionalStringAttribute(v18, (void *)CXNoNamespace, (xmlChar *)"conformance", &v103);
  v96 = v103;
  if (v96 && objc_msgSend(v96, "isEqualToString:", CFSTR("strict")))
    -[PXPresentationState setupNSForXMLFormat:](v15, "setupNSForXMLFormat:", 1);
  objc_msgSend(a1, "readSizeFromChildOfElement:childName:state:", v97, "sldSz", v15);
  -[PDPresentation setSlideSize:](v100, "setSlideSize:");
  objc_msgSend(a1, "readSizeFromChildOfElement:childName:state:", v97, "notesSz", v15);
  -[PDPresentation setNotesSize:](v100, "setNotesSize:");
  objc_msgSend(a1, "readPresentationProperties:to:state:", v13, v100, v15);
  objc_msgSend(v91, "pathExtension");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lowercaseString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = v20;
  if ((objc_msgSend(v20, "isEqualToString:", CFSTR("ppsx")) & 1) != 0
    || objc_msgSend(v20, "isEqualToString:", CFSTR("ppsm")))
  {
    -[PDPresentation setIsAutoPlay:](v100, "setIsAutoPlay:", 1);
  }
  objc_msgSend(v13, "mainDocumentPart");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v13;
  -[OCXState OCXPackageViewPropsRelationshipType](v15, "OCXPackageViewPropsRelationshipType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstPartWithRelationshipOfType:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = v23;
  if (v23)
  {
    v24 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v23, "xmlDocument"));
    if (!v24)
    {

      v15 = 0;
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    }
    v25 = CXDefaultBoolAttribute(v24, (CXNamespace *)CXNoNamespace, (xmlChar *)"showComments", 1);
  }
  else
  {
    v25 = 1;
  }
  -[PDPresentation setIsCommentsVisible:](v100, "setIsCommentsVisible:", v25);
  objc_msgSend(a1, "readSlideIndicesWithPresentationPart:presentationState:", v101, v15);
  objc_msgSend(v13, "mainDocumentPart");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCXState OCXTableStylesRelationshipType](v15, "OCXTableStylesRelationshipType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "firstPartWithRelationshipOfType:", v27);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPresentationState tableStyleCache](v15, "tableStyleCache");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPresentationState officeArtState](v15, "officeArtState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXTable cacheTableStylesInPart:cache:drawingState:](OAXTable, "cacheTableStylesInPart:cache:drawingState:", v94, v28, v29);

  -[OCXState OCXCommentAuthorsRelationshipType](v15, "OCXCommentAuthorsRelationshipType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "relationshipsByType:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = v31;
  if (objc_msgSend(v31, "count"))
  {
    if (objc_msgSend(v31, "count") != 1)
    {

      v15 = 0;
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    }
    objc_msgSend(v31, "objectAtIndex:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "package");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "targetLocation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "partForLocation:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXCommentAuthor readCommentAuthors:presentation:state:](PXCommentAuthor, "readCommentAuthors:presentation:state:", v35, v100, v15);
    objc_msgSend(v101, "package");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "targetLocation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "resetPartForLocation:", v37);

  }
  -[OCXState OCXLegacyDocTextInfoRelationshipType](v15, "OCXLegacyDocTextInfoRelationshipType");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "firstPartWithRelationshipOfType:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "data");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    objc_opt_class();
    -[PXPresentationState oavState](v15, "oavState");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXLegacyText readLegacyTextGlobalsFromData:state:](PXLegacyText, "readLegacyTextGlobalsFromData:state:", v90, v40);

  }
  -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
  v41 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v42 = OCXFindChild(v97, v41, "defaultTextStyle");

  if (v42)
  {
    -[OCDDocument defaultTextStyle](v100, "defaultTextStyle");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPresentationState officeArtState](v15, "officeArtState");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextListStyle readNode:textListStyle:state:](OAXTextListStyle, "readNode:textListStyle:state:", v42, v43, v44);

  }
  -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
  v45 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v46 = (_xmlNode *)OCXFindChild(v97, v45, "sldMasterIdLst");

  if (!v46)
  {

    v15 = 0;
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  }
  -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
  v47 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v48 = CXCountChildren(v46, v47, (xmlChar *)"sldMasterId");

  +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read master slides"), (double)v48, 25.0);
  -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
  v49 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(v46, v49, "sldMasterId");

  while (Child)
  {
    if (-[PXPresentationState isCancelled](v15, "isCancelled"))
      break;
    v51 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[OCXState OCXRelationshipsNamespace](v15, "OCXRelationshipsNamespace");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v51, "tc_initFromXmlNode:nsWithFallbackNs:attributeName:", Child, v52, "id");

    if (!v53)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    objc_msgSend(v101, "relationshipForIdentifier:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "targetLocation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "partForLocation:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXSlideMaster readFromPackagePart:presentationState:](PXSlideMaster, "readFromPackagePart:presentationState:", v56, v15);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setSlideId:", CXRequiredUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"id"));
    -[PDPresentation addSlideMaster:](v100, "addSlideMaster:", v57);
    objc_msgSend(v54, "targetLocation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "resetPartForLocation:", v58);

    v13 = v102;
    -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
    v59 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v59, (xmlChar *)"sldMasterId");

  }
  +[TCProgressContext endStage](TCProgressContext, "endStage");
  -[PXPresentationState resetOfficeArtState](v15, "resetOfficeArtState");
  -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
  v60 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v61 = (_xmlNode *)OCXFindChild(v97, v60, "notesMasterIdLst");

  if (v61)
  {
    -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
    v62 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v63 = CXCountChildren(v61, v62, (xmlChar *)"notesMasterId");

    +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read note slides"), (double)v63, 5.0);
    -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
    v64 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v65 = (_xmlNode *)OCXFindChild(v61, v64, "notesMasterId");

    while (v65)
    {
      if (-[PXPresentationState isCancelled](v15, "isCancelled"))
        break;
      -[OCXReadState OCXReadRequiredRelationshipForNode:packagePart:](v15, "OCXReadRequiredRelationshipForNode:packagePart:", v65, v101);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "targetLocation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "partForLocation:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      +[PXNotesMaster readFromPackagePart:presentationState:](PXNotesMaster, "readFromPackagePart:presentationState:", v68, v15);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDPresentation addNotesMaster:](v100, "addNotesMaster:", v69);
      -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
      v70 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v65 = OCXFindNextChild(v65, v70, (xmlChar *)"notesMasterId");

      objc_msgSend(v66, "targetLocation");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resetPartForLocation:", v71);

    }
    +[TCProgressContext endStage](TCProgressContext, "endStage");
  }
  else
  {
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 5.0);
  }
  -[PXPresentationState resetOfficeArtState](v15, "resetOfficeArtState");
  -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
  v72 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v73 = (_xmlNode *)OCXFindChild(v97, v72, "sldIdLst");

  if (v73)
  {
    -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
    v74 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v75 = CXCountChildren(v73, v74, (xmlChar *)"sldId");

    if (v99 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v99, "readerDidStartDocument:withElementCount:", v100, v75);
    +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read slides"), (double)(2 * v75), 70.0);
    -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
    v76 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v77 = (_xmlNode *)OCXFindChild(v73, v76, "sldId");

    if (v77)
    {
      v78 = 0;
      v98 = v75 - 1;
      while (!-[PXPresentationState isCancelled](v15, "isCancelled"))
      {
        -[OCXReadState OCXReadRequiredRelationshipForNode:packagePart:](v15, "OCXReadRequiredRelationshipForNode:packagePart:", v77, v101);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "targetLocation");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "partForLocation:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v81)
        {

          +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
          v15 = 0;
        }
        +[PXSlide readFromPackagePart:presentationState:](PXSlide, "readFromPackagePart:presentationState:", v81, v15);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "setSlideId:", CXRequiredUnsignedLongAttribute(v77, (CXNamespace *)CXNoNamespace, (xmlChar *)"id"));
        if ((objc_msgSend(v82, "isHidden") & 1) == 0)
        {
          if (v99 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v83 = v78 >= v98 || v87;
            objc_msgSend(v99, "readerDidReadElement:atIndex:inDocument:isLastElement:", v82, v78, v100, v83);
            if ((_DWORD)v83)
            {
              -[PXPresentationState resetOfficeArtState](v15, "resetOfficeArtState");

              v13 = v102;
              break;
            }
            ++v78;
          }
          else
          {
            -[PDPresentation addSlide:](v100, "addSlide:", v82);
          }
        }
        -[PXPresentationState resetOfficeArtState](v15, "resetOfficeArtState");
        objc_msgSend(v79, "targetLocation");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "resetPartForLocation:", v84);

        v13 = v102;
        -[PXPresentationState PXPresentationMLNamespace](v15, "PXPresentationMLNamespace");
        v85 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v77 = OCXFindNextChild(v77, v85, (xmlChar *)"sldId");

        if (!v77)
          break;
      }
    }
    +[TCProgressContext endStage](TCProgressContext, "endStage");
    if (v99 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v99, "readerDidEndDocument:", v100);
  }
  else
  {
    +[TCProgressContext advanceProgress:](TCProgressContext, "advanceProgress:", 70.0);
  }

  return v100;
}

+ (void)readSlideIndicesWithPresentationPart:(id)a3 presentationState:(id)a4
{
  id v5;
  _xmlNode *v6;
  CXNamespace *v7;
  _xmlNode *v8;
  CXNamespace *v9;
  _xmlNode *Child;
  uint64_t v11;
  void *v12;
  void *v13;
  CXNamespace *v14;
  id v15;

  v15 = a3;
  v5 = a4;
  v6 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v15, "xmlDocument"));
  objc_msgSend(v5, "PXPresentationMLNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = (_xmlNode *)OCXFindChild(v6, v7, "sldIdLst");

  if (v8)
  {
    objc_msgSend(v5, "PXPresentationMLNamespace");
    v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(v8, v9, "sldId");

    if (Child)
    {
      v11 = 0;
      do
      {
        objc_msgSend(v5, "OCXReadRequiredRelationshipForNode:packagePart:", Child, v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "targetLocation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setSlideIndex:forSlideURL:", v11, v13);

        objc_msgSend(v5, "PXPresentationMLNamespace");
        v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        Child = OCXFindNextChild(Child, v14, (xmlChar *)"sldId");

        ++v11;
      }
      while (Child);
    }
  }

}

+ (CGSize)readSizeFromChildOfElement:(_xmlNode *)a3 childName:(const char *)a4 state:(id)a5
{
  CXNamespace *v7;
  _xmlNode *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  CGSize result;

  objc_msgSend(a5, "PXPresentationMLNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = (_xmlNode *)OCXFindChild(a3, v7, a4);

  v12 = 0;
  CXOptionalLongAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"cx", &v12);
  v11 = 0;
  CXOptionalLongAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"cy", &v11);
  v9 = (double)(v12 / 12700);
  v10 = (double)(v11 / 12700);
  result.height = v10;
  result.width = v9;
  return result;
}

+ (void)readPresentationProperties:(id)a3 to:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _xmlNode *v11;
  CXNamespace *v12;
  _xmlNode *v13;
  CXNamespace *v14;
  uint64_t v15;
  id v16;

  v16 = a4;
  v7 = a5;
  objc_msgSend(a3, "mainDocumentPart");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OCXPackagePresPropsRelationshipType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstPartWithRelationshipOfType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v10, "xmlDocument"));
    objc_msgSend(v7, "PXPresentationMLNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v13 = (_xmlNode *)OCXFindChild(v11, v12, "showPr");

    if (v13)
    {
      objc_msgSend(v16, "setIsLooping:", CXDefaultBoolAttribute(v13, (CXNamespace *)CXNoNamespace, (xmlChar *)"loop", 0));
      objc_msgSend(v7, "PXPresentationMLNamespace");
      v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v15 = OCXFindChild(v13, v14, "kiosk");

      if (v15)
        objc_msgSend(v16, "setIsKiosk:", 1);
    }
  }

}

@end
