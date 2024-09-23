@implementation PXSlideBase

+ (void)readFromPackagePart:(id)a3 toSlideBase:(id)a4 presentationState:(id)a5
{
  id v7;
  id v8;
  id v9;
  _xmlDoc *v10;
  _xmlNode *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  CXNamespace *v14;
  _xmlNode *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  CXNamespace *v24;
  _xmlNode *v25;
  __objc2_class **p_superclass;
  void *v27;
  _xmlNode *v28;
  unsigned int i;
  void *v30;
  void *v31;
  void *v32;
  unsigned int j;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  CXNamespace *v38;
  uint64_t v39;
  void *v40;
  CXNamespace *v41;
  uint64_t v42;
  PDTransition *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _xmlNode *v48;
  uint64_t v49;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v47 = v7;
  v10 = (_xmlDoc *)objc_msgSend(v7, "xmlDocument");
  if (!v10)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v11 = OCXGetRootElement(v10);
  if (!v11)
  {
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    v11 = 0;
  }
  v49 = 0;
  v48 = v11;
  v12 = CXOptionalLongAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"show", &v49);
  if (v49)
    v13 = 0;
  else
    v13 = v12;
  if (v13)
    objc_msgSend(v8, "setIsHidden:", 1);
  objc_msgSend(v9, "PXPresentationMLNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = (_xmlNode *)OCXFindChild(v48, v14, "cSld");

  CXDefaultStringAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"name", 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v16;
  if (v16)
    objc_msgSend(v8, "setName:", v16);
  objc_msgSend(v9, "officeArtState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPackagePart:", v7);
  objc_msgSend(v9, "tableStyleCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTableStyleCache:", v18);

  objc_msgSend(v8, "colorScheme");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setColorScheme:", v19);

  objc_msgSend(v8, "fontScheme");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFontScheme:", v20);

  objc_msgSend(v8, "colorMap");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setColorMap:", v21);

  objc_msgSend(v9, "PXPresentationMLNamespace");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXBackground readBackgroundFromParentNode:inNamespace:state:](OAXBackground, "readBackgroundFromParentNode:inNamespace:state:", v15, v22, v17);
  v23 = objc_claimAutoreleasedReturnValue();

  v45 = (void *)v23;
  if (v23)
    objc_msgSend(v8, "setBackground:", v23);
  objc_msgSend(v9, "PXPresentationMLNamespace");
  v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v25 = (_xmlNode *)OCXFindChild(v15, v24, "spTree");

  p_superclass = (__objc2_class **)(&OBJC_METACLASS___TCTaggedMessage + 8);
  if (v25)
  {
    +[PXSlideBase readLegacyDrawables:state:](PXSlideBase, "readLegacyDrawables:state:", v47, v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = OCXFirstChild(v25);
    for (i = 0; v28; ++i)
      v28 = OCXNextSibling(v28);
    +[TCProgressContext createStageWithSteps:takingSteps:name:](TCProgressContext, "createStageWithSteps:takingSteps:name:", CFSTR("read drawables"), (double)i, 1.0);
    objc_msgSend(v9, "PXPresentationMLNamespace");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXDrawable readDrawablesFromXmlNode:inNamespace:drawingState:](OAXDrawable, "readDrawablesFromXmlNode:inNamespace:drawingState:", v25, v30, v17);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v27, "count") + objc_msgSend(v31, "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObjectsFromArray:", v31);
    for (j = 0; objc_msgSend(v27, "count") > (unint64_t)j; ++j)
    {
      objc_msgSend(v27, "objectAtIndex:", j);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "oavState");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isDualDrawable:", v34);

      if ((v36 & 1) == 0)
        objc_msgSend(v32, "addObject:", v34);

    }
    objc_msgSend(v8, "setDrawables:", v32);

    p_superclass = &OBJC_METACLASS___TCTaggedMessage.superclass;
  }
  objc_msgSend(v9, "tgtPresentation");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "cacheGraphicStylesForSlideBase:", v8);

  objc_msgSend(p_superclass + 44, "endStage");
  objc_msgSend(v9, "PXPresentationMLNamespace");
  v38 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v39 = OCXFindChild(v48, v38, "timing");

  objc_msgSend(v8, "animation");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXAnimation readAnimationFromTimingXmlNode:tgtAnimation:drawingState:](PXAnimation, "readAnimationFromTimingXmlNode:tgtAnimation:drawingState:", v39, v40, v17);

  objc_msgSend(v9, "PXPresentationMLNamespace");
  v41 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v42 = OCXFindChild(v48, v41, "transition");

  if (v42 || (v42 = OCXFindChild(v48, (CXNamespace *)PXMacPowerPointNamespace, "transition")) != 0)
  {
    v43 = objc_alloc_init(PDTransition);
    +[PXTransition readTransitionFromNode:tgtTransition:drawingState:](PXTransition, "readTransitionFromNode:tgtTransition:drawingState:", v42, v43, v17);
    objc_msgSend(v8, "setTransition:", v43);

  }
  +[OAXTable readDefaultTableStyleWithDrawingState:](OAXTable, "readDefaultTableStyleWithDrawingState:", v17);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDefaultTableStyle:", v44);

}

+ (id)readLegacyDrawables:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _xmlDoc *v14;
  xmlDoc *v15;
  xmlNodePtr v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "oavState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OCXVmlDrawingRelationshipType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relationshipsByType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "package");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    if (objc_msgSend(v9, "count") != 1)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    objc_msgSend(v9, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "targetLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "partForLocation:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    v14 = +[OAVDrawable vmlDocumentFromPart:](OAVDrawable, "vmlDocumentFromPart:", v13);
    v15 = v14;
    if (v14)
    {
      v16 = OCXGetRootElement(v14);
      if (!v16)
        +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
      objc_msgSend(v7, "resetForNewDrawing");
      objc_msgSend(v7, "setPackagePart:", v13);
      objc_msgSend(v6, "PXPresentationMLNamespace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAVDrawable readDrawablesFromParent:inNamespace:state:](OAVDrawable, "readDrawablesFromParent:inNamespace:state:", v16, v17, v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "targetLocation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resetPartForLocation:", v20);

      xmlFreeDoc(v15);
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
