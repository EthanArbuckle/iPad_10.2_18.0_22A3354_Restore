@implementation CHXLayout

+ (void)readFrom:(_xmlNode *)a3 graphicProperties:(id)a4 state:(id)a5
{
  void *v7;
  id v8;

  v8 = a4;
  +[CHXLayout orientedBoundsFromLayoutElement:state:](CHXLayout, "orientedBoundsFromLayoutElement:state:", a3, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v8, "setOrientedBounds:", v7);

}

+ (id)orientedBoundsFromLayoutElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  CXNamespace *v8;
  _xmlNode *v9;
  void *v10;
  void *v11;
  CXNamespace *v12;
  _xmlNode *v13;
  void *v14;
  void *v15;
  CXNamespace *v16;
  _xmlNode *v17;
  void *v18;

  v6 = a4;
  objc_msgSend(v6, "drawingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OAXChartNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = (_xmlNode *)OCXFindChild(a3, v8, "manualLayout");

  if (v9)
  {
    objc_msgSend(a1, "boundsRectFromXmlManualLayoutElement:state:", v9, v6);
    +[OADOrientedBounds orientedBoundsWithBounds:rotation:flipX:flipY:](OADOrientedBounds, "orientedBoundsWithBounds:rotation:flipX:flipY:", 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "drawingState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "OAXChartNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v13 = (_xmlNode *)OCXFindChild(v9, v12, "xMode");

    if (v13)
    {
      CXRequiredStringAttribute(v13, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("edge")))
        objc_msgSend(v10, "setXMode:", 1);

    }
    objc_msgSend(v6, "drawingState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "OAXChartNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v17 = (_xmlNode *)OCXFindChild(v9, v16, "yMode");

    if (v17)
    {
      CXRequiredStringAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("edge")))
        objc_msgSend(v10, "setYMode:", 1);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (CGRect)boundsRectFromXmlManualLayoutElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  CXNamespace *v7;
  _xmlNode *v8;
  double v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  double v13;
  void *v14;
  CXNamespace *v15;
  _xmlNode *v16;
  double v17;
  void *v18;
  CXNamespace *v19;
  _xmlNode *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v5 = a4;
  v26 = 0.0;
  objc_msgSend(v5, "drawingState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OAXChartNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = (_xmlNode *)OCXFindChild(a3, v7, "x");

  if (v8)
  {
    CXOptionalDoubleAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v26);
    v9 = v26;
  }
  else
  {
    v9 = 0.0;
  }
  v26 = 0.0;
  objc_msgSend(v5, "drawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OAXChartNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "y");

  if (v12)
  {
    CXOptionalDoubleAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v26);
    v13 = v26;
  }
  else
  {
    v13 = 0.0;
  }
  v26 = 0.0;
  objc_msgSend(v5, "drawingState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "OAXChartNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = (_xmlNode *)OCXFindChild(a3, v15, "w");

  if (v16)
  {
    CXOptionalDoubleAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v26);
    v17 = v26;
  }
  else
  {
    v17 = 0.0;
  }
  v26 = 0.0;
  objc_msgSend(v5, "drawingState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "OAXChartNamespace");
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = (_xmlNode *)OCXFindChild(a3, v19, "h");

  if (v20)
  {
    CXOptionalDoubleAttribute(v20, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v26);
    v21 = v26;
  }
  else
  {
    v21 = 0.0;
  }

  v22 = v9;
  v23 = v13;
  v24 = v17;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (id)stringFromLayoutMode:(int)a3
{
  if (a3 == 1)
    return CFSTR("edge");
  else
    return CFSTR("factor");
}

@end
