@implementation OAXDrawable

+ (void)readNonVisualPropertiesFromDrawableXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 visualNodeName:(const char *)a5 toDrawable:(id)a6 drawingState:(id)a7
{
  CXNamespace *v11;
  id v12;
  id v13;
  _xmlNode *v14;
  _xmlNode *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  id v23;
  void *v24;
  _xmlAttr *v25;
  void *v26;
  CXNamespace *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  CXNamespace *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  CXNamespace *v35;
  _xmlNode *v36;
  _xmlNode *v37;
  void *v38;
  _xmlNode *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;

  v11 = (CXNamespace *)a4;
  v12 = a6;
  v13 = a7;
  v43 = v12;
  v14 = (_xmlNode *)OCXFindChild(a3, v11, a5);
  if (v14)
  {
    v15 = (_xmlNode *)OCXFindChild(v14, v11, "cNvPr");
  }
  else
  {
    objc_msgSend(v13, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (_xmlNode *)objc_msgSend(v16, "genericNonVisualPropertiesNodeForDrawableNode:inNamespace:state:", a3, v11, v13);

  }
  objc_msgSend(v12, "setHidden:", CXDefaultBoolAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"hidden", 0));
  v45 = 0;
  v17 = CXOptionalStringAttribute(v15, (void *)CXNoNamespace, (xmlChar *)"title", &v45);
  v18 = v45;
  v42 = v18;
  if (v17)
  {
    v19 = v18;
    objc_msgSend(v12, "drawableProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAltTitle:", v19);

  }
  v44 = 0;
  v21 = CXOptionalStringAttribute(v15, (void *)CXNoNamespace, (xmlChar *)"name", &v44);
  v22 = v44;
  v41 = v22;
  if (v21)
  {
    v23 = v22;
    objc_msgSend(v12, "drawableProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAltDescription:", v23);

  }
  v25 = CXRequiredUnsignedLongAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"id");
  objc_msgSend(v13, "drawableForShapeId:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    v25 = (_xmlAttr *)+[OADDrawable generateOADDrawableId:](OADDrawable, "generateOADDrawableId:", v12);
  objc_msgSend(v12, "setId:", v25);
  objc_msgSend(v13, "OAXMainNamespace");
  v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v28 = OCXFindChild(v15, v27, "hlinkClick");

  if (v28)
  {
    +[OAXHyperlink readHyperlink:state:](OAXHyperlink, "readHyperlink:state:", v28, v13);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "drawableProperties");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setClickHyperlink:", v29);

  }
  objc_msgSend(v13, "OAXMainNamespace");
  v31 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v32 = OCXFindChild(v15, v31, "hlinkHover");

  if (v32)
  {
    +[OAXHyperlink readHyperlink:state:](OAXHyperlink, "readHyperlink:state:", v32, v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "drawableProperties");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setHoverHyperlink:", v33);

  }
  objc_msgSend(v13, "OAXMainNamespace");
  v35 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v36 = (_xmlNode *)OCXFindChild(v15, v35, "extLst");

  if (v36)
  {
    v37 = OCXFirstChildNamed(v36, (xmlChar *)"ext");
    while (v37)
    {
      CXDefaultStringAttribute(v37, (CXNamespace *)CXNoNamespace, (xmlChar *)"uri", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "isEqualToString:", CFSTR("{63B3BB69-23CF-44E3-9099-C40C66FF867C}")))
      {
        v39 = OCXFirstChildNamed(v37, (xmlChar *)"compatExt");
        if (v39)
        {
          CXDefaultStringAttribute(v39, (CXNamespace *)CXNoNamespace, (xmlChar *)"spid", 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v40, "length"))
          {
            objc_msgSend(v13, "setVmlShapeId:forDrawableId:", v40, v25);

            break;
          }

        }
      }
      v37 = OCXNextSiblingNamed(v36, (xmlChar *)"ext");

    }
  }

}

+ (id)readDrawablesFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _xmlNode *i;
  void *v12;
  xmlNode *v13;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type != XML_ELEMENT_NODE)
      continue;
    objc_msgSend(a1, "readDrawableFromXmlNode:inNamespace:drawingState:", i, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = OCXReplaceChoiceWithFallback(i);
      if (!v13)
      {
        v12 = 0;
        goto LABEL_6;
      }
      objc_msgSend(a1, "readDrawableFromXmlNode:inNamespace:drawingState:", v13, v8, v9);
      i = v13;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_6;
    }
    objc_msgSend(v10, "addObject:", v12);
LABEL_6:

  }
  return v10;
}

+ (id)readDrawableFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  id v7;
  id v8;
  __objc2_class **v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v7 = a4;
  v8 = a5;
  if (!objc_msgSend(v7, "containsNode:", a3))
    goto LABEL_13;
  if (xmlStrEqual(a3->name, (const xmlChar *)"sp"))
  {
    v9 = off_24F399390;
    goto LABEL_12;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"cxnSp"))
  {
    v9 = off_24F399370;
    goto LABEL_12;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"pic"))
  {
    v9 = off_24F399388;
    goto LABEL_12;
  }
  if (xmlStrEqual(a3->name, (const xmlChar *)"graphicFrame"))
  {
    v9 = off_24F399378;
    goto LABEL_12;
  }
  if (!xmlStrEqual(a3->name, (const xmlChar *)"grpSp"))
  {
    if (xmlStrEqual(a3->name, (const xmlChar *)"contentPart"))
    {
      objc_msgSend(v8, "packagePart");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "OCXReadRequiredRelationshipForNode:packagePart:", a3, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "targetLocation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "relativeString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", OAUnsupportedMediaType, v32);
    }
LABEL_13:
    objc_msgSend(v8, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "readClientDrawableFromXmlNode:state:", a3, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_19;
    goto LABEL_14;
  }
  v9 = off_24F399380;
LABEL_12:
  -[__objc2_class readFromXmlNode:inNamespace:drawingState:](*v9, "readFromXmlNode:inNamespace:drawingState:", a3, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_13;
LABEL_14:
  v12 = objc_msgSend(v10, "id");
  objc_msgSend(v8, "vmlShapeIdForDrawableId:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v8, "oavState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "drawableForVmlShapeId:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v8, "oavState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addDualDrawable:", v15);

      objc_msgSend(v15, "setId:", v12);
      objc_msgSend(v10, "drawableProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "orientedBounds");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "drawableProperties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setOrientedBounds:", v18);

      objc_msgSend(v10, "drawableProperties");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "clickHyperlink");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "drawableProperties");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setClickHyperlink:", v21);

      objc_msgSend(v10, "drawableProperties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "hoverHyperlink");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "drawableProperties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setHoverHyperlink:", v24);

      objc_msgSend(v10, "clientData");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setClientData:", v26);

      v27 = v15;
      v10 = v27;
    }

  }
  objc_msgSend(v8, "setDrawable:forShapeId:", v10, v12);

LABEL_19:
  return v10;
}

@end
