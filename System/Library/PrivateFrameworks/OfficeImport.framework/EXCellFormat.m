@implementation EXCellFormat

+ (id)edCellFormatFromXmlCellFormatElement:(_xmlNode *)a3 isStyle:(BOOL)a4 state:(id)a5
{
  _BOOL4 v5;
  id v7;
  EDNamedStyle *v8;
  void *v9;
  EDNamedStyle *v10;
  uint64_t v11;
  EDStyle *v12;
  void *v13;
  CXNamespace *v14;
  uint64_t v15;
  void *v16;
  CXNamespace *v17;
  uint64_t v18;
  void *v19;
  BOOL v21;
  BOOL v22[8];
  BOOL v23[8];
  BOOL v24[8];
  uint64_t v25;
  uint64_t v26;

  v5 = a4;
  v7 = a5;
  if (a3)
  {
    if (v5)
    {
      v8 = [EDNamedStyle alloc];
      objc_msgSend(v7, "resources");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[EDStyle initWithResources:](v8, "initWithResources:", v9);

      v11 = 0;
    }
    else
    {
      v12 = [EDStyle alloc];
      objc_msgSend(v7, "resources");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[EDStyle initWithResources:](v12, "initWithResources:", v13);

      v11 = objc_msgSend(v7, "cellStyleXfsOffset");
    }
    v26 = 0;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"xfId", &v26))
      -[EDStyle setParentIndex:](v10, "setParentIndex:", v26 + v11);
    v25 = 0;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fontId", &v25))
    {
      -[EDStyle setFontIndex:](v10, "setFontIndex:", v25);
      v24[0] = 1;
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyFont", v24);
      -[EDStyle setFontApplied:](v10, "setFontApplied:", v24[0]);
    }
    *(_QWORD *)v24 = 0;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"borderId", (uint64_t *)v24))
    {
      -[EDStyle setBordersIndex:](v10, "setBordersIndex:", *(_QWORD *)v24);
      v23[0] = 1;
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyBorder", v23);
      -[EDStyle setBordersApplied:](v10, "setBordersApplied:", v23[0]);
    }
    *(_QWORD *)v23 = 0;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fillId", (uint64_t *)v23))
    {
      -[EDStyle setFillIndex:](v10, "setFillIndex:", *(_QWORD *)v23);
      v22[0] = 1;
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyFill", v22);
      -[EDStyle setFillApplied:](v10, "setFillApplied:", v22[0]);
    }
    *(_QWORD *)v22 = 0;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"numFmtId", (uint64_t *)v22))
    {
      -[EDStyle setContentFormatId:](v10, "setContentFormatId:", *(_QWORD *)v22);
      v21 = 1;
      if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyNumberFormat", &v21))
        -[EDStyle setContentFormatApplied:](v10, "setContentFormatApplied:", v21);
    }
    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v15 = OCXFindChild(a3, v14, "protection");

    +[EXProtection edProtectionFromXmlElement:state:](EXProtection, "edProtectionFromXmlElement:state:", v15, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDStyle setProtection:](v10, "setProtection:", v16);

    -[EDStyle setProtectionOverridden:](v10, "setProtectionOverridden:", v15 != 0);
    if (v15)
    {
      v21 = 1;
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyProtection", &v21);
      -[EDStyle setProtectionApplied:](v10, "setProtectionApplied:", v21);
    }
    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v18 = OCXFindChild(a3, v17, "alignment");

    +[EXAlignmentInfo edAlignmentInfoFromXmlAlignmentInfoElement:state:](EXAlignmentInfo, "edAlignmentInfoFromXmlAlignmentInfoElement:state:", v18, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDStyle setAlignmentInfo:](v10, "setAlignmentInfo:", v19);

    -[EDStyle setAlignmentInfoOverridden:](v10, "setAlignmentInfoOverridden:", v18 != 0);
    if (v18)
    {
      v21 = 1;
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyAlignment", &v21);
      -[EDStyle setAlignmentInfoApplied:](v10, "setAlignmentInfoApplied:", v21);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
