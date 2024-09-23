@implementation EXOfficeArtClient

- (void)readClientDataFromNode:(_xmlNode *)a3 toDrawable:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  EDOfficeArtClient *v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CXNamespace *v17;
  uint64_t v18;
  double v19;
  double v20;
  CXNamespace *v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a4;
  v7 = a5;
  objc_opt_class();
  objc_msgSend(v7, "excelState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(EDOfficeArtClient);
  objc_msgSend(v29, "setClientData:", v9);
  objc_msgSend(v8, "currentSheet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDOfficeArtClient setSheet:](v9, "setSheet:", v10);

  objc_msgSend(v7, "OAXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "xfrm");

  if (v12)
  {
    v13 = *MEMORY[0x24BDBF090];
    v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
    objc_msgSend(v7, "OAXMainNamespace");
    v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v18 = OCXFindChild(v12, v17, "off");

    if (v18)
    {
      +[OAXBaseTypes readPoint2DFromXmlNode:](OAXBaseTypes, "readPoint2DFromXmlNode:", v18);
      v13 = v19;
      v14 = v20;
    }
    objc_msgSend(v7, "OAXMainNamespace");
    v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v22 = OCXFindChild(v12, v21, "ext");

    if (v22)
    {
      +[OAXBaseTypes readSize2DFromXmlNode:](OAXBaseTypes, "readSize2DFromXmlNode:", v22);
      v15 = v23;
      v16 = v24;
    }
    -[EDOfficeArtClient setBounds:](v9, "setBounds:", v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend(v29, "drawableProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "hasOrientedBounds");

    if (v26)
    {
      objc_msgSend(v29, "drawableProperties");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "orientedBounds");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "bounds");
      -[EDOfficeArtClient setBounds:](v9, "setBounds:");

    }
  }

}

- (BOOL)chartAutoFillIsHollow
{
  return self->mAutoChartFillIsHollow;
}

- (BOOL)chartAutoStrokeIsHollow
{
  return self->mAutoChartStrokeIsHollow;
}

- (BOOL)autoChartFillIsHollow
{
  return self->mAutoChartFillIsHollow;
}

- (void)setAutoChartFillIsHollow:(BOOL)a3
{
  self->mAutoChartFillIsHollow = a3;
}

- (BOOL)autoChartStrokeIsHollow
{
  return self->mAutoChartStrokeIsHollow;
}

- (void)setAutoChartStrokeIsHollow:(BOOL)a3
{
  self->mAutoChartStrokeIsHollow = a3;
}

@end
