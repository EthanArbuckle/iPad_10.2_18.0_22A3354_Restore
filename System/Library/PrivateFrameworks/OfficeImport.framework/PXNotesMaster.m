@implementation PXNotesMaster

+ (id)readFromPackagePart:(id)a3 presentationState:(id)a4
{
  OCPPackagePart *v5;
  OCXState *v6;
  PDNotesMaster *v7;
  _xmlDoc *v8;
  xmlNodePtr v9;
  _xmlNode *v10;
  void *v11;
  void *v12;
  void *v13;
  CXNamespace *v14;
  uint64_t v15;
  void *v16;
  CXNamespace *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v5 = (OCPPackagePart *)a3;
  v6 = (OCXState *)a4;
  v7 = objc_alloc_init(PDNotesMaster);
  v8 = -[OCPPackagePart xmlDocument](v5, "xmlDocument");
  if (!v8)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v9 = OCXGetRootElement(v8);
  v10 = v9;
  if (!v9 || !xmlStrEqual(v9->name, (const xmlChar *)"notesMaster"))
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  -[OCXState officeArtState](v6, "officeArtState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v5, v6, (objc_selector *)sel_OCXThemeRelationshipType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  -[PDNotesMaster theme](v7, "theme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  +[OAXTheme readFromPackagePart:toTheme:state:](OAXTheme, "readFromPackagePart:toTheme:state:", v12, v13, v11);
  -[OCXState PXPresentationMLNamespace](v6, "PXPresentationMLNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = OCXFindChild(v10, v14, "clrMap");

  if (!v15)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  -[PDNotesMaster colorMap](v7, "colorMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXColorMap readFromXmlNode:toColorMap:](OAXColorMap, "readFromXmlNode:toColorMap:", v15, v16);

  -[OCXState PXPresentationMLNamespace](v6, "PXPresentationMLNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = OCXFindChild(v10, v17, "notesStyle");

  if (v18)
  {
    -[PDNotesMaster notesTextStyle](v7, "notesTextStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextListStyle readNode:textListStyle:state:](OAXTextListStyle, "readNode:textListStyle:state:", v18, v19, v11);

  }
  +[PXSlideBase readFromPackagePart:toSlideBase:presentationState:](PXSlideBase, "readFromPackagePart:toSlideBase:presentationState:", v5, v7, v6);
  -[OCPPackagePart location](v5, "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCXState setModelObject:forLocation:](v6, "setModelObject:forLocation:", v7, v20);

  return v7;
}

@end
