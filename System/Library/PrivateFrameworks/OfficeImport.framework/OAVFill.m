@implementation OAVFill

+ (id)readFromManager:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  OADGradientFill *v9;
  OADLinearShade *v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  OADCustomPattern *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "fillType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isFilled") & 1) == 0)
    goto LABEL_16;
  if (!objc_msgSend(v8, "isEqualToString:", CFSTR("solid")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("gradient")))
    {
      v9 = objc_alloc_init(OADGradientFill);
      objc_msgSend(a1, "readGradientFill:fromManager:", v9, v6);
      v10 = objc_alloc_init(OADLinearShade);
      -[OADLinearShade setScaled:](v10, "setScaled:", 0);
      objc_msgSend(v6, "fillAngle");
      *(float *)&v12 = (float)((float)((float)(270.0 - v11) / 360.0) - floorf((float)(270.0 - v11) / 360.0)) * 360.0;
      -[OADLinearShade setAngle:](v10, "setAngle:", v12);
      -[OADGradientFill setShade:](v9, "setShade:", v10);
      goto LABEL_15;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("gradientRadial")))
    {
      v9 = objc_alloc_init(OADGradientFill);
      objc_msgSend(a1, "readGradientFill:fromManager:", v9, v6);
      v10 = objc_alloc_init(OADPathShade);
      -[OADLinearShade setType:](v10, "setType:", 1);
      -[OADGradientFill setShade:](v9, "setShade:", v10);
      goto LABEL_15;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("pattern")))
    {
      objc_msgSend(a1, "readBlipRefFromManager:state:", v6, v7);
      v10 = (OADLinearShade *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "targetFgColorWithManager:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "targetBgColorWithManager:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(OADPatternFill);
      -[OADGradientFill setFgColor:](v9, "setFgColor:", v13);
      -[OADGradientFill setBgColor:](v9, "setBgColor:", v14);
      v15 = objc_alloc_init(OADCustomPattern);
      -[OADCustomPattern setBlipRef:](v15, "setBlipRef:", v10);
      -[OADGradientFill setPattern:](v9, "setPattern:", v15);

      goto LABEL_15;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("tile")))
    {
      v9 = objc_alloc_init(OADImageFill);
      objc_msgSend(a1, "readBlipRefFromManager:state:", v6, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADGradientFill setBlipRef:](v9, "setBlipRef:", v16);

      v10 = objc_alloc_init(OADTileTechnique);
      -[OADGradientFill setTechnique:](v9, "setTechnique:", v10);
      goto LABEL_15;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("frame")))
    {
      objc_msgSend(v6, "imageFillId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v9 = objc_alloc_init(OADImageFill);
        objc_msgSend(a1, "readBlipRefFromManager:state:", v6, v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADGradientFill setBlipRef:](v9, "setBlipRef:", v18);

        v10 = objc_alloc_init(OADStretchTechnique);
        -[OADGradientFill setTechnique:](v9, "setTechnique:", v10);
        goto LABEL_15;
      }
    }
LABEL_16:
    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v9 = (OADGradientFill *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v9 = objc_alloc_init(OADSolidFill);
  objc_msgSend(a1, "targetFgColorWithManager:", v6);
  v10 = (OADLinearShade *)objc_claimAutoreleasedReturnValue();
  -[OADGradientFill setColor:](v9, "setColor:", v10);
LABEL_15:

LABEL_17:
  return v9;
}

+ (id)targetFgColorWithManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "fillFgColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fillFgAlpha");
  +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)readGradientFill:(id)a3 fromManager:(id)a4
{
  id v6;
  void *v7;
  float v8;
  signed int v9;
  _BOOL4 v10;
  float v12;
  float v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSString *v32;
  float v33;
  void *v34;
  double v35;
  uint64_t v36;
  int v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int8 v50;
  id v51;
  unsigned int v52;
  unsigned int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id obj;
  id v60;
  void *v61;

  v60 = a3;
  v6 = a4;
  objc_msgSend(v6, "fillType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("gradient")))
  {
    objc_msgSend(v6, "fillAngle");
    v9 = vcvtms_s32_f32(v8 / 360.0);
    v10 = (v9 & 1) != 0 && ((float)(v8 - (float)(360 * v9)) > 0.0 || v9 > 0);
  }
  else
  {
    v10 = 1;
  }
  objc_msgSend(v6, "fillFocus");
  v13 = v12 * 100.0;
  v14 = (int)v13
      + 200
      * ((((int)v13 & ~((int)v13 >> 31)) - ((int)v13 + ((int)v13 >> 31))) / 0xC8
       + ((int)v13 >> 31));
  if (v10)
    LOBYTE(v15) = ((v14 / 0x64) & 1) == 0;
  else
    v15 = v14 / 0x64;
  objc_msgSend(v6, "fillFgColor");
  v16 = objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 1.0;
  +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v16, v6, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fillBgColor");
  v19 = objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = 1.0;
  v61 = v6;
  v56 = (void *)v16;
  v57 = v7;
  v58 = v18;
  v55 = (void *)v19;
  +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v19, v6, v20);
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fillGradientColors");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "componentsSeparatedByString:", CFSTR(";"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v14 / 0x64;
  v53 = v14;
  v22 = objc_msgSend(v21, "count");
  v23 = operator new[]();
  v24 = v23;
  *(_QWORD *)v23 = 16;
  *(_QWORD *)(v23 + 8) = v22 + 2;
  v25 = v23 + 16;
  if (v22 != -2)
  {
    v26 = v23 + 16;
    do
    {
      *(_QWORD *)v26 = 0;
      *(_DWORD *)(v26 + 8) = 0;
      v26 += 16;
    }
    while (v26 != v25 + 16 * (v22 + 2));
  }
  v50 = v15;
  v51 = a1;
  objc_storeStrong((id *)(v23 + 16), v18);
  *(_DWORD *)(v24 + 24) = 0;
  if (v22)
  {
    v27 = 0;
    LODWORD(v28) = 1;
    v29 = v21;
    do
    {
      objc_msgSend(v21, "objectAtIndex:", v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsSeparatedByString:", CFSTR(" "));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndex:", 0);
      v32 = (NSString *)objc_claimAutoreleasedReturnValue();
      v33 = OAVReadFraction(v32);

      objc_msgSend(v31, "objectAtIndex:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v35) = 1.0;
      +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v34, v61, v35);
      v36 = objc_claimAutoreleasedReturnValue();

      if (v33 == 0.0 && v27 == 0)
        v38 = 0;
      else
        v38 = v28;
      v28 = (v38 + 1);
      v39 = v25 + 16 * v38;
      v40 = *(void **)v39;
      *(_QWORD *)v39 = v36;

      *(float *)(v39 + 8) = v33;
      ++v27;
      v21 = v29;
    }
    while (v22 != v27);
  }
  else
  {
    v28 = 1;
  }
  v41 = 1.0;
  v42 = (double)(int)(v53 - 100 * v52) / -100.0 + 1.0;
  v43 = v42;
  if (*(float *)(v25 + 16 * (int)v28 - 8) != 1.0)
  {
    v44 = (int)v28;
    v28 = (v28 + 1);
    v45 = v25 + 16 * v44;
    objc_storeStrong((id *)v45, obj);
    *(_DWORD *)(v45 + 8) = 1065353216;
  }
  LODWORD(v42) = 0;
  *(float *)&v41 = v43;
  objc_msgSend(v51, "addStopsFromArray:stopCount:inverted:startPos:endPos:toGradientFill:manager:", v25, v28, v50 & 1, v60, v61, v42, v41);
  LODWORD(v46) = 1.0;
  *(float *)&v47 = v43;
  objc_msgSend(v51, "addStopsFromArray:stopCount:inverted:startPos:endPos:toGradientFill:manager:", v25 + 16 * (v50 & (v43 > 0.0)), (__PAIR64__(v28, 0.0) - LODWORD(v43)) >> 32, (v50 & 1) == 0, v60, v61, v47, v46);
  v48 = *(_QWORD *)(v24 + 8);
  if (v48)
  {
    v49 = 16 * v48;
    do
    {

      v49 -= 16;
    }
    while (v49);
  }
  MEMORY[0x22E2DD3F0](v24, 0x1080C809227ACB4);

}

+ (void)addStopsFromArray:(const OAVGradientStop *)a3 stopCount:(int)a4 inverted:(BOOL)a5 startPos:(float)a6 endPos:(float)a7 toGradientFill:(id)a8 manager:(id)a9
{
  _BOOL4 v12;
  id v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  double v25;
  double v26;
  uint64_t v27;
  float *p_var1;
  id v29;
  double v30;
  float v31;
  id v32;
  OADValueColorTransform *v33;
  double v34;
  double v35;
  id v36;
  id v37;

  v12 = a5;
  v37 = a8;
  v15 = a9;
  v16 = v15;
  if (a6 < a7)
  {
    v36 = v15;
    objc_msgSend(v15, "fillFgAlpha");
    v18 = v17;
    objc_msgSend(v16, "fillBgAlpha");
    v20 = v19;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a4);
    v22 = a4 - 1;
    if (v12)
    {
      v23 = -1;
    }
    else
    {
      v22 = 0;
      v23 = a4;
    }
    v24 = v22 - v23;
    if (v22 != v23)
    {
      v25 = a6;
      v26 = (float)(a7 - a6);
      if (v12)
        v27 = -1;
      else
        v27 = 1;
      p_var1 = &a3[v22].var1;
      do
      {
        v29 = *((id *)p_var1 - 1);
        if (v12)
          v30 = 1.0 - *p_var1;
        else
          v30 = *p_var1;
        v31 = (float)(v18 * (float)(1.0 - *p_var1)) + (float)(*p_var1 * v20);
        v32 = v29;
        if (v31 != 1.0)
        {
          v33 = -[OADColorTransform initWithType:]([OADValueColorTransform alloc], "initWithType:", 6);
          *(float *)&v34 = v31;
          -[OADValueColorTransform setValue:](v33, "setValue:", v34);
          objc_msgSend(v32, "addTransform:", v33);

        }
        v35 = v25 + v30 * v26;
        *(float *)&v35 = v35;
        +[OADGradientFillStop addStopWithColor:position:toArray:](OADGradientFillStop, "addStopWithColor:position:toArray:", v32, v21, v35);

        p_var1 += 4 * v27;
        v24 += v27;
      }
      while (v24);
    }
    objc_msgSend(v37, "setStops:", v21);

    v16 = v36;
  }

}

+ (id)readBlipRefFromManager:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  OADForegroundColorEffect *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "imageFillId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "packagePart");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "relationshipForIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "targetLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "blipRefForURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(OADForegroundColorEffect);
    objc_msgSend(a1, "targetFgColorWithManager:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADForegroundColorEffect setForegroundColor:](v13, "setForegroundColor:", v14);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)targetBgColorWithManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "fillBgColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fillBgAlpha");
  +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)readImageFill:(id)a3 fromManager:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  OADForegroundColorEffect *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "imageFillId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "packagePart");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "relationshipForIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "targetLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "blipRefForURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setBlipRef:", v14);
  v15 = objc_alloc_init(OADForegroundColorEffect);
  objc_msgSend(a1, "targetFgColorWithManager:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADForegroundColorEffect setForegroundColor:](v15, "setForegroundColor:", v16);

}

@end
