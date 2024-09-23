@implementation PXOfficeArtClient

- (PXOfficeArtClient)initWithState:(id)a3
{
  id v4;
  PXOfficeArtClient *v5;
  PXOfficeArtClient *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXOfficeArtClient;
  v5 = -[PXOfficeArtClient init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->mPresentationState, v4);

  return v6;
}

- (void)readClientDataFromShapeNode:(_xmlNode *)a3 toShape:(id)a4 state:(id)a5
{
  const char *v7;
  id WeakRetained;
  CXNamespace *v9;
  _xmlNode *v10;
  id v11;
  CXNamespace *v12;
  _xmlNode *v13;
  id v14;
  CXNamespace *v15;
  _xmlNode *v16;
  void *v17;
  PDPlaceholder *v18;
  id v19;

  v19 = a4;
  if (xmlStrEqual(a3->name, (const xmlChar *)"sp"))
  {
    v7 = "nvSpPr";
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"cxnSp"))
  {
    v7 = "nvCxnSpPr";
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"pic"))
  {
    v7 = "nvPicPr";
  }
  else
  {
    v7 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->mPresentationState);
  objc_msgSend(WeakRetained, "PXPresentationMLNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, v7);

  if (v10)
  {
    v11 = objc_loadWeakRetained((id *)&self->mPresentationState);
    objc_msgSend(v11, "PXPresentationMLNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v13 = (_xmlNode *)OCXFindChild(v10, v12, "nvPr");

    if (v13)
    {
      v14 = objc_loadWeakRetained((id *)&self->mPresentationState);
      objc_msgSend(v14, "PXPresentationMLNamespace");
      v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v16 = (_xmlNode *)OCXFindChild(v13, v15, "ph");

      if (v16)
      {
        objc_msgSend(v19, "ensureClientDataOfClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_alloc_init(PDPlaceholder);
        objc_msgSend(v17, "setPlaceholder:", v18);
        -[PDPlaceholder setType:](v18, "setType:", objc_msgSend((id)objc_opt_class(), "readPlaceholderTypeFromNode:", v16));
        -[PDPlaceholder setIndex:](v18, "setIndex:", CXDefaultUnsignedLongAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx", 0));
        -[PDPlaceholder setBoundsTrack:](v18, "setBoundsTrack:", objc_msgSend((id)objc_opt_class(), "readPlaceholderBoundsTrackFromNode:", v16));

      }
    }
  }

}

+ (int)readPlaceholderTypeFromNode:(_xmlNode *)a3
{
  void *v3;
  unsigned __int8 v4;
  int v5;

  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_6;
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_50, 0, &dword_22A0CC000);
  }
  if (PXPlaceholderTypeEnumMap(void)::once != -1)
    dispatch_once(&PXPlaceholderTypeEnumMap(void)::once, &__block_literal_global_102);
  v5 = objc_msgSend((id)PXPlaceholderTypeEnumMap(void)::theEnumMap, "valueForString:", v3);
  if (v5 == -130883970)
LABEL_6:
    v5 = 8;

  return v5;
}

+ (int)readPlaceholderBoundsTrackFromNode:(_xmlNode *)a3
{
  xmlChar *NoNsProp;
  const xmlChar *v4;
  int v5;

  NoNsProp = xmlGetNoNsProp(a3, (const xmlChar *)"boundsTrack");
  if (!NoNsProp)
    return 0;
  v4 = NoNsProp;
  if (xmlStrEqual(NoNsProp, (const xmlChar *)"slide"))
    v5 = 1;
  else
    v5 = 2 * (xmlStrEqual(v4, (const xmlChar *)"union") != 0);
  ((void (*)(const xmlChar *))*MEMORY[0x24BEDE758])(v4);
  return v5;
}

- (void)readClientDataFromPictureNode:(_xmlNode *)a3 toImage:(id)a4 state:(id)a5
{
  id WeakRetained;
  CXNamespace *v8;
  _xmlNode *v9;
  id v10;
  CXNamespace *v11;
  _xmlNode *v12;
  void *v13;
  id v14;
  CXNamespace *v15;
  _xmlNode *v16;
  PDPlaceholder *v17;
  id v18;

  v18 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->mPresentationState);
  objc_msgSend(WeakRetained, "PXPresentationMLNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = (_xmlNode *)OCXFindChild(a3, v8, "nvPicPr");

  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)&self->mPresentationState);
    objc_msgSend(v10, "PXPresentationMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = (_xmlNode *)OCXFindChild(v9, v11, "nvPr");

    if (v12)
    {
      objc_msgSend(v18, "ensureClientDataOfClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_loadWeakRetained((id *)&self->mPresentationState);
      objc_msgSend(v14, "PXPresentationMLNamespace");
      v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v16 = (_xmlNode *)OCXFindChild(v12, v15, "ph");

      if (v16)
      {
        v17 = objc_alloc_init(PDPlaceholder);
        objc_msgSend(v13, "setPlaceholder:", v17);
        -[PDPlaceholder setType:](v17, "setType:", objc_msgSend((id)objc_opt_class(), "readPlaceholderTypeFromNode:", v16));
        -[PDPlaceholder setIndex:](v17, "setIndex:", CXDefaultUnsignedLongAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx", 0));

      }
    }
  }

}

- (void)postprocessHyperlink:(id)a3 relationship:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v16, "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("ppaction://hlinksldjump")))
  {
    objc_msgSend(v7, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasSuffix:", CFSTR("/slide"));

    if ((v11 & 1) == 0)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    objc_msgSend(v7, "targetLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "slideIndexForSlideURL:", v12);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
    objc_msgSend(CFSTR("ppaction://hlinksldjump?slideindex="), "stringByAppendingFormat:", CFSTR("%ld"), v14 + 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setAction:", v15);
  }
  else
  {
    v15 = v9;
  }

}

- (id)readOle:(_xmlNode *)a3 state:(id)a4
{
  id WeakRetained;
  CXNamespace *v7;
  _xmlNode *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  EXReader *v19;
  void *v20;
  void *v21;
  void *v22;
  OADOle *v23;
  void *v24;
  id v25;
  OADImage *v26;
  id v27;
  CXNamespace *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  OADImage *v33;
  void *v35;
  id *location;
  id v37;
  id v38;

  v37 = a4;
  location = (id *)&self->mPresentationState;
  WeakRetained = objc_loadWeakRetained((id *)&self->mPresentationState);
  objc_msgSend(WeakRetained, "PXPresentationMLNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = (_xmlNode *)OCXFindChild(a3, v7, "oleObj");

  if (!v8)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  CXDefaultStringAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"progId", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[OADOle isProgIDChart:](OADOle, "isProgIDChart:", v9))
  {
    v35 = v9;
    v10 = (void *)MEMORY[0x22E2DDB58]();
    objc_msgSend(v37, "packagePart");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "package");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "OCXReadRequiredRelationshipForNode:packagePart:", v8, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "targetLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "partForLocation:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "documentState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cancelDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v35, "hasSuffix:", CFSTR(".12")))
    {
      v19 = -[OCDReader initWithCancelDelegate:]([EXReader alloc], "initWithCancelDelegate:", v18);
      if (-[OCXReader start](v19, "start"))
      {
        -[OCDReader setData:](v19, "setData:", v16);
        -[EXReader read](v19, "read");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = 0;
      }

      v21 = 0;
    }
    else
    {
      +[OABOle readFromData:cancel:](OABOle, "readFromData:cancel:", v16, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
    }

    objc_autoreleasePoolPop(v10);
    objc_msgSend(v13, "targetLocation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v35;
    objc_msgSend(v12, "resetPartForLocation:", v22);

    if (v21)
      goto LABEL_16;
  }
  else
  {
    v20 = 0;
  }
  v23 = objc_alloc_init(OADOle);
  v21 = v23;
  if (v20)
    -[OADOle setObject:](v23, "setObject:", v20);
  if (v9)
    objc_msgSend(v21, "setAnsiProgID:", v9);
LABEL_16:
  objc_msgSend(v37, "oavState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  CXOptionalStringAttribute(v8, (void *)CXNoNamespace, (xmlChar *)"spid", &v38);
  v25 = v38;
  if (v25)
  {
    objc_msgSend(v24, "drawableForVmlShapeId:", v25);
    v26 = (OADImage *)objc_claimAutoreleasedReturnValue();
    if (v26)
      goto LABEL_22;
  }
  else
  {
    v27 = objc_loadWeakRetained(location);
    objc_msgSend(v27, "PXPresentationMLNamespace");
    v28 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v29 = OCXFindChild(v8, v28, "pic");

    if (v29)
    {
      v30 = objc_loadWeakRetained(location);
      objc_msgSend(v30, "PXPresentationMLNamespace");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXDrawable readDrawableFromXmlNode:inNamespace:drawingState:](OAXDrawable, "readDrawableFromXmlNode:inNamespace:drawingState:", v29, v31, v37);
      v32 = objc_claimAutoreleasedReturnValue();

      v26 = (OADImage *)v32;
      if (v32)
        goto LABEL_22;
    }
  }
  v26 = objc_alloc_init(OADImage);
LABEL_22:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = v26;
    -[OADImage setOle:](v33, "setOle:", v21);
    objc_msgSend(v24, "addDualDrawable:", v33);
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)readClientDataFromGraphicalFramePropertiesNode:(_xmlNode *)a3 toDrawable:(id)a4 state:(id)a5
{
  id WeakRetained;
  CXNamespace *v8;
  _xmlNode *v9;
  id v10;
  CXNamespace *v11;
  _xmlNode *v12;
  void *v13;
  PDPlaceholder *v14;
  id v15;

  v15 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->mPresentationState);
  objc_msgSend(WeakRetained, "PXPresentationMLNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = (_xmlNode *)OCXFindChild(a3, v8, "nvPr");

  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)&self->mPresentationState);
    objc_msgSend(v10, "PXPresentationMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = (_xmlNode *)OCXFindChild(v9, v11, "ph");

    if (v12)
    {
      objc_msgSend(v15, "ensureClientDataOfClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(PDPlaceholder);
      objc_msgSend(v13, "setPlaceholder:", v14);
      -[PDPlaceholder setType:](v14, "setType:", objc_msgSend((id)objc_opt_class(), "readPlaceholderTypeFromNode:", v12));
      -[PDPlaceholder setIndex:](v14, "setIndex:", CXDefaultUnsignedLongAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx", 0));

    }
  }

}

- (PXPresentationState)presentationState
{
  return (PXPresentationState *)objc_loadWeakRetained((id *)&self->mPresentationState);
}

- (id)readClientTextField:(_xmlNode *)a3 identity:(id)a4 paragraph:(id)a5 state:(id)a6
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("slidenum"));

  if (v10)
  {
    objc_msgSend(v8, "addSlideNumberField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)readBlipExtWithURI:(id)a3 fromNode:(_xmlNode *)a4 toDrawable:(id)a5 state:(id)a6
{
  id v9;
  id v10;
  _xmlNode *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  OADVideoFile *v16;
  _xmlNode *v17;
  _xmlNode *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  OAXMovieContext *v24;
  void *v25;
  void *v26;
  OAXMovieContext *v27;
  double v28;
  double v29;

  v9 = a5;
  v10 = a6;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("{DAA4B4D4-6D71-4841-9C94-3DE7FCFB9230}")))
  {
    v11 = (_xmlNode *)OCXFindChild(a4, (CXNamespace *)PXPowerPoint2010Namespace, "media");
    v12 = objc_opt_class();
    TSUDynamicCast(v12, (uint64_t)v9);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v11)
      v15 = v13 == 0;
    else
      v15 = 1;
    if (!v15)
    {
      v16 = objc_alloc_init(OADVideoFile);
      v17 = (_xmlNode *)OCXFindChild(v11, (CXNamespace *)PXPowerPoint2010Namespace, "trim");
      v18 = v17;
      if (v17)
      {
        v28 = 0.0;
        v29 = 0.0;
        CXOptionalDoubleAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"st", &v29);
        CXOptionalDoubleAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"end", &v28);
        HIDWORD(v19) = HIDWORD(v29);
        *(float *)&v19 = v29;
        -[OADMovie setMovieStartPoint:](v16, "setMovieStartPoint:", v19);
        HIDWORD(v20) = HIDWORD(v28);
        *(float *)&v20 = v28;
        -[OADMovie setMovieEndPoint:](v16, "setMovieEndPoint:", v20);
      }
      objc_msgSend(v10, "packagePart", *(_QWORD *)&v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "OCXReadRelationshipForNode:attributeName:packagePart:", v11, "embed", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "targetLocation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = [OAXMovieContext alloc];
      objc_msgSend(v10, "packagePart");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "package");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[OCXDelayedMediaContext initWithTargetLocation:package:](v24, "initWithTargetLocation:package:", v23, v26);

      -[OCDDelayedNode setDelayedContext:](v16, "setDelayedContext:", v27);
      -[OADLinkedMediaFile setUrl:](v16, "setUrl:", v23);
      -[OADLinkedMediaFile setIsExternal:](v16, "setIsExternal:", objc_msgSend(v22, "targetMode") == 1);
      objc_msgSend(v14, "setMovie:", v16);

    }
  }

}

- (BOOL)chartAutoFillIsHollow
{
  return 1;
}

- (BOOL)chartAutoStrokeIsHollow
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mPresentationState);
}

@end
