@implementation OADColorTransform

- (OADColorTransform)initWithType:(int)a3
{
  OADColorTransform *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OADColorTransform;
  result = -[OADColorTransform init](&v5, sel_init);
  if (result)
    result->mType = a3;
  return result;
}

+ (id)colorByApplyingTransforms:(id)a3 toColor:(id)a4
{
  id v6;
  id v7;
  float v8;
  float v9;
  float v10;
  _BOOL8 v11;
  unsigned int i;
  unsigned int v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  float v23;
  double v24;
  float v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  float v30;
  float v31;
  float v32;
  float v33;
  double v34;
  float v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  float v40;
  float v41;
  float v42;
  float v43;
  double v44;
  double v45;
  float v46;
  double v47;
  uint64_t v49;
  float v50;
  float v51;
  float v52;
  float v53;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "red");
  if (v8 == 0.0 && (objc_msgSend(v7, "blue"), v9 == 0.0))
  {
    objc_msgSend(v7, "green");
    v11 = v10 == 0.0;
  }
  else
  {
    v11 = 0;
  }
  for (i = 0; ; i = v13 + 1)
  {
    v13 = i;
    if (objc_msgSend(v6, "count") <= (unint64_t)i)
      break;
    objc_msgSend(v6, "objectAtIndex:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v14, "type"))
    {
      case 1u:
        v53 = 0.0;
        objc_msgSend(v7, "red");
        v53 = v18;
        v52 = 0.0;
        objc_msgSend(v7, "green");
        v52 = v19;
        v51 = 0.0;
        objc_msgSend(v7, "blue");
        v51 = v20;
        v50 = 0.0;
        v49 = 0;
        convertRgbToHsl(v53, v52, v20, &v50, (float *)&v49 + 1, (float *)&v49);
        v21 = (float)((float)((float)(v50 + 180.0) / 360.0) - floorf((float)(v50 + 180.0) / 360.0)) * 360.0;
        v22 = *((float *)&v49 + 1);
        if (*((float *)&v49 + 1) < 0.0)
          v22 = 0.0;
        v23 = fmin(v22, 1.0);
        *((float *)&v49 + 1) = v23;
        v50 = v21;
        v24 = *(float *)&v49;
        if (*(float *)&v49 < 0.0)
          v24 = 0.0;
        v25 = fmin(v24, 1.0);
        *(float *)&v49 = v25;
        convertHslToRgb(v21, v23, v25, &v53, &v52, &v51);
        *(float *)&v27 = v52;
        *(float *)&v26 = v53;
        *(float *)&v28 = v51;
        +[OADRgbColor rgbColorWithRed:green:blue:](OADRgbColor, "rgbColorWithRed:green:blue:", v26, v27, v28);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 2u:
        LODWORD(v15) = 1074580685;
        objc_msgSend(a1, "applyExpTransformWithValue:toColor:", v7, v15);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "red");
        v31 = v30;
        objc_msgSend(v29, "green");
        v33 = v32;
        objc_msgSend(v29, "blue");
        *(float *)&v34 = 1.0 - v33;
        *(float *)&v36 = 1.0 - v35;
        *(float *)&v37 = 1.0 - v31;
        +[OADRgbColor rgbColorWithRed:green:blue:](OADRgbColor, "rgbColorWithRed:green:blue:", v37, v34, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v39) = 1055439406;
        objc_msgSend(a1, "applyExpTransformWithValue:toColor:", v38, v39);
        v7 = (id)objc_claimAutoreleasedReturnValue();

        break;
      case 3u:
        objc_msgSend(v7, "red");
        v41 = v40;
        objc_msgSend(v7, "green");
        v43 = v42;
        objc_msgSend(v7, "blue");
        v44 = v43 * 0.59;
        v45 = v44 + v41 * 0.3;
        v47 = v45 + v46 * 0.11;
        *(float *)&v47 = v47;
        LODWORD(v45) = LODWORD(v47);
        LODWORD(v44) = LODWORD(v47);
        +[OADRgbColor rgbColorWithRed:green:blue:](OADRgbColor, "rgbColorWithRed:green:blue:", v47, v45, v44);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 4u:
      case 5u:
        objc_msgSend(a1, "applyRGBTransform:toColor:skipGamma:", v14, v7, 0);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
      case 0x10u:
      case 0x11u:
        objc_msgSend(a1, "applyHSLTransform:toColor:", v14, v7);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x15u:
      case 0x16u:
      case 0x17u:
      case 0x18u:
      case 0x19u:
      case 0x1Au:
        objc_msgSend(a1, "applyRGBTransform:toColor:skipGamma:", v14, v7, v11);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 0x1Bu:
        LODWORD(v15) = 1055439406;
        objc_msgSend(a1, "applyExpTransformWithValue:toColor:", v7, v15);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 0x1Cu:
        LODWORD(v15) = 1074580685;
        objc_msgSend(a1, "applyExpTransformWithValue:toColor:", v7, v15);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 0x1Du:
        objc_msgSend(v14, "value");
        objc_msgSend(a1, "applyExpTransformWithValue:toColor:", v7);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v17 = (void *)v16;

        v7 = v17;
        break;
      default:
        break;
    }

  }
  return v7;
}

+ (float)alphaByApplyingTransforms:(id)a3 toAlpha:(float)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  float v11;

  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "type") - 6 < 3)
      {
        *(float *)&v10 = a4;
        objc_msgSend(a1, "applyAlphaTransform:toAlpha:", v9, v10);
        a4 = v11;
      }

      ++v8;
    }
    while (v7 != v8);
  }

  return a4;
}

- (int)type
{
  return self->mType;
}

+ (float)applyAlphaTransform:(id)a3 toAlpha:(float)a4
{
  id v5;
  float v6;
  float v7;
  int v8;
  float v9;
  double v10;
  float v11;

  v5 = a3;
  objc_msgSend(v5, "value");
  v7 = v6;
  v8 = objc_msgSend(v5, "type");
  if (v8 != 6)
  {
    v9 = v7 * a4;
    if (v8 != 8)
      v9 = a4;
    if (v8 == 7)
      v7 = v7 + a4;
    else
      v7 = v9;
  }
  v10 = v7;
  if (v7 < 0.0)
    v10 = 0.0;
  v11 = fmin(v10, 1.0);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int mType;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    mType = self->mType;
    v6 = mType == objc_msgSend(v4, "type");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)applyRGBTransform:(id)a3 toColor:(id)a4 skipGamma:(BOOL)a5
{
  id v8;
  id v9;
  double v10;
  uint64_t v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  uint64_t v28;

  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    LODWORD(v10) = 1074580685;
    objc_msgSend(a1, "applyExpTransformWithValue:toColor:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  objc_msgSend(v9, "red");
  v13 = v12;
  objc_msgSend(v9, "green");
  v15 = v14;
  objc_msgSend(v9, "blue");
  v17 = v16;
  objc_msgSend(v8, "value");
  v19 = v18;
  switch(objc_msgSend(v8, "type"))
  {
    case 4u:
      v13 = (float)(1.0 - v19) + (float)(v13 * v19);
      v15 = (float)(1.0 - v19) + (float)(v15 * v19);
      v17 = (float)(1.0 - v19) + (float)(v17 * v19);
      break;
    case 5u:
      v13 = v13 * v19;
      v15 = v15 * v19;
      goto LABEL_6;
    case 0x12u:
      v13 = v19;
      break;
    case 0x13u:
      v13 = v13 + v19;
      break;
    case 0x14u:
      v13 = v13 * v19;
      break;
    case 0x15u:
      v15 = v19;
      break;
    case 0x16u:
      v15 = v15 + v19;
      break;
    case 0x17u:
      v15 = v15 * v19;
      break;
    case 0x18u:
      v17 = v19;
      break;
    case 0x19u:
      v17 = v17 + v19;
      break;
    case 0x1Au:
LABEL_6:
      v17 = v17 * v19;
      break;
    default:
      break;
  }
  v20 = v13;
  v21 = 0.0;
  if (v13 < 0.0)
    v20 = 0.0;
  v22 = fmin(v20, 1.0);
  *(float *)&v22 = v22;
  v23 = v15;
  if (v15 < 0.0)
    v23 = 0.0;
  v24 = fmin(v23, 1.0);
  *(float *)&v24 = v24;
  if (v17 >= 0.0)
    v21 = v17;
  v25 = fmin(v21, 1.0);
  *(float *)&v25 = v25;
  +[OADRgbColor rgbColorWithRed:green:blue:](OADRgbColor, "rgbColorWithRed:green:blue:", v22, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a5)
  {
    LODWORD(v27) = 1055439406;
    objc_msgSend(a1, "applyExpTransformWithValue:toColor:", v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v26 = (void *)v28;
  }

  return v26;
}

+ (id)applyExpTransformWithValue:(float)a3 toColor:(id)a4
{
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v5 = a4;
  objc_msgSend(v5, "red");
  v7 = powf(v6, a3);
  objc_msgSend(v5, "green");
  v9 = v8;
  objc_msgSend(v5, "blue");
  v11 = v10;
  v12 = powf(v9, a3);
  LODWORD(v13) = powf(v11, a3);
  *(float *)&v14 = v7;
  *(float *)&v15 = v12;
  +[OADRgbColor rgbColorWithRed:green:blue:](OADRgbColor, "rgbColorWithRed:green:blue:", v14, v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)applyHSLTransform:(id)a3 toColor:(id)a4
{
  id v5;
  id v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  double v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  double v19;
  double v20;
  float v21;
  float v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v28;
  float v29;
  float v30;
  float v31;
  float v32;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "red");
  v8 = v7;
  v32 = v7;
  objc_msgSend(v6, "green");
  v10 = v9;
  v31 = v9;
  objc_msgSend(v6, "blue");
  v30 = v11;
  v29 = 0.0;
  v28 = 0;
  *(float *)&v12 = convertRgbToHsl(v8, v10, v11, &v29, (float *)&v28 + 1, (float *)&v28);
  objc_msgSend(v5, "value", v12);
  v14 = v13;
  switch(objc_msgSend(v5, "type"))
  {
    case 9u:
      v29 = v14;
      break;
    case 0xAu:
      v15 = v14 + v29;
      goto LABEL_5;
    case 0xBu:
      v15 = v14 * v29;
LABEL_5:
      v29 = v15;
      break;
    case 0xCu:
      *((float *)&v28 + 1) = v14;
      break;
    case 0xDu:
      v16 = v14 + *((float *)&v28 + 1);
      goto LABEL_9;
    case 0xEu:
      v16 = v14 * *((float *)&v28 + 1);
LABEL_9:
      *((float *)&v28 + 1) = v16;
      break;
    case 0xFu:
      *(float *)&v28 = v14;
      break;
    case 0x10u:
      v17 = v14 + *(float *)&v28;
      goto LABEL_13;
    case 0x11u:
      v17 = v14 * *(float *)&v28;
LABEL_13:
      *(float *)&v28 = v17;
      break;
    default:
      break;
  }
  v18 = (float)((float)(v29 / 360.0) - floorf(v29 / 360.0)) * 360.0;
  v19 = *((float *)&v28 + 1);
  v20 = 0.0;
  if (*((float *)&v28 + 1) < 0.0)
    v19 = 0.0;
  v21 = fmin(v19, 1.0);
  *((float *)&v28 + 1) = v21;
  v29 = v18;
  if (*(float *)&v28 >= 0.0)
    v20 = *(float *)&v28;
  v22 = fmin(v20, 1.0);
  *(float *)&v28 = v22;
  convertHslToRgb(v18, v21, v22, &v32, &v31, &v30);
  *(float *)&v24 = v31;
  *(float *)&v23 = v32;
  *(float *)&v25 = v30;
  +[OADRgbColor rgbColorWithRed:green:blue:](OADRgbColor, "rgbColorWithRed:green:blue:", v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:", self->mType);
}

- (unint64_t)hash
{
  return self->mType;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADColorTransform;
  -[OADColorTransform description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
