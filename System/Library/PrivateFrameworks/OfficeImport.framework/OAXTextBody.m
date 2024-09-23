@implementation OAXTextBody

+ (void)readTextBodyProperties:(_xmlNode *)a3 textBodyProperties:(id)a4 drawingState:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  id v14;
  _BOOL4 v15;
  id v16;
  double v17;
  _BOOL4 v18;
  id v19;
  _BOOL4 v20;
  id v21;
  _BOOL4 v22;
  id v23;
  _xmlNode *i;
  OADTextBodyAutoFit *v25;
  _BOOL4 v26;
  double v27;
  _BOOL4 v28;
  double v29;
  OADNormalTextBodyAutoFit *v30;
  double v31;
  double v32;
  OADTextBodyAutoFit *v33;
  OADPresetTextWarp *v34;
  id v35;
  void *v36;
  double v37;
  double v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  BOOL v44;
  uint64_t v45;

  v7 = a4;
  v45 = 0;
  v44 = 0;
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"lIns", &v45, 12))
  {
    v8 = (double)v45 / 12700.0;
    *(float *)&v8 = v8;
    objc_msgSend(v7, "setLeftInset:", v8);
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"tIns", &v45, 12))
  {
    v9 = (double)v45 / 12700.0;
    *(float *)&v9 = v9;
    objc_msgSend(v7, "setTopInset:", v9);
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rIns", &v45, 12))
  {
    v10 = (double)v45 / 12700.0;
    *(float *)&v10 = v10;
    objc_msgSend(v7, "setRightInset:", v10);
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bIns", &v45, 12))
  {
    v11 = (double)v45 / 12700.0;
    *(float *)&v11 = v11;
    objc_msgSend(v7, "setBottomInset:", v11);
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"numCol", &v45))
    objc_msgSend(v7, "setColumnCount:", v45);
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"spcCol", &v45))
  {
    v12 = (double)v45 / 12700.0;
    *(float *)&v12 = v12;
    objc_msgSend(v7, "setColumnSpacing:", v12);
  }
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rtlCol", &v44))
    objc_msgSend(v7, "setIsLeftToRightColumns:", v44);
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"spcFirstLastPara", &v44))
    objc_msgSend(v7, "setRespectLastFirstLineSpacing:", v44);
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"anchorCtr", &v44))
    objc_msgSend(v7, "setIsAnchorCenter:", v44);
  v43 = 0;
  v13 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"anchor", &v43);
  v14 = v43;
  if (v13)
    objc_msgSend(v7, "setTextAnchorType:", objc_msgSend(a1, "readAnchorType:", v14));
  v42 = 0;
  v15 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"vert", &v42);
  v16 = v42;
  if (v15)
    objc_msgSend(a1, "readFlowType:textBodyProperties:", v16, v7);
  +[OAXBaseTypes readOptionalAngleFromXmlNode:name:](OAXBaseTypes, "readOptionalAngleFromXmlNode:name:", a3, "rot");
  *(float *)&v17 = v17;
  objc_msgSend(v7, "setRotation:", v17);
  v41 = 0;
  v18 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"wrap", &v41);
  v19 = v41;
  if (v18)
    objc_msgSend(a1, "readWrapType:textBodyProperties:", v19, v7);
  v40 = 0;
  v20 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"vertOverflow", &v40);
  v21 = v40;
  if (v20)
    objc_msgSend(a1, "readVerticalOverflowType:textBodyProperties:", v21, v7);
  v39 = 0;
  v36 = v19;
  v22 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"horzOverflow", &v39);
  v23 = v39;
  if (v22)
    objc_msgSend(a1, "readHorizontalOverflowType:textBodyProperties:", v23, v7);
  if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"upright", &v44))
    objc_msgSend(v7, "setIsUpright:", v44);
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"noAutofit"))
    {
      v25 = -[OADTextBodyAutoFit initWithType:]([OADTextBodyAutoFit alloc], "initWithType:", 0);
      objc_msgSend(v7, "setAutoFit:", v25);
LABEL_43:

      continue;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"normAutofit"))
    {
      v38 = 0.0;
      v26 = CXOptionalFractionAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"fontScale", &v38);
      v27 = v38 * 100.0;
      if (!v26)
        v27 = 100.0;
      v38 = v27;
      v37 = 0.0;
      v28 = CXOptionalFractionAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"lnSpcReduction", &v37);
      v29 = v37 * 100.0;
      if (!v28)
        v29 = 0.0;
      v37 = v29;
      v30 = [OADNormalTextBodyAutoFit alloc];
      HIDWORD(v32) = HIDWORD(v37);
      HIDWORD(v31) = HIDWORD(v38);
      *(float *)&v31 = v38;
      *(float *)&v32 = v37;
      v25 = -[OADNormalTextBodyAutoFit initWithFontScalePercent:lineSpacingReductionPercent:](v30, "initWithFontScalePercent:lineSpacingReductionPercent:", v31, v32);
      objc_msgSend(v7, "setAutoFit:", v25);
      goto LABEL_43;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"spAutoFit"))
    {
      v25 = -[OADTextBodyAutoFit initWithType:]([OADTextBodyAutoFit alloc], "initWithType:", 1);
      objc_msgSend(v7, "setAutoFit:", v25);
      goto LABEL_43;
    }
    if (xmlStrEqual(i->name, (const xmlChar *)"prstTxWarp"))
    {
      CXDefaultStringAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst", 0);
      v33 = (OADTextBodyAutoFit *)objc_claimAutoreleasedReturnValue();
      v25 = v33;
      if (v33 && (-[OADTextBodyAutoFit isEqualToString:](v33, "isEqualToString:", CFSTR("textNoShape")) & 1) == 0)
      {
        v35 = v14;
        v34 = objc_alloc_init(OADPresetTextWarp);
        -[OADPresetTextWarp setPresetTextWarpType:](v34, "setPresetTextWarpType:", 29);
        objc_msgSend(v7, "setTextWarp:", v34);

        v14 = v35;
      }
      goto LABEL_43;
    }
  }

}

+ (unsigned)readAnchorType:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("t")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ctr")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("b")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("just")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("dist")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)readWrapType:(id)a3 textBodyProperties:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("none")) & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend(v7, "isEqualToString:", CFSTR("square"));
  objc_msgSend(v5, "setWrapType:", v6);

}

+ (void)readTextBodyFromXmlNode:(_xmlNode *)a3 textBody:(id)a4 drawingState:(id)a5
{
  id v8;
  CXNamespace *v9;
  uint64_t v10;
  void *v11;
  CXNamespace *v12;
  _xmlNode *Child;
  void *v14;
  CXNamespace *v15;
  CXNamespace *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a4;
  v8 = a5;
  objc_msgSend(v8, "OAXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "bodyPr");

  if (!v10)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  objc_msgSend(v19, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readTextBodyProperties:textBodyProperties:drawingState:", v10, v11, v8);

  objc_msgSend(v8, "OAXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(a3, v12, "p");

  while (Child)
  {
    objc_msgSend(v19, "addParagraph");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXParagraph readParagraph:paragraph:drawingState:](OAXParagraph, "readParagraph:paragraph:drawingState:", Child, v14, v8);

    objc_msgSend(v8, "OAXMainNamespace");
    v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v15, (xmlChar *)"p");

  }
  objc_msgSend(v8, "OAXMainNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = OCXFindChild(a3, v16, "lstStyle");

  if (v17 && *(_QWORD *)(v17 + 24))
  {
    objc_msgSend(v19, "overrideTextListStyle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[OAXTextListStyle readNode:textListStyle:state:](OAXTextListStyle, "readNode:textListStyle:state:", v17, v18, v8);

  }
}

+ (void)readFlowType:(id)a3 textBodyProperties:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(v6, "setFlowType:", objc_msgSend(a1, "readFlowType:", v7));

}

+ (unsigned)readFlowType:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("horz")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("vert")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("vert270")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("wordArtVert")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("eaVert")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mongolianVert")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("wordArtVertRtl")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (unsigned)readHorizontalOverflowType:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("overflow")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("clip"));

  return v4;
}

+ (void)readVerticalOverflowType:(id)a3 textBodyProperties:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("overflow")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ellipsis")) & 1) != 0)
  {
    v6 = 1;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("clip")))
  {
    v6 = 2;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v5, "setVerticalOverflowType:", v6);

}

+ (void)readHorizontalOverflowType:(id)a3 textBodyProperties:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(v6, "setHorizontalOverflowType:", objc_msgSend(a1, "readHorizontalOverflowType:", v7));

}

+ (id)stringWithTextBodyVerticalOverflowType:(unsigned __int8)a3
{
  const __CFString *v3;

  v3 = CFSTR("clip");
  if (a3 == 1)
    v3 = CFSTR("ellipsis");
  if (a3)
    return (id)v3;
  else
    return CFSTR("overflow");
}

+ (id)stringWithTextBodyHorizontalOverflowType:(unsigned __int8)a3
{
  if (a3)
    return CFSTR("clip");
  else
    return CFSTR("overflow");
}

+ (id)stringWithTextBodyFlowType:(unsigned __int8)a3
{
  if (a3 > 7u)
    return CFSTR("horz");
  else
    return off_24F39D3E8[(char)a3];
}

+ (id)stringWithTextBodyWrapType:(unsigned __int8)a3
{
  const __CFString *v3;

  v3 = &stru_24F3BFFF8;
  if (a3 == 1)
    v3 = CFSTR("square");
  if (a3)
    return (id)v3;
  else
    return CFSTR("none");
}

+ (id)stringWithTextAnchorType:(unsigned __int8)a3
{
  if (a3 > 4u)
    return CFSTR("b");
  else
    return off_24F39D428[(char)a3];
}

+ (void)writeTextBodyAutoFit:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  float v7;
  float v8;
  int v9;
  const __CFString *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = objc_msgSend(v11, "type");
      if (v9)
      {
        if (v9 != 1)
          goto LABEL_9;
        v10 = CFSTR("spAutoFit");
      }
      else
      {
        v10 = CFSTR("noAutofit");
      }
      objc_msgSend(v5, "startOAElement:", v10);
      objc_msgSend(v5, "endElement");
      goto LABEL_9;
    }
    v6 = v11;
    objc_msgSend(v5, "startOAElement:", CFSTR("normAutofit"));
    objc_msgSend(v6, "fontScalePercent");
    objc_msgSend(v5, "writeOAAttribute:intContent:", CFSTR("fontScale"), (uint64_t)(v7 * 100000.0 / 100.0));
    objc_msgSend(v6, "lineSpacingReductionPercent");
    objc_msgSend(v5, "writeOAAttribute:intContent:", CFSTR("lnSpcReduction"), (uint64_t)(v8 * 100000.0 / 100.0));
    objc_msgSend(v5, "endElement");

  }
LABEL_9:

}

@end
