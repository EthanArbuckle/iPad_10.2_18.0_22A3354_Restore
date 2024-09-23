@implementation CHXPie2DType

+ (void)readFrom:(_xmlNode *)a3 chartType:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  OADGraphicProperties *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _xmlNode *parent;
  void *v37;
  CXNamespace *v38;
  void *v39;
  CXNamespace *v40;
  void *v41;
  void *v42;
  id v43;

  v43 = a4;
  v7 = a5;
  objc_msgSend(v7, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "firstSliceAng");

  if (v10)
  {
    v11 = (uint64_t)CXRequiredUnsignedLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  }
  else
  {
    objc_msgSend(v7, "chart");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "view3D");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      parent = a3->parent->parent;
      objc_msgSend(v7, "drawingState");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "OAXChartNamespace");
      v38 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v11 = OCXFindChild(parent, v38, "view3D");

      if (v11)
      {
        objc_msgSend(v7, "drawingState");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "OAXChartNamespace");
        v40 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v11 = OCXFindChild((_xmlNode *)v11, v40, "rotY");

        if (v11)
        {
          objc_msgSend(v7, "chart");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "view3D");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v42, "rotationY");

        }
      }
    }
    else
    {
      v11 = 0;
    }
  }
  objc_msgSend(v43, "setFirstSliceAngle:", v11);
  objc_msgSend(v7, "chart");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "plotArea");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "graphicProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v7, "chart");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "plotArea");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(OADGraphicProperties);
    objc_msgSend(v16, "setGraphicProperties:", v17);

  }
  objc_msgSend(v7, "chart");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "plotArea");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "graphicProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hasOrientedBounds");

  if (v21)
  {
    objc_msgSend(v7, "chart");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "plotArea");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "graphicProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "orientedBounds");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v27 = v26;
    v29 = v28;

    if (v27 == 0.0 && v29 == 0.0)
    {
      objc_msgSend(v7, "chart");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "plotArea");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "graphicProperties");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "orientedBounds");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setBounds:", 0.191593176, 0.0509259259, 0.538888889, 0.898148148);

    }
  }

}

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(v6, "chart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDChartType chartTypeWithChart:](CHDPie2DType, "chartTypeWithChart:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "readFrom:chartType:state:", a3, v8, v6);
  return v8;
}

@end
