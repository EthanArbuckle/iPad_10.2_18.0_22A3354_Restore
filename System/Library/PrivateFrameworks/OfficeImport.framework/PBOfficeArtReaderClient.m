@implementation PBOfficeArtReaderClient

+ (BOOL)escherIsFullySupported
{
  return 1;
}

+ (void)readClientDataFromShape:(id)a3 toGraphic:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  PDOfficeArtClient *v13;
  int v14;
  int v15;
  int v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "presentationState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;
    objc_msgSend(v11, "firstChildOfType:", 61457);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(PDOfficeArtClient);
    objc_msgSend(a1, "readClientAnchorFromContainer:toDrawable:state:", v11, v8, v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = objc_msgSend(a1, "readPlaceholderInfo:clientData:toGraphic:presentationState:", v11, v13, v8, v10);
    else
      v14 = 0;
    v15 = objc_msgSend(a1, "readClientTextBoxFromShape:toGraphic:clientData:state:", v11, v8, v13, v9);
    objc_msgSend(a1, "readHyperlinkFromShapeContainerHolder:toDrawable:state:", v11, v8, v9);
    v16 = objc_msgSend(a1, "readRecolorInfoFromClientDataHolder:toClientData:state:", v11, v13, v9);
    if (v14 | v15 | v16 | objc_msgSend(a1, "readOleFromClientDataHolder:toGraphic:tgtClientData:state:", v11, v8, v13, v10))objc_msgSend(v8, "setClientData:", v13);

  }
}

+ (BOOL)readPlaceholderInfo:(id)a3 clientData:(id)a4 toGraphic:(id)a5 presentationState:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const void *v16;
  unsigned int *v17;
  unsigned int *v18;
  PDPlaceholder *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "firstChildOfType:", 61457);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstChildOfType:", 3011);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = (const void *)objc_msgSend(v14, "eshObject");
    if (v16)
    {
      if (v17)
      {
        v18 = v17;
        v19 = objc_alloc_init(PDPlaceholder);
        objc_msgSend(v10, "setPlaceholder:", v19);
        -[PDPlaceholder setIndex:](v19, "setIndex:", v18[12]);
        v20 = +[PBPlaceholder readPlaceholderType:](PBPlaceholder, "readPlaceholderType:", *((unsigned __int8 *)v18 + 52));
        -[PDPlaceholder setType:](v19, "setType:", v20);
        -[PDPlaceholder setSize:](v19, "setSize:", +[PBPlaceholder readPlaceholderSize:](PBPlaceholder, "readPlaceholderSize:", *((unsigned __int8 *)v18 + 53)));
        -[PDPlaceholder setOrientation:](v19, "setOrientation:", +[PBPlaceholder readPlaceholderOrientation:](PBPlaceholder, "readPlaceholderOrientation:", *((unsigned __int8 *)v18 + 52)));
        v21 = objc_opt_class();
        TSUDynamicCast(v21, (uint64_t)v11);
        v22 = objc_claimAutoreleasedReturnValue();
        v39 = (void *)v22;
        if ((_DWORD)v20 != 5)
        {
          if ((v20 & 0xFFFFFFFD) != 4 || !v22)
            goto LABEL_22;
          objc_msgSend(v9, "firstChildOfType:", 61453);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            objc_msgSend(v12, "setSourceTextBoxContainerHolder:forTargetShape:", v28, v39);
          goto LABEL_21;
        }
        objc_msgSend(v12, "tgtSlide");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v24 = objc_opt_isKindOfClass() | (v22 == 0);

        if ((v24 & 1) != 0)
        {
LABEL_22:
          v34 = +[PDPlaceholder isTextType:](PDPlaceholder, "isTextType:", v20);
          objc_msgSend(v39, "shapeProperties");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setIsTextBox:", v34);

          v29 = 1;
          goto LABEL_23;
        }
        objc_msgSend(v12, "tgtSlide");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v12, "tgtSlide");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "slideMaster");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v12, "tgtSlide");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v31 = objc_opt_isKindOfClass();

          if ((v31 & 1) == 0)
          {
            v33 = 0;
            v28 = 0;
LABEL_20:

LABEL_21:
            goto LABEL_22;
          }
          objc_msgSend(v12, "tgtSlide");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "slideLayout");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "slideMaster");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = v37;
        }

        if (v28)
        {
          objc_msgSend(v28, "placeholderWithType:placeholderTypeIndex:overrideIndex:", 5, 0, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "textBody");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
            objc_msgSend(v39, "setTextBody:", v33);
        }
        else
        {
          v33 = 0;
        }
        goto LABEL_20;
      }
    }
  }
  v29 = 0;
LABEL_23:

  return v29;
}

+ (void)readHyperlinkFromShapeContainerHolder:(id)a3 toDrawable:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v7 = a5;
  objc_msgSend(a3, "firstChildOfType:", 61457);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "presentationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "childOfType:instance:", 4082, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      +[PBHyperlink readAnimationInfoContainerHolder:presentationState:](PBHyperlink, "readAnimationInfoContainerHolder:presentationState:", v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "drawableProperties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setClickHyperlink:", v11);

    }
    objc_msgSend(v8, "childOfType:instance:", 4082, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[PBHyperlink readAnimationInfoContainerHolder:presentationState:](PBHyperlink, "readAnimationInfoContainerHolder:presentationState:", v13, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "drawableProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHoverHyperlink:", v14);

    }
  }

}

+ (BOOL)readOleFromClientDataHolder:(id)a3 toGraphic:(id)a4 tgtClientData:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const void *v17;
  _DWORD *v18;
  int v19;
  uint64_t DocumentRef;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  BOOL v25;
  void **p_cache;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  const void *v31;
  _DWORD *v32;
  BOOL v33;
  const void *v34;
  _DWORD *v35;
  void *v36;
  const void *v37;
  char *v38;
  void *v39;
  void *v40;
  const void *v41;
  _DWORD *v42;
  const void *v43;
  _DWORD *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  const void *v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  BOOL v56;
  unsigned int v58;
  unsigned int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v69 = a6;
  v12 = objc_opt_class();
  TSUDynamicCast(v12, (uint64_t)v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v56 = 0;
    goto LABEL_64;
  }
  objc_msgSend(v9, "firstChildOfType:", 61457);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    v56 = 0;
    goto LABEL_63;
  }
  objc_msgSend(v14, "firstChildOfType:", 3009);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v25 = 0;
    goto LABEL_62;
  }
  v62 = v16;
  v63 = v15;
  v64 = v10;
  v65 = v9;
  v66 = v11;
  v68 = v13;
  v17 = (const void *)objc_msgSend(v16, "eshObject");
  if (!v17
  {
    +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
    v18 = 0;
  }
  v19 = v18[12];
  DocumentRef = PptBinaryReader::getDocumentRef((PptBinaryReader *)objc_msgSend(v69, "reader"));
  objc_msgSend(v69, "documentRoot");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pbReferenceWithID:", DocumentRef);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = v22;
  objc_msgSend(v22, "firstChildOfType:", 1033);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = 0;
  p_cache = OADSolidFill.cache;
  while (2)
  {
    if (objc_msgSend(v23, "childCount") <= (unint64_t)v24)
      goto LABEL_61;
    objc_msgSend(v23, "childAt:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "eshObject");
    v29 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v28 + 16))(v28);
    switch(v29)
    {
      case 4102:
      case 4103:
        goto LABEL_26;
      case 4104:
      case 4105:
      case 4106:
      case 4107:
      case 4108:
      case 4110:
        goto LABEL_56;
      case 4109:
      case 4112:
        objc_msgSend(v27, "firstChildOfType:", 4100);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (const void *)objc_msgSend(v30, "eshObject");
        if (!v31
        {
          +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
          v32 = 0;
        }
        if (v32[12] != v19)
          goto LABEL_55;
        v33 = +[PBMedia readLinkedMovieFromMovieHolder:toImage:state:](PBMedia, "readLinkedMovieFromMovieHolder:toImage:state:", v27, v68, v69);
        goto LABEL_38;
      case 4111:
        objc_msgSend(v27, "firstChildOfType:", 4100);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (const void *)objc_msgSend(v30, "eshObject");
        if (!v43
        {
          +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
          v44 = 0;
        }
        if (v44[12] != v19)
          goto LABEL_55;
        v33 = +[PBMedia readEmbeddedSoundFromClientDataHolder:toImage:state:](PBMedia, "readEmbeddedSoundFromClientDataHolder:toImage:state:", v27, v68, v69);
LABEL_38:
        v25 = v33;
        goto LABEL_55;
      default:
        if (v29 == 4074)
        {
LABEL_26:
          objc_msgSend(v27, "firstContainerChildOfType:mustExist:", 4101, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v39;
          if (v39)
          {
            objc_msgSend(v39, "firstChildOfType:", 4100);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (const void *)objc_msgSend(v40, "eshObject");
            if (!v41
            {
              +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
              v42 = 0;
            }
            if (v42[12] == v19)
              v25 = +[PBMedia readLinkedMovieFromMovieHolder:toImage:state:](PBMedia, "readLinkedMovieFromMovieHolder:toImage:state:", v30, v68, v69);

          }
          goto LABEL_55;
        }
        if (v29 != 4044)
          goto LABEL_56;
        objc_msgSend(v27, "firstChildOfType:", 4035);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30)
          +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
        v34 = (const void *)objc_msgSend(v30, "eshObject");
        if (!v34
        {
          +[TCMessageException raise:](TCMessageException, "raise:", TCUnknownProblemMessage);
          v35 = 0;
        }
        if (v35[14] != v19)
          goto LABEL_55;
        objc_msgSend(v27, "childOfType:instance:", 4026, 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v67 = v36;
          v37 = (const void *)objc_msgSend(v36, "eshObject");
          if (v37)
          else
            v38 = 0;
          v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", v38 + 48);
          if (!objc_msgSend(p_cache + 448, "isProgIDChart:", v45))
          {
            v54 = objc_alloc_init((Class)(p_cache + 448));
            v55 = v54;
            if (v45)
              objc_msgSend(v54, "setAnsiProgID:", v45);
            goto LABEL_54;
          }
          v46 = v35[16];
          objc_msgSend(v69, "documentRoot");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "pbReferenceWithID:", v46);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          v60 = v48;
          v49 = (const void *)objc_msgSend(v48, "eshObject");
          if (v49
          {
            v51 = v50;
            v52 = v50[12];
            (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v52 + 16))(v52, *((unsigned int *)v50 + 16), 0);
            v59 = *((_DWORD *)v51 + 18);
            v58 = *((_DWORD *)v51 + 12);
            objc_msgSend(v69, "cancelDelegate");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (v58)
              +[OABOle readCompressedFromStream:compressedSize:uncompressedSize:cancel:](OABOle, "readCompressedFromStream:compressedSize:uncompressedSize:cancel:", v52, v59, v58, v53);
            else
              +[OABOle readFromStream:size:cancel:](OABOle, "readFromStream:size:cancel:", v52, v59, v53);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            if (v55)
            {
              objc_msgSend(v55, "setIconic:", v35[12] == 4);
              p_cache = (void **)(OADSolidFill + 16);
              v25 = 1;
              objc_msgSend(v66, "setHasOleChart:", 1);
              goto LABEL_53;
            }
          }
          else
          {
            v55 = 0;
          }
          p_cache = (void **)(OADSolidFill + 16);
LABEL_53:

LABEL_54:
          objc_msgSend(v68, "setOle:", v55);

LABEL_55:
LABEL_56:

          ++v24;
          continue;
        }

LABEL_61:
        v10 = v64;
        v9 = v65;
        v11 = v66;
        v13 = v68;
        v16 = v62;
        v15 = v63;
LABEL_62:

        v56 = v25;
LABEL_63:

LABEL_64:
        return v56;
    }
  }
}

+ (BOOL)tablesAreAllowed
{
  return 1;
}

+ (void)readClientDataFromGroup:(id)a3 toGroup:(id)a4 state:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  objc_msgSend(a3, "firstChildOfType:", 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readClientAnchorFromContainer:toDrawable:state:", v9, v10, v8);

}

+ (void)readClientDataFromTableCell:(id)a3 toTableCell:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  OADTextBody *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "presentationState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstChildOfType:", 61453);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc_init(OADTextBody);
      +[PBTextBlock readClientTextBox:textBody:state:](PBTextBlock, "readClientTextBox:textBody:state:", v10, v11, v9);
      objc_msgSend(v7, "setTextBody:", v11);

    }
  }

}

+ (id)readClientTextBoxFromShape:(id)a3 toTextBody:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int *v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  ESDContainer *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  objc_msgSend(v9, "presentationState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v11 = v7;
  objc_opt_class();
  objc_msgSend(v11, "firstChildOfType:", 61457);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    +[PBProgTag readClientData:state:](PBProgTag, "readClientData:state:", v12, v10);
  objc_opt_class();
  objc_msgSend(v11, "firstChildOfType:", 61453);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "childCount"))
  {
    v14 = (unsigned int *)ESDAtomAccess<PptOutlineTextRefAtom>::first(v13, 0);
    if (v14)
    {
      v15 = v14[12];
      v16 = (_QWORD *)objc_msgSend(v10, "currentSlideTextBlockRecordIndexRangeVector");
      if (v15 < ((v16[1] - *v16) >> 4))
      {
        v17 = (unint64_t *)(*v16 + 16 * v15);
        v18 = v17[1];
        if (v18)
        {
          v26 = v9;
          v27 = v8;
          v19 = *v17;
          v20 = -[ESDObject initWithType:]([ESDContainer alloc], "initWithType:", 61453);
          if (v20)
          {
            if (v19 < v18 + v19)
            {
              do
              {
                objc_msgSend(v10, "sourceSlideListHolder");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "childAt:", v19);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[ESDContainer addChild:](v20, "addChild:", v22);

                ++v19;
                --v18;
              }
              while (v18);
            }
            if (-[ESDContainer childCount](v20, "childCount"))
            {
              -[ESDContainer firstChildOfType:](v20, "firstChildOfType:", 3999);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v13, "firstChildOfType:", 4006);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              -[ESDContainer addChild:](v20, "addChild:", v24);
            if (-[ESDContainer childCount](v20, "childCount"))
              +[PBTextBlock readClientTextBox:textBody:state:](PBTextBlock, "readClientTextBox:textBody:state:", v20, v27, v10);

          }
          v9 = v26;
          v8 = v27;
        }
      }
    }
    else if (ESDAtomAccess<PptTextHeaderAtom>::first(v13, 0))
    {
      +[PBTextBlock readClientTextBox:textBody:state:](PBTextBlock, "readClientTextBox:textBody:state:", v13, v8, v10);
    }
  }

  return v13;
}

+ (BOOL)readClientTextBoxFromShape:(id)a3 toGraphic:(id)a4 clientData:(id)a5 state:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  OADTextBody *v17;
  void *v18;
  void *v19;
  BOOL v20;
  unsigned int *v21;
  uint64_t v22;
  void *v23;
  char isKindOfClass;
  void *v26;
  _BOOL4 v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  objc_msgSend(v13, "presentationState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  TSUDynamicCast(v15, (uint64_t)v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_alloc_init(OADTextBody);
    objc_msgSend(a1, "readClientTextBoxFromShape:toTextBody:state:", v10, v17, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v18 != 0;
    if (v18)
    {
      if (!ESDAtomAccess<PptOutlineTextRefAtom>::first(v18, 0))
      {
        v21 = (unsigned int *)ESDAtomAccess<PptTextHeaderAtom>::first(v19, 0);
        if (v21)
        {
          v22 = +[PBPlaceholder placeholderTypeFromTextType:](PBPlaceholder, "placeholderTypeFromTextType:", v21[12]);
          if ((_DWORD)v22 != -1 && (objc_msgSend(v12, "hasPlaceholder") & 1) == 0)
          {
            objc_msgSend(v14, "tgtSlide");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
              objc_msgSend(v12, "setInheritedTextStylePlaceholderType:", v22);
          }
          v27 = +[PDPlaceholder isTextType:](PDPlaceholder, "isTextType:", v22);
          objc_msgSend(v16, "shapeProperties");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setIsTextBox:", v27);

        }
      }
      objc_msgSend(v16, "setTextBody:", v17);
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)xmlEquivalentOfDrawableCanBeUsed
{
  return 1;
}

+ (int)oadSchemeColorValueForEshSchemeColorIndex:(unsigned __int16)a3 state:(id)a4
{
  return +[PBColorScheme oadSchemeColorValueForEshSchemeColorIndex:](PBColorScheme, "oadSchemeColorValueForEshSchemeColorIndex:", a3, a4);
}

+ (id)readDrawableFromPackagePart:(id)a3 foundInObject:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  xmlNodePtr v18;
  void *v19;
  __objc2_class **v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _DWORD *v43;
  char v44;
  char v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  int v61;

  v8 = a3;
  v58 = a4;
  v54 = a5;
  objc_opt_class();
  v9 = v54;
  objc_msgSend(v9, "presentationState");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "xmlDrawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentationState");
  v12 = objc_claimAutoreleasedReturnValue();

  v55 = (void *)v12;
  objc_msgSend(v56, "tgtSlide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPackagePart:", v8);
  objc_msgSend(v13, "styleMatrix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStyleMatrix:", v14);

  objc_msgSend(v13, "colorScheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColorScheme:", v15);

  objc_msgSend(v13, "colorMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColorMap:", v16);

  objc_msgSend(v13, "fontScheme");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFontScheme:", v17);

  v18 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v8, "xmlDocument"));
  objc_msgSend((id)v12, "PXPresentationMLNamespace");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v19, "isEqualToString:", CFSTR("application/vnd.ms-office.DrsConnector+xml"));

  if ((v12 & 1) != 0)
  {
    v20 = off_24F399370;
LABEL_11:
    -[__objc2_class readFromXmlNode:inNamespace:drawingState:](*v20, "readFromXmlNode:inNamespace:drawingState:", v18, v57, v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v8, "contentType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("application/vnd.ms-office.DrsE2oDoc+xml"));

  if ((v22 & 1) != 0)
  {
    v20 = off_24F399378;
    goto LABEL_11;
  }
  objc_msgSend(v8, "contentType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("application/vnd.ms-office.DrsGroupShape+xml"));

  if ((v24 & 1) != 0)
  {
    v20 = off_24F399380;
    goto LABEL_11;
  }
  objc_msgSend(v8, "contentType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("application/vnd.ms-office.DrsPicture+xml"));

  if ((v26 & 1) != 0)
  {
    v20 = off_24F399388;
    goto LABEL_11;
  }
  objc_msgSend(v8, "contentType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("application/vnd.ms-office.DrsShape+xml"));

  if (v28)
  {
    v20 = off_24F399390;
    goto LABEL_11;
  }
  v29 = 0;
LABEL_12:
  v30 = objc_opt_class();
  TSUDynamicCast(v30, (uint64_t)v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)objc_opt_new();
    v33 = (id)objc_msgSend(a1, "readClientTextBoxFromShape:toTextBody:state:", v58, v32, v9);
    objc_msgSend(v31, "textBody");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isSimilarToTextBody:", v32);

    if ((v35 & 1) == 0)
    {
      v36 = objc_msgSend(v58, "eshShape");
      if (v36)
      {
        objc_msgSend(v32, "properties");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[OABTextBodyProperties readTextBodyProperties:textBox:useDefaults:state:](OABTextBodyProperties, "readTextBodyProperties:textBox:useDefaults:state:", v37, v36 + 272, 0, v9);

      }
      objc_msgSend(v31, "setTextBody:", v32);
    }

  }
  v38 = objc_opt_class();
  TSUDynamicCast(v38, (uint64_t)v58);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = objc_opt_class();
    objc_msgSend(v39, "firstChildOfType:", 61457);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v40, (uint64_t)v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = ESDAtomAccess<PptRoundTripShapeIdAtom>::first(v42, 0);
      v44 = objc_msgSend(v9, "useXmlBlobs");
      v45 = v43 ? v44 : 0;
      if ((v45 & 1) != 0)
      {
        v52 = v43[12];
        objc_msgSend(v9, "presentationState");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_opt_class();
        objc_msgSend(v53, "tgtSlide");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        TSUDynamicCast(v46, (uint64_t)v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          objc_msgSend(v48, "slideLayout");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "drawables");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v59[0] = MEMORY[0x24BDAC760];
          v59[1] = 3221225472;
          v59[2] = __75__PBOfficeArtReaderClient_readDrawableFromPackagePart_foundInObject_state___block_invoke;
          v59[3] = &unk_24F3B4D38;
          v60 = v29;
          v61 = v52;
          objc_msgSend(v50, "enumerateObjectsUsingBlock:", v59);

        }
      }
    }

  }
  return v29;
}

void __75__PBOfficeArtReaderClient_readDrawableFromPackagePart_foundInObject_state___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "id") == *(_DWORD *)(a1 + 40))
  {
    v6 = objc_opt_class();
    objc_msgSend(v14, "clientData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v6, (uint64_t)v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "placeholder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "clientData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      TSUDynamicCast(v10, (uint64_t)v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "placeholder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIndex:", objc_msgSend(v9, "index"));

    }
    *a4 = 1;

  }
}

+ (void)readClientAnchorFromContainer:(id)a3 toDrawable:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  const void *v10;
  _DWORD *v11;
  float v12;
  int v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  OADOrientedBounds *v28;
  void *v29;
  id v30;

  v30 = a4;
  v7 = a5;
  objc_msgSend(a3, "firstChildOfType:", 61456);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (const void *)objc_msgSend(v8, "eshObject");
    if (v10)
    else
      v11 = 0;
    if ((int)objc_msgSend(v7, "groupDepth") <= 0)
      v12 = 0.125;
    else
      v12 = 1.0;
    v14 = v11[7];
    v13 = v11[8];
    v16 = v11[9];
    v15 = v11[10];
    objc_msgSend(v30, "drawableProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasOrientedBounds");
    v19 = (float)(v12 * (float)v14);
    v20 = (float)(v12 * (float)v13);
    v21 = (float)(v12 * (float)(v16 - v14));
    v22 = (float)(v12 * (float)(v15 - v13));

    if (v18)
    {
      objc_msgSend(v30, "drawableProperties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "orientedBounds");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "rotation");
      if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
      {
        v19 = NSTransposedRectWithSameCenter(v19, v20, v21, v22);
        v20 = v25;
        v21 = v26;
        v22 = v27;
      }
      objc_msgSend(v24, "setBounds:", v19, v20, v21, v22);
    }
    else
    {
      v28 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v19, v20, v21, v22);
      objc_msgSend(v30, "drawableProperties");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setOrientedBounds:", v28);

      v24 = v28;
    }

  }
}

+ (BOOL)readRecolorInfoFromClientDataHolder:(id)a3 toClientData:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const void *v14;
  XlChartDataSeries *v15;
  XlChartDataSeries *v16;
  id v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  id v21;
  uint64_t v22;
  int v23;
  unsigned int v24;
  OADImageRecolorInfo *v25;
  BOOL v26;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "firstChildOfType:", 61457);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "firstChildOfType:", 4071);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12
      && (v14 = (const void *)objc_msgSend(v12, "eshObject")) != 0
    {
      v16 = v15;
      v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v18 = *((_QWORD *)v16 + 7) - *((_QWORD *)v16 + 6);
      if ((__int16)((int)v18 >> 3) >= 1)
      {
        LOWORD(v19) = 0;
        v20 = v18 >> 3;
        do
        {
          objc_msgSend(a1, "addRecolorSpec:toDictionary:state:", XlChartDataSeries::getCachedCustomFormat(v16, (__int16)v19), v17, v9);
          v19 = (__int16)(v19 + 1);
        }
        while (v19 < (__int16)v20);
      }
      v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v22 = *((_QWORD *)v16 + 10) - *((_QWORD *)v16 + 9);
      if ((__int16)((int)v22 >> 3) >= 1)
      {
        LOWORD(v23) = 0;
        v24 = v22 >> 3;
        do
        {
          objc_msgSend(a1, "addRecolorSpec:toDictionary:state:", XlChartDataSeries::getCachedCustomLabel(v16, (__int16)v23), v21, v9);
          v23 = (__int16)(v23 + 1);
        }
        while (v23 < (__int16)v24);
      }
      v25 = -[OADImageRecolorInfo initWithColors:fills:]([OADImageRecolorInfo alloc], "initWithColors:fills:", v17, v21);
      objc_msgSend(v8, "setImageRecolorInfo:", v25);

      v26 = 1;
    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

+ (void)addRecolorSpec:(const PptRecolorSpec *)a3 toDictionary:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  unsigned int Red;
  unsigned int Green;
  void *v11;
  void *v12;
  EshColor v13;
  EshColor v14;

  v7 = a4;
  v8 = a5;
  if (a3->var3)
  {
    EshColor::EshColor(&v14, &a3->var2);
    Red = EshColor::getRed(&v14);
    Green = EshColor::getGreen(&v14);
    +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", (double)Red / 255.0, (double)Green / 255.0, (double)EshColor::getBlue(&v14) / 255.0, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    EshColor::EshColor(&v13, &a3->var1);
    +[OABColor readColor:colorPropertiesManager:state:](OABColor, "readColor:colorPropertiesManager:state:", &v13, 0, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v12, v11);

  }
}

+ (id)newTargetFromDrawable:(id)a3 clientData:(id)a4 buildType:(int)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  __objc2_class **v11;
  PDAnimationOleChartTarget *v12;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char isKindOfClass;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v7, "shapeProperties"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isTextBox"),
          v9,
          (v10 & 1) != 0))
    {
      v11 = off_24F399418;
    }
    else
    {
      v11 = off_24F399408;
    }
    v12 = (PDAnimationOleChartTarget *)objc_alloc_init(*v11);
    -[PDAnimationShapeTarget setDrawable:](v12, "setDrawable:", v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v7;
      if (objc_msgSend(v8, "hasOleChart"))
      {
        v12 = objc_alloc_init(PDAnimationOleChartTarget);
        -[PDAnimationShapeTarget setDrawable:](v12, "setDrawable:", v14);
        if ((a5 - 7) >= 4)
          v15 = 0;
        else
          v15 = (a5 - 6);
        -[PDAnimationOleChartTarget setChartSubElementType:](v12, "setChartSubElementType:", v15);
      }
      else
      {
        objc_msgSend(v14, "ole");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "object");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
          v12 = objc_alloc_init(PDAnimationSoundTarget);
        else
          v12 = objc_alloc_init(PDAnimationShapeTarget);
        -[PDAnimationShapeTarget setDrawable:](v12, "setDrawable:", v14);
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (int)presetIdFromFlyMethod:(int)a3 isEntrance:(BOOL)a4
{
  int result;
  BOOL v5;
  int v6;
  int v7;

  if (a3 > 51)
  {
    if (a3 <= 71)
    {
      if (a3 == 52)
        return 15;
      if (a3 == 62)
      {
        v5 = !a4;
        v6 = 50;
        v7 = 17;
LABEL_22:
        if (v5)
          return v6;
        else
          return v7;
      }
    }
    else
    {
      if (a3 == 72)
        return 23;
      if (a3 == 82)
        return 19;
    }
    return 1;
  }
  result = 24;
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      result = 3;
      break;
    case 3:
      result = 5;
      break;
    case 5:
      result = 9;
      break;
    case 6:
      result = 10;
      break;
    case 8:
      result = 14;
      break;
    case 9:
      result = 18;
      break;
    case 10:
      result = 22;
      break;
    case 11:
      result = 4;
      break;
    case 12:
      result = 2;
      break;
    case 13:
      result = 16;
      break;
    case 14:
      result = 11;
      break;
    case 17:
      v5 = !a4;
      v6 = 10;
      v7 = 160;
      goto LABEL_22;
    case 19:
      result = 20;
      break;
    case 26:
      result = 21;
      break;
    case 32:
      result = 7;
      break;
    case 42:
      result = 12;
      break;
    default:
      return 1;
  }
  return result;
}

+ (int)directionFromFlyDirection:(int)a3
{
  if (a3 > 0x47)
    return 1;
  else
    return *(_DWORD *)&asc_22A4D369C[4 * a3];
}

+ (id)newBuildFromBuildType:(int)a3
{
  PDChartBuild *v4;

  if ((a3 - 2) > 4)
  {
    if ((a3 - 7) > 3)
    {
      v4 = 0;
      if (!a3)
        return v4;
      goto LABEL_8;
    }
    v4 = -[PDChartBuild initWithBuildType:]([PDChartBuild alloc], "initWithBuildType:", (a3 - 6));
  }
  else
  {
    v4 = objc_alloc_init(PDParagraphBuild);
    -[PDChartBuild setBuildLevel:](v4, "setBuildLevel:", (a3 - 1));
    -[PDChartBuild setType:](v4, "setType:", 2);
  }
  if (!a3)
    return v4;
LABEL_8:
  if (!v4)
    return objc_alloc_init(PDBuild);
  return v4;
}

@end
