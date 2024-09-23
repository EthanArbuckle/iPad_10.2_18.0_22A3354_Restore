@implementation OABStroke

+ (char)readPresetDashStyle:(int)a3
{
  if ((a3 - 1) > 9)
    return 0;
  else
    return byte_22A4BE4B2[a3 - 1];
}

+ (unsigned)readLineEndType:(int)a3
{
  if (a3 >= 6)
    return 0;
  else
    return a3;
}

+ (unsigned)readLineEndWidth:(int)a3
{
  if (a3 >= 3)
    return 1;
  else
    return a3;
}

+ (unsigned)readLineEndLength:(int)a3
{
  if (a3 >= 3)
    return 1;
  else
    return a3;
}

+ (unsigned)readCapStyle:(int)a3
{
  if (a3 >= 3)
    return 2;
  else
    return a3;
}

+ (unsigned)readCompoundType:(int)a3
{
  if (a3 >= 5)
    return 0;
  else
    return a3;
}

+ (id)readStrokeFromShapeBaseManager:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  OADStroke *v8;
  float v9;
  double v10;
  char v11;
  int v12;
  OADPatternFill *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  OADCustomDash *v20;
  void *v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  int *v25;
  double v26;
  double v27;
  uint64_t v28;
  int v29;
  __objc2_class **v30;
  OADMiterLineJoin *v31;
  float v32;
  double v33;
  OADLineEnd *v34;
  OADLineEnd *v35;
  double v36;
  OADPatternFill *v38;
  void *v39;
  void *v40;
  EshColor v41;
  EshColor v42;
  EshColor v43;
  EshColor v44;

  v6 = a3;
  v7 = a4;
  v39 = v7;
  v8 = objc_alloc_init(OADStroke);
  if (v6)
    objc_msgSend(v6, "strokeFgColor");
  else
    v44 = 0;
  v9 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v6, "strokeFgAlpha"));
  EshColor::EshColor(&v43, &v44);
  *(float *)&v10 = v9;
  +[OABShapeProperties targetColorWithSourceColor:alpha:colorPropertiesManager:state:](OABShapeProperties, "targetColorWithSourceColor:alpha:colorPropertiesManager:state:", &v43, v6, v7, v10);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStroke setColor:](v8, "setColor:", v40);
  v11 = objc_msgSend(v6, "isStroked");
  v12 = objc_msgSend(v6, "strokeFillType");
  if ((v11 & 1) != 0)
  {
    if (v12 == 1)
    {
      v14 = objc_msgSend(v6, "strokeFillBlipID");
      objc_msgSend(v6, "strokeFillBlipName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[OABFill patternFromBlipId:blipName:blipDataReference:state:](OABFill, "patternFromBlipId:blipName:blipDataReference:state:", v14, v15, objc_msgSend(v6, "strokeFillBlipDataReference"), v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        if (v6)
          objc_msgSend(v6, "strokeBgColor");
        else
          v42 = 0;
        EshColor::EshColor(&v41, &v42);
        *(float *)&v17 = v9;
        +[OABShapeProperties targetColorWithSourceColor:alpha:colorPropertiesManager:state:](OABShapeProperties, "targetColorWithSourceColor:alpha:colorPropertiesManager:state:", &v41, v6, v7, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc_init(OADPatternFill);
        -[OADPatternFill setFgColor:](v13, "setFgColor:", v40);
        -[OADPatternFill setBgColor:](v13, "setBgColor:", v18);
        -[OADPatternFill setPattern:](v13, "setPattern:", v16);

      }
      else
      {
        +[OADNullFill nullFill](OADNullFill, "nullFill");
        v13 = (OADPatternFill *)objc_claimAutoreleasedReturnValue();
      }

    }
    else if (v12)
    {
      v13 = 0;
    }
    else
    {
      v13 = objc_alloc_init(OADSolidFill);
      -[OADPatternFill setColor:](v13, "setColor:", v40);
    }
  }
  else
  {
    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v13 = (OADPatternFill *)objc_claimAutoreleasedReturnValue();
  }
  -[OADStroke setFill:](v8, "setFill:", v13);
  v38 = v13;
  v19 = objc_msgSend(v6, "strokeCustomDash");
  if (v19)
  {
    v20 = objc_alloc_init(OADCustomDash);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", ((*(_QWORD *)(v19 + 16) - *(_QWORD *)(v19 + 8)) >> 3) & 0x7FFFFFFFLL);
    if (((*(_QWORD *)(v19 + 16) - *(_QWORD *)(v19 + 8)) & 0x3FFFFFFF8) != 0)
    {
      v22 = 0;
      v23 = 1;
      do
      {
        v24 = *(_DWORD *)EshBasicTablePropVal<int>::operator[](v19, v23 - 1);
        v25 = (int *)EshBasicTablePropVal<int>::operator[](v19, v23);
        *(float *)&v26 = (float)v24;
        *(float *)&v27 = (float)*v25;
        +[OADDashStop addStopWithDash:space:toArray:](OADDashStop, "addStopWithDash:space:toArray:", v21, v26, v27);
        ++v22;
        v23 += 2;
      }
      while (v22 < (((*(_QWORD *)(v19 + 16) - *(_QWORD *)(v19 + 8)) >> 3) & 0x7FFFFFFF));
    }
    -[OADCustomDash setStops:](v20, "setStops:", v21);

  }
  else
  {
    v28 = objc_msgSend(a1, "readPresetDashStyle:", objc_msgSend(v6, "strokePresetDash"));
    v20 = objc_alloc_init(OADPresetDash);
    -[OADCustomDash setType:](v20, "setType:", v28);
  }
  -[OADStroke setDash:](v8, "setDash:", v20);
  v29 = objc_msgSend(v6, "strokeJoinStyle");
  if (v29)
  {
    if (v29 == 1)
    {
      v32 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v6, "strokeMiterLimit"));
      v31 = objc_alloc_init(OADMiterLineJoin);
      *(float *)&v33 = v32;
      -[OADMiterLineJoin setLimit:](v31, "setLimit:", v33);
      goto LABEL_31;
    }
    if (v29 != 2)
    {
      v31 = 0;
      goto LABEL_31;
    }
    v30 = off_24F399358;
  }
  else
  {
    v30 = off_24F399320;
  }
  v31 = (OADMiterLineJoin *)objc_alloc_init(*v30);
LABEL_31:
  -[OADStroke setJoin:](v8, "setJoin:", v31);
  v34 = -[OADLineEnd initWithType:width:length:]([OADLineEnd alloc], "initWithType:width:length:", objc_msgSend(a1, "readLineEndType:", objc_msgSend(v6, "strokeStartArrowType")), objc_msgSend(a1, "readLineEndWidth:", objc_msgSend(v6, "strokeStartArrowWidth")), objc_msgSend(a1, "readLineEndLength:", objc_msgSend(v6, "strokeStartArrowLength")));
  -[OADStroke setTail:](v8, "setTail:", v34);
  v35 = -[OADLineEnd initWithType:width:length:]([OADLineEnd alloc], "initWithType:width:length:", objc_msgSend(a1, "readLineEndType:", objc_msgSend(v6, "strokeEndArrowType")), objc_msgSend(a1, "readLineEndWidth:", objc_msgSend(v6, "strokeEndArrowWidth")), objc_msgSend(a1, "readLineEndLength:", objc_msgSend(v6, "strokeEndArrowLength")));
  -[OADStroke setHead:](v8, "setHead:", v35);
  *(float *)&v36 = (float)(int)objc_msgSend(v6, "strokeWidth") / 12700.0;
  -[OADStroke setWidth:](v8, "setWidth:", v36);
  -[OADStroke setCap:](v8, "setCap:", objc_msgSend(a1, "readCapStyle:", objc_msgSend(v6, "strokeCapStyle")));
  -[OADStroke setCompoundType:](v8, "setCompoundType:", objc_msgSend(a1, "readCompoundType:", objc_msgSend(v6, "strokeCompoundType")));

  return v8;
}

+ (id)readLineEndWithType:(int)a3 width:(int)a4 length:(int)a5
{
  return -[OADLineEnd initWithType:width:length:]([OADLineEnd alloc], "initWithType:width:length:", objc_msgSend(a1, "readLineEndType:", *(_QWORD *)&a3), objc_msgSend(a1, "readLineEndWidth:", *(_QWORD *)&a4), objc_msgSend(a1, "readLineEndLength:", *(_QWORD *)&a5));
}

+ (int)writeCompoundType:(unsigned __int8)a3
{
  if (((a3 - 1) & 0xFC) != 0)
    return 0;
  else
    return (a3 - 1) + 1;
}

+ (int)writePresetDashStyle:(char)a3
{
  uint64_t v3;

  v3 = a3 - 1;
  if (v3 > 9)
    return 0;
  else
    return dword_22A4BE4BC[v3];
}

+ (int)writeLineEndType:(unsigned __int8)a3
{
  if ((a3 - 1) < 5)
    return (a3 - 1) + 1;
  else
    return 0;
}

+ (int)writeLineEndWidth:(unsigned __int8)a3
{
  if (a3 >= 3u)
    return 1;
  else
    return a3;
}

+ (int)writeLineEndLength:(unsigned __int8)a3
{
  if (a3 >= 3u)
    return 1;
  else
    return a3;
}

+ (int)writeCapStyle:(unsigned __int8)a3
{
  if (a3 >= 2u)
    return 2;
  else
    return a3;
}

+ (void)writePresetDashStyleForCustomDash:(id)a3 toStroke:(EshStroke *)a4 state:(id)a5
{
  uint64_t v6;
  void *v7;
  float v8;
  int v9;
  unsigned int v10;
  float v11;
  int v12;
  int v13;
  id v14;

  objc_msgSend(a3, "stops");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v14, "count");
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dash");
  if (v8 >= 2.0)
  {
    objc_msgSend(v7, "dash");
    if (v6 == 2)
      v12 = 9;
    else
      v12 = 10;
    if (v6 == 1)
      v12 = 7;
    if (v6 == 2)
      v13 = 8;
    else
      v13 = 10;
    if (v6 == 1)
      v13 = 6;
    if (v11 < 4.0)
      v10 = v13;
    else
      v10 = v12;
  }
  else
  {
    if (v6 == 2)
      v9 = 3;
    else
      v9 = 4;
    if (v6 == 1)
      v10 = 2;
    else
      v10 = v9;
  }
  EshStroke::setPredefDashStyle((uint64_t)a4, v10);

}

@end
