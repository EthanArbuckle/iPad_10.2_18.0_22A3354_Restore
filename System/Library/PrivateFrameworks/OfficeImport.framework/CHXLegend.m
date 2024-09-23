@implementation CHXLegend

+ (id)chdLegendFromXmlLegendElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  CHDLegend *v7;
  void *v8;
  CHDLegend *v9;
  OADGraphicProperties *v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  _xmlNode *v14;
  void *v15;
  CXNamespace *v16;
  uint64_t v17;
  void *v18;
  CXNamespace *v19;
  uint64_t v20;
  OADTextBody *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _xmlNode *i;
  void *v27;
  void *v28;

  v6 = a4;
  v7 = [CHDLegend alloc];
  objc_msgSend(v6, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CHDLegend initWithResources:](v7, "initWithResources:", v8);

  v10 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v10, a3, v6);
  objc_msgSend(v6, "autoStyling");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resolveLegendGraphicProperties:", v10);

  -[CHDLegend setGraphicProperties:](v9, "setGraphicProperties:", v10);
  objc_msgSend(v6, "drawingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "OAXChartNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "overlay");

  if (v14)
    -[CHDLegend setIsOverlay:](v9, "setIsOverlay:", CXRequiredBoolAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "OAXChartNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = OCXFindChild(a3, v16, "legendPos");

  -[CHDLegend setLegendPosition:](v9, "setLegendPosition:", objc_msgSend(a1, "chdLegendPositionFromXmlLegendPositionElement:", v17));
  objc_msgSend(v6, "drawingState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "OAXChartNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = OCXFindChild(a3, v19, "txPr");

  if (v20)
  {
    v21 = objc_alloc_init(OADTextBody);
    objc_msgSend(v6, "drawingState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextBody readTextBodyFromXmlNode:textBody:drawingState:](OAXTextBody, "readTextBodyFromXmlNode:textBody:drawingState:", v20, v21, v22);

    +[CHXFont edFontWithOadTextBody:state:](CHXFont, "edFontWithOadTextBody:state:", v21, v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHDLegend setFont:](v9, "setFont:", v23);
    if (-[OADTextBody paragraphCount](v21, "paragraphCount"))
    {
      -[OADTextBody firstParagraphEffects](v21, "firstParagraphEffects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXEffect updateIncomingEffects:](OAXEffect, "updateIncomingEffects:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[CHDLegend setLabelEffects:](v9, "setLabelEffects:", v25);
    }

  }
  else
  {
    v23 = 0;
  }
  for (i = OCXFirstChildNamed(a3, (xmlChar *)"legendEntry"); i; i = OCXNextSiblingNamed(i, (xmlChar *)"legendEntry"))
  {
    -[CHDLegend legendEntries](v9, "legendEntries");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "chdLegendEntryFromXmlLegendEntryElement:defaultFont:state:", i, v23, v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v28);

  }
  return v9;
}

+ (int)chdLegendPositionFromXmlLegendPositionElement:(_xmlNode *)a3
{
  void *v3;
  int v4;

  if (a3)
  {
    CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b")) & 1) != 0)
    {
      v4 = 1;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tr")) & 1) != 0)
    {
      v4 = 5;
    }
    else
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("l")) & 1) == 0)
      {
        if ((objc_msgSend(v3, "isEqualToString:", CFSTR("r")) & 1) == 0)
        {
          if ((objc_msgSend(v3, "isEqualToString:", CFSTR("t")) & 1) != 0)
          {
            v4 = 4;
            goto LABEL_14;
          }
          +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
        }
        v4 = 3;
        goto LABEL_14;
      }
      v4 = 2;
    }
LABEL_14:

    return v4;
  }
  return 3;
}

+ (void)setDefaultLegendBounds:(id)a3 legendPosition:(int)a4
{
  double *v5;
  double *v6;
  double *v7;
  double *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (double *)MEMORY[0x24BDBF090];
  v6 = (double *)(MEMORY[0x24BDBF090] + 16);
  v7 = (double *)(MEMORY[0x24BDBF090] + 8);
  v8 = (double *)((char *)&unk_22A4C1B00 + 8 * a4 - 8);
  if ((a4 - 1) > 4)
  {
    v8 = (double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    v5 = (double *)((char *)&unk_22A4C1A88 + 8 * a4 - 8);
    v7 = (double *)((char *)&unk_22A4C1AB0 + 8 * a4 - 8);
    v6 = (double *)((char *)&unk_22A4C1AD8 + 8 * a4 - 8);
  }
  +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:", *v5 / 4000.0, *v7 / 4000.0, *v6 / 4000.0, *v8 / 4000.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOrientedBounds:", v9);

}

+ (id)chdLegendEntryFromXmlLegendEntryElement:(_xmlNode *)a3 defaultFont:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  CHDLegendEntry *v9;
  void *v10;
  CHDLegendEntry *v11;
  void *v12;
  CXNamespace *v13;
  _xmlNode *v14;
  void *v15;
  CXNamespace *v16;
  uint64_t v17;
  void *v18;

  v7 = a4;
  v8 = a5;
  v9 = [CHDLegendEntry alloc];
  objc_msgSend(v8, "resources");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CHDLegendEntry initWithResources:](v9, "initWithResources:", v10);

  objc_msgSend(v8, "drawingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "OAXChartNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = OCXFindRequiredChild(a3, v13, (xmlChar *)"idx");

  -[CHDLegendEntry setEntryIndex:](v11, "setEntryIndex:", CXRequiredUnsignedLongAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v8, "drawingState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "OAXChartNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = OCXFindChild(a3, v16, "txPr");

  if (v17
    && (+[CHXFont edFontFromXmlTextPropertiesElement:state:](CHXFont, "edFontFromXmlTextPropertiesElement:state:", v17, v8), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CHDLegendEntry setFont:](v11, "setFont:", v18);
  }
  else
  {
    if (v7)
      -[CHDLegendEntry setFont:](v11, "setFont:", v7);
    v18 = 0;
  }

  return v11;
}

@end
