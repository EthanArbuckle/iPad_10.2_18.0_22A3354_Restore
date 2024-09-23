@implementation PXSlideChild

+ (void)readFromPackagePart:(id)a3 toSlideChild:(id)a4 presentationState:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _xmlDoc *v15;
  _xmlNode *v16;
  CXNamespace *v17;
  _xmlNode *v18;
  void *v19;
  CXNamespace *v20;
  uint64_t v21;
  OADColorMap *v22;
  id v23;

  v23 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "officeArtState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "styleMatrix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OCXThemeOverrideRelationshipType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstPartWithRelationshipOfType:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "themeOverrides");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXThemeOverrides readFromPackagePart:toThemeOverrides:drawingState:](OAXThemeOverrides, "readFromPackagePart:toThemeOverrides:drawingState:", v12, v13, v9);
    objc_msgSend(v13, "styleMatrix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v9, "setStyleMatrix:", v14);

  }
  v15 = (_xmlDoc *)objc_msgSend(v23, "xmlDocument");
  if (!v15)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v16 = OCXGetRootElement(v15);
  if (!v16)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v7, "setShowMasterShapes:", CXDefaultBoolAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"showMasterSp", 1));
  objc_msgSend(v7, "setShowMasterPlaceholderAnimations:", CXDefaultBoolAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"showMasterPhAnim", 1));
  objc_msgSend(v8, "PXPresentationMLNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = (_xmlNode *)OCXFindChild(v16, v17, "clrMapOvr");

  if (v18)
  {
    objc_msgSend(v8, "officeArtState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "OAXMainNamespace");
    v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v21 = OCXFindChild(v18, v20, "overrideClrMapping");

    if (v21)
    {
      v22 = objc_alloc_init(OADColorMap);
      objc_msgSend(v7, "setColorMapOverride:", v22);
      +[OAXColorMap readFromXmlNode:toColorMap:](OAXColorMap, "readFromXmlNode:toColorMap:", v21, v22);

    }
  }
  +[PXSlideBase readFromPackagePart:toSlideBase:presentationState:](PXSlideBase, "readFromPackagePart:toSlideBase:presentationState:", v23, v7, v8);
  objc_msgSend(v9, "setStyleMatrix:", v10);

}

@end
