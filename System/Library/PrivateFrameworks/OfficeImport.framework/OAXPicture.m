@implementation OAXPicture

+ (id)readFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  CXNamespace *v8;
  id v9;
  OADImage *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = (CXNamespace *)a4;
  v9 = a5;
  v10 = objc_alloc_init(OADImage);
  +[OAXDrawable readNonVisualPropertiesFromDrawableXmlNode:inNamespace:visualNodeName:toDrawable:drawingState:](OAXDrawable, "readNonVisualPropertiesFromDrawableXmlNode:inNamespace:visualNodeName:toDrawable:drawingState:", a3, v8, "nvPicPr", v10, v9);
  v11 = OCXFindChild(a3, v8, "nvPicPr");
  if (!v11)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  +[OAXPicture readNonVisualPropertiesFromXmlNode:inNamespace:toDrawable:drawingState:](OAXPicture, "readNonVisualPropertiesFromXmlNode:inNamespace:toDrawable:drawingState:", v11, v8, v10, v9);
  v12 = OCXFindChild(a3, v8, "spPr");
  if (!v12)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  -[OADGraphic graphicProperties](v10, "graphicProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXGraphic readPropertiesFromXmlNode:graphicProperties:drawingState:](OAXGraphic, "readPropertiesFromXmlNode:graphicProperties:drawingState:", v12, v13, v9);

  v14 = OCXFindChild(a3, v8, "blipFill");
  if (!v14)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  objc_msgSend(v9, "packagePart");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXFill readImageFillFromXmlNode:packagePart:forDrawable:drawingState:](OAXFill, "readImageFillFromXmlNode:packagePart:forDrawable:drawingState:", v14, v15, v10, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[OADImage imageProperties](v10, "imageProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImageFill:", v16);

  +[OAXTransform2D readFromParentXmlNode:inNamespace:toDrawable:drawingState:](OAXTransform2D, "readFromParentXmlNode:inNamespace:toDrawable:drawingState:", v12, v8, v10, v9);
  +[OAXGeometry readFromParentXmlNode:drawingState:](OAXGeometry, "readFromParentXmlNode:drawingState:", v12, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADImage setGeometry:](v10, "setGeometry:", v18);

  objc_msgSend(v9, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "readClientDataFromPictureNode:toImage:state:", a3, v10, v9);

  -[OADImage movie](v10, "movie");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    objc_msgSend(a1, "mapImageWithGifAsMovie:xmlNode:drawingState:", v10, v14, v9);

  return v10;
}

+ (void)readNonVisualPropertiesFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 toDrawable:(id)a5 drawingState:(id)a6
{
  CXNamespace *v9;
  id v10;
  _xmlNode *v11;
  CXNamespace *v12;
  _xmlNode *v13;
  uint64_t v14;
  void *v15;
  _xmlNode *v16;
  _xmlNode *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  OADGenericLinkedMediaFile *v23;
  OAXMovieContext *v24;
  _BOOL4 v25;
  id v26;
  void *v27;
  _xmlNode *v28;
  _xmlNode *v29;
  _xmlNode *i;
  void *v31;
  int v32;
  int v33;
  __objc2_class **v34;
  int v35;
  int v36;
  id v37;
  void *v38;
  OAXMovieContext *v39;
  void *v40;
  void *v41;
  void *v42;
  OAXMovieContext *v43;
  void *v44;
  OADSound *v45;
  OADOle *v46;
  void *v47;
  OAXMovieContext *v48;
  void *v49;
  void *v50;
  _xmlNode *v51;
  _xmlNode *v52;
  _xmlNode *v53;
  id v54;
  id v55;
  id v56;

  v9 = (CXNamespace *)a4;
  v54 = a5;
  v10 = a6;
  v11 = (_xmlNode *)OCXFindChild(a3, v9, "cNvPicPr");
  if (v11)
  {
    objc_msgSend(v10, "OAXMainNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v13 = (_xmlNode *)OCXFindChild(v11, v12, "picLocks");

    if (v13)
    {
      v14 = CXDefaultBoolAttribute(v13, (CXNamespace *)CXNoNamespace, (xmlChar *)"noChangeAspect", 0);
      objc_msgSend(v54, "drawableProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAspectRatioLocked:", v14);

    }
    v16 = (_xmlNode *)OCXFindChild(a3, v9, "cNvPr");
    v17 = v16;
    if (v16)
    {
      v56 = 0;
      v18 = CXOptionalStringAttribute(v16, (void *)CXNoNamespace, (xmlChar *)"descr", &v56);
      v19 = v56;
      v20 = v19;
      if (v18 && objc_msgSend(v19, "hasPrefix:", CFSTR("movie::")))
      {
        objc_msgSend(v20, "substringFromIndex:", objc_msgSend(CFSTR("movie::"), "length"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v21);
        v23 = objc_alloc_init(OADGenericLinkedMediaFile);
        -[OADLinkedMediaFile setUrl:](v23, "setUrl:", v22);
        -[OADLinkedMediaFile setIsExternal:](v23, "setIsExternal:", 1);
        v24 = -[OCXDelayedMediaContext initWithTargetLocation:package:]([OAXMovieContext alloc], "initWithTargetLocation:package:", v22, 0);
        -[OCDDelayedNode setDelayedContext:](v23, "setDelayedContext:", v24);
        objc_msgSend(v54, "setMovie:", v23);

      }
      v55 = 0;
      v25 = CXOptionalStringAttribute(v17, (void *)CXNoNamespace, (xmlChar *)"name", &v55);
      v26 = v55;
      if (v25)
      {
        objc_msgSend(v54, "drawableProperties");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setAltDescription:", v26);

      }
    }
    v28 = (_xmlNode *)OCXFindChild(a3, v9, "nvPr");
    v29 = v28;
    if (v28)
    {
      for (i = OCXFirstChild(v28); i; i = OCXNextSibling(i))
      {
        objc_msgSend(v10, "OAXMainNamespace");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "containsNode:", i);

        if (v32)
        {
          if (xmlStrEqual(i->name, (const xmlChar *)"wavAudioFile"))
          {
            objc_msgSend(v10, "packagePart");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "OCXReadRelationshipForNode:attributeName:packagePart:", i, "embed", v38);
            v37 = (id)objc_claimAutoreleasedReturnValue();

            v39 = [OAXMovieContext alloc];
            objc_msgSend(v37, "targetLocation");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "packagePart");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "package");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = -[OCXDelayedMediaContext initWithTargetLocation:package:](v39, "initWithTargetLocation:package:", v40, v42);

            CXDefaultStringAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"name", 0);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_alloc_init(OADSound);
            -[OCDDelayedNode setDelayedContext:](v45, "setDelayedContext:", v43);
            -[OADSound setName:](v45, "setName:", v44);
            v46 = objc_alloc_init(OADOle);
            -[OADOle setObject:](v46, "setObject:", v45);
            objc_msgSend(v54, "setOle:", v46);
            goto LABEL_22;
          }
          v33 = xmlStrEqual(i->name, (const xmlChar *)"audioFile");
          v34 = off_24F399318;
          if (v33
            || (v35 = xmlStrEqual(i->name, (const xmlChar *)"videoFile"), v34 = off_24F399368, v35)
            || (v36 = xmlStrEqual(i->name, (const xmlChar *)"quickTimeFile"), v34 = off_24F399350, v36))
          {
            v37 = objc_alloc_init(*v34);
            if (v37)
            {
              objc_msgSend(v10, "packagePart");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "OCXReadRelationshipForNode:attributeName:packagePart:", i, "link", v47);
              v43 = (OAXMovieContext *)objc_claimAutoreleasedReturnValue();

              -[OAXMovieContext targetLocation](v43, "targetLocation");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              if (v44)
              {
                v48 = [OAXMovieContext alloc];
                objc_msgSend(v10, "packagePart");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "package");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = -[OCXDelayedMediaContext initWithTargetLocation:package:](v48, "initWithTargetLocation:package:", v44, v50);

                objc_msgSend(v37, "setDelayedContext:", v45);
                objc_msgSend(v37, "setUrl:", v44);
                objc_msgSend(v37, "setIsExternal:", -[OAXMovieContext targetMode](v43, "targetMode") == 1);
                objc_msgSend(v54, "setMovie:", v37);
LABEL_25:

LABEL_26:
                break;
              }
              v51 = OCXFirstChildNamed(v29, (xmlChar *)"extLst");
              if (!v51)
                goto LABEL_26;
              v52 = OCXFirstChildNamed(v51, (xmlChar *)"ext");
              v53 = v52;
              if (!v52)
                goto LABEL_26;
              CXDefaultStringAttribute(v52, (CXNamespace *)CXNoNamespace, (xmlChar *)"uri", 0);
              v45 = (OADSound *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "client");
              v46 = (OADOle *)objc_claimAutoreleasedReturnValue();
              -[OADOle readBlipExtWithURI:fromNode:toDrawable:state:](v46, "readBlipExtWithURI:fromNode:toDrawable:state:", v45, v53, v54, v10);
LABEL_22:

              goto LABEL_25;
            }
          }
        }
      }
    }
  }

}

+ (id)GifSubBlip:(id)a3 drawingState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  id v15;

  v5 = a4;
  objc_msgSend(a3, "blipRef");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "blip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetBlipCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "blips");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "index");
  if (v7)
    goto LABEL_2;
  v14 = v10;
  if (!objc_msgSend(v9, "count") || objc_msgSend(v9, "count") <= (unint64_t)(v14 - 1))
  {
    v7 = 0;
LABEL_11:
    v12 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_11;
LABEL_2:
  objc_msgSend(v7, "mainSubBlip");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "type") != 7 || (v12 = v11) == 0)
  {
    objc_msgSend(v7, "altSubBlip");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "type") == 7)
      v12 = v13;
    else
      v12 = 0;

  }
LABEL_15:
  v15 = v12;

  return v15;
}

+ (void)mapImageWithGifAsMovie:(id)a3 xmlNode:(_xmlNode *)a4 drawingState:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFData *v12;
  void *v13;
  CGImageSource *v14;
  void *v15;
  CXNamespace *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  OADVideoFile *v21;
  OAXMovieContext *v22;
  void *v23;
  OAXMovieContext *v24;
  void *v25;
  id v26;

  v26 = a3;
  v8 = a5;
  objc_msgSend(v26, "imageProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageFill");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "GifSubBlip:drawingState:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if ((objc_msgSend(v11, "isLoaded") & 1) == 0)
      objc_msgSend(v11, "load");
    objc_msgSend(v11, "data");
    v12 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)MEMORY[0x22E2DDB58]();
      v14 = CGImageSourceCreateWithData(v12, 0);
      if (CGImageSourceGetCount(v14) >= 2)
      {
        objc_msgSend(v8, "packagePart");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "OAXMainNamespace");
        v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v17 = OCXFindChild(a4, v16, "blip");

        if (v17)
        {
          objc_msgSend(v8, "OCXReadRelationshipForNode:attributeName:packagePart:", v17, "embed", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "targetLocation");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v25 = v15;
              v21 = objc_alloc_init(OADVideoFile);
              v22 = [OAXMovieContext alloc];
              objc_msgSend(v25, "package");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = -[OCXDelayedMediaContext initWithTargetLocation:package:](v22, "initWithTargetLocation:package:", v20, v23);

              -[OCDDelayedNode setDelayedContext:](v21, "setDelayedContext:", v24);
              -[OADLinkedMediaFile setUrl:](v21, "setUrl:", v20);
              -[OADLinkedMediaFile setIsExternal:](v21, "setIsExternal:", 0);
              -[OADMovie setLoop:](v21, "setLoop:", 1);
              objc_msgSend(v26, "setMovie:", v21);

              v15 = v25;
            }
          }
          else
          {
            v20 = 0;
          }
        }
        else
        {
          v20 = 0;
          v19 = 0;
        }

      }
      CFRelease(v14);
      objc_autoreleasePoolPop(v13);
    }

  }
}

@end
