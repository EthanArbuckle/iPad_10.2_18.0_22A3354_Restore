@implementation PBSlide

+ (void)readFromSlideContainer:(id)a3 toSlide:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  const void *v12;
  unsigned __int8 *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x22E2DDB58]();
  objc_msgSend(v19, "firstChildOfType:", 1007);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (const void *)objc_msgSend(v11, "eshObject");
  if (v12)
  else
    v13 = 0;
  objc_msgSend(v8, "setShowMasterShapes:", v13[92]);
  objc_msgSend(v9, "officeArtState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "xmlDocumentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "officeArtState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "styleMatrix");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readThemeOverridesFromSlideContainer:toSlideChild:doesFollowMasterScheme:state:", v19, v8, v13[93], v9);
  objc_msgSend(a1, "readComments:slide:state:", v19, v8, v9);
  objc_msgSend(a1, "readDrawingGroup:slide:state:", v19, v8, v9);
  if (objc_msgSend(v9, "hasSlideNumberPlaceholder"))
  {
    objc_msgSend(v8, "slideLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBSlideBase mapSlideNumberPlaceholder:tgtSlideBase:state:](PBSlideBase, "mapSlideNumberPlaceholder:tgtSlideBase:state:", v18, v8, v9);

  }
  objc_msgSend(v9, "setHasSlideNumberPlaceholder:", 0);
  objc_msgSend(v16, "setStyleMatrix:", v17);

  objc_autoreleasePoolPop(v10);
}

+ (void)readThemeOverridesFromSlideContainer:(id)a3 toSlideChild:(id)a4 doesFollowMasterScheme:(BOOL)a5 state:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  OcBinaryData *v15;
  void *v16;
  char v17;
  char v18;
  OADColorScheme *v19;
  OADColorScheme *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  OADColorMap *v27;
  void *v28;
  void *v29;
  char v30;
  char v31;
  xmlNodePtr v32;
  CXNamespace *v33;
  uint64_t v34;
  OADColorMap *v35;
  id v36;

  v36 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v11, "officeArtState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "xmlDocumentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "officeArtState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (OcBinaryData *)ESDAtomAccess<PptRoundTripThemeAtom>::first(v36, 0);
  objc_msgSend(v11, "officeArtState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "useXmlBlobs");

  if (v15)
    v18 = v17;
  else
    v18 = 0;
  if ((v18 & 1) != 0)
  {
    OCPNewZipPackageWithOcBinaryData(v15 + 1);
    v19 = (OADColorScheme *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      -[OADColorScheme mainDocumentPart](v19, "mainDocumentPart");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstPartWithRelationshipOfType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/themeOverride"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "themeOverrides");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXThemeOverrides readFromPackagePart:toThemeOverrides:drawingState:](OAXThemeOverrides, "readFromPackagePart:toThemeOverrides:drawingState:", v22, v23, v14);

    }
    objc_msgSend(v10, "themeOverrides");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "styleMatrix");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      objc_msgSend(v14, "setStyleMatrix:", v25);

  }
  else
  {
    if (a5)
      goto LABEL_13;
    v20 = objc_alloc_init(OADColorScheme);
    objc_msgSend(v10, "themeOverrides");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setColorScheme:", v20);

    v27 = objc_alloc_init(OADColorMap);
    objc_msgSend(v10, "setColorMapOverride:", v27);
    objc_msgSend(a1, "readColorScheme:colorScheme:colorMap:state:", v36, v20, v27, v11);

  }
LABEL_13:
  v28 = ESDAtomAccess<PptRoundTripColorMappingAtom>::first(v36, 0);
  objc_msgSend(v11, "officeArtState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "useXmlBlobs");

  if (v28)
    v31 = v30;
  else
    v31 = 0;
  if ((v31 & 1) != 0)
  {
    v32 = CXGetRootElement(*((const unsigned __int8 **)v28 + 9), *((_DWORD *)v28 + 16));
    if (v32)
    {
      objc_msgSend(v14, "OAXMainNamespace");
      v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v34 = OCXFindChild(v32, v33, "overrideClrMapping");

      if (v34)
      {
        v35 = objc_alloc_init(OADColorMap);
        objc_msgSend(v10, "setColorMapOverride:", v35);
        +[OAXColorMap readFromXmlNode:toColorMap:](OAXColorMap, "readFromXmlNode:toColorMap:", v34, v35);

      }
      xmlFreeDoc(v32->doc);
    }
  }

}

+ (id)notesSlideFromSlideContainer:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PDNotesSlide *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "tgtPresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notesMasterAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(PDNotesSlide);
    -[PDNotesSlide setNotesMaster:](v10, "setNotesMaster:", v9);
    objc_msgSend(a1, "readThemeOverridesFromSlideContainer:toSlideChild:doesFollowMasterScheme:state:", v6, v10, *((unsigned __int8 *)ESDAtomAccess<PptNotesAtom>::first(v6, 1) + 53), v7);
    +[PBSlideBase readDrawingGroup:slide:state:](PBSlideBase, "readDrawingGroup:slide:state:", v6, v10, v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
