@implementation OABFill

+ (id)readFillFromFillPropertiesManager:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  int v8;
  OADSolidFill *v9;
  OADLinearShade *v10;
  float v11;
  double v12;
  OADBackgroundFill *v13;
  OADPathShade *v14;
  uint64_t v15;
  OADRelativeRect *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  uint64_t v24;
  float v25;
  double v26;
  void *v27;
  float v28;
  double v29;
  void *v30;
  EshColor v31;
  EshColor v32;
  EshColor v33;
  EshColor v34;
  EshColor v35;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "fillType");
  if ((objc_msgSend(v6, "isFilled") & 1) != 0)
  {
    if (!v8)
    {
      if (v6)
        objc_msgSend(v6, "fillFgColor");
      else
        v35 = 0;
      v21 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v6, "fillFgAlpha"));
      EshColor::EshColor(&v34, &v35);
      *(float *)&v22 = v21;
      +[OABShapeProperties targetColorWithSourceColor:alpha:colorPropertiesManager:state:](OABShapeProperties, "targetColorWithSourceColor:alpha:colorPropertiesManager:state:", &v34, v6, v7, v22);
      v10 = (OADLinearShade *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(OADSolidFill);
      -[OADSolidFill setColor:](v9, "setColor:", v10);
      goto LABEL_18;
    }
    if (v8 == 7 || v8 == 4)
    {
      v9 = objc_alloc_init(OADGradientFill);
      objc_msgSend(a1, "readGradientFill:fromFillPropertiesManager:state:", v9, v6, v7);
      v10 = objc_alloc_init(OADLinearShade);
      -[OADLinearShade setScaled:](v10, "setScaled:", v8 == 7);
      v11 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v6, "fillAngle"));
      *(float *)&v12 = (float)((float)((float)(270.0 - v11) / 360.0) - floorf((float)(270.0 - v11) / 360.0)) * 360.0;
      -[OADLinearShade setAngle:](v10, "setAngle:", v12);
      -[OADSolidFill setShade:](v9, "setShade:", v10);
LABEL_18:

      goto LABEL_19;
    }
    if ((v8 - 5) <= 1)
    {
      v9 = objc_alloc_init(OADGradientFill);
      objc_msgSend(a1, "readGradientFill:fromFillPropertiesManager:state:", v9, v6, v7);
      v14 = objc_alloc_init(OADPathShade);
      v10 = (OADLinearShade *)v14;
      if (v8 == 6)
        v15 = 1;
      else
        v15 = 3;
      -[OADPathShade setType:](v14, "setType:", v15);
      v16 = objc_alloc_init(OADRelativeRect);
      *(float *)&v17 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v6, "fillFocusLeft"));
      -[OADRelativeRect setLeft:](v16, "setLeft:", v17);
      *(float *)&v18 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v6, "fillFocusTop"));
      -[OADRelativeRect setTop:](v16, "setTop:", v18);
      *(float *)&v19 = 1.0 - EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v6, "fillFocusRight"));
      -[OADRelativeRect setRight:](v16, "setRight:", v19);
      *(float *)&v20 = 1.0 - EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v6, "fillFocusBottom"));
      -[OADRelativeRect setBottom:](v16, "setBottom:", v20);
      -[OADLinearShade setFillToRect:](v10, "setFillToRect:", v16);
      -[OADSolidFill setShade:](v9, "setShade:", v10);
LABEL_15:

      goto LABEL_18;
    }
    v9 = 0;
    switch(v8)
    {
      case 1:
        v24 = objc_msgSend(v6, "fillBlipID");
        objc_msgSend(v6, "fillBlipName");
        v10 = (OADLinearShade *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "patternFromBlipId:blipName:blipDataReference:state:", v24, v10, objc_msgSend(v6, "fillBlipDataReference"), v7);
        v16 = (OADRelativeRect *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          if (v6)
            objc_msgSend(v6, "fillFgColor");
          else
            v35 = 0;
          v25 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v6, "fillFgAlpha"));
          EshColor::EshColor(&v33, &v35);
          *(float *)&v26 = v25;
          +[OABShapeProperties targetColorWithSourceColor:alpha:colorPropertiesManager:state:](OABShapeProperties, "targetColorWithSourceColor:alpha:colorPropertiesManager:state:", &v33, v6, v7, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
            objc_msgSend(v6, "fillBgColor");
          else
            v32 = 0;
          v28 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v6, "fillBgAlpha"));
          EshColor::EshColor(&v31, &v32);
          *(float *)&v29 = v28;
          +[OABShapeProperties targetColorWithSourceColor:alpha:colorPropertiesManager:state:](OABShapeProperties, "targetColorWithSourceColor:alpha:colorPropertiesManager:state:", &v31, v6, v7, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_alloc_init(OADPatternFill);
          -[OADSolidFill setFgColor:](v9, "setFgColor:", v27);
          -[OADSolidFill setBgColor:](v9, "setBgColor:", v30);
          -[OADSolidFill setPattern:](v9, "setPattern:", v16);

        }
        else
        {
          +[OADNullFill nullFill](OADNullFill, "nullFill");
          v9 = (OADSolidFill *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_15;
      case 2:
        v9 = objc_alloc_init(OADImageFill);
        objc_msgSend(a1, "readImageFill:fromFillPropertiesManager:state:", v9, v6, v7);
        v10 = objc_alloc_init(OADTileTechnique);
        -[OADSolidFill setTechnique:](v9, "setTechnique:", v10);
        goto LABEL_18;
      case 3:
        v9 = objc_alloc_init(OADImageFill);
        objc_msgSend(a1, "readImageFill:fromFillPropertiesManager:state:", v9, v6, v7);
        v10 = objc_alloc_init(OADStretchTechnique);
        -[OADSolidFill setTechnique:](v9, "setTechnique:", v10);
        goto LABEL_18;
      case 9:
        v13 = objc_alloc_init(OADBackgroundFill);
        goto LABEL_7;
      default:
        break;
    }
  }
  else
  {
    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v13 = (OADBackgroundFill *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v9 = (OADSolidFill *)v13;
  }
LABEL_19:

  return v9;
}

+ (id)patternFromBlipId:(unsigned int)a3 blipName:(id)a4 blipDataReference:(EshBlip *)a5 state:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  EshBlip *v12;
  void *v13;
  void *v14;
  const void *v15;
  void *v16;
  unsigned int var4;
  unsigned __int8 v18;
  uint64_t v19;
  OADPresetPattern *v20;
  void *v21;
  OADBlipRef *v22;
  OADCustomPattern *v23;

  v8 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a6;
  v11 = v10;
  v12 = a5;
  if ((_DWORD)v8)
  {
    v12 = a5;
    if (!a5)
    {
      objc_msgSend(v10, "bstoreContainerHolder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "childCount") >= (unint64_t)v8)
      {
        objc_msgSend(v13, "childAt:", (v8 - 1));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (const void *)objc_msgSend(v14, "eshObject");
        if (v15
        {
          v12 = (EshBlip *)*((_QWORD *)v16 + 4);
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
  }
  if (v12
    && (*((unsigned int (**)(EshBlip *))v12->var0 + 2))(v12) == 61471
    && (var4 = v12[2].var2.var4, var4 >= 0xC4)
    && (v18 = var4 + 60, v18 <= 0x2Fu))
  {
    v19 = +[OABFill patternFromBlipId:blipName:blipDataReference:state:]::kPresetPatternTypeArray[v18];
    v20 = objc_alloc_init(OADPresetPattern);
    -[OADPresetPattern setType:](v20, "setType:", v19);
    if (!a5)
      goto LABEL_20;
  }
  else
  {
    v20 = 0;
    if (!a5)
      goto LABEL_20;
  }
  +[OABBlip readBlipFromEshBlip:](OABBlip, "readBlipFromEshBlip:", a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = -[OADBlipRef initWithIndex:name:blip:]([OADBlipRef alloc], "initWithIndex:name:blip:", v8, v9, v21);
    v23 = objc_alloc_init(OADCustomPattern);
    -[OADCustomPattern setBlipRef:](v23, "setBlipRef:", v22);

    goto LABEL_23;
  }
LABEL_20:
  if (v20)
    v23 = v20;
  else
    v23 = 0;
LABEL_23:

  return v23;
}

+ (void)addStopsFromArray:(const OABGradientStop *)a3 stopCount:(int)a4 inverted:(BOOL)a5 startPos:(float)a6 endPos:(float)a7 toStopArray:(id)a8 fillPropertiesManager:(id)a9
{
  _BOOL4 v12;
  id v15;
  void *v16;
  float v17;
  float v18;
  int v19;
  int v20;
  int v21;
  float v22;
  double v23;
  double v24;
  uint64_t v25;
  float *p_var1;
  id v27;
  double v28;
  float v29;
  id v30;
  OADValueColorTransform *v31;
  double v32;
  double v33;
  id v34;

  v12 = a5;
  v34 = a8;
  v15 = a9;
  v16 = v15;
  if (a6 < a7)
  {
    v17 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v15, "fillFgAlpha"));
    v18 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v16, "fillBgAlpha"));
    v19 = a4 - 1;
    if (v12)
    {
      v20 = -1;
    }
    else
    {
      v19 = 0;
      v20 = a4;
    }
    v21 = v19 - v20;
    if (v19 != v20)
    {
      v22 = v18;
      v23 = a6;
      v24 = (float)(a7 - a6);
      if (v12)
        v25 = -1;
      else
        v25 = 1;
      p_var1 = &a3[v19].var1;
      do
      {
        v27 = *((id *)p_var1 - 1);
        if (v12)
          v28 = 1.0 - *p_var1;
        else
          v28 = *p_var1;
        v29 = (float)(v17 * (float)(1.0 - *p_var1)) + (float)(*p_var1 * v22);
        v30 = v27;
        if (v29 != 1.0)
        {
          v31 = -[OADColorTransform initWithType:]([OADValueColorTransform alloc], "initWithType:", 6);
          *(float *)&v32 = v29;
          -[OADValueColorTransform setValue:](v31, "setValue:", v32);
          objc_msgSend(v30, "addTransform:", v31);

        }
        v33 = v23 + v28 * v24;
        *(float *)&v33 = v33;
        +[OADGradientFillStop addStopWithColor:position:toArray:](OADGradientFillStop, "addStopWithColor:position:toArray:", v30, v34, v33);

        p_var1 += 4 * v25;
        v21 += v25;
      }
      while (v21);
    }
  }

}

+ (void)readGradientFill:(id)a3 fromFillPropertiesManager:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  float v12;
  signed int v13;
  _BOOL4 v14;
  int v16;
  unsigned int v17;
  unsigned int v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  id *v27;
  id *v28;
  id *v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  OADRgbColor *v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  void *v43;
  id *v44;
  id *v45;
  void *v46;
  double v47;
  double v48;
  float v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  id v55;
  id v56;
  id v57;
  id v58;
  unsigned int v59;
  char v60;
  unsigned int v61;
  id obj;
  id v63;
  EshColor v64;
  EshColor v65;
  EshColor v66;
  EshColor v67;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "fillType");
  if (v11 == 7 || v11 == 4)
  {
    v12 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v9, "fillAngle"));
    v13 = vcvtms_s32_f32(v12 / 360.0);
    v14 = (v13 & 1) != 0 && ((float)(v12 - (float)(360 * v13)) > 0.0 || v13 > 0);
  }
  else
  {
    v14 = 1;
  }
  v16 = objc_msgSend(v9, "fillFocus");
  v17 = v16 + 200 * (((v16 & ~(v16 >> 31)) - (v16 + (v16 >> 31))) / 0xC8 + (v16 >> 31));
  v61 = v17 / 0x64;
  if (v14)
    LOBYTE(v18) = ((v17 / 0x64) & 1) == 0;
  else
    v18 = v17 / 0x64;
  if (v9)
    objc_msgSend(v9, "fillFgColor");
  else
    v67 = 0;
  EshColor::EshColor(&v66, &v67);
  LODWORD(v19) = 1.0;
  +[OABShapeProperties targetColorWithSourceColor:alpha:colorPropertiesManager:state:](OABShapeProperties, "targetColorWithSourceColor:alpha:colorPropertiesManager:state:", &v66, v9, v10, v19);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v9, "fillBgColor");
  else
    v65 = 0;
  EshColor::EshColor(&v64, &v65);
  LODWORD(v20) = 1.0;
  +[OABShapeProperties targetColorWithSourceColor:alpha:colorPropertiesManager:state:](OABShapeProperties, "targetColorWithSourceColor:alpha:colorPropertiesManager:state:", &v64, v9, v10, v20);
  v63 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v9, "fillGradientColors");
  v22 = v21;
  v59 = v17;
  if (v21)
    v23 = -1431655765 * ((*(_QWORD *)(v21 + 16) - *(_QWORD *)(v21 + 8)) >> 2);
  else
    v23 = 0;
  v24 = (_QWORD *)operator new[]();
  v25 = v24;
  v26 = v23 + 2;
  *v24 = 16;
  v24[1] = v26;
  v27 = (id *)(v24 + 2);
  if (v23 == -2)
    goto LABEL_28;
  v28 = &v27[2 * v26];
  v29 = (id *)(v24 + 2);
  do
  {
    *v29 = 0;
    *((_DWORD *)v29 + 2) = 0;
    v29 += 2;
  }
  while (v29 != v28);
  if (v23)
  {
LABEL_28:
    if (*(float *)(EshBasicTablePropVal<EshGradientStop>::operator[](v22, 0) + 8) == 0.0)
    {
      v60 = 0;
      v30 = 0;
      goto LABEL_33;
    }
    v60 = 0;
  }
  else
  {
    v60 = 1;
  }
  objc_storeStrong(v27, obj);
  *((_DWORD *)v25 + 6) = 0;
  v30 = 1;
LABEL_33:
  if (v23 >= 1)
  {
    v54 = v18;
    v55 = a1;
    v56 = v10;
    v57 = v9;
    v58 = v8;
    v31 = 0;
    v32 = (uint64_t)&v25[2 * v30 + 2];
    do
    {
      v33 = EshBasicTablePropVal<EshGradientStop>::operator[](v22, v31);
      v34 = *(unsigned __int16 *)(v33 + 2);
      v35 = *(unsigned __int16 *)(v33 + 4);
      v36 = *(unsigned __int16 *)(v33 + 6);
      v37 = *(_DWORD *)(v33 + 8);
      v38 = [OADRgbColor alloc];
      *(float *)&v39 = (float)v34;
      *(float *)&v40 = (float)v35;
      *(float *)&v41 = (float)v36;
      v42 = -[OADRgbColor initWithRedByte:greenByte:blueByte:](v38, "initWithRedByte:greenByte:blueByte:", v39, v40, v41);
      v43 = *(void **)v32;
      *(_QWORD *)v32 = v42;

      *(_DWORD *)(v32 + 8) = v37;
      ++v31;
      v32 += 16;
    }
    while (v23 != v31);
    v30 = v30 + v31;
    v9 = v57;
    v8 = v58;
    a1 = v55;
    v10 = v56;
    LOBYTE(v18) = v54;
  }
  if ((v60 & 1) == 0 && *(float *)(EshBasicTablePropVal<EshGradientStop>::operator[](v22, v23 - 1) + 8) == 1.0)
  {
    v44 = v27;
  }
  else
  {
    v44 = v27;
    v45 = &v27[2 * v30];
    objc_storeStrong(v45, v63);
    *((_DWORD *)v45 + 2) = 1065353216;
    v30 = (v30 + 1);
  }
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", (int)v30);
  v47 = 1.0;
  v48 = (double)(int)(v59 - 100 * v61) / -100.0 + 1.0;
  v49 = v48;
  LODWORD(v48) = 0;
  *(float *)&v47 = v49;
  objc_msgSend(a1, "addStopsFromArray:stopCount:inverted:startPos:endPos:toStopArray:fillPropertiesManager:", v44, v30, v18 & 1, v46, v9, v48, v47);
  LODWORD(v50) = 1.0;
  *(float *)&v51 = v49;
  objc_msgSend(a1, "addStopsFromArray:stopCount:inverted:startPos:endPos:toStopArray:fillPropertiesManager:", &v44[2 * (v18 & (v49 > 0.0))], (__PAIR64__(v30, 0.0) - LODWORD(v49)) >> 32, (v18 & 1) == 0, v46, v9, v51, v50);
  objc_msgSend(v8, "setStops:", v46);

  v52 = v25[1];
  if (v52)
  {
    v53 = 2 * v52;
    do
    {

      v53 -= 2;
    }
    while (v53 * 8);
  }
  MEMORY[0x22E2DD3F0](v25, 0x1080C809227ACB4);

}

+ (void)readImageFill:(id)a3 fromFillPropertiesManager:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  OADBlipRef *v14;
  float v15;
  double v16;
  void *v17;
  OADForegroundColorEffect *v18;
  EshColor v19;
  EshColor v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "fillBlipID");
  objc_msgSend(v8, "fillBlipName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "fillBlipDataReference");
  if (v12)
  {
    +[OABBlip readBlipFromEshBlip:](OABBlip, "readBlipFromEshBlip:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = -[OADBlipRef initWithIndex:name:blip:]([OADBlipRef alloc], "initWithIndex:name:blip:", v10, v11, v13);
  objc_msgSend(v7, "setBlipRef:", v14);
  if (v8)
    objc_msgSend(v8, "fillFgColor");
  else
    v20 = 0;
  v15 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)objc_msgSend(v8, "fillFgAlpha"));
  EshColor::EshColor(&v19, &v20);
  *(float *)&v16 = v15;
  +[OABShapeProperties targetColorWithSourceColor:alpha:colorPropertiesManager:state:](OABShapeProperties, "targetColorWithSourceColor:alpha:colorPropertiesManager:state:", &v19, v8, v9, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(OADForegroundColorEffect);
  -[OADForegroundColorEffect setForegroundColor:](v18, "setForegroundColor:", v17);
  -[OADBlipRef addEffect:](v14, "addEffect:", v18);

}

@end
