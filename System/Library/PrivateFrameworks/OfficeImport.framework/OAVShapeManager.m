@implementation OAVShapeManager

- (BOOL)isImage
{
  void *v2;
  BOOL v3;

  -[OAVShapeManager imageRelId](self, "imageRelId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)imageRelId
{
  _xmlNode *v3;
  _xmlNode *v4;
  void *v5;
  void *v6;

  v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "imagedata");
  if (v3)
  {
    v4 = v3;
    CXDefaultStringAttribute(v3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"relid", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[OCXReadState OCXReadRelationshipForNode:packagePart:](self->mOAVState, "OCXReadRelationshipForNode:packagePart:", v4, self->mPackagePart);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isWordArt
{
  EshShapeLib *mType;
  _xmlNode *v4;

  mType = (EshShapeLib *)self->mType;
  if ((_DWORD)mType)
  {
    LOBYTE(v4) = EshShapeLib::isWordArt(mType);
  }
  else
  {
    v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "textpath");
    if (v4)
      LOBYTE(v4) = CXDefaultBoolAttribute(v4, (CXNamespace *)CXNoNamespace, (xmlChar *)"on", 0);
  }
  return (char)v4;
}

- (id)fillType
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", (NSString *)CFSTR("solid"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("solid");
  }
  return v3;
}

- (BOOL)isFilled
{
  uint64_t isFillOn;
  uint64_t v4;
  _xmlNode *v5;

  if (-[OAVShapeManager isFillOK](self, "isFillOK"))
  {
    isFillOn = EshShapeLib::isFillOn((EshShapeLib *)self->mType, 1);
    v4 = CXDefaultBoolAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"filled", isFillOn);
    v5 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
    if (v5)
      return CXDefaultBoolAttribute(v5, (CXNamespace *)CXNoNamespace, (xmlChar *)"on", v4);
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isFillOK
{
  uint64_t isFillOK;
  _xmlNode *v4;

  isFillOK = EshShapeLib::isFillOK((EshShapeLib *)self->mType, 1);
  v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "path");
  if (v4)
    return CXDefaultBoolAttribute(v4, (CXNamespace *)CXNoNamespace, (xmlChar *)"fillok", isFillOK);
  else
    return isFillOK;
}

- (id)fillFgColor
{
  NSString *v3;
  _xmlNode *v4;
  uint64_t v5;

  CXDefaultStringAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"fillcolor", (NSString *)CFSTR("white"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v4)
  {
    CXDefaultStringAttribute(v4, (CXNamespace *)CXNoNamespace, (xmlChar *)"color", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (NSString *)v5;
  }
  return v3;
}

- (float)fillFgAlpha
{
  NSString *v2;
  _xmlNode *v3;
  float v4;

  v2 = (NSString *)CFSTR("1.0");
  v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"opacity", (NSString *)CFSTR("1.0"));
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = OAVReadFraction(v2);

  return v4;
}

- (id)path
{
  NSString *v3;
  _xmlNode *v4;
  uint64_t v5;

  CXDefaultStringAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"path", 0);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "path");
  if (v4)
  {
    CXDefaultStringAttribute(v4, (CXNamespace *)CXNoNamespace, (xmlChar *)"v", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (NSString *)v5;
  }
  return v3;
}

- (unsigned)type
{
  return self->mType;
}

- (_xmlNode)shape
{
  return self->mShape;
}

- (OAVTextBoxInsets)textInsets
{
  float v3;
  float v4;
  float v5;
  float v6;
  _xmlNode *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int i;
  void *v12;
  void *v13;
  NSString *v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  OAVTextBoxInsets result;

  v3 = OAVReadLength((NSString *)CFSTR("0.10in"));
  v4 = OAVReadLength((NSString *)CFSTR("0.05in"));
  v5 = OAVReadLength((NSString *)CFSTR("0.10in"));
  v6 = OAVReadLength((NSString *)CFSTR("0.05in"));
  v7 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "textbox");
  if (v7)
  {
    CXDefaultStringAttribute(v7, (CXNamespace *)CXNoNamespace, (xmlChar *)"inset", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      for (i = 0; objc_msgSend(v10, "count") > (unint64_t)i; ++i)
      {
        objc_msgSend(v10, "objectAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();

        if (-[NSString length](v14, "length"))
        {
          v15 = OAVReadLength(v14);
          v16 = v15;
          switch(i)
          {
            case 0u:
              break;
            case 1u:
              v4 = v15;
              goto LABEL_10;
            case 2u:
              v5 = v15;
              goto LABEL_10;
            case 3u:
              v6 = v15;
              goto LABEL_10;
            default:
              goto LABEL_10;
          }
        }
        else
        {
LABEL_10:
          v16 = v3;
        }

        v3 = v16;
      }

    }
  }
  v17 = v3;
  v18 = v4;
  v19 = v5;
  v20 = v6;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (id)textLayoutFlow
{
  __CFString *v2;

  -[NSDictionary objectForKey:](self->mTextBoxStyle, "objectForKey:", CFSTR("layout-flow"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR("horizontal");
  return v2;
}

- (id)textAltLayoutFlow
{
  return -[NSDictionary objectForKey:](self->mTextBoxStyle, "objectForKey:", CFSTR("mso-layout-flow-alt"));
}

- (BOOL)fitShapeToText
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->mTextBoxStyle, "objectForKey:", CFSTR("mso-fit-shape-to-text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("t"));

  return v3;
}

- (id)textAnchor
{
  __CFString *v2;

  -[NSDictionary objectForKey:](self->mShapeStyle, "objectForKey:", CFSTR("v-text-anchor"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR("top");
  return v2;
}

- (id)strokeFgColor
{
  NSString *v3;
  _xmlNode *v4;
  uint64_t v5;

  CXDefaultStringAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"strokecolor", (NSString *)CFSTR("black"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v4)
  {
    CXDefaultStringAttribute(v4, (CXNamespace *)CXNoNamespace, (xmlChar *)"color", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (NSString *)v5;
  }
  return v3;
}

- (float)strokeFgAlpha
{
  NSString *v2;
  _xmlNode *v3;
  float v4;

  v2 = (NSString *)CFSTR("1.0");
  v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"opacity", (NSString *)CFSTR("1.0"));
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = OAVReadFraction(v2);

  return v4;
}

- (BOOL)isStroked
{
  uint64_t isStrokeOn;
  uint64_t v4;
  _xmlNode *v5;

  if (-[OAVShapeManager isStrokeOK](self, "isStrokeOK"))
  {
    isStrokeOn = EshShapeLib::isStrokeOn((EshShapeLib *)self->mType, 1);
    v4 = CXDefaultBoolAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"stroked", isStrokeOn);
    v5 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
    if (v5)
      return CXDefaultBoolAttribute(v5, (CXNamespace *)CXNoNamespace, (xmlChar *)"on", v4);
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isStrokeOK
{
  uint64_t isStrokeOK;
  _xmlNode *v4;

  isStrokeOK = EshShapeLib::isStrokeOK((EshShapeLib *)self->mType, 1);
  v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "path");
  if (v4)
    return CXDefaultBoolAttribute(v4, (CXNamespace *)CXNoNamespace, (xmlChar *)"strokeok", isStrokeOK);
  else
    return isStrokeOK;
}

- (id)strokeFillType
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"filltype", (NSString *)CFSTR("solid"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("solid");
  }
  return v3;
}

- (id)strokeDashStyle
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"dashstyle", (NSString *)CFSTR("solid"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("solid");
  }
  return v3;
}

- (id)strokeJoinStyle
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"joinstyle", (NSString *)CFSTR("round"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("round");
  }
  return v3;
}

- (id)strokeStartArrowType
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"startarrow", (NSString *)CFSTR("none"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("none");
  }
  return v3;
}

- (id)strokeStartArrowWidth
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"startarrowwidth", (NSString *)CFSTR("medium"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("medium");
  }
  return v3;
}

- (id)strokeStartArrowLength
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"startarrowlength", (NSString *)CFSTR("medium"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("medium");
  }
  return v3;
}

- (id)strokeEndArrowType
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"endarrow", (NSString *)CFSTR("none"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("none");
  }
  return v3;
}

- (id)strokeEndArrowWidth
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"endarrowwidth", (NSString *)CFSTR("medium"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("medium");
  }
  return v3;
}

- (id)strokeEndArrowLength
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"endarrowlength", (NSString *)CFSTR("medium"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("medium");
  }
  return v3;
}

- (float)strokeWidth
{
  NSString *v3;
  _xmlNode *v4;
  uint64_t v5;
  float v6;

  CXDefaultStringAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"strokeweight", (NSString *)CFSTR("0.75pt"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v4)
  {
    CXDefaultStringAttribute(v4, (CXNamespace *)CXNoNamespace, (xmlChar *)"weight", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (NSString *)v5;
  }
  v6 = OAVReadLength(v3);

  return v6;
}

- (id)strokeCapStyle
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"endcap", (NSString *)CFSTR("flat"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("flat");
  }
  return v3;
}

- (id)strokeCompoundType
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"linestyle", (NSString *)CFSTR("single"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("single");
  }
  return v3;
}

- (BOOL)isShadowed
{
  _xmlNode *v3;

  if (-[OAVShapeManager isShadowOK](self, "isShadowOK")
    && (v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "shadow")) != 0)
  {
    return CXDefaultBoolAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"on", 0);
  }
  else
  {
    return 0;
  }
}

- (BOOL)isShadowOK
{
  uint64_t isShadowOK;
  _xmlNode *v4;

  isShadowOK = EshShapeLib::isShadowOK((EshShapeLib *)self->mType, 1);
  v4 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "path");
  if (v4)
    return CXDefaultBoolAttribute(v4, (CXNamespace *)CXNoNamespace, (xmlChar *)"shadowok", isShadowOK);
  else
    return isShadowOK;
}

- (id)shadowColor
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "shadow");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"color", (NSString *)CFSTR("#808080"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("#808080");
  }
  return v3;
}

- (float)shadowAlpha
{
  NSString *v2;
  _xmlNode *v3;
  float v4;

  v2 = (NSString *)CFSTR("1.0");
  v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "shadow");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"opacity", (NSString *)CFSTR("1.0"));
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = OAVReadFraction(v2);

  return v4;
}

- (CGPoint)shadowOffsets
{
  _xmlNode *v2;
  __CFString *v3;
  void *v4;
  NSString *v5;
  float v6;
  double v7;
  NSString *v8;
  float v9;
  double v10;
  double v11;
  CGPoint result;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "shadow");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"offset", (NSString *)CFSTR("2pt,2pt"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("2pt,2pt");
  }
  -[__CFString componentsSeparatedByString:](v3, "componentsSeparatedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = OAVReadLength(v5);

  v7 = 2.0;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v4, "objectAtIndex:", 1);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = OAVReadLength(v8);

    v7 = v9;
  }

  v10 = v6;
  v11 = v7;
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)packagePart
{
  return self->mPackagePart;
}

- (id)movieRelId
{
  _xmlNode *mShape;
  void *v4;
  CXNamespace *v5;
  _xmlNode *v6;
  void *v7;
  CXNamespace *v8;
  void *v9;
  void *v10;

  mShape = self->mShape;
  -[OAVReadState oaxState](self->mOAVState, "oaxState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "OAXWordProcessingMLNamespace");
  v5 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v6 = (_xmlNode *)OCXFindChild(mShape, v5, "movie");

  if (v6)
  {
    -[OAVReadState oaxState](self->mOAVState, "oaxState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "OAXWordProcessingMLNamespace");
    v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    CXDefaultStringAttribute(v6, v8, (xmlChar *)"relid", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[OCXReadState OCXReadRelationshipForNode:packagePart:](self->mOAVState, "OCXReadRelationshipForNode:packagePart:", v6, self->mPackagePart);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (float)fillAngle
{
  NSString *v2;
  _xmlNode *v3;
  float v4;

  v2 = (NSString *)CFSTR("0");
  v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"angle", (NSString *)CFSTR("0"));
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = OAVReadAngle(v2);

  return v4;
}

- (float)fillFocus
{
  NSString *v2;
  _xmlNode *v3;
  float v4;

  v2 = (NSString *)CFSTR("0");
  v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"focus", (NSString *)CFSTR("0"));
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = OAVReadFraction(v2);

  return v4;
}

- (id)fillBgColor
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"color2", (NSString *)CFSTR("white"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("white");
  }
  return v3;
}

- (id)fillGradientColors
{
  _xmlNode *v2;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"colors", 0);
    v2 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (float)fillBgAlpha
{
  NSString *v2;
  _xmlNode *v3;
  float v4;

  v2 = (NSString *)CFSTR("1.0");
  v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"opacity2", (NSString *)CFSTR("1.0"));
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = OAVReadFraction(v2);

  return v4;
}

- (id)imageFillId
{
  _xmlNode *v3;
  _xmlNode *v4;
  void *v5;
  void *v6;

  v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v3)
  {
    v4 = v3;
    CXDefaultStringAttribute(v3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"relid", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[OCXReadState OCXReadRelationshipForNode:packagePart:](self->mOAVState, "OCXReadRelationshipForNode:packagePart:", v4, self->mPackagePart);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)textRotation
{
  __CFString *v2;

  -[NSDictionary objectForKey:](self->mTextBoxStyle, "objectForKey:", CFSTR("mso-rotate"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR("0");
  return v2;
}

- (id)textWrapStyle
{
  __CFString *v2;

  -[NSDictionary objectForKey:](self->mShapeStyle, "objectForKey:", CFSTR("mso-wrap-style"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR("square");
  return v2;
}

- (id)limo
{
  _xmlNode *v2;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "path");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"limo", 0);
    v2 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)textBodyRects
{
  _xmlNode *v2;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "path");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"TextBodyrect", 0);
    v2 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (OAVShapeManager)initWithShape:(_xmlNode *)a3 type:(unsigned __int16)a4 packagePart:(id)a5 state:(id)a6
{
  id v11;
  id v12;
  OAVShapeManager *v13;
  OAVShapeManager *v14;
  NSString *v15;
  uint64_t v16;
  NSDictionary *mShapeStyle;
  _xmlNode *v18;
  NSString *v19;
  NSString *v20;
  uint64_t v21;
  NSDictionary *mTextBoxStyle;
  objc_super v24;

  v11 = a5;
  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)OAVShapeManager;
  v13 = -[OAVShapeManager init](&v24, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->mShape = a3;
    v13->mType = a4;
    objc_storeStrong((id *)&v13->mPackagePart, a5);
    CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"style");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    OAVReadComposite(v15);
    v16 = objc_claimAutoreleasedReturnValue();
    mShapeStyle = v14->mShapeStyle;
    v14->mShapeStyle = (NSDictionary *)v16;

    v18 = (_xmlNode *)OCXFindChild(v14->mShape, (CXNamespace *)OAVOfficeMainNamespace, "textbox");
    if (v18)
    {
      CXDefaultStringAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"style", 0);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        OAVReadComposite(v19);
        v21 = objc_claimAutoreleasedReturnValue();
        mTextBoxStyle = v14->mTextBoxStyle;
        v14->mTextBoxStyle = (NSDictionary *)v21;

      }
    }
    objc_storeStrong((id *)&v14->mOAVState, a6);

  }
  return v14;
}

- (id)oavState
{
  return self->mOAVState;
}

- (BOOL)isPolyline
{
  return xmlStrEqual(self->mShape->name, (const xmlChar *)"polyline") != 0;
}

- (id)points
{
  return CXDefaultStringAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"points", 0);
}

- (id)imageFillTitle
{
  _xmlNode *v2;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "fill");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"title", 0);
    v2 = (_xmlNode *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)strokeBgColor
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"color2", (NSString *)CFSTR("white"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("white");
  }
  return v3;
}

- (float)strokeMiterLimit
{
  NSString *v2;
  _xmlNode *v3;
  float v4;

  v2 = (NSString *)CFSTR("8.0");
  v3 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "stroke");
  if (v3)
  {
    CXDefaultStringAttribute(v3, (CXNamespace *)CXNoNamespace, (xmlChar *)"miterlimit", (NSString *)CFSTR("8.0"));
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v4 = OAVReadFraction(v2);

  return v4;
}

- (id)shadowType
{
  _xmlNode *v2;
  __CFString *v3;

  v2 = (_xmlNode *)OCXFindChild(self->mShape, (CXNamespace *)OAVOfficeMainNamespace, "shadow");
  if (v2)
  {
    CXDefaultStringAttribute(v2, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", (NSString *)CFSTR("single"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("single");
  }
  return v3;
}

- (BOOL)autoInsets
{
  void *v2;
  char v3;

  CXDefaultStringAttribute(self->mShape, (CXNamespace *)CXNoNamespace, (xmlChar *)"insetmode", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("auto"));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOAVState, 0);
  objc_storeStrong((id *)&self->mTextBoxStyle, 0);
  objc_storeStrong((id *)&self->mShapeStyle, 0);
  objc_storeStrong((id *)&self->mPackagePart, 0);
}

@end
