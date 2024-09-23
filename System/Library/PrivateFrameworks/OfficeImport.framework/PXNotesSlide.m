@implementation PXNotesSlide

+ (id)readFromPackagePart:(id)a3 presentationState:(id)a4
{
  id v5;
  id v6;
  PDNotesSlide *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _xmlDoc *v17;
  _xmlNode *v18;
  CXNamespace *v19;
  _xmlNode *v20;
  CXNamespace *v21;
  uint64_t v22;
  OADColorMap *v23;
  void *v25;
  void *v26;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(PDNotesSlide);
  objc_msgSend(v6, "OCXNotesMasterRelationshipType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relationshipsByType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count") != 1)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v9, "objectAtIndex:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "targetLocation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelObjectForLocation:", v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  -[PDNotesSlide setNotesMaster:](v7, "setNotesMaster:", v10);
  objc_msgSend(v6, "officeArtState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "styleMatrix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OCXThemeOverrideRelationshipType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstPartWithRelationshipOfType:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PDSlideChild themeOverrides](v7, "themeOverrides");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    +[OAXThemeOverrides readFromPackagePart:toThemeOverrides:drawingState:](OAXThemeOverrides, "readFromPackagePart:toThemeOverrides:drawingState:", v14, v15, v11);
    objc_msgSend(v15, "styleMatrix");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v11, "setStyleMatrix:", v16);

  }
  v17 = (_xmlDoc *)objc_msgSend(v5, "xmlDocument");
  if (!v17)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v18 = OCXGetRootElement(v17);
  if (!v18)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v6, "PXPresentationMLNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = (_xmlNode *)OCXFindChild(v18, v19, "clrMapOvr");

  if (!v20)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  objc_msgSend(v6, "PXPresentationMLNamespace");
  v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v22 = OCXFindChild(v20, v21, "overrideClrMapping");

  if (v22)
  {
    v23 = objc_alloc_init(OADColorMap);
    -[PDSlideChild setColorMapOverride:](v7, "setColorMapOverride:", v23);
    +[OAXColorMap readFromXmlNode:toColorMap:](OAXColorMap, "readFromXmlNode:toColorMap:", v22, v23);

  }
  +[PXSlideBase readFromPackagePart:toSlideBase:presentationState:](PXSlideBase, "readFromPackagePart:toSlideBase:presentationState:", v5, v7, v6);
  objc_msgSend(v11, "setStyleMatrix:", v12);

  return v7;
}

@end
