@implementation OAVShapeGeometry

+ (id)readFromManager:(id)a3
{
  id v4;
  void *v5;
  OADCustomShapeGeometry *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MinY;
  double MaxX;
  _DWORD v15[4];
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v4 = a3;
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(OADCustomShapeGeometry);
    -[OADShapeGeometry setIsEscher:](v6, "setIsEscher:", 1);
    objc_msgSend(a1, "readAdjustValuesFromManager:toGeometry:", v4, v6);
    +[OAVDrawable readCoordBounds:](OAVDrawable, "readCoordBounds:", objc_msgSend(v4, "shape"));
    x = v16.origin.x;
    y = v16.origin.y;
    width = v16.size.width;
    height = v16.size.height;
    MinX = CGRectGetMinX(v16);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MinY = CGRectGetMinY(v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    MaxX = CGRectGetMaxX(v18);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v15[0] = (int)MinX;
    v15[1] = (int)MinY;
    v15[2] = (int)MaxX;
    v15[3] = (int)CGRectGetMaxY(v19);
    -[OADCustomShapeGeometry setGeometryCoordSpace:](v6, "setGeometryCoordSpace:", v15);
    objc_msgSend(a1, "readLimoFromManager:toGeometry:", v4, v6);
    objc_msgSend(a1, "readTextBodyRectsFromManager:toGeometry:", v4, v6);
    +[OAVFormula readFormulasFromManager:toGeometry:](OAVFormula, "readFormulasFromManager:toGeometry:", v4, v6);
    +[OAVPath readPath:toGeometry:](OAVPath, "readPath:toGeometry:", v5, v6);
  }
  else
  {
    v6 = objc_alloc_init(OADPresetShapeGeometry);
    -[OADShapeGeometry setIsEscher:](v6, "setIsEscher:", 1);
    -[OADCustomShapeGeometry setType:](v6, "setType:", objc_msgSend(v4, "type"));
    -[OADShapeGeometry setIsEscher:](v6, "setIsEscher:", 1);
    objc_msgSend(a1, "readAdjustValuesFromManager:toGeometry:", v4, v6);
  }

  return v6;
}

+ (void)readAdjustValuesFromManager:(id)a3 toGeometry:(id)a4
{
  id v5;
  _xmlNode *v6;
  NSString *v7;
  NSString *v8;
  _xmlNode *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int i;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = a4;
  if (objc_msgSend(v17, "type") == 2)
  {
    v6 = (_xmlNode *)objc_msgSend(v17, "shape");
    CXDefaultStringAttribute(v6, (CXNamespace *)CXNoNamespace, (xmlChar *)"arcsize", 0);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v5, "setAdjustValue:atIndex:", (int)(float)(OAVReadFraction(v7) * 21600.0), 0);

  }
  v9 = (_xmlNode *)objc_msgSend(v17, "shape");
  CXDefaultStringAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"adj", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; objc_msgSend(v12, "count") > (unint64_t)i; ++i)
    {
      objc_msgSend(v12, "objectAtIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "length"))
        objc_msgSend(v5, "setAdjustValue:atIndex:", objc_msgSend(v16, "intValue"), i);

    }
  }

}

+ (void)readLimoFromManager:(id)a3 toGeometry:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;

  v5 = a3;
  v6 = a4;
  v7 = 0x8000000080000000;
  v19 = 0x8000000080000000;
  objc_msgSend(v5, "limo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v17 = v5;
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = 1;
    do
    {
      v13 = v12;
      if (objc_msgSend(v10, "count") > v11)
      {
        objc_msgSend(v10, "objectAtIndex:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "length"))
          *((_DWORD *)&v19 + v11) = objc_msgSend(v16, "intValue");

      }
      v12 = 0;
      v11 = 1;
    }
    while ((v13 & 1) != 0);

    v7 = v19;
    v5 = v17;
  }
  v18 = v7;
  objc_msgSend(v6, "setLimo:", &v18);

}

+ (void)readTextBodyRectsFromManager:(id)a3 toGeometry:(id)a4
{
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  OADAdjustRect *v16;
  OADAdjustRect *v17;
  id v18;
  id v19;
  void *i;
  id v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v21 = a4;
  objc_msgSend(v19, "textBodyRects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v18 = v6;
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(";"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    for (i = v7; ; v7 = i)
    {
      v9 = v8;
      if (objc_msgSend(v7, "count") <= (unint64_t)v8)
        break;
      objc_msgSend(v7, "objectAtIndex:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v22 = 0u;
      v23 = 0u;
      do
      {
        objc_msgSend(v11, "objectAtIndex:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        *((_QWORD *)&v22 + v12) = objc_msgSend(a1, "readAdjustCoord:", v15);
        ++v12;
      }
      while (v12 != 4);
      v16 = [OADAdjustRect alloc];
      v17 = -[OADAdjustRect initWithLeft:top:right:bottom:](v16, "initWithLeft:top:right:bottom:", v22, v23);

      objc_msgSend(v21, "addTextBodyRect:", v17);
      v8 = v9 + 1;
    }

    v6 = v18;
  }

}

+ (OADAdjustCoord)readAdjustCoord:(id)a3
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "characterAtIndex:", 0);
  if (v4 == 64)
  {
    objc_msgSend(v3, "substringFromIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");

  }
  else
  {
    v6 = objc_msgSend(v3, "intValue");
  }

  return (OADAdjustCoord)((v4 == 64) | (unint64_t)(v6 << 32));
}

@end
