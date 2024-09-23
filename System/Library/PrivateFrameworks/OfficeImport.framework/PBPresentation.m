@implementation PBPresentation

+ (void)readFrom:(void *)a3 to:(id)a4 cancel:(id)a5 asThumbnail:(BOOL)a6 delegate:(id)a7
{
  id v11;
  PBPresentationReaderState *v12;
  ESDRoot *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  char v17;
  _DWORD *v18;
  char v19;
  const void *v20;
  _DWORD *v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  OcBinaryData *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  char *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  id v45;
  id v46;

  v43 = a6;
  v46 = a4;
  v11 = a5;
  v45 = a7;
  v12 = -[PBPresentationReaderState initWithReader:tgtPresentation:]([PBPresentationReaderState alloc], "initWithReader:tgtPresentation:", a3, v46);
  -[PBPresentationReaderState setCancelDelegate:](v12, "setCancelDelegate:", v11);
  v13 = -[ESDRoot initWithPbState:]([ESDRoot alloc], "initWithPbState:", v12);
  -[PBPresentationReaderState setDocumentRoot:](v12, "setDocumentRoot:", v13);
  -[ESDRoot pbReferenceWithID:](v13, "pbReferenceWithID:", PptBinaryReader::getDocumentRef((PptBinaryReader *)a3));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  TCVerifyInputMeetsCondition(isKindOfClass & 1);

  objc_msgSend(v14, "firstChildOfType:", 1010);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v17 = objc_opt_isKindOfClass();
  TCVerifyInputMeetsCondition(v17 & 1);
  objc_msgSend(a1, "setFontEntites:environmentHolder:", v12, v16);
  objc_msgSend(a1, "setDefaultTextStyleWithEnvironmentHolder:state:", v16, v12);
  v18 = ESDAtomAccess<PptDocumentAtom>::first(v14, 1);
  +[PBHyperlink readHyperlinksWithPresentationState:](PBHyperlink, "readHyperlinksWithPresentationState:", v12);
  objc_msgSend(v14, "firstChildOfType:", 2000);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v19 = objc_opt_isKindOfClass();
  TCVerifyInputMeetsCondition(v19 & 1);
  objc_opt_class();
  +[PBProgTag readDocumentList:state:](PBProgTag, "readDocumentList:state:", v44, v12);
  objc_msgSend(v46, "setSlideSize:", (double)(v18[12] / 8), (double)(v18[13] / 8));
  objc_msgSend(v46, "setNotesSize:", (double)(v18[14] / 8), (double)(v18[15] / 8));
  objc_msgSend(v46, "setIsCommentsVisible:", *((_BYTE *)v18 + 82) != 0);
  objc_msgSend(v14, "firstChildOfType:", 1025);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v20 = (const void *)objc_msgSend(v41, "eshObject");
    if (v20)
    else
      v21 = 0;
    TCVerifyInputMeetsCondition(v21 != 0);
    objc_msgSend(v46, "setIsLooping:", *((unsigned __int8 *)v21 + 101));
    objc_msgSend(v46, "setIsKiosk:", v21[24] == 32);
  }
  objc_msgSend(a1, "drawingGroupHolderWithDocumentContainerHolder:", v14);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBPresentationReaderState officeArtState](v12, "officeArtState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[OABDrawingGroup readBlipsFromDrawingGroup:toDocument:state:](OABDrawingGroup, "readBlipsFromDrawingGroup:toDocument:state:", v42, v46, v22);

  v23 = (char *)ESDAtomAccess<PptTextDefaultSpecialInfoAtom>::first(v16, 0);
  if (v23)
  {
    objc_msgSend(v46, "defaultTextStyle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "defaultProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBCharacterProperties readCharacterProperties:specialInfo:state:](PBCharacterProperties, "readCharacterProperties:specialInfo:state:", v25, v23 + 48, v12);

  }
  -[PBPresentationReaderState officeArtState](v12, "officeArtState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "xmlDocumentState");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBPresentationReaderState officeArtState](v12, "officeArtState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "useXmlBlobs");

  if (v28)
  {
    v29 = (OcBinaryData *)ESDAtomAccess<PptRoundTripCustomTableStylesAtom>::first(v14, 0);
    if (v29)
    {
      OCPNewZipPackageWithOcBinaryData(v29 + 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        v39 = v11;
        objc_msgSend(v30, "partByRelationshipType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/tableStyles"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "tableStyleCache");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "officeArtState");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        +[OAXTable cacheTableStylesInPart:cache:drawingState:](OAXTable, "cacheTableStylesInPart:cache:drawingState:", v38, v32, v33);

        v11 = v39;
      }
    }
  }
  +[PBMasterLayoutMap masterLayoutMap](PBMasterLayoutMap, "masterLayoutMap");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readMasterAndLayouts:masterLayoutMap:state:", v14, v34, v12);
  v35 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "readSlides:masterLayoutMap:slideIdMap:state:isThumbnail:delegate:", v14, v34, v35, v12, v43, v45);
  if (!v43)
    objc_msgSend(a1, "readNotes:masterLayoutMap:slideIdMap:state:delegate:", v14, v34, v35, v12, v45);
  objc_msgSend(v46, "summary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    v37 = (char *)a3 + 8;
  else
    v37 = 0;
  +[OCBSummary readSummary:reader:](OCBSummary, "readSummary:reader:", v36, v37);

  if (v45 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v45, "readerDidEndDocument:", v46);

}

+ (void)setFontEntites:(id)a3 environmentHolder:(id)a4
{
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  _BYTE *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(a4, "firstChildOfType:", 2005);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    TCVerifyInputMeetsCondition(isKindOfClass & 1);
    v7 = objc_msgSend(v5, "childCount");
    if (v7)
    {
      v8 = 0;
      do
      {
        objc_msgSend(v5, "childAt:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "eshObject");
        if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v10 + 16))(v10) == 4023)
        {
          v11 = (const void *)objc_msgSend(v9, "eshObject");
          if (v11)
          else
            v12 = 0;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCsString:", v12 + 48);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addFontEntity:charSet:type:family:", v13, v12[73], v12[72] & 3, v12[72] & 0xF0);

        }
        ++v8;
      }
      while (v7 != v8);
    }
  }

}

+ (void)setDefaultTextStyleWithEnvironmentHolder:(id)a3 state:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  EshRecord *v9;
  EshRecord *v10;
  uint64_t Instance;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  v6 = objc_msgSend(v14, "indexOfFirstChildOfType:afterIndex:", 4003, 0);
  while (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v14, "childAt:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TCVerifyInputMeetsCondition(v7 != 0);
    v8 = (const void *)objc_msgSend(v7, "eshObject");
    if (v8)
    {
      if (v9)
      {
        v10 = v9;
        Instance = EshRecord::getInstance(v9);
        TCVerifyInputMeetsCondition(Instance < 9);
        *(_QWORD *)objc_msgSend(v5, "docSourceMasterStyleInfoOfType:", Instance) = v10;
        if ((_DWORD)Instance == 4)
        {
          objc_msgSend(v5, "tgtPresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "defaultTextStyle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[PBMasterStyle readMasterStyleAtom:baseMasterStyleAtom:masterBulletStyleAtom:textListStyle:state:](PBMasterStyle, "readMasterStyleAtom:baseMasterStyleAtom:masterBulletStyleAtom:textListStyle:state:", v10, 0, 0, v13, v5);

        }
      }
    }
    v6 = objc_msgSend(v14, "indexOfFirstChildOfType:afterIndex:", 4003, v6);

  }
}

+ (id)drawingGroupHolderWithDocumentContainerHolder:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;

  objc_msgSend(a3, "firstChildOfType:", 1035);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "childCount") == 1;
  TCVerifyInputMeetsCondition(v4);
  objc_msgSend(v3, "childAt:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  TCVerifyInputMeetsCondition(isKindOfClass & 1);

  return v5;
}

+ (void)readMasterAndLayouts:(id)a3 masterLayoutMap:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "tgtPresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __70__PBPresentation_Private__readMasterAndLayouts_masterLayoutMap_state___block_invoke;
  v19[3] = &unk_24F3B4D78;
  v12 = v11;
  v20 = v12;
  v13 = v10;
  v21 = v13;
  v14 = v9;
  v22 = v14;
  v24 = a1;
  v15 = v8;
  v23 = v15;
  objc_msgSend(a1, "readSlideListWithInstance:documentContainerHolder:state:block:", 1, v15, v13, v19);
  objc_msgSend(v15, "childOfType:instance:", 4080, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v13, "documentRoot");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "scanSlideListForLayoutTypes:slideListHolder:masterLayoutMap:", v17, v16, v14);

  }
  objc_msgSend(a1, "readCommentAuthorsFrom:state:", v15, v13);
  objc_msgSend(v13, "documentRoot");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "processLayoutTypesFromDocument:masterLayoutMap:state:", v18, v14, v13);

}

+ (void)readDefaultTextListStyle:(id)a3 fromDocumentContainer:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  PptTextMasterStyleAtom *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  PptParaProperty *v22;
  const PptParaProperty *LevelReference;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _OWORD *v32;
  char *v33;
  id v34;

  v34 = a3;
  v7 = a4;
  v8 = a5;
  v31 = v7;
  objc_msgSend(v7, "firstChildOfType:", 1010);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v9;
  v10 = (char *)ESDAtomAccess<PptTextDefaultParagraphStyleAtom>::first(v9, 0);
  v11 = (char *)ESDAtomAccess<PptTextDefaultCharacterStyleAtom>::first(v9, 0);
  v12 = v11;
  v32 = v11 + 48;
  if (v11)
    v13 = v11 + 48;
  else
    v13 = 0;
  v14 = (char *)ESDAtomAccess<PptTextDefaultSpecialInfoAtom>::first(v9, 0);
  objc_msgSend(v7, "firstChildOfType:", 2000);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBProgTag binaryTagDataWithName:inProgTagsParent:](PBProgTag, "binaryTagDataWithName:inProgTagsParent:", L"___PPT9", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (char *)ESDAtomAccess<PptTextDefaultStyle9Atom>::first(v26, 0);
  v16 = v15 + 48;
  if (!v15)
    v16 = 0;
  v33 = v16;
  objc_msgSend(v34, "defaultProperties", v26);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    +[PBCharacterProperties readCharacterProperties:specialInfo:state:](PBCharacterProperties, "readCharacterProperties:specialInfo:state:", v29, v14 + 48, v8);
  v17 = (PptTextMasterStyleAtom *)ESDAtomAccess<PptTextMasterStyleAtom>::byInstance(v9, 4, 1);
  v18 = *((_DWORD *)v17 + 14) - *((_DWORD *)v17 + 12);
  v19 = (unsigned __int16)(v18 >> 3);
  if ((unsigned __int16)(v18 >> 3))
  {
    v20 = 0;
    do
    {
      objc_msgSend(v34, "propertiesForListLevel:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        +[PBCharacterProperties readCharacterProperties:specialInfo:state:](PBCharacterProperties, "readCharacterProperties:specialInfo:state:", v21, v14 + 48, v8);
      if (v10)
      {
        v22 = (PptParaProperty *)operator new();
        PptParaProperty::PptParaProperty(v22);
        PptParaProperty::operator=(v22, (PptParaProperty *)(v10 + 48));
        LevelReference = (const PptParaProperty *)PptTextMasterStyleAtom::getLevelReference(v17, (unsigned __int16)v20);
        PptParaProperty::copyValuesOfNonOverriddenPropertiesFromParent((char *)v22, LevelReference);
        +[PBParagraphProperties readParagraphProperties:paragraphProperty:bulletStyle:isMaster:state:](PBParagraphProperties, "readParagraphProperties:paragraphProperty:bulletStyle:isMaster:state:", v21, v22, v33, 0, v8);
        PptParaProperty::~PptParaProperty(v22);
        MEMORY[0x22E2DD408]();
      }
      if (v12)
      {
        v24 = operator new();
        PptCharProperty::PptCharProperty((PptCharProperty *)v24);
        *(_OWORD *)v24 = *v32;
        *(_QWORD *)(v24 + 16) = *((_QWORD *)v13 + 2);
        *(_DWORD *)(v24 + 24) = *((_DWORD *)v13 + 6);
        *(_WORD *)(v24 + 28) = *((_WORD *)v13 + 14);
        v25 = PptTextMasterStyleAtom::getLevelReference(v17, (unsigned __int16)v20);
        PptCharProperty::copyValuesOfNonOverriddenPropertiesFromParent((PptCharProperty *)v24, (const PptCharProperty *)(v25 + 48));
        +[PBCharacterProperties readCharacterProperties:characterProperty:state:](PBCharacterProperties, "readCharacterProperties:characterProperty:state:", v21, v24, v8);
        MEMORY[0x22E2DD408](v24, 0x1000C40F1E6B3FFLL);
      }

      ++v20;
    }
    while (v19 != v20);
  }

}

+ (void)scanSlideListForLayoutTypes:(id)a3 slideListHolder:(id)a4 masterLayoutMap:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  const void *v12;
  ESDContainer *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v7, "childCount");
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend(v7, "childAt:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (const void *)objc_msgSend(v11, "eshObject");
      if ((*(unsigned int (**)(const void *))(*(_QWORD *)v12 + 16))(v12) == 1011
        && (*(unsigned int (**)(const void *))(*(_QWORD *)v12 + 80))(v12))
      {
        v13 = (ESDContainer *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        TCVerifyInputMeetsCondition(isKindOfClass & 1);
        objc_msgSend(v8, "masterInfoForSlideHolder:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "slideLayoutForSlideHolder:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
          objc_msgSend(v15, "cacheTargetLayoutType:", pdSlideLayoutTypeForPptSlideHolder(v13));

      }
    }
  }

}

+ (void)processLayoutTypesFromDocument:(id)a3 masterLayoutMap:(id)a4 state:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  uint64_t i;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  char *v102;
  char *v103;
  char *v104;
  char *v105;
  char *v106;
  char *v107;
  char *v108;
  char *v109;
  char *v110;
  char *v111;
  int *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  char *v120;
  int *v121;
  OADShape *v122;
  OADPresetShapeGeometry *v123;
  PDOfficeArtClient *v124;
  PDPlaceholder *v125;
  uint64_t v126;
  uint64_t v127;
  CGFloat v128;
  CGFloat v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  double *v133;
  double MidX;
  CGFloat MidY;
  double v136;
  double v137;
  double v138;
  CGFloat v139;
  CGFloat v140;
  CGFloat v141;
  OADOrientedBounds *v142;
  void *v143;
  OADTextBody *v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  id v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  unsigned int v156;
  uint64_t v157;
  void *v158;
  double v159;
  double v160;
  double v161;
  double v162;
  void *v163;
  id v164;
  void *v165;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v170;
  CGFloat v171;
  CGFloat v172;
  CGFloat v173;
  void *v174;
  CGFloat v175;
  CGFloat v176;
  CGFloat v177;
  CGFloat v178;
  CGFloat v179;
  CGFloat v180;
  CGFloat v181;
  CGFloat v182;
  double v183;
  double v184;
  CGFloat v185;
  CGFloat v186;
  CGFloat v187;
  CGFloat v188;
  CGFloat v189;
  CGFloat v190;
  CGFloat v191;
  CGFloat v192;
  id v193;
  CGFloat v194;
  CGFloat v195;
  CGFloat v196;
  CGFloat v197;
  CGFloat v198;
  CGFloat v199;
  CGFloat rect;
  CGAffineTransform v201;
  CGAffineTransform v202;
  CGAffineTransform v203;
  CGAffineTransform v204;
  CGAffineTransform v205;
  CGAffineTransform v206;
  CGAffineTransform v207;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;

  v147 = a3;
  v149 = a4;
  v164 = a5;
  if ((+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultBoundsInitialized & 1) == 0)
  {
    +[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultBoundsInitialized = 1;
    TCRectMakeWithSides();
    *(_QWORD *)+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds = v7;
    *(_QWORD *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[8] = v8;
    *(_QWORD *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[16] = v9;
    *(_QWORD *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[24] = v10;
    TCRectMakeWithSides();
    *(_QWORD *)ymmword_255AFD668 = v11;
    *(_QWORD *)&ymmword_255AFD668[8] = v12;
    *(_QWORD *)&ymmword_255AFD668[16] = v13;
    *(_QWORD *)&ymmword_255AFD668[24] = v14;
    TCRectMakeWithSides();
    *(_QWORD *)ymmword_255AFD688 = v15;
    *(_QWORD *)&ymmword_255AFD688[8] = v16;
    *(_QWORD *)&ymmword_255AFD688[16] = v17;
    *(_QWORD *)&ymmword_255AFD688[24] = v18;
    TCRectMakeWithSides();
    *(_QWORD *)ymmword_255AFD6A8 = v19;
    *(_QWORD *)&ymmword_255AFD6A8[8] = v20;
    *(_QWORD *)&ymmword_255AFD6A8[16] = v21;
    *(_QWORD *)&ymmword_255AFD6A8[24] = v22;
    TCRectMakeWithSides();
    *(_QWORD *)ymmword_255AFD6C8 = v23;
    *(_QWORD *)&ymmword_255AFD6C8[8] = v24;
    *(_QWORD *)&ymmword_255AFD6C8[16] = v25;
    *(_QWORD *)&ymmword_255AFD6C8[24] = v26;
    TCRectMakeWithSides();
    qword_255AFD708 = v27;
    unk_255AFD710 = v28;
    qword_255AFD718 = v29;
    unk_255AFD720 = v30;
    TCRectMakeWithSides();
    qword_255AFD728 = v31;
    unk_255AFD730 = v32;
    qword_255AFD738 = v33;
    unk_255AFD740 = v34;
    TCRectMakeWithSides();
    qword_255AFD748 = v35;
    unk_255AFD750 = v36;
    qword_255AFD758 = v37;
    unk_255AFD760 = v38;
    TCRectMakeWithSides();
    qword_255AFD768 = v39;
    unk_255AFD770 = v40;
    qword_255AFD778 = v41;
    unk_255AFD780 = v42;
    TCRectMakeWithSides();
    qword_255AFD788 = v43;
    unk_255AFD790 = v44;
    qword_255AFD798 = v45;
    unk_255AFD7A0 = v46;
    TCRectMakeWithSides();
    qword_255AFD7A8 = v47;
    unk_255AFD7B0 = v48;
    qword_255AFD7B8 = v49;
    unk_255AFD7C0 = v50;
    TCRectMakeWithSides();
    *(_QWORD *)ymmword_255AFD7C8 = v51;
    *(_QWORD *)&ymmword_255AFD7C8[8] = v52;
    *(_QWORD *)&ymmword_255AFD7C8[16] = v53;
    *(_QWORD *)&ymmword_255AFD7C8[24] = v54;
    TCRectMakeWithSides();
    *(_QWORD *)ymmword_255AFD7E8 = v55;
    *(_QWORD *)&ymmword_255AFD7E8[8] = v56;
    *(_QWORD *)&ymmword_255AFD7E8[16] = v57;
    *(_QWORD *)&ymmword_255AFD7E8[24] = v58;
    *(CGRect *)ymmword_255AFD5E8 = CGRectUnion(*(CGRect *)ymmword_255AFD668, *(CGRect *)ymmword_255AFD688);
    *(CGRect *)ymmword_255AFD608 = CGRectUnion(*(CGRect *)ymmword_255AFD6A8, *(CGRect *)ymmword_255AFD6C8);
    *(CGRect *)ymmword_255AFD628 = CGRectUnion(*(CGRect *)ymmword_255AFD668, *(CGRect *)ymmword_255AFD6A8);
    *(CGRect *)ymmword_255AFD648 = CGRectUnion(*(CGRect *)ymmword_255AFD688, *(CGRect *)ymmword_255AFD6C8);
    *(CGRect *)ymmword_255AFD5C8 = CGRectUnion(*(CGRect *)ymmword_255AFD628, *(CGRect *)ymmword_255AFD648);
    *(CGRect *)ymmword_255AFD6E8 = CGRectUnion(*(CGRect *)+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds, *(CGRect *)ymmword_255AFD5C8);
    *(CGRect *)ymmword_255AFD808 = CGRectUnion(*(CGRect *)ymmword_255AFD7C8, *(CGRect *)ymmword_255AFD7E8);
  }
  v59 = (double *)MEMORY[0x24BDBEFB0];
  v161 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v162 = *MEMORY[0x24BDBEFB0];
  v187 = *(double *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[8];
  v188 = *(double *)+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds;
  v185 = *(double *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[24];
  v186 = *(double *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[16];
  v177 = *(double *)&ymmword_255AFD5C8[8];
  v178 = *(double *)ymmword_255AFD5C8;
  v175 = *(double *)&ymmword_255AFD5C8[24];
  v176 = *(double *)&ymmword_255AFD5C8[16];
  v211 = CGRectUnion(*(CGRect *)+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds, *(CGRect *)ymmword_255AFD5C8);
  y = v211.origin.y;
  x = v211.origin.x;
  height = v211.size.height;
  width = v211.size.width;
  objc_msgSend(v164, "tgtPresentation");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "slideSize");
  v62 = v61;
  v64 = v63;

  memset(&v205, 0, sizeof(v205));
  CGAffineTransformMakeScale(&v205, v62 / 5760.0, v64 / 4320.0);
  v159 = v59[1];
  v160 = *v59;
  objc_msgSend(v149, "allMasterIds");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v148, "count");
  v66 = v65;
  if (v65)
  {
    v67 = 0;
    v183 = v64;
    v184 = v62;
    v154 = v65;
    do
    {
      v150 = v67;
      objc_msgSend(v148, "objectAtIndex:", v147);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "intValue");

      objc_msgSend(v149, "masterInfoForMasterId:", v69);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "slideMaster");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v164, "masterStyles:", v174);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = v205;
      v212.origin.y = v187;
      v212.origin.x = v188;
      v212.size.height = v185;
      v212.size.width = v186;
      v213 = CGRectApplyAffineTransform(v212, &v204);
      v191 = v213.origin.y;
      v192 = v213.origin.x;
      v189 = v213.size.height;
      v190 = v213.size.width;
      objc_msgSend(v174, "placeholderWithType:placeholderTypeIndex:overrideIndex:", 0, 0, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = v70;
      if (v70)
      {
        objc_msgSend(v70, "drawableProperties");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "orientedBounds");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "bounds");
        v191 = v74;
        v192 = v73;
        v189 = v76;
        v190 = v75;

      }
      v203 = v205;
      v214.origin.y = v177;
      v214.origin.x = v178;
      v214.size.height = v175;
      v214.size.width = v176;
      v215 = CGRectApplyAffineTransform(v214, &v203);
      v181 = v215.origin.y;
      v182 = v215.origin.x;
      v179 = v215.size.height;
      v180 = v215.size.width;
      objc_msgSend(v174, "placeholderWithType:placeholderTypeIndex:overrideIndex:", 1, 0, 1);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = v77;
      if (v77)
      {
        objc_msgSend(v77, "drawableProperties");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "orientedBounds");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "bounds");
        v181 = v81;
        v182 = v80;
        v179 = v83;
        v180 = v82;

      }
      v216.origin.y = v191;
      v216.origin.x = v192;
      v216.size.height = v189;
      v216.size.width = v190;
      v228.origin.y = v181;
      v228.origin.x = v182;
      v228.size.height = v179;
      v228.size.width = v180;
      v217 = CGRectUnion(v216, v228);
      v172 = v217.origin.y;
      v173 = v217.origin.x;
      v170 = v217.size.height;
      v171 = v217.size.width;
      v84 = objc_msgSend(v174, "slideLayoutCount");
      if (v84)
      {
        for (i = 0; i != v84; ++i)
        {
          objc_msgSend(v174, "slideLayoutAtIndex:", i);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          +[PBSlideMaster flattenPlaceholderTextStylesIntoLayout:layoutType:masterStyleMap:](PBSlideMaster, "flattenPlaceholderTextStylesIntoLayout:layoutType:masterStyleMap:", v86, 0, v165);

        }
      }
      objc_msgSend(v153, "allTargetLayoutTypes");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v163, "count");
      v88 = v87;
      if (v87)
      {
        v89 = 0;
        v155 = v87;
        do
        {
          objc_msgSend(v163, "objectAtIndex:", v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v90, "intValue");

          objc_msgSend(v174, "slideLayoutOfType:", v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v92)
          {
            objc_msgSend(v174, "addSlideLayout");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "setSlideLayoutType:", v91);
            v93 = v91 - 1;
            v94 = 18;
            v95 = 13;
            v96 = 14;
            v97 = 15;
            v98 = 16;
            v99 = 17;
            v100 = 7;
            v101 = 1;
            v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyLayoutBoundsArray;
            v103 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::title4BodiesLayoutBoundsArray;
            v104 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleOnlyLayoutBoundsArray;
            v105 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::emptyLayoutBoundsArray;
            v106 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyNextToBodyLayoutBoundsArray;
            v107 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyOverBodyLayoutBoundsArray;
            v108 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::verticalTitleBodyLayoutBoundsArray;
            v109 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::title2BodiesOverBodyLayoutBoundsArray;
            v110 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::largeBodyLayoutBoundsArray;
            v111 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::verticalTitleBodyOverBodyLayoutBoundsArray;
            switch((int)v91)
            {
              case 1:
              case 3:
                v101 = 0;
                v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::centerTitleSubtitleLayoutBoundsArray;
                goto LABEL_17;
              case 2:
              case 10:
              case 12:
              case 16:
              case 18:
              case 31:
                goto LABEL_17;
              case 4:
              case 13:
              case 14:
              case 15:
              case 19:
              case 20:
              case 22:
              case 24:
              case 30:
              case 32:
              case 33:
                v101 = 8;
                v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyNextToBodyLayoutBoundsArray;
                goto LABEL_17;
              case 5:
LABEL_23:
                v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                goto LABEL_54;
              case 6:
LABEL_24:
                v103 = v104;
                v96 = v100;
                v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                goto LABEL_54;
              case 7:
LABEL_25:
                v103 = v105;
                v96 = v98;
                v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                goto LABEL_54;
              case 8:
LABEL_26:
                v103 = v106;
                v96 = v91;
LABEL_27:
                v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__26_;
                goto LABEL_54;
              case 9:
LABEL_28:
                v103 = v107;
                v96 = v91;
                v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                goto LABEL_54;
              case 11:
LABEL_29:
                v103 = v108;
                v96 = v99;
                v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                goto LABEL_54;
              case 17:
LABEL_30:
                v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__15_;
                goto LABEL_54;
              case 21:
LABEL_31:
                v103 = v109;
                v96 = v95;
LABEL_32:
                v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__21_;
                goto LABEL_54;
              case 23:
              case 34:
                v101 = 11;
                v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::title2BodiesNextToBodyLayoutBoundsArray;
                goto LABEL_17;
              case 25:
              case 29:
                v101 = 10;
                v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyNextTo2BodiesLayoutBoundsArray;
                goto LABEL_17;
              case 26:
              case 28:
                v101 = 9;
                v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyOverBodyLayoutBoundsArray;
                goto LABEL_17;
              case 27:
LABEL_33:
                v103 = v110;
                v96 = v97;
                v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__25_;
                goto LABEL_54;
              case 35:
LABEL_34:
                v103 = v111;
                v96 = v94;
                v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__33_;
                goto LABEL_54;
              default:
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "PptSlideLayoutType pptSlideLayoutTypeForPDSlideLayoutType(PDSlideLayoutType)", &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyLayoutBoundsArray, &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyOverBodyLayoutBoundsArray, &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::verticalTitleBodyLayoutBoundsArray, &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::title2BodiesOverBodyLayoutBoundsArray, &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::largeBodyLayoutBoundsArray);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Binary/Mapper/PBPresentation.mm");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v113, v114, 545, 0, "Unknown slide layout type");

                +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
                v101 = 1;
                v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyLayoutBoundsArray;
LABEL_17:
                v103 = v102;
                v96 = v101;
                v104 = v102;
                v100 = v101;
                v105 = v102;
                v98 = v101;
                v106 = v102;
                LODWORD(v91) = v101;
                v107 = v102;
                v108 = v102;
                v99 = v101;
                v109 = v102;
                v95 = v101;
                v110 = v102;
                v97 = v101;
                v111 = v102;
                v94 = v101;
                v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                switch(v93)
                {
                  case 0:
                    break;
                  case 1:
                    v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                    break;
                  case 2:
                  case 30:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__29_;
                    break;
                  case 3:
                    v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                    break;
                  case 4:
                    goto LABEL_23;
                  case 5:
                    goto LABEL_24;
                  case 6:
                    goto LABEL_25;
                  case 7:
                    goto LABEL_26;
                  case 8:
                    goto LABEL_28;
                  case 9:
                    v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                    break;
                  case 10:
                    goto LABEL_29;
                  case 11:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__10_;
                    break;
                  case 12:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__11_;
                    break;
                  case 13:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__12_;
                    break;
                  case 14:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__13_;
                    break;
                  case 15:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__14_;
                    break;
                  case 16:
                    goto LABEL_30;
                  case 17:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__16_;
                    break;
                  case 18:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__17_;
                    break;
                  case 19:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__18_;
                    break;
                  case 20:
                    goto LABEL_31;
                  case 21:
                  case 25:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__24_;
                    break;
                  case 22:
                    goto LABEL_32;
                  case 23:
                  case 27:
                    goto LABEL_27;
                  case 24:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__23_;
                    break;
                  case 26:
                    goto LABEL_33;
                  case 28:
                  case 33:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__32_;
                    break;
                  case 29:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__28_;
                    break;
                  case 31:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__30_;
                    break;
                  case 32:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__31_;
                    break;
                  case 34:
                    goto LABEL_34;
                  default:
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "const PptPlaceholder *pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)");
                    v115 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Binary/Mapper/PBPresentation.mm");
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v115, v116, 484, 0, "Unexpected PD layout type");

                    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
                    v112 = 0;
                    break;
                }
LABEL_54:
                v193 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                v156 = v96;
                v157 = v89;
                v117 = *v112;
                v118 = *v103;
                if ((_DWORD)v117)
                {
                  v119 = 0;
                  v120 = v103 + 1;
                  v121 = v112 + 1;
                  do
                  {
                    TCVerifyInputMeetsCondition((_BYTE)v118 != 0xFF);
                    v122 = objc_alloc_init(OADShape);
                    objc_msgSend(v193, "addObject:", v122);
                    v123 = objc_alloc_init(OADPresetShapeGeometry);
                    -[OADShape setGeometry:](v122, "setGeometry:", v123);
                    -[OADShapeGeometry setIsEscher:](v123, "setIsEscher:", 1);
                    -[OADPresetShapeGeometry setType:](v123, "setType:", 1);
                    v124 = objc_alloc_init(PDOfficeArtClient);
                    -[OADDrawable setClientData:](v122, "setClientData:", v124);
                    v125 = objc_alloc_init(PDPlaceholder);
                    -[PDOfficeArtClient setPlaceholder:](v124, "setPlaceholder:", v125);
                    -[PDPlaceholder setIndex:](v125, "setIndex:", v119);
                    -[PDPlaceholder setType:](v125, "setType:", +[PBPlaceholder readPlaceholderType:](PBPlaceholder, "readPlaceholderType:", v117));
                    if ((v118 - 2) >= 0x11u)
                      v126 = 0;
                    else
                      v126 = dword_22A4D3B10[(char)(v118 - 2)];
                    -[PDPlaceholder setSize:](v125, "setSize:", v126);
                    v127 = +[PBPlaceholder readPlaceholderOrientation:](PBPlaceholder, "readPlaceholderOrientation:", v117);
                    -[PDPlaceholder setOrientation:](v125, "setOrientation:", v127);
                    v128 = v185;
                    v129 = v186;
                    v130 = v187;
                    v131 = v188;
                    v199 = v190;
                    rect = v189;
                    v132 = v192;
                    v198 = v191;
                    if ((_BYTE)v118)
                    {
                      v128 = v175;
                      v129 = v176;
                      v130 = v177;
                      v131 = v178;
                      v199 = v180;
                      rect = v179;
                      v132 = v182;
                      v198 = v181;
                      if (v118 >= 0xAu)
                      {
                        if (v118 - 16 < 4)
                          goto LABEL_63;
                        v128 = 4320.0;
                        v129 = 5760.0;
                        v130 = v161;
                        v131 = v162;
                        v199 = v62;
                        rect = v64;
                        v132 = v160;
                        v198 = v159;
                        if (v118 == 10)
                        {
LABEL_63:
                          v128 = height;
                          v129 = width;
                          v130 = y;
                          v131 = x;
                          v199 = v171;
                          rect = v170;
                          v132 = v173;
                          v198 = v172;
                        }
                      }
                    }
                    v133 = (double *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[32 * (char)v118];
                    v196 = v133[1];
                    v197 = *v133;
                    v194 = v133[3];
                    v195 = v133[2];
                    memset(&v202, 0, sizeof(v202));
                    v218.origin.x = v131;
                    v218.origin.y = v130;
                    v218.size.width = v129;
                    v218.size.height = v128;
                    MidX = CGRectGetMidX(v218);
                    v219.origin.x = v131;
                    v219.origin.y = v130;
                    v219.size.width = v129;
                    v219.size.height = v128;
                    MidY = CGRectGetMidY(v219);
                    CGAffineTransformMakeTranslation(&v202, -MidX, -MidY);
                    t1 = v202;
                    v220.origin.x = v132;
                    v220.origin.y = v198;
                    v220.size.width = v199;
                    v220.size.height = rect;
                    v136 = CGRectGetWidth(v220);
                    v221.origin.x = v131;
                    v221.origin.y = v130;
                    v221.size.width = v129;
                    v221.size.height = v128;
                    v137 = CGRectGetWidth(v221);
                    v222.origin.x = v132;
                    v222.origin.y = v198;
                    v222.size.width = v199;
                    v222.size.height = rect;
                    v138 = CGRectGetHeight(v222);
                    v223.origin.x = v131;
                    v223.origin.y = v130;
                    v223.size.width = v129;
                    v223.size.height = v128;
                    v139 = CGRectGetHeight(v223);
                    CGAffineTransformMakeScale(&t2, v136 / v137, v138 / v139);
                    CGAffineTransformConcat(&v210, &t1, &t2);
                    v202 = v210;
                    v207 = v210;
                    v224.origin.x = v132;
                    v224.origin.y = v198;
                    v224.size.width = v199;
                    v224.size.height = rect;
                    v140 = CGRectGetMidX(v224);
                    v225.origin.x = v132;
                    v225.origin.y = v198;
                    v225.size.width = v199;
                    v225.size.height = rect;
                    v141 = CGRectGetMidY(v225);
                    CGAffineTransformMakeTranslation(&v206, v140, v141);
                    CGAffineTransformConcat(&v210, &v207, &v206);
                    v202 = v210;
                    v201 = v210;
                    v226.origin.y = v196;
                    v226.origin.x = v197;
                    v226.size.height = v194;
                    v226.size.width = v195;
                    v227 = CGRectApplyAffineTransform(v226, &v201);
                    v142 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v227.origin.x, v227.origin.y, v227.size.width, v227.size.height);
                    -[OADDrawable drawableProperties](v122, "drawableProperties");
                    v143 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v143, "setOrientedBounds:", v142);

                    v144 = objc_alloc_init(OADTextBody);
                    -[OADShape setTextBody:](v122, "setTextBody:", v144);
                    v64 = v183;
                    v62 = v184;
                    if ((_DWORD)v127 == 1)
                    {
                      -[OADTextBody properties](v144, "properties");
                      v145 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v145, "setFlowType:", 6);

                    }
                    v117 = v121[v119];
                    v118 = v120[v119++];
                  }
                  while ((_DWORD)v117);
                }
                TCVerifyInputMeetsCondition(v118 == 255);
                +[PBHeadersFooters readHeadersFootersToSlideLayout:drawables:state:](PBHeadersFooters, "readHeadersFootersToSlideLayout:drawables:state:", v158, v193, v164);
                v66 = v154;
                v88 = v155;
                v89 = v157;
                objc_msgSend(v158, "setDrawables:", v193);
                objc_msgSend(v164, "tgtPresentation");
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v146, "cacheGraphicStylesForSlideBase:", v158);

                +[PBSlideBase mapSlideNumberPlaceholder:tgtSlideBase:state:](PBSlideBase, "mapSlideNumberPlaceholder:tgtSlideBase:state:", v174, v158, v164);
                +[PBSlideMaster flattenPlaceholderTextStylesIntoLayout:layoutType:masterStyleMap:](PBSlideMaster, "flattenPlaceholderTextStylesIntoLayout:layoutType:masterStyleMap:", v158, v156, v165);

                v92 = v158;
                break;
            }
          }

          ++v89;
        }
        while (v89 != v88);
      }
      objc_msgSend(v153, "cacheSlideLayouts");

      v67 = v150 + 1;
    }
    while (v150 + 1 != v66);
  }

}

+ (void)readSlides:(id)a3 masterLayoutMap:(id)a4 slideIdMap:(id)a5 state:(id)a6 isThumbnail:(BOOL)a7 delegate:(id)a8
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  char v24;
  int v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  BOOL v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;

  v13 = a3;
  v31 = a4;
  v14 = a6;
  v15 = a8;
  v30 = v14;
  objc_msgSend(v14, "tgtPresentation");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = objc_opt_respondsToSelector();
      if ((v17 & 1) != 0)
      {
        objc_msgSend(v13, "childOfType:instance:", 4080, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = objc_msgSend(v18, "indexOfFirstChildOfType:afterIndex:", 1011, -1);
          v21 = a1;
          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v22 = 0;
            do
            {
              v20 = objc_msgSend(v19, "indexOfFirstChildOfType:afterIndex:", 1011, v20);
              ++v22;
            }
            while (v20 != 0x7FFFFFFFFFFFFFFFLL);
            goto LABEL_16;
          }
        }
        else
        {
          v21 = a1;
        }
        v22 = 0;
LABEL_16:
        v23 = (void *)v16;
        objc_msgSend(v15, "readerDidStartDocument:withElementCount:", v16, v22);
        v24 = v17 & 1;

        v25 = 1;
        goto LABEL_10;
      }
    }
  }
  v21 = a1;
  v23 = (void *)v16;
  v24 = 0;
  v25 = 0;
LABEL_10:
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__24;
  v49 = __Block_byref_object_dispose__24;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __92__PBPresentation_Private__readSlides_masterLayoutMap_slideIdMap_state_isThumbnail_delegate___block_invoke;
  v32[3] = &unk_24F3B4DA0;
  v26 = v30;
  v33 = v26;
  v27 = v31;
  v39 = a7;
  v40 = v24;
  v34 = v27;
  v37 = &v45;
  v28 = v15;
  v35 = v28;
  v38 = &v41;
  v29 = v23;
  v36 = v29;
  objc_msgSend(v21, "readSlideListWithInstance:documentContainerHolder:state:block:", 0, v13, v26, v32);
  if (v25 && v46[5])
  {
    ++v42[3];
    objc_msgSend(v28, "readerDidReadElement:atIndex:inDocument:isLastElement:");
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

}

+ (void)addHeadersFootersToDocumentContainer:(id)a3 instance:(int)a4
{
  __int16 v4;
  char *v5;
  id v6;
  id v7;

  v4 = a4;
  objc_msgSend(a3, "addPptContainerChildOfType:", 4057);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  EshRecord::setInstance(objc_msgSend(v7, "eshContainer"), v4);
  v5 = (char *)operator new(0x40uLL);
  PptHeadersFootersAtom::PptHeadersFootersAtom((PptHeadersFootersAtom *)v5);
  v6 = (id)objc_msgSend(v7, "addEshChild:", v5);
  *((_DWORD *)v5 + 12) = 0;
  *((_WORD *)v5 + 26) = 256;
  *(_DWORD *)(v5 + 54) = 0;

}

+ (void)readThemeFromSlideMaster:(id)a3 document:(id)a4 theme:(id)a5 colorMap:(id)a6 state:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  xmlNodePtr v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v42 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = ESDAtomAccess<PptRoundTripThemeAtom>::first(v42, 0);
  objc_msgSend(v15, "officeArtState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "useXmlBlobs");

  if (v16)
    v19 = v18;
  else
    v19 = 0;
  if ((v19 & 1) != 0)
  {
    v20 = v16[9];
    v21 = *((unsigned int *)v16 + 16);
    objc_msgSend(v15, "officeArtState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "xmlDrawingState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTheme readFromThemeData:themeDataSize:toTheme:xmlDrawingState:](OAXTheme, "readFromThemeData:themeDataSize:toTheme:xmlDrawingState:", v20, v21, v13, v23);

    v24 = ESDAtomAccess<PptRoundTripColorMappingAtom>::first(v42, 0);
    if (v24)
    {
      v25 = CXGetRootElement(*((const unsigned __int8 **)v24 + 9), *((_DWORD *)v24 + 16));
      if (v25)
      {
        +[OAXColorMap readFromXmlNode:toColorMap:](OAXColorMap, "readFromXmlNode:toColorMap:", v25, v14);
        xmlFreeDoc(v25->doc);
      }
    }
  }
  else
  {
    objc_msgSend(v13, "baseStyles");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "colorScheme");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBSlideBase readColorScheme:colorScheme:colorMap:state:](PBSlideBase, "readColorScheme:colorScheme:colorMap:state:", v42, v27, v14, v15);

    objc_msgSend(a1, "drawingGroupHolderWithDocumentContainerHolder:", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "drawableDefaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v29, "addShapeDefaults");

    objc_msgSend(v13, "drawableDefaults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend(v31, "addLineDefaults");

    objc_msgSend(v13, "drawableDefaults");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend(v33, "addTextDefaults");

    objc_msgSend(v15, "officeArtState");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[OABDrawingGroup readGraphicalDefaultsFromDrawingGroup:toTheme:state:](OABDrawingGroup, "readGraphicalDefaultsFromDrawingGroup:toTheme:state:", v28, v13, v35);

    objc_msgSend(v13, "drawableDefaults");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "shapeDefaults");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "textListStyle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readDefaultTextListStyle:fromDocumentContainer:state:", v38, v12, v15);

    objc_msgSend(v13, "drawableDefaults");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "textDefaults");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "textListStyle");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readDefaultTextListStyle:fromDocumentContainer:state:", v41, v12, v15);

  }
}

+ (void)readXmlLayoutsFromSlideMaster:(id)a3 document:(id)a4 masterInfo:(id)a5 state:(id)a6
{
  uint64_t v9;
  void *v10;
  void *v11;
  const void *v12;
  OcBinaryData *v13;
  EshRecord *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int16 Instance;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v26 = a3;
  v23 = a4;
  v25 = a5;
  v24 = a6;
  v9 = 0;
  while (1)
  {
    v9 = objc_msgSend(v26, "indexOfFirstChildOfType:afterIndex:", 1054, v9);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(v26, "childAt:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = (const void *)objc_msgSend(v10, "eshObject");
      if (v12)
      {
        if (v13)
        {
          v14 = (EshRecord *)v13;
          OCPNewZipPackageWithOcBinaryData(v13 + 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "partByRelationshipType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              objc_msgSend(v25, "slideMaster");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addSlideLayout");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              Instance = EshRecord::getInstance(v14);
              objc_msgSend(v24, "officeArtState");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "xmlDocumentState");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              +[PXSlideLayout readFromPackagePart:toSlideLayout:presentationState:](PXSlideLayout, "readFromPackagePart:toSlideLayout:presentationState:", v17, v19, v22);

              objc_msgSend(v25, "setSlideLayout:forXmlLayoutId:", v19, Instance);
            }

          }
        }
      }
    }

  }
}

+ (void)readTextStylesFromSlideMaster:(id)a3 toSlideMaster:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  OcBinaryData *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  xmlNodePtr v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (OcBinaryData *)ESDAtomAccess<PptRoundTripOfficeArtTextStylesAtom>::first(v19, 0);
  objc_msgSend(v8, "officeArtState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "useXmlBlobs");

  if (v9)
    v12 = v11;
  else
    v12 = 0;
  if ((v12 & 1) != 0)
  {
    OCPNewZipPackageWithOcBinaryData(v9 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "partByRelationshipType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v15, "xmlDocument"));
      objc_msgSend(v8, "officeArtState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "xmlDocumentState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXSlideMaster readTextStylesFromNode:slideMaster:state:](PXSlideMaster, "readTextStylesFromNode:slideMaster:state:", v16, v7, v18);

    }
  }
  else
  {
    +[PBSlideMaster setSlideMasterTextStyles:state:](PBSlideMaster, "setSlideMasterTextStyles:state:", v7, v8);
  }

}

+ (void)readTextStyleFromNotesMaster:(id)a3 toNotesMaster:(id)a4 slideMaster:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  OcBinaryData *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  _xmlNode *v18;
  void *v19;
  void *v20;
  CXNamespace *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;

  v32 = a3;
  v9 = a4;
  v31 = a5;
  v10 = a6;
  v11 = (OcBinaryData *)ESDAtomAccess<PptRoundTripNotesMasterTextStylesAtom>::first(v32, 0);
  objc_msgSend(v10, "officeArtState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "useXmlBlobs");

  if (v11)
    v14 = v13;
  else
    v14 = 0;
  if ((v14 & 1) == 0)
  {
    objc_msgSend(v10, "masterStyles:", v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "notesTextStyle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "overrideWithTextStyle:", v17);

    objc_msgSend(v9, "theme");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "baseStyles");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fontScheme");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "minorFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "propertiesForListLevel:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBSlideMaster setFont:fromCharacterProperties:](PBSlideMaster, "setFont:fromCharacterProperties:", v24, v25);
    goto LABEL_9;
  }
  OCPNewZipPackageWithOcBinaryData(v11 + 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "partByRelationshipType:", CFSTR("http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v17, "xmlDocument"));
    objc_msgSend(v10, "officeArtState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "xmlDocumentState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "PXPresentationMLNamespace");
    v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v22 = OCXFindChild(v18, v21, "bodyStyle");

    if (!v22)
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v9, "notesTextStyle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "officeArtState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "xmlDocumentState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "officeArtState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextListStyle readNode:textListStyle:state:](OAXTextListStyle, "readNode:textListStyle:state:", v22, v23, v26);

LABEL_9:
    goto LABEL_10;
  }
LABEL_11:

}

+ (void)readSlideListWithInstance:(int)a3 documentContainerHolder:(id)a4 state:(id)a5 block:(id)a6
{
  __int16 v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  _DWORD *v14;
  int v15;
  _OWORD *v16;
  int v17;
  _OWORD *v18;
  _OWORD *v19;
  unint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unint64_t v23;
  char *v24;
  unsigned int v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  _DWORD *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  EshRecord *v40;
  EshRecord *v41;
  _BOOL8 v42;
  unint64_t *v43;
  void *v44;
  char isKindOfClass;
  void (**v46)(id, void *, _DWORD *, char *);
  void *v47;
  unint64_t v48;
  _DWORD *v49;
  _QWORD *v50;
  int v51;
  unint64_t v52;
  char v53;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v46 = (void (**)(id, void *, _DWORD *, char *))a6;
  objc_msgSend(v10, "documentRoot");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "childOfType:instance:", 4080, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v11, "childCount");
  objc_msgSend(v10, "setSourceSlideListHolder:", v11);
  v12 = objc_msgSend(v10, "currentSlideTextBlockRecordIndexRangeVector");
  v13 = 0;
  v50 = (_QWORD *)(v12 + 16);
  do
  {
    if (v13 >= v48 || (objc_msgSend(v10, "isCancelled") & 1) != 0)
      break;
    v53 = 0;
    v14 = ESDAtomAccess<PptSlidePersistAtom>::byIndex(v11, v13);
    if (v14)
    {
      v49 = v14;
      v15 = v14[13];
      v16 = *(_OWORD **)v12;
      *(_QWORD *)(v12 + 8) = *(_QWORD *)v12;
      v51 = v15;
      if (v15 >= 1)
      {
        v17 = 0;
        do
        {
          if ((unint64_t)v16 >= *v50)
          {
            v19 = *(_OWORD **)v12;
            v20 = (unint64_t)v16 - *(_QWORD *)v12;
            v21 = (*v50 - *(_QWORD *)v12) >> 4;
            if (2 * (int)v21 <= (v20 >> 4) + 1)
              v22 = (v20 >> 4) + 1;
            else
              v22 = 2 * v21;
            if (v21 >= 0x7FFFFFFF)
              v23 = 0xFFFFFFFFLL;
            else
              v23 = v22;
            if ((_DWORD)v23)
            {
              v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)v50, v23);
              v26 = v25;
              v19 = *(_OWORD **)v12;
              v16 = *(_OWORD **)(v12 + 8);
            }
            else
            {
              v24 = 0;
              v26 = 0;
            }
            v27 = &v24[v20 & 0xFFFFFFFF0];
            *(_OWORD *)v27 = xmmword_22A4BD1C0;
            v18 = v27 + 16;
            if (v16 != v19)
            {
              do
              {
                *((_OWORD *)v27 - 1) = *(v16 - 1);
                v27 -= 16;
                --v16;
              }
              while (v16 != v19);
              v19 = *(_OWORD **)v12;
            }
            *(_QWORD *)v12 = v27;
            *(_QWORD *)(v12 + 8) = v18;
            *(_QWORD *)(v12 + 16) = &v24[16 * v26];
            if (v19)
              operator delete(v19);
          }
          else
          {
            *v16 = xmmword_22A4BD1C0;
            v18 = v16 + 1;
          }
          *(_QWORD *)(v12 + 8) = v18;
          ++v17;
          v16 = v18;
        }
        while (v17 != v51);
      }
      v28 = objc_msgSend(v11, "indexOfFirstChildOfType:afterIndex:", 1011, v13);
      v29 = v48;
      v30 = v49;
      if (v28 != 0x7FFFFFFFFFFFFFFFLL)
        v29 = v28;
      v31 = v13 + 1;
      v52 = v29;
      if (v31 < v29)
      {
        do
        {
          v32 = objc_msgSend(v11, "indexOfFirstChildOfType:afterIndex:", 3999, v31);
          if (v32 == 0x7FFFFFFFFFFFFFFFLL)
            v33 = v52;
          else
            v33 = v32;
          if (v33 >= v52)
            v34 = v52;
          else
            v34 = v33;
          if (v34 <= v31)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PBPresentation(Private) readSlideListWithInstance:documentContainerHolder:state:block:]");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v11;
            v37 = v10;
            v38 = v9;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Binary/Mapper/PBPresentation.mm");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v39, 1697, 0, "If the text block start index was < the start index of the next slide, then the text block must have a positive length");

            v9 = v38;
            v10 = v37;
            v11 = v36;
            +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
            v30 = v49;
          }
          v40 = (EshRecord *)ESDAtomAccess<PptTextHeaderAtom>::byIndex(v11, v31);
          v41 = v40;
          if (v40)
            v42 = v51 > (int)EshRecord::getInstance(v40);
          else
            v42 = 0;
          TCVerifyInputMeetsCondition(v42);
          v43 = (unint64_t *)(*(_QWORD *)v12 + 16 * EshRecord::getInstance(v41));
          *v43 = v31;
          v43[1] = v34 - v31;
          v31 = v34;
        }
        while (v52 > v33);
      }
      objc_msgSend(v47, "pbReferenceWithID:", v30[12]);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        TCVerifyInputMeetsCondition(isKindOfClass & 1);
        v46[2](v46, v44, v30, &v53);
      }
      *(_QWORD *)(v12 + 8) = *(_QWORD *)v12;

      v13 = v52;
    }
    else
    {
      TCVerifyInputMeetsCondition(0);
    }
  }
  while (!v53);

}

void __70__PBPresentation_Private__readMasterAndLayouts_masterLayoutMap_state___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PDSlideMaster *v9;
  PBMasterInfo *v10;
  void *v11;
  uint64_t v12;
  _OWORD *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int *v19;
  unsigned int *v20;
  const void *v21;
  _DWORD *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  OADColorScheme *v29;
  OADColorMap *v30;
  void *v31;
  unint64_t v32;
  unsigned int v33;
  unsigned int v34;
  id v35;

  v5 = a2;
  v6 = *(unsigned int *)(a3 + 48);
  v7 = *(unsigned int *)(a3 + 56);
  v35 = v5;
  v8 = objc_msgSend(v5, "eshObject");
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8) == 1016)
  {
    v9 = -[PDSlideMaster initWithPresentation:]([PDSlideMaster alloc], "initWithPresentation:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "addSlideMaster:", v9);
    v10 = objc_alloc_init(PBMasterInfo);
    -[PBMasterInfo setSlideMaster:](v10, "setSlideMaster:", v9);
    -[PBMasterInfo setMainPbRef:](v10, "setMainPbRef:", v6);
    objc_msgSend(*(id *)(a1 + 40), "officeArtState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBMasterInfo setUseXmlBlobs:](v10, "setUseXmlBlobs:", objc_msgSend(v11, "useXmlBlobs"));

    objc_msgSend(*(id *)(a1 + 48), "setMasterInfo:forMasterId:", v10, v7);
    objc_msgSend(*(id *)(a1 + 40), "setCurrentSourceMasterStyleInfoVector:", -[PBMasterInfo sourceTextStyling](v10, "sourceTextStyling"));
    v12 = 0;
    do
    {
      v13 = (_OWORD *)objc_msgSend(*(id *)(a1 + 40), "docSourceMasterStyleInfoOfType:", v12);
      *(_OWORD *)objc_msgSend(*(id *)(a1 + 40), "currentSourceMasterStyleInfoOfType:", v12) = *v13;
      v12 = (v12 + 1);
    }
    while ((_DWORD)v12 != 9);
    +[PBSlideMaster readSlideMasterTextStyles:slideHolder:state:](PBSlideMaster, "readSlideMasterTextStyles:slideHolder:state:", v9, v35, *(_QWORD *)(a1 + 40));
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(void **)(a1 + 64);
    -[PDSlideMaster theme](v9, "theme");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDSlideMaster colorMap](v9, "colorMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "readThemeFromSlideMaster:document:theme:colorMap:state:", v35, v14, v16, v17, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 64), "readTextStylesFromSlideMaster:toSlideMaster:state:", v35, v9, *(_QWORD *)(a1 + 40));
    +[PBSlideMaster readMasterDrawables:slideHolder:state:](PBSlideMaster, "readMasterDrawables:slideHolder:state:", v9, v35, *(_QWORD *)(a1 + 40));
    +[PBSlideMaster readSlideMasterName:slideHolder:state:](PBSlideMaster, "readSlideMasterName:slideHolder:state:", v9, v35, *(_QWORD *)(a1 + 40));
    -[PDSlideMaster theme](v9, "theme");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "validateTheme");

    objc_msgSend(*(id *)(a1 + 40), "setCurrentSourceMasterStyleInfoVector:", 0);
    if (-[PBMasterInfo useXmlBlobs](v10, "useXmlBlobs"))
    {
      v19 = (unsigned int *)ESDAtomAccess<PptRoundTripOriginalMainMasterIdAtom>::first(v35, 0);
      if (v19)
        -[PBMasterInfo setXmlMainMasterId:](v10, "setXmlMainMasterId:", v19[12]);
      v20 = (unsigned int *)ESDAtomAccess<PptRoundTripCompositeMasterIdAtom>::first(v35, 0);
      if (v20)
        -[PBMasterInfo setXmlMainMasterId:](v10, "setXmlMainMasterId:", v20[12]);
      objc_msgSend(*(id *)(a1 + 64), "readXmlLayoutsFromSlideMaster:document:masterInfo:state:", v35, *(_QWORD *)(a1 + 56), v10, *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    objc_msgSend(v35, "firstChildOfType:", 1007);
    v10 = (PBMasterInfo *)objc_claimAutoreleasedReturnValue();
    v21 = (const void *)-[PBMasterInfo eshObject](v10, "eshObject");
    if (v21)
    else
      v22 = 0;
    TCVerifyInputMeetsCondition(v22 != 0);
    if (v22)
    {
      LODWORD(v23) = v22[21];
      objc_msgSend(*(id *)(a1 + 48), "masterInfoForMasterId:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        objc_msgSend(*(id *)(a1 + 48), "allMasterIds");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "sortedArrayUsingSelector:", sel_compare_);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        TCVerifyInputMeetsCondition(v27 != 0);
        v23 = objc_msgSend(v27, "intValue");
        objc_msgSend(*(id *)(a1 + 48), "masterInfoForMasterId:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v24, "setTitlePbRef:", v6);
      objc_msgSend(v24, "slideMaster");
      v9 = (PDSlideMaster *)objc_claimAutoreleasedReturnValue();
      -[PDSlideMaster addSlideLayout](v9, "addSlideLayout");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setSlideLayoutType:", 1);
      objc_msgSend(*(id *)(a1 + 40), "setCurrentSourceMasterStyleInfoVector:", objc_msgSend(v24, "sourceTextStyling"));
      v32 = __PAIR64__(v7, v23);
      v29 = objc_alloc_init(OADColorScheme);
      v30 = objc_alloc_init(OADColorMap);
      if (+[PBSlideBase readColorScheme:colorScheme:colorMap:state:](PBSlideBase, "readColorScheme:colorScheme:colorMap:state:", v35, v29, v30, *(_QWORD *)(a1 + 40)))
      {
        objc_msgSend(v28, "themeOverrides");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setColorScheme:", v29);

        objc_msgSend(v28, "setColorMapOverride:", v30);
      }
      +[PBSlideBase readDrawingGroup:slide:state:](PBSlideBase, "readDrawingGroup:slide:state:", v35, v28, *(_QWORD *)(a1 + 40), v32);
      objc_msgSend(*(id *)(a1 + 40), "setCurrentSourceMasterStyleInfoVector:", 0);
      objc_msgSend(v28, "setShowMasterShapes:", *((unsigned __int8 *)v22 + 92));
      objc_msgSend(*(id *)(a1 + 48), "setMasterId:forTitleId:", v33, v34);

    }
    else
    {
      v9 = 0;
    }
  }

}

+ (void)readCommentAuthorsFrom:(id)a3 state:(id)a4
{
  id v5;
  void *v6;
  unsigned int i;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  PDCommentAuthor *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  char *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v5 = a4;
  objc_msgSend(v21, "firstChildOfType:", 2000);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBProgTag binaryTagDataWithName:inProgTagsParent:](PBProgTag, "binaryTagDataWithName:inProgTagsParent:", L"___PPT10", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; i = v8 + 1)
  {
    v8 = i;
    if (objc_msgSend(v6, "childCount") <= (unint64_t)i)
      break;
    objc_msgSend(v6, "childAt:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "eshObject");
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v10 + 16))(v10) == 12004)
    {
      v11 = objc_alloc_init(PDCommentAuthor);
      objc_msgSend(v5, "tgtPresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDCommentAuthor setId:](v11, "setId:", objc_msgSend(v12, "commentAuthorCount"));

      objc_msgSend(v5, "tgtPresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addCommentAuthor:", v11);

      objc_msgSend(v9, "firstChildOfType:", 12005);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "eshObject");

      if (v15)
      {
        -[PDCommentAuthor setColorIndex:](v11, "setColorIndex:", *(unsigned int *)(v15 + 48));
        -[PDCommentAuthor setLastCommentIndex:](v11, "setLastCommentIndex:", (*(_DWORD *)(v15 + 52) - 1));
      }
      objc_msgSend(v9, "firstChildOfType:", 4026);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (const void *)objc_msgSend(v16, "eshObject");
      if (v17)
      {
        if (v18)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCsString:", v18 + 48);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PDCommentAuthor setName:](v11, "setName:", v19);

        }
      }

    }
  }

}

void __92__PBPresentation_Private__readSlides_masterLayoutMap_slideIdMap_state_isThumbnail_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  PDSlide *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setSourceSlideId:", *(unsigned int *)(a3 + 56));
  v7 = objc_alloc_init(PDSlide);
  objc_msgSend(*(id *)(a1 + 40), "slideLayoutForSlideHolder:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSlide setSlideLayout:](v7, "setSlideLayout:", v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "masterInfoForSlideHolder:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentSourceMasterStyleInfoVector:", objc_msgSend(v10, "sourceTextStyling"));

  +[PBSlide readFromSlideContainer:toSlide:state:](PBSlide, "readFromSlideContainer:toSlide:state:", v13, v7, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentSourceMasterStyleInfoVector:", 0);
  if (!-[PDSlideBase isHidden](v7, "isHidden"))
  {
    *a4 = *(_BYTE *)(a1 + 80);
    if (*(_BYTE *)(a1 + 81))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      if (*(_QWORD *)(v11 + 40))
      {
        v12 = *(void **)(a1 + 48);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        objc_msgSend(v12, "readerDidReadElement:atIndex:inDocument:isLastElement:");
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      }
      objc_storeStrong((id *)(v11 + 40), v7);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "addSlide:", v7);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setSourceSlideId:", 0xFFFFFFFFLL);

}

+ (void)readNotes:(id)a3 masterLayoutMap:(id)a4 slideIdMap:(id)a5 state:(id)a6 delegate:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  PDNotesMaster *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v28 = a7;
  objc_msgSend(v13, "documentRoot");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tgtPresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(PDNotesMaster);
  objc_msgSend(v14, "addNotesMaster:", v15);
  if (*((_DWORD *)ESDAtomAccess<PptDocumentAtom>::first(v11, 1) + 16))
  {
    objc_msgSend(v29, "pbReferenceWithID:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    TCVerifyInputMeetsCondition(isKindOfClass & 1);
    objc_msgSend(v12, "masterInfoForMasterId:", *((unsigned int *)ESDAtomAccess<PptNotesAtom>::first(v16, 1) + 12));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(v12, "allMasterIds");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sortedArrayUsingSelector:", sel_compare_);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      TCVerifyInputMeetsCondition(v21 != 0);
      objc_msgSend(v12, "masterInfoForMasterId:", objc_msgSend(v21, "intValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    TCVerifyInputMeetsCondition(v18 != 0);
    objc_msgSend(v13, "setCurrentSourceMasterStyleInfoVector:", objc_msgSend(v18, "sourceTextStyling"));
    -[PDNotesMaster theme](v15, "theme");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDNotesMaster colorMap](v15, "colorMap");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readThemeFromSlideMaster:document:theme:colorMap:state:", v16, v11, v22, v23, v13);

    objc_msgSend(v18, "slideMaster");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readTextStyleFromNotesMaster:toNotesMaster:slideMaster:state:", v16, v15, v24, v13);

  }
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __79__PBPresentation_Private__readNotes_masterLayoutMap_slideIdMap_state_delegate___block_invoke;
  v30[3] = &unk_24F3B4DC8;
  v25 = v13;
  v31 = v25;
  v26 = v28;
  v32 = v26;
  v27 = v14;
  v33 = v27;
  objc_msgSend(a1, "readSlideListWithInstance:documentContainerHolder:state:block:", 2, v11, v25, v30);
  objc_msgSend(v25, "setCurrentSourceMasterStyleInfoVector:", 0);

}

void __79__PBPresentation_Private__readNotes_masterLayoutMap_slideIdMap_state_delegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "eshObject");
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3) == 1008)
  {
    +[PBSlide notesSlideFromSlideContainer:state:](PBSlide, "notesSlideFromSlideContainer:state:", v5, *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "readerDidReadElement:atIndex:inDocument:isLastElement:", v4, 0x7FFFFFFFFFFFFFFFLL, *(_QWORD *)(a1 + 48), 0);

  }
}

@end
