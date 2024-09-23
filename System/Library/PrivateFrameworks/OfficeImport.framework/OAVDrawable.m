@implementation OAVDrawable

+ (id)readDrawablesFromParent:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _xmlNode *i;
  void *v12;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (i->type == XML_ELEMENT_NODE)
    {
      objc_msgSend(a1, "readDrawableFromNode:inNamespace:state:", i, v8, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        objc_msgSend(v10, "addObject:", v12);

    }
  }

  return v10;
}

+ (id)readDrawableFromNode:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v7 = a4;
  v8 = a5;
  if (xmlStrEqual(a3->name, (const xmlChar *)"shape")
    || xmlStrEqual(a3->name, (const xmlChar *)"line")
    || xmlStrEqual(a3->name, (const xmlChar *)"polyline")
    || xmlStrEqual(a3->name, (const xmlChar *)"rect")
    || xmlStrEqual(a3->name, (const xmlChar *)"roundrect")
    || xmlStrEqual(a3->name, (const xmlChar *)"oval"))
  {
    +[OAVShape readFromShape:inNamespace:state:](OAVShape, "readFromShape:inNamespace:state:", a3, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"shapetype"))
  {
    +[OAVShapeType readFromShapeType:state:](OAVShapeType, "readFromShapeType:state:", a3, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!xmlStrEqual(a3->name, (const xmlChar *)"group"))
    {
      v10 = 0;
      goto LABEL_9;
    }
    +[OAVGroup readFromGroup:inNamespace:state:](OAVGroup, "readFromGroup:inNamespace:state:", a3, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_9:

  return v10;
}

+ (void)readFromDrawable:(_xmlNode *)a3 toDrawable:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  OADOrientedBounds *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  double v16;
  void *v17;
  int v18;
  const xmlChar *name;
  NSString *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSString *v28;
  float v29;
  NSString *v30;
  float v31;
  NSString *v32;
  float v33;
  NSString *v34;
  float v35;
  int v36;
  int v37;
  int v38;
  NSString *v39;
  void *v40;
  NSString *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;

  v7 = a4;
  v8 = a5;
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"id", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CXDefaultStringAttribute(a3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"spid", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v10;
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v8, "setDrawable:forVmlShapeId:", v7, v9);
    objc_msgSend(v7, "setId:", objc_msgSend(v8, "officeArtShapeIdWithVmlShapeId:", v9));
  }
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v8, "setDrawable:forVmlShapeId:", v7, v10);
    if (!objc_msgSend(v9, "length"))
      objc_msgSend(v7, "setId:", objc_msgSend(v8, "officeArtShapeIdWithVmlShapeId:", v10));
  }
  if (!objc_msgSend(v9, "length"))
    objc_msgSend(v10, "length");
  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"style");
  v41 = (NSString *)objc_claimAutoreleasedReturnValue();
  OAVReadComposite(v41);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(OADOrientedBounds);
  objc_msgSend(v7, "drawableProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOrientedBounds:", v12);

  objc_msgSend(v11, "objectForKey:", CFSTR("rotation"));
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    *(float *)&v16 = OAVReadAngle(v14);
    -[OADOrientedBounds setRotation:](v12, "setRotation:", v16);
  }
  objc_msgSend(v11, "objectForKey:", CFSTR("flip"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("x")))
  {
    -[OADOrientedBounds setFlipX:](v12, "setFlipX:", 1);
    goto LABEL_16;
  }
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("y")) & 1) == 0)
  {
    if (!objc_msgSend(v17, "isEqualToString:", CFSTR("x y")))
      goto LABEL_16;
    -[OADOrientedBounds setFlipX:](v12, "setFlipX:", 1);
  }
  -[OADOrientedBounds setFlipY:](v12, "setFlipY:", 1);
LABEL_16:
  objc_msgSend(v11, "objectForKey:", CFSTR("visibility"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "isEqualToString:", CFSTR("hidden")))
    objc_msgSend(v7, "setHidden:", 1);
  v18 = xmlStrEqual(a3->parent->name, (const xmlChar *)"group");
  name = a3->name;
  if (v18)
  {
    if (xmlStrEqual(name, (const xmlChar *)"line"))
    {
      v44 = 0;
      CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"from");
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      OAVReadIntPair(v20, (int *)&v44 + 1, (int *)&v44);
      v43 = 0;
      CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"to");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      OAVReadIntPair(v21, (int *)&v43 + 1, (int *)&v43);
      -[OADOrientedBounds setBounds:](v12, "setBounds:", (double)SHIDWORD(v44), (double)(int)v44, (double)(HIDWORD(v43) - HIDWORD(v44)), (double)((int)v43 - (int)v44));
LABEL_23:

      goto LABEL_24;
    }
    if (!xmlStrEqual(a3->name, (const xmlChar *)"polyline"))
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("left"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v24, "intValue");

      objc_msgSend(v11, "objectForKey:", CFSTR("top"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v25, "intValue");

      objc_msgSend(v11, "objectForKey:", CFSTR("width"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v26, "intValue");

      objc_msgSend(v11, "objectForKey:", CFSTR("height"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v25) = objc_msgSend(v27, "intValue");

      -[OADOrientedBounds setBounds:](v12, "setBounds:", (double)v38, (double)v37, (double)v36, (double)(int)v25);
    }
  }
  else
  {
    if (xmlStrEqual(name, (const xmlChar *)"line"))
    {
      v44 = 0;
      CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"from");
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      OAVReadLengthPair(v20, (float *)&v44 + 1, (float *)&v44);
      v43 = 0;
      CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"to");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      OAVReadLengthPair(v21, (float *)&v43 + 1, (float *)&v43);
      -[OADOrientedBounds setBounds:](v12, "setBounds:", *((float *)&v44 + 1), *(float *)&v44, (float)(*((float *)&v43 + 1) - *((float *)&v44 + 1)), (float)(*(float *)&v43 - *(float *)&v44));
      goto LABEL_23;
    }
    if (!xmlStrEqual(a3->name, (const xmlChar *)"polyline"))
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("margin-left"));
      v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("left"));
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      v29 = OAVReadLength(v28);
      objc_msgSend(v11, "objectForKey:", CFSTR("margin-top"));
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        objc_msgSend(v11, "objectForKey:", CFSTR("top"));
        v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      v39 = v30;
      v31 = OAVReadLength(v30);
      objc_msgSend(v11, "objectForKey:", CFSTR("width"));
      v32 = (NSString *)objc_claimAutoreleasedReturnValue();
      v33 = OAVReadLength(v32);

      objc_msgSend(v11, "objectForKey:", CFSTR("height"));
      v34 = (NSString *)objc_claimAutoreleasedReturnValue();
      v35 = OAVReadLength(v34);

      -[OADOrientedBounds setBounds:](v12, "setBounds:", v29, v31, v33, v35);
    }
  }
LABEL_24:
  +[OAVHyperlink readFromDrawable:state:](OAVHyperlink, "readFromDrawable:state:", a3, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "drawableProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setClickHyperlink:", v22);

}

+ (_xmlDoc)vmlDocumentFromPart:(id)a3
{
  void *v3;
  void *v4;
  _xmlDoc *Doc;

  objc_msgSend(a3, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithData:encoding:", v3, 4);
  if (objc_msgSend(v4, "rangeOfString:", CFSTR("<br/>")) == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<br>"), CFSTR("<br/>"), 2, 0, objc_msgSend(v4, "length"));
  Doc = xmlReadDoc((const xmlChar *)objc_msgSend(v4, "tc_xmlString"), 0, 0, 97);

  return Doc;
}

+ (CGRect)readCoordBounds:(_xmlNode *)a3
{
  NSString *v4;
  NSString *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  int v15;
  int v16[2];
  CGRect result;

  *(_QWORD *)v16 = 0;
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"coordorigin", 0);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  OAVReadIntPair(v4, &v16[1], v16);
  v14 = 1000;
  v15 = 1000;
  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"coordsize");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  OAVReadIntPair(v5, &v15, &v14);
  v6 = (double)v16[1];
  v7 = (double)v16[0];
  v8 = (double)v15;
  v9 = (double)v14;

  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

@end
