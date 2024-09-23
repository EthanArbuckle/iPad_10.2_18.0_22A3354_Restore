@implementation CHXView3D

+ (id)chdView3DFromXmlView3DElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  CHDView3D *v6;
  void *v7;
  CXNamespace *v8;
  _xmlNode *v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  void *v13;
  CXNamespace *v14;
  _xmlNode *v15;
  void *v16;
  CXNamespace *v17;
  _xmlNode *v18;
  void *v19;
  CXNamespace *v20;
  _xmlNode *v21;
  void *v22;
  CXNamespace *v23;
  _xmlNode *v24;
  _xmlAttr *v25;

  v5 = a4;
  v6 = objc_alloc_init(CHDView3D);
  objc_msgSend(v5, "drawingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OAXChartNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = (_xmlNode *)OCXFindChild(a3, v8, "rotX");

  if (v9)
    -[CHDView3D setRotationX:](v6, "setRotationX:", CXRequiredLongAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v5, "drawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OAXChartNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "rotY");

  if (v12)
    -[CHDView3D setRotationY:](v6, "setRotationY:", CXRequiredLongAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v5, "drawingState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "OAXChartNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = (_xmlNode *)OCXFindChild(a3, v14, "hPercent");

  if (v15)
    -[CHDView3D setHeightPercent:](v6, "setHeightPercent:", CXRequiredLongAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v5, "drawingState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "OAXChartNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = (_xmlNode *)OCXFindChild(a3, v17, "depthPercent");

  if (v18)
    -[CHDView3D setDepthPercent:](v6, "setDepthPercent:", CXRequiredLongAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v5, "drawingState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "OAXChartNamespace");
  v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v21 = (_xmlNode *)OCXFindChild(a3, v20, "perspective");

  if (v21)
    -[CHDView3D setPerspective:](v6, "setPerspective:", CXRequiredLongAttribute(v21, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v5, "drawingState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "OAXChartNamespace");
  v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v24 = (_xmlNode *)OCXFindChild(a3, v23, "rAngAx");

  if (v24)
    v25 = CXRequiredBoolAttribute(v24, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  else
    v25 = 0;
  -[CHDView3D setRightAngleAxes:](v6, "setRightAngleAxes:", v25);

  return v6;
}

@end
