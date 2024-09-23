@implementation OAVShape

+ (id)readFromShape:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5
{
  id v7;
  void *v8;
  OADImage *v9;
  OADImage *v10;
  OADImage *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  OADImage *v19;
  OADImage *v21;

  v7 = a5;
  objc_msgSend(a1, "managerWithShape:state:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isImage"))
  {
    v9 = objc_alloc_init(OADImage);
    v10 = 0;
    v21 = v9;
  }
  else
  {
    v9 = objc_alloc_init(OADShape);
    v21 = 0;
    v10 = v9;
  }
  v11 = v9;
  v12 = objc_msgSend(v8, "isPolyline");
  +[OAVDrawable readFromDrawable:toDrawable:state:](OAVDrawable, "readFromDrawable:toDrawable:state:", a3, v11, v7);
  -[OADGraphic graphicProperties](v11, "graphicProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "isWordArt");
  +[OAVFill readFromManager:state:](OAVFill, "readFromManager:state:", v8, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFill:", v15);

  if (v14)
  {
    +[OAVWordArt readFromManager:toShape:state:](OAVWordArt, "readFromManager:toShape:state:", v8, v10, v7);
  }
  else
  {
    if (v10)
    {
      if ((v12 & 1) != 0)
      {
        objc_msgSend(a1, "readBoundsAndGeometryOfPolylineFromManager:toShape:state:", v8, v10, v7);
      }
      else
      {
        +[OAVShapeGeometry readFromManager:](OAVShapeGeometry, "readFromManager:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADImage setGeometry:](v10, "setGeometry:", v16);

      }
      +[OAVTextBodyProperties readFromManager:toShape:state:](OAVTextBodyProperties, "readFromManager:toShape:state:", v8, v10, v7);
    }
    +[OAVStroke readFromManager:](OAVStroke, "readFromManager:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStroke:", v17);

    +[OAVShadow readFromManager:](OAVShadow, "readFromManager:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEffects:", v18);

    if (v21)
      +[OAVImage readFromManager:toImage:state:](OAVImage, "readFromManager:toImage:state:", v8, v21, v7);
  }
  objc_msgSend((id)objc_msgSend(v7, "client"), "readClientDataFromShape:toGraphic:state:", a3, v11, v7);
  v19 = v11;

  return v19;
}

+ (id)managerWithShape:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  uint64_t v7;
  OAVShapeManager *v8;
  void *v9;
  OAVShapeManager *v10;

  v6 = a4;
  v7 = objc_msgSend(a1, "typeWithShape:state:", a3, v6);
  v8 = [OAVShapeManager alloc];
  objc_msgSend(v6, "packagePart");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[OAVShapeManager initWithShape:type:packagePart:state:](v8, "initWithShape:type:packagePart:state:", a3, v7, v9, v6);

  return v10;
}

+ (unsigned)typeWithShape:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  unsigned __int16 v10;
  void *v11;

  v5 = a4;
  if (xmlStrEqual(a3->name, (const xmlChar *)"shape"))
  {
    CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "substringFromIndex:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v5, "shapeTypeForId:", v8);
      v10 = v9;
      if (!v9)
      {
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("_x0000_t")))
        {
          objc_msgSend(v8, "substringFromIndex:", objc_msgSend(CFSTR("_x0000_t"), "length"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v11, "intValue");

        }
        else
        {
          v10 = 0;
        }
      }
    }
    else
    {
      v10 = 0;
      v8 = 0;
    }

  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"line"))
  {
    v10 = 20;
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"polyline"))
  {
    v10 = 0;
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"rect"))
  {
    v10 = 1;
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"roundrect"))
  {
    v10 = 2;
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"oval"))
  {
    v10 = 3;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)readBoundsAndGeometryOfPolylineFromManager:(id)a3 toShape:(id)a4 state:(id)a5
{
  id v6;
  id v7;
  double v8;
  NSString *v9;
  void *v10;
  unint64_t v11;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  OADCustomShapeGeometry *v16;
  OADPath *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  void *v31;
  _DWORD v32[4];
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v6 = a3;
  v7 = a4;
  if (xmlStrEqual(*(const xmlChar **)(*(_QWORD *)(objc_msgSend(v6, "shape") + 40) + 16), (const xmlChar *)"group"))
    v8 = 1.0;
  else
    v8 = 20.0;
  objc_msgSend(v6, "points");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  OAVReadLengthArray(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11 >= 2)
  {
    x = *MEMORY[0x24BDBF070];
    y = *(double *)(MEMORY[0x24BDBF070] + 8);
    width = *(double *)(MEMORY[0x24BDBF070] + 16);
    height = *(double *)(MEMORY[0x24BDBF070] + 24);
    v16 = objc_alloc_init(OADCustomShapeGeometry);
    objc_msgSend(v7, "setGeometry:", v16);
    -[OADShapeGeometry setIsEscher:](v16, "setIsEscher:", 1);
    v17 = objc_alloc_init(OADPath);
    -[OADCustomShapeGeometry addPath:](v16, "addPath:", v17);
    v30 = v9;
    v31 = v7;
    v18 = 0;
    if (v11 >> 1 <= 1)
      v19 = 1;
    else
      v19 = v11 >> 1;
    v20 = 1;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v20 - 1, v30, v31);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      v23 = v22;

      objc_msgSend(v10, "objectAtIndexedSubscript:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "doubleValue");
      v26 = v25;

      v36.size.width = 0.0;
      v36.size.height = 0.0;
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v36.origin.x = v23;
      v36.origin.y = v26;
      v34 = CGRectUnion(v33, v36);
      x = v34.origin.x;
      y = v34.origin.y;
      width = v34.size.width;
      height = v34.size.height;
      v27 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithToPoint:", (unint64_t)(int)(v8 * v23) << 32, (unint64_t)(int)(v8 * v26) << 32);
      -[OADPath addElement:](v17, "addElement:", v27);

      ++v18;
      v20 += 2;
    }
    while (v19 != v18);
    v35.origin.x = TSUMultiplyRectScalar(x, y, width, height, v8);
    v9 = v30;
    v7 = v31;
    OCChRectI4WithCGRect(v35, v32);
    -[OADCustomShapeGeometry setGeometryCoordSpace:](v16, "setGeometryCoordSpace:", v32);
    objc_msgSend(v31, "drawableProperties");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "orientedBounds");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBounds:", x, y, width, height);

  }
}

@end
