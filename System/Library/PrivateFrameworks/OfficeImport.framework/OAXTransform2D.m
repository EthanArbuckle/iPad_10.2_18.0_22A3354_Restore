@implementation OAXTransform2D

+ (void)readFromParentXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 toDrawable:(id)a5 drawingState:(id)a6
{
  id v10;
  id v11;
  CXNamespace *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  CXNamespace *v17;

  v17 = (CXNamespace *)a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v11, "OAXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "xfrm");

  if (v13 || (v13 = OCXFindChild(a3, v17, "xfrm")) != 0)
  {
    objc_msgSend(v10, "drawableProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(a1, "readOrientedBoundsFromXmlNode:inNamespace:relative:drawingState:", v13, v17, objc_msgSend(v11, "isInsideGroup"), v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "drawableProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setOrientedBounds:", v15);

    }
  }

}

+ (id)readOrientedBoundsFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 relative:(BOOL)a5 drawingState:(id)a6
{
  _BOOL4 v6;
  id v8;
  OADOrientedBounds *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CXNamespace *v14;
  uint64_t v15;
  double v16;
  double v17;
  CXNamespace *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  float v23;
  int v24;
  int v25;
  double v26;

  v6 = a5;
  v8 = a6;
  v9 = objc_alloc_init(OADOrientedBounds);
  v10 = *MEMORY[0x24BDBF090];
  v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
  objc_msgSend(v8, "OAXMainNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = OCXFindChild(a3, v14, "off");

  if (v15)
  {
    if (v6)
    {
      v10 = (double)+[OAXBaseTypes readRequiredLongFromXmlNode:name:](OAXBaseTypes, "readRequiredLongFromXmlNode:name:", v15, "x");
      v11 = (double)+[OAXBaseTypes readRequiredLongFromXmlNode:name:](OAXBaseTypes, "readRequiredLongFromXmlNode:name:", v15, "y");
    }
    else
    {
      +[OAXBaseTypes readPoint2DFromXmlNode:](OAXBaseTypes, "readPoint2DFromXmlNode:", v15);
      v10 = v16;
      v11 = v17;
    }
  }
  objc_msgSend(v8, "OAXMainNamespace");
  v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v19 = OCXFindChild(a3, v18, "ext");

  if (v19)
  {
    if (v6)
    {
      v12 = (double)+[OAXBaseTypes readRequiredLongFromXmlNode:name:](OAXBaseTypes, "readRequiredLongFromXmlNode:name:", v19, "cx");
      v13 = (double)+[OAXBaseTypes readRequiredLongFromXmlNode:name:](OAXBaseTypes, "readRequiredLongFromXmlNode:name:", v19, "cy");
    }
    else
    {
      +[OAXBaseTypes readSize2DFromXmlNode:](OAXBaseTypes, "readSize2DFromXmlNode:", v19);
      v12 = v20;
      v13 = v21;
    }
  }
  -[OADOrientedBounds setBounds:](v9, "setBounds:", v10, v11, v12, v13);
  +[OAXBaseTypes readOptionalAngleFromXmlNode:name:](OAXBaseTypes, "readOptionalAngleFromXmlNode:name:", a3, "rot");
  v23 = v22;
  *(float *)&v22 = v23;
  -[OADOrientedBounds setRotation:](v9, "setRotation:", v22);
  -[OADOrientedBounds setFlipX:](v9, "setFlipX:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"flipH", 0));
  -[OADOrientedBounds setFlipY:](v9, "setFlipY:", CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"flipV", 0));
  v24 = -[OADOrientedBounds flipX](v9, "flipX");
  v25 = -[OADOrientedBounds flipY](v9, "flipY");
  if (v23 != 0.0 && v24 != v25)
  {
    *(float *)&v26 = 360.0 - v23;
    -[OADOrientedBounds setRotation:](v9, "setRotation:", v26);
  }

  return v9;
}

+ (CGRect)readChildrenBoundsFromParentXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  id v6;
  CXNamespace *v7;
  _xmlNode *v8;
  CXNamespace *v9;
  uint64_t v10;
  CXNamespace *v11;
  uint64_t v12;
  uint64_t v13;
  CXNamespace *v14;
  uint64_t v15;
  CXNamespace *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v6 = a5;
  objc_msgSend(v6, "OAXMainNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = (_xmlNode *)OCXFindChild(a3, v7, "xfrm");

  objc_msgSend(v6, "OAXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(v8, v9, "chOff");

  if (!v10)
  {
    objc_msgSend(v6, "OAXMainNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v10 = OCXFindChild(v8, v11, "off");

    if (!v10)
    {
      +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
      v10 = 0;
    }
  }
  v12 = +[OAXBaseTypes readRequiredLongFromXmlNode:name:](OAXBaseTypes, "readRequiredLongFromXmlNode:name:", v10, "x");
  v13 = +[OAXBaseTypes readRequiredLongFromXmlNode:name:](OAXBaseTypes, "readRequiredLongFromXmlNode:name:", v10, "y");
  objc_msgSend(v6, "OAXMainNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = OCXFindChild(v8, v14, "chExt");

  if (!v15)
  {
    objc_msgSend(v6, "OAXMainNamespace");
    v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v15 = OCXFindChild(v8, v16, "ext");

    if (!v15)
    {
      +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
      v15 = 0;
    }
  }
  v17 = +[OAXBaseTypes readRequiredLongFromXmlNode:name:](OAXBaseTypes, "readRequiredLongFromXmlNode:name:", v15, "cx");
  v18 = (double)+[OAXBaseTypes readRequiredLongFromXmlNode:name:](OAXBaseTypes, "readRequiredLongFromXmlNode:name:", v15, "cy");

  v19 = (double)v12;
  v20 = (double)v13;
  v21 = (double)v17;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

@end
