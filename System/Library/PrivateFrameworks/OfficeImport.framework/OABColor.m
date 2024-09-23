@implementation OABColor

+ (EshColor)propertyColor:(int)a3 colorPropertiesManager:(id)a4
{
  _QWORD *v4;
  _QWORD *v6;
  id v7;
  int v8;
  id v9;
  int v10;
  EshColor v11;
  id v12;

  v6 = v4;
  v7 = a4;
  v12 = v7;
  switch(a3)
  {
    case 240:
      if (v7)
        goto LABEL_18;
      goto LABEL_19;
    case 241:
      v8 = objc_msgSend(v7, "isStroked");
      v9 = v12;
      if (v8)
        goto LABEL_5;
      goto LABEL_17;
    case 242:
      if (v7)
        goto LABEL_8;
      goto LABEL_19;
    case 243:
      if (!v7)
        goto LABEL_19;
      objc_msgSend(v7, "shadowColor");
      goto LABEL_20;
    case 245:
      if (!v7)
        goto LABEL_19;
      objc_msgSend(v7, "fillBgColor");
      goto LABEL_20;
    case 246:
      if (!v7)
        goto LABEL_19;
      objc_msgSend(v7, "strokeBgColor");
      goto LABEL_20;
    case 247:
      v10 = objc_msgSend(v7, "isFilled");
      v9 = v12;
      if (v10)
      {
LABEL_17:
        v7 = v9;
        if (v9)
        {
LABEL_18:
          objc_msgSend(v7, "fillFgColor");
          goto LABEL_20;
        }
      }
      else
      {
LABEL_5:
        v7 = v9;
        if (v9)
        {
LABEL_8:
          objc_msgSend(v7, "strokeFgColor");
          goto LABEL_20;
        }
      }
LABEL_19:
      *v6 = 0;
LABEL_20:

      return v11;
    default:
      *(_DWORD *)v6 = 255;
      goto LABEL_20;
  }
}

+ (int)readColorAdjustmentType:(int)a3
{
  if ((a3 - 1) >= 6)
    return 0;
  else
    return a3;
}

+ (id)readColor:(const EshColor *)a3 colorPropertiesManager:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  OADSchemeColor *v10;
  int var0;
  OADRgbColor *v12;
  unsigned int Red;
  unsigned int Green;
  unsigned int Blue;
  double v16;
  double v17;
  double v18;
  OADSystemColor *v19;
  uint64_t SchemeIndex;
  void *v21;
  void *v22;
  void *v23;
  OADRgbColor *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  OADAdjustedColor *v36;
  uint64_t v37;
  uint64_t isInvert;
  uint64_t isInvert128;
  int v41;

  v8 = a4;
  v9 = a5;
  v10 = 0;
  var0 = a3->var0.var0;
  switch(a3->var0.var0)
  {
    case 0:
    case 2:
    case 4:
      v12 = [OADRgbColor alloc];
      Red = EshColor::getRed((EshColor *)a3);
      Green = EshColor::getGreen((EshColor *)a3);
      Blue = EshColor::getBlue((EshColor *)a3);
      *(float *)&v16 = (float)Red;
      *(float *)&v17 = (float)Green;
      *(float *)&v18 = (float)Blue;
      v19 = -[OADRgbColor initWithRedByte:greenByte:blueByte:](v12, "initWithRedByte:greenByte:blueByte:", v16, v17, v18);
      goto LABEL_6;
    case 1:
    case 3:
    case 5:
    case 6:
    case 7:
      break;
    case 8:
      SchemeIndex = EshColor::getSchemeIndex((EshColor *)a3);
      objc_msgSend(v9, "colorPalette");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, "colorWithIndex:", SchemeIndex);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = [OADRgbColor alloc];
        objc_msgSend(v23, "redComponent");
        v26 = v25;
        objc_msgSend(v23, "greenComponent");
        v28 = v27;
        objc_msgSend(v23, "blueComponent");
        v29 = v26;
        *(float *)&v30 = v28;
        *(float *)&v32 = v31;
        *(float *)&v31 = v29;
        v10 = -[OADRgbColor initWithRed:green:blue:](v24, "initWithRed:green:blue:", v31, v30, v32);

      }
      else
      {
        v10 = -[OADSchemeColor initWithSchemeColorIndex:]([OADSchemeColor alloc], "initWithSchemeColorIndex:", objc_msgSend((id)objc_msgSend(v9, "client"), "oadSchemeColorValueForEshSchemeColorIndex:state:", SchemeIndex, v9));
      }

      break;
    default:
      if (var0 == 33)
      {
        objc_msgSend(a1, "propertyColor:colorPropertiesManager:", EshColor::getRed((EshColor *)a3), v8);
        if (v41 == 33)
        {
          +[OADRgbColor white](OADRgbColor, "white");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "copy");
        }
        else
        {
          objc_msgSend(a1, "readColor:colorPropertiesManager:state:", &v41, v8, v9);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(a1, "readColorAdjustmentType:", EshColor::getAdjustmentType((EshColor *)a3));
          v36 = [OADAdjustedColor alloc];
          v37 = EshColor::getGreen((EshColor *)a3);
          isInvert = EshColor::isInvert((EshColor *)a3);
          isInvert128 = EshColor::isInvert128((EshColor *)a3);
          v34 = -[OADAdjustedColor initWithBaseColor:adjustmentType:adjustmentParam:invert:invert128:gray:](v36, "initWithBaseColor:adjustmentType:adjustmentParam:invert:invert128:gray:", v33, v35, v37, isInvert, isInvert128, EshColor::isGray((EshColor *)a3));
        }
        v10 = (OADSchemeColor *)v34;

      }
      else if (var0 == 34)
      {
        v19 = -[OADSystemColor initWithSystemColorID:]([OADSystemColor alloc], "initWithSystemColorID:", objc_msgSend(a1, "readSystemColorID:", EshColor::getRed((EshColor *)a3)));
LABEL_6:
        v10 = (OADSchemeColor *)v19;
      }
      break;
  }

  return v10;
}

+ (int)writeSystemColorID:(int)a3
{
  if ((a3 - 1) > 0x1A)
    return 0;
  else
    return dword_22A4BE1DC[a3 - 1];
}

+ (int)readSystemColorID:(int)a3
{
  if (a3 > 0x18)
    return 0;
  else
    return dword_22A4BE248[a3];
}

@end
