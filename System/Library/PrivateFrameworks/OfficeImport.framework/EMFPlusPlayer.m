@implementation EMFPlusPlayer

- (EMFPlusPlayer)initWithOwner:(id)a3 canvas:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  EMFPlusPlayer *v11;
  EMFPlusPlayer *v12;
  MFPGraphics *v13;
  MFPGraphics *mGraphics;
  NSMutableData *v15;
  NSMutableData *mLargeData;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EMFPlusPlayer;
  v11 = -[EMFPlusPlayer init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->mOwner, a3);
    v13 = -[MFPGraphics initWithCanvas:]([MFPGraphics alloc], "initWithCanvas:", x, y, width, height);
    mGraphics = v12->mGraphics;
    v12->mGraphics = v13;

    v12->mLargeType = 0x4000;
    v15 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    mLargeData = v12->mLargeData;
    v12->mLargeData = v15;

  }
  return v12;
}

+ (int)serializableObjectTypeForGUID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = a3;
  v4 = (void *)+[EMFPlusPlayer serializableObjectTypeForGUID:]::serializableObjectGUIDToTypeMap;
  if (!+[EMFPlusPlayer serializableObjectTypeForGUID:]::serializableObjectGUIDToTypeMap)
  {
    v5 = objc_alloc(MEMORY[0x24BDBCE70]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFPBlurEffect GUID](MFPBlurEffect, "GUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFPSharpenEffect GUID](MFPSharpenEffect, "GUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFPColorMatrixEffect GUID](MFPColorMatrixEffect, "GUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFPColorLUTEffect GUID](MFPColorLUTEffect, "GUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFPBrightnessContrastEffect GUID](MFPBrightnessContrastEffect, "GUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFPHueSaturationLightnessEffect GUID](MFPHueSaturationLightnessEffect, "GUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFPLevelsEffect GUID](MFPLevelsEffect, "GUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFPTintEffect GUID](MFPTintEffect, "GUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFPColorBalanceEffect GUID](MFPColorBalanceEffect, "GUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFPRedEyeCorrectionEffect GUID](MFPRedEyeCorrectionEffect, "GUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFPColorCurveEffect GUID](MFPColorCurveEffect, "GUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "initWithObjectsAndKeys:", v25, v6, v24, v23, v33, v32, v22, v21, v7, v31, v30, v29, v20, v19, v18, v17, v16,
           v28,
           v27,
           v26,
           v15,
           v8,
           0);
    v10 = (void *)+[EMFPlusPlayer serializableObjectTypeForGUID:]::serializableObjectGUIDToTypeMap;
    +[EMFPlusPlayer serializableObjectTypeForGUID:]::serializableObjectGUIDToTypeMap = v9;

    v4 = (void *)+[EMFPlusPlayer serializableObjectTypeForGUID:]::serializableObjectGUIDToTypeMap;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = objc_msgSend(v11, "intValue");
  else
    v13 = 0;

  return v13;
}

- (id)effect
{
  return self->mEffect;
}

- (void)setEffect:(id)a3
{
  objc_storeStrong((id *)&self->mEffect, a3);
}

- (int)playUnknown:(const char *)a3 in_size:(unsigned int)a4 in_type:(int)a5 in_flags:(unsigned __int16)a6
{
  return 0;
}

- (int)playHeader:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  _BOOL8 v7;

  v7 = (a5 & 1) == 0;
  -[EMFPlayer setIgnoreEMFPlusRecords:](self->mOwner, "setIgnoreEMFPlusRecords:", a5 & 1, *(_QWORD *)&a4);
  -[EMFPlayer setIgnoreEMFRecords:](self->mOwner, "setIgnoreEMFRecords:", v7);
  -[MFPGraphics setHorizontalDpi:verticalDpi:](self->mGraphics, "setHorizontalDpi:verticalDpi:", *((unsigned int *)a3 + 2), *((unsigned int *)a3 + 3));
  return 0;
}

- (int)readImage:(const char *)a3 in_size:(unsigned int)a4 pImage:(id *)a5
{
  unsigned int v5;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;

  *a5 = 0;
  v5 = a4 - 8;
  if (a4 < 8)
    return -7;
  v7 = *((_DWORD *)a3 + 1);
  if (v7 == 2)
  {
    if (v5 >= 8)
    {
      v10 = a4 - 16;
      if (*((_DWORD *)a3 + 3) == (_DWORD)v10)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3 + 16, v10);
        *a5 = -[MFPMetafileImage initWithMetafileData:]([MFPMetafileImage alloc], "initWithMetafileData:", v11);

        return 0;
      }
    }
    return -7;
  }
  if (v7 != 1 || v5 < 0x14)
    return -7;
  v8 = *((_DWORD *)a3 + 6);
  if (!v8)
    return v8;
  if (v8 != 1)
    return -7;
  if (*((_DWORD *)a3 + 2) | *((_DWORD *)a3 + 3) | *((_DWORD *)a3 + 4) | *((_DWORD *)a3 + 5))
    v8 = -7;
  else
    v8 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3 + 28, a4 - 28);
  *a5 = -[MFPBitmapImage initWithBitmapData:]([MFPBitmapImage alloc], "initWithBitmapData:", v9);

  return v8;
}

- (int)readPath:(const char *)a3 in_size:(unsigned int)a4 returnPath:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v23;
  __int16 v24;
  char v25;
  unsigned int v26;
  __int16 v28;
  unsigned int v29;
  __int16 v30;
  const unsigned __int8 *v31;
  uint64_t v32;
  const unsigned __int8 *v33;
  signed __int8 v34;
  int v35;
  double Point;
  double v37;
  int v38;
  const unsigned __int8 *v39;
  double v40;
  unsigned __int8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  if (a4 < 0xC)
    return -7;
  v42 = v20;
  v43 = v19;
  v44 = v18;
  v45 = v17;
  v46 = v14;
  v47 = v13;
  v48 = v12;
  v49 = v11;
  v50 = v10;
  v51 = v9;
  v52 = v8;
  v53 = v7;
  v54 = v6;
  v55 = v5;
  v56 = v15;
  v57 = v16;
  v23 = *((_DWORD *)a3 + 1);
  v24 = *((unsigned __int8 *)a3 + 9);
  if ((v24 & 0x40) != 0)
    v25 = 2;
  else
    v25 = 3;
  if (v23 > a4)
    return -7;
  v26 = v23 << v25;
  if (v23 + (v23 << v25) + 12 > a4)
    return -7;
  v28 = *((unsigned __int8 *)a3 + 8);
  *a5 = objc_alloc_init(OITSUBezierPath);
  if (v23)
  {
    v29 = 0;
    v30 = v28 | (v24 << 8);
    v31 = (const unsigned __int8 *)(a3 + 12);
    if ((v24 & 0x40) != 0)
      v32 = 4;
    else
      v32 = 8;
    v33 = &v31[v26];
    do
    {
      v34 = v33[v29];
      v35 = v34;
      Point = readPoint(v31, v30);
      v31 += v32;
      switch(v34 & 7)
      {
        case 3:
          if (v34 < 0)
            return -7;
          if (v29 + 2 >= v23)
            return -7;
          readPoint(v31, v30);
          if ((v33[v29 + 1] & 0x87) != 3)
            return -7;
          v39 = &v31[v32];
          v40 = readPoint(v39, v30);
          v41 = v33[v29 + 2];
          if ((v41 & 7) != 3)
            return -7;
          v31 = &v39[v32];
          objc_msgSend(*a5, "curveToPoint:controlPoint1:controlPoint2:", v40);
          v38 = 3;
          if ((v41 & 0x80) != 0)
            goto LABEL_27;
          break;
        case 1:
          objc_msgSend(*a5, "lineToPoint:", Point, v37);
          break;
        case 0:
          if (v34 < 0)
            return -7;
          objc_msgSend(*a5, "moveToPoint:", Point, v37);
          v38 = 1;
          break;
        default:
          v38 = 1;
          if (v35 < 0)
LABEL_27:
            objc_msgSend(*a5, "closePath", v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57);
          break;
      }
      v29 += v38;
    }
    while (v29 < v23);
  }
  return 0;
}

- (int)readGradientBrush:(id)a3 from:(const char *)a4 brushFlags:(unsigned int)a5 in_size:(unsigned int)a6
{
  char v7;
  id v9;
  BOOL v10;
  int v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  MFPBlendStop *v26;
  double v27;
  double v28;
  MFPBlendStop *v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  void *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  void *v44;
  MFPGradientStop *v45;
  double v46;
  MFPGradientStop *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int v51;
  _OWORD v52[3];
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v7 = a5;
  v9 = a3;
  if ((v7 & 2) != 0)
  {
    v10 = a6 >= 0x18;
    a6 -= 24;
    if (!v10)
    {
LABEL_16:
      v11 = -7;
      goto LABEL_17;
    }
    v54 = 0u;
    v55 = 0u;
    v53 = 0u;
    readAffineTransform((const unsigned __int8 *)*a4, (double *)&v53);
    v52[0] = v53;
    v52[1] = v54;
    v52[2] = v55;
    objc_msgSend(v9, "setTransform:", v52);
    *a4 += 24;
  }
  if ((v7 & 8) != 0)
  {
    v12 = a6 - 4;
    if (a6 < 4)
      goto LABEL_16;
    v13 = *(unsigned __int8 *)*a4;
    v14 = *((unsigned __int8 *)*a4 + 1);
    v15 = *((unsigned __int8 *)*a4 + 2);
    v16 = *((unsigned __int8 *)*a4 + 3);
    v17 = v13 | (v14 << 8) | (v15 << 16) | (v16 << 24);
    *a4 += 4;
    if (v12 < 8 * v17)
      goto LABEL_16;
    LODWORD(v48) = v12;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v13 | (v14 << 8) | (v15 << 16) | (v16 << 24));
    if (v17)
    {
      v19 = 0;
      v20 = (v15 << 18) | (v16 << 26) | (v14 << 10) | (4 * v13);
      v21 = v17;
      do
      {
        +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", *a4, v19, v48);
        v23 = v22;
        +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", *a4, (v20 + v19));
        v25 = v24;
        v26 = [MFPBlendStop alloc];
        LODWORD(v27) = v25;
        LODWORD(v28) = v23;
        v29 = -[MFPBlendStop initWithFactor:position:](v26, "initWithFactor:position:", v27, v28);
        objc_msgSend(v18, "addObject:", v29);

        v19 = (v19 + 4);
        --v21;
      }
      while (v21);
    }
    objc_msgSend(v9, "setBlend:", v18, v48);
    v30 = 8 * v17;
    a6 = v49 - 8 * v17;
    *a4 += v30;

    if ((v7 & 4) == 0)
      goto LABEL_7;
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_7;
  }
  v31 = a6 - 4;
  if (a6 < 4)
    goto LABEL_16;
  v32 = *(unsigned __int8 *)*a4;
  v33 = *((unsigned __int8 *)*a4 + 1);
  v34 = *((unsigned __int8 *)*a4 + 2);
  v35 = *((unsigned __int8 *)*a4 + 3);
  v36 = v32 | (v33 << 8) | (v34 << 16) | (v35 << 24);
  *a4 += 4;
  if (v31 < 8 * v36)
    goto LABEL_16;
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v32 | (v33 << 8) | (v34 << 16) | (v35 << 24));
  v50 = v32 | (v33 << 8) | (v34 << 16) | (v35 << 24);
  if (v36)
  {
    v39 = 0;
    v40 = (v34 << 18) | (v35 << 26) | (v33 << 10) | (4 * v32);
    v41 = 4 * v50;
    do
    {
      +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", *a4, v39, v50);
      v43 = v42;
      +[OITSUColor colorWithBinaryRed:green:blue:alpha:](OITSUColor, "colorWithBinaryRed:green:blue:alpha:", (*a4)[(v40 + v39) + 2], (*a4)[(v40 + v39) + 1], (*a4)[(v40 + v39)], (*a4)[(v40 + v39) + 3]);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = [MFPGradientStop alloc];
      LODWORD(v46) = v43;
      v47 = -[MFPGradientStop initWithColor:position:](v45, "initWithColor:position:", v44, v46);
      objc_msgSend(v38, "addObject:", v47);

      v39 += 4;
    }
    while (v41 != v39);
  }
  objc_msgSend(v9, "setColorBlend:", v38, v50);
  *a4 += (8 * v51);

LABEL_7:
  v11 = 0;
LABEL_17:

  return v11;
}

- (int)readBrush:(const char *)a3 in_size:(unsigned int)a4 returnBrush:(id *)a5
{
  unsigned int v5;
  int v6;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  MFPPathGradientBrush *v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  float v25;
  float v26;
  float v27;
  unsigned int v28;
  uint64_t v29;
  unsigned __int8 *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  unsigned int v36;
  MFPLinearGradientBrush *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  MFPPathGradientBrush *v41;
  id v42;
  MFPTextureBrush *v43;
  unsigned int v44;
  OITSUBezierPath *v45;
  uint64_t v46;
  float v47;
  float v48;
  float v49;
  float v50;
  double v51;
  double v52;
  int v53;
  int v54;
  unsigned int v55;
  void *v56;
  id v57;
  _OWORD v58[3];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  const char *v63;

  v63 = a3;
  v5 = a4 - 8;
  if (a4 < 8)
    return -7;
  switch(*((_DWORD *)a3 + 1))
  {
    case 0:
      if (v5 < 4)
        return -7;
      +[OITSUColor colorWithBinaryRed:green:blue:alpha:](OITSUColor, "colorWithBinaryRed:green:blue:alpha:", *((unsigned __int8 *)a3 + 10), *((unsigned __int8 *)a3 + 9), *((unsigned __int8 *)a3 + 8), *((unsigned __int8 *)a3 + 11));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = -[MFPSolidBrush initWithColor:]([MFPSolidBrush alloc], "initWithColor:", v12);
      goto LABEL_9;
    case 1:
      if (v5 < 0xC)
        return -7;
      v13 = *((unsigned int *)a3 + 2);
      +[OITSUColor colorWithBinaryRed:green:blue:alpha:](OITSUColor, "colorWithBinaryRed:green:blue:alpha:", *((unsigned __int8 *)a3 + 14), *((unsigned __int8 *)a3 + 13), *((unsigned __int8 *)a3 + 12), *((unsigned __int8 *)a3 + 15));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUColor colorWithBinaryRed:green:blue:alpha:](OITSUColor, "colorWithBinaryRed:green:blue:alpha:", *((unsigned __int8 *)a3 + 18), *((unsigned __int8 *)a3 + 17), *((unsigned __int8 *)a3 + 16), *((unsigned __int8 *)a3 + 19));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = -[MFPHatchBrush initWithHatchStyle:foreColor:backColor:]([MFPHatchBrush alloc], "initWithHatchStyle:foreColor:backColor:", v13, v12, v14);

LABEL_9:
      return 0;
    case 2:
      if (v5 < 8)
        return -7;
      v15 = a4 - 16;
      v16 = a3[8];
      v17 = *((unsigned int *)a3 + 3);
      v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      v60 = *MEMORY[0x24BDBD8B8];
      v61 = v18;
      v62 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      if ((v16 & 2) != 0)
      {
        if (v15 < 0x18)
          return -7;
        v15 = a4 - 40;
        readAffineTransform((const unsigned __int8 *)a3 + 16, (double *)&v60);
        v19 = 40;
      }
      else
      {
        v19 = 16;
      }
      v59 = 0;
      v6 = -[EMFPlusPlayer readImage:in_size:pImage:](self, "readImage:in_size:pImage:", &a3[v19], v15, &v59);
      v42 = v59;
      if (v42)
      {
        v43 = [MFPTextureBrush alloc];
        v58[0] = v60;
        v58[1] = v61;
        v58[2] = v62;
        *a5 = -[MFPTextureBrush initWithImage:wrapMode:transform:](v43, "initWithImage:wrapMode:transform:", v42, v17, v58);
      }

      return v6;
    case 3:
      if (v5 < 0x18)
        return -7;
      v20 = objc_alloc_init(MFPPathGradientBrush);
      v21 = *((unsigned __int8 *)a3 + 8);
      v22 = *((unsigned __int8 *)a3 + 9);
      v23 = *((unsigned __int8 *)a3 + 10);
      v24 = *((unsigned __int8 *)a3 + 11);
      -[MFPGradientBrush setWrapMode:](v20, "setWrapMode:", *((unsigned int *)a3 + 3));
      +[OITSUColor colorWithBinaryRed:green:blue:alpha:](OITSUColor, "colorWithBinaryRed:green:blue:alpha:", *((unsigned __int8 *)a3 + 18), *((unsigned __int8 *)a3 + 17), *((unsigned __int8 *)a3 + 16), *((unsigned __int8 *)a3 + 19));
      v53 = v24;
      v54 = v22;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFPPathGradientBrush setCenterColor:](v20, "setCenterColor:");
      v55 = v21;
      +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3 + 20, 0);
      v26 = v25;
      +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3 + 20, 4);
      -[MFPPathGradientBrush setCenterPoint:](v20, "setCenterPoint:", v26, v27);
      v28 = a4 - 32;
      v29 = *((unsigned int *)a3 + 7);
      v30 = (unsigned __int8 *)(a3 + 32);
      v63 = (const char *)v30;
      if (!(_DWORD)v29)
        goto LABEL_20;
      if (v28 < 4 * (int)v29)
        goto LABEL_22;
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v29);
      v28 -= 4 * v29;
      do
      {
        +[OITSUColor colorWithBinaryRed:green:blue:alpha:](OITSUColor, "colorWithBinaryRed:green:blue:alpha:", v30[2], v30[1], *v30, v30[3]);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v32);
        v30 += 4;
        v63 = (const char *)v30;

        LODWORD(v29) = v29 - 1;
      }
      while ((_DWORD)v29);
      -[MFPPathGradientBrush setSurroundColors:](v20, "setSurroundColors:", v31);

LABEL_20:
      v33 = v28 - 4;
      if (v28 < 4)
        goto LABEL_22;
      v36 = *(_DWORD *)v30;
      v34 = (const char *)(v30 + 4);
      v35 = v36;
      v63 = v34;
      if (v33 < v36)
        goto LABEL_22;
      v44 = v55;
      if ((v55 & 1) != 0)
      {
        v57 = 0;
        -[EMFPlusPlayer readPath:in_size:returnPath:](self, "readPath:in_size:returnPath:", v34, v35, &v57);
        v45 = (OITSUBezierPath *)v57;
        v34 = v63;
      }
      else
      {
        if (v33 < 8 * (int)v35)
        {
LABEL_22:

          return -7;
        }
        v45 = objc_alloc_init(OITSUBezierPath);
        if ((_DWORD)v35)
        {
          v46 = 0;
          do
          {
            +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", &v34[v46 & 0xFFFFFFF8], 0);
            v48 = v47;
            +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", &v34[v46 & 0xFFFFFFF8], 4);
            v50 = v49;
            v51 = v48;
            v52 = v50;
            if (v46)
              -[OITSUBezierPath lineToPoint:](v45, "lineToPoint:", v51, v52);
            else
              -[OITSUBezierPath moveToPoint:](v45, "moveToPoint:", v51, v52);
            v46 += 8;
          }
          while (8 * v35 != v46);
        }
        -[OITSUBezierPath closePath](v45, "closePath");
        v44 = v55;
        LODWORD(v35) = 8 * v35;
        v33 = (v33 - v35);
      }
      v63 = &v34[v35];
      -[MFPPathGradientBrush setPath:](v20, "setPath:", v45);
      v6 = -[EMFPlusPlayer readGradientBrush:from:brushFlags:in_size:](self, "readGradientBrush:from:brushFlags:in_size:", v20, &v63, (v23 << 16) | (v54 << 8) | (v53 << 24) | v44, v33);
      -[MFPGradientBrush createPhoneBrush](v20, "createPhoneBrush");
      v41 = objc_retainAutorelease(v20);
      *a5 = v41;

LABEL_25:
      break;
    case 4:
      if (v5 < 0x28)
        return -7;
      v37 = objc_alloc_init(MFPLinearGradientBrush);
      v38 = *((unsigned int *)a3 + 2);
      -[MFPGradientBrush setWrapMode:](v37, "setWrapMode:", *((unsigned int *)a3 + 3));
      -[MFPLinearGradientBrush setBounds:](v37, "setBounds:", readFloat32Rect((const unsigned __int8 *)a3 + 16));
      +[OITSUColor colorWithBinaryRed:green:blue:alpha:](OITSUColor, "colorWithBinaryRed:green:blue:alpha:", *((unsigned __int8 *)a3 + 34), *((unsigned __int8 *)a3 + 33), *((unsigned __int8 *)a3 + 32), *((unsigned __int8 *)a3 + 35));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFPLinearGradientBrush setStartColor:](v37, "setStartColor:", v39);
      +[OITSUColor colorWithBinaryRed:green:blue:alpha:](OITSUColor, "colorWithBinaryRed:green:blue:alpha:", *((unsigned __int8 *)a3 + 38), *((unsigned __int8 *)a3 + 37), *((unsigned __int8 *)a3 + 36), *((unsigned __int8 *)a3 + 39));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFPLinearGradientBrush setEndColor:](v37, "setEndColor:", v40);
      *(_QWORD *)&v60 = a3 + 48;
      v6 = -[EMFPlusPlayer readGradientBrush:from:brushFlags:in_size:](self, "readGradientBrush:from:brushFlags:in_size:", v37, &v60, v38, a4 - 48);
      -[MFPGradientBrush createPhoneBrush](v37, "createPhoneBrush");
      v41 = objc_retainAutorelease(v37);
      *a5 = v41;

      goto LABEL_25;
    default:
      return 0;
  }
  return v6;
}

- (int)playBrush:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  uint64_t v5;
  int v7;
  id v8;
  void *v9;
  id v11;

  v5 = a5;
  v11 = 0;
  v7 = -[EMFPlusPlayer readBrush:in_size:returnBrush:](self, "readBrush:in_size:returnBrush:", a3, *(_QWORD *)&a4, &v11);
  v8 = v11;
  if (v8)
  {
    -[MFPGraphics objectTable](self->mGraphics, "objectTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:atIndex:", v8, v5);

  }
  return v7;
}

- (int)playPen:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  uint64_t v5;
  MFPPen *v9;
  uint64_t v10;
  int v11;
  char v13;
  char v14;
  unsigned int *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  int v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  double v44[6];

  v5 = a5;
  v9 = objc_alloc_init(MFPPen);
  v10 = a4 - 20;
  if (a4 < 0x14)
    goto LABEL_2;
  v13 = a3[8];
  v14 = a3[9];
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 16);
  -[MFPPen setWidth:](v9, "setWidth:");
  v15 = (unsigned int *)(a3 + 20);
  if ((v13 & 1) == 0)
  {
LABEL_7:
    if ((v13 & 2) != 0)
    {
      v27 = v10 >= 4;
      v10 = (v10 - 4);
      if (!v27)
        goto LABEL_2;
      -[MFPPen setStartCap:](v9, "setStartCap:", *v15++);
    }
    if ((v13 & 4) != 0)
    {
      v27 = v10 >= 4;
      v10 = (v10 - 4);
      if (!v27)
        goto LABEL_2;
      -[MFPPen setEndCap:](v9, "setEndCap:", *v15++);
    }
    if ((v13 & 8) != 0)
    {
      v27 = v10 >= 4;
      v10 = (v10 - 4);
      if (!v27)
        goto LABEL_2;
      -[MFPPen setLineJoin:](v9, "setLineJoin:", *v15++);
    }
    if ((v13 & 0x10) != 0)
    {
      v27 = v10 >= 4;
      v10 = (v10 - 4);
      if (!v27)
        goto LABEL_2;
      +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", v15, 0);
      -[MFPPen setMiterLimit:](v9, "setMiterLimit:");
      ++v15;
    }
    if ((v13 & 0x20) != 0)
    {
      v27 = v10 >= 4;
      v10 = (v10 - 4);
      if (!v27)
        goto LABEL_2;
      -[MFPPen setDashStyle:](v9, "setDashStyle:", *v15++);
    }
    if ((v13 & 0x40) != 0)
    {
      v27 = v10 >= 4;
      v10 = (v10 - 4);
      if (!v27)
        goto LABEL_2;
      -[MFPPen setDashCap:](v9, "setDashCap:", *v15++);
    }
    if (v13 < 0)
    {
      v27 = v10 >= 4;
      v10 = (v10 - 4);
      if (!v27)
        goto LABEL_2;
      +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", v15, 0);
      -[MFPPen setDashOffset:](v9, "setDashOffset:");
      ++v15;
    }
    if ((v14 & 1) != 0)
    {
      v27 = v10 >= 4;
      v10 = (v10 - 4);
      if (!v27)
        goto LABEL_2;
      -[MFPPen setDashStyle:](v9, "setDashStyle:", 5);
      v28 = *v15;
      v29 = 4 * v28;
      v30 = operator new[]();
      ++v15;
      if ((_DWORD)v28)
      {
        v41 = v28;
        v31 = 0;
        while ((v10 & 0xFFFFFFFC) != v31)
        {
          +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", &v15[v31 / 4], 0);
          *(_DWORD *)(v30 + v31) = v32;
          v31 += 4;
          if (v29 == v31)
          {
            v15 = (unsigned int *)((char *)v15 + v31);
            v10 = (v10 - v31);
            v28 = v41;
            goto LABEL_43;
          }
        }
        goto LABEL_64;
      }
LABEL_43:
      -[MFPPen setDashPattern:count:](v9, "setDashPattern:count:", v30, v28);
      MEMORY[0x22E2DD3F0](v30, 0x1000C8052888210);
    }
    if ((v14 & 2) != 0)
    {
      v27 = v10 >= 4;
      v10 = (v10 - 4);
      if (!v27)
        goto LABEL_2;
      -[MFPPen setAlignment:](v9, "setAlignment:", *v15++);
    }
    if ((v14 & 4) != 0)
    {
      v27 = v10 >= 4;
      v10 = (v10 - 4);
      if (!v27)
        goto LABEL_2;
      v33 = *v15;
      v34 = 4 * v33;
      v30 = operator new[]();
      ++v15;
      if ((_DWORD)v33)
      {
        v42 = v33;
        v35 = 0;
        while ((v10 & 0xFFFFFFFC) != v35)
        {
          +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", &v15[v35 / 4], 0);
          *(_DWORD *)(v30 + v35) = v36;
          v35 += 4;
          if (v34 == v35)
          {
            v15 = (unsigned int *)((char *)v15 + v35);
            v10 = (v10 - v35);
            v33 = v42;
            goto LABEL_56;
          }
        }
LABEL_64:
        MEMORY[0x22E2DD3F0](v30, 0x1000C8052888210);
        goto LABEL_2;
      }
LABEL_56:
      -[MFPPen setCompoundArray:count:](v9, "setCompoundArray:count:", v30, v33);
      MEMORY[0x22E2DD3F0](v30, 0x1000C8052888210);
    }
    if ((v14 & 8) != 0)
    {
      if (v10 < 4)
        goto LABEL_2;
      v37 = *v15;
      v27 = v10 >= v37;
      v10 = (v10 - v37);
      if (!v27)
        goto LABEL_2;
      v15 = (unsigned int *)((char *)v15 + v37);
    }
    if ((v14 & 0x10) != 0)
    {
      if (v10 < 4)
        goto LABEL_2;
      v40 = *v15;
      v27 = v10 >= v40;
      v10 = (v10 - v40);
      if (!v27)
        goto LABEL_2;
      v15 = (unsigned int *)((char *)v15 + v40);
    }
    v43 = 0;
    v11 = -[EMFPlusPlayer readBrush:in_size:returnBrush:](self, "readBrush:in_size:returnBrush:", v15, v10, &v43);
    v38 = v43;
    -[MFPPen setBrush:](v9, "setBrush:", v38);
    -[MFPGraphics objectTable](self->mGraphics, "objectTable");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:atIndex:", v9, v5);

    goto LABEL_3;
  }
  if (v10 >= 0x18)
  {
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3 + 20, 0);
    v17 = v16;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3 + 20, 4);
    v19 = v18;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3 + 20, 8);
    v21 = v20;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3 + 20, 12);
    v23 = v22;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3 + 20, 16);
    v25 = v24;
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3 + 20, 20);
    v44[0] = v17;
    v44[1] = v19;
    v44[2] = v21;
    v44[3] = v23;
    v44[4] = v25;
    v44[5] = v26;
    -[MFPPen setTransform:](v9, "setTransform:", v44);
    v10 = a4 - 44;
    v15 = (unsigned int *)(a3 + 44);
    goto LABEL_7;
  }
LABEL_2:
  v11 = -7;
LABEL_3:

  return v11;
}

- (int)playPath:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  uint64_t v5;
  int v7;
  id v8;
  MFPPath *v9;
  void *v10;
  id v12;

  v5 = a5;
  v12 = 0;
  v7 = -[EMFPlusPlayer readPath:in_size:returnPath:](self, "readPath:in_size:returnPath:", a3, *(_QWORD *)&a4, &v12);
  v8 = v12;
  if (v8)
  {
    v9 = -[MFPPath initWithPath:]([MFPPath alloc], "initWithPath:", v8);
    -[MFPGraphics objectTable](self->mGraphics, "objectTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:atIndex:", v9, v5);

  }
  return v7;
}

- (int)playRegion:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  return 0;
}

- (int)playImage:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  uint64_t v5;
  int v7;
  id v8;
  void *v9;
  id v11;

  v5 = a5;
  v11 = 0;
  v7 = -[EMFPlusPlayer readImage:in_size:pImage:](self, "readImage:in_size:pImage:", a3, *(_QWORD *)&a4, &v11);
  v8 = v11;
  if (v8)
  {
    -[MFPGraphics objectTable](self->mGraphics, "objectTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:atIndex:", v8, v5);

  }
  return v7;
}

- (int)playFont:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  unsigned int v5;
  int v6;
  uint64_t v7;
  MFPFont *v10;
  int v11;
  int v12;
  uint8x8_t v13;
  int8x16_t v14;
  int8x8_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;

  v5 = a4 - 24;
  if (a4 < 0x18)
    return -7;
  v7 = a5;
  v10 = objc_alloc_init(MFPFont);
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 4);
  v12 = v11;
  v13.i32[0] = *((_DWORD *)a3 + 5);
  v14 = (int8x16_t)vshlq_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v13)), (uint32x4_t)xmmword_22A4C0900);
  v15 = vorr_s8(*(int8x8_t *)v14.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL));
  v16 = (v15.i32[0] | v15.i32[1]);
  if (v5 >= v16)
  {
    v18 = *((unsigned int *)a3 + 2);
    v17 = *((unsigned int *)a3 + 3);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3 + 24, v16, CFStringConvertEncodingToNSStringEncoding(0x14000100u));
    LODWORD(v20) = v12;
    -[MFPFont setSize:](v10, "setSize:", v20);
    -[MFPFont setUnit:](v10, "setUnit:", v18);
    -[MFPFont setFlags:](v10, "setFlags:", v17);
    -[MFPFont setName:](v10, "setName:", v19);
    -[MFPGraphics objectTable](self->mGraphics, "objectTable");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:atIndex:", v10, v7);

    v6 = 0;
  }
  else
  {
    v6 = -7;
  }

  return v6;
}

- (int)playStringFormat:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  int v5;
  uint64_t v6;
  MFPStringFormat *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  unsigned int v29;
  unsigned int v31;
  unsigned __int16 v32;

  if (a4 >= 0x38)
  {
    v6 = *(_QWORD *)&a4;
    v29 = a5;
    v8 = objc_alloc_init(MFPStringFormat);
    v9 = *((unsigned __int8 *)a3 + 4);
    v10 = *((unsigned __int8 *)a3 + 5);
    v11 = *((unsigned __int8 *)a3 + 6);
    v12 = *((unsigned __int8 *)a3 + 7);
    v14 = *((unsigned int *)a3 + 3);
    v13 = *((unsigned int *)a3 + 4);
    v31 = *((unsigned __int8 *)a3 + 24);
    v32 = *((_WORD *)a3 + 10);
    +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 28);
    v16 = v15;
    v17 = v9 | (v10 << 8) | (v11 << 16) | (v12 << 24);
    v18 = *((unsigned int *)a3 + 8);
    v19 = *((unsigned int *)a3 + 12);
    -[MFPStringFormat setFormatFlags:](v8, "setFormatFlags:", v17);
    -[MFPStringFormat setAlignment:](v8, "setAlignment:", v14);
    -[MFPStringFormat setLineAlignment:](v8, "setLineAlignment:", v13);
    -[MFPStringFormat setDigitSubstitutionLanguage:](v8, "setDigitSubstitutionLanguage:", v32);
    -[MFPStringFormat setDigitSubstitutionMethod:](v8, "setDigitSubstitutionMethod:", v31);
    LODWORD(v20) = v16;
    -[MFPStringFormat setFirstTabOffset:](v8, "setFirstTabOffset:", v20);
    -[MFPStringFormat setHotkeyPrefix:](v8, "setHotkeyPrefix:", v18);
    -[MFPStringFormat setTrimming:](v8, "setTrimming:", v19);
    v21 = *((unsigned int *)a3 + 13);
    if ((int)v21 >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "integerValue");

      if (v23 < (4 * v21) + 60)
      {
        v5 = -7;
LABEL_10:

        return v5;
      }
      v24 = operator new[]();
      v25 = 0;
      do
      {
        +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, (v25 + 60));
        *(_DWORD *)(v24 + v25) = v26;
        v25 += 4;
      }
      while (4 * v21 != v25);
      -[MFPStringFormat setTabStops:count:](v8, "setTabStops:count:", v24, v21);
      MEMORY[0x22E2DD3F0](v24, 0x1000C8052888210);
    }
    -[MFPGraphics objectTable](self->mGraphics, "objectTable");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:atIndex:", v8, v29);

    v5 = 0;
    goto LABEL_10;
  }
  return -7;
}

- (int)playImageAttributes:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  return 0;
}

- (int)playCustomLineCap:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  return 0;
}

- (int)playGraphics:(const char *)a3 in_size:(unsigned int)a4 objectIndex:(unsigned __int8)a5
{
  return 0;
}

- (int)playObject:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  int result;

  switch(HIBYTE(a5) & 0x3F)
  {
    case 1:
      result = -[EMFPlusPlayer playBrush:in_size:objectIndex:](self, "playBrush:in_size:objectIndex:", a3, *(_QWORD *)&a4, a5);
      break;
    case 2:
      result = -[EMFPlusPlayer playPen:in_size:objectIndex:](self, "playPen:in_size:objectIndex:", a3, *(_QWORD *)&a4, a5);
      break;
    case 3:
      result = -[EMFPlusPlayer playPath:in_size:objectIndex:](self, "playPath:in_size:objectIndex:", a3, *(_QWORD *)&a4, a5);
      break;
    case 4:
      result = -[EMFPlusPlayer playRegion:in_size:objectIndex:](self, "playRegion:in_size:objectIndex:", a3, *(_QWORD *)&a4, a5);
      break;
    case 5:
      result = -[EMFPlusPlayer playImage:in_size:objectIndex:](self, "playImage:in_size:objectIndex:", a3, *(_QWORD *)&a4, a5);
      break;
    case 6:
      result = -[EMFPlusPlayer playFont:in_size:objectIndex:](self, "playFont:in_size:objectIndex:", a3, *(_QWORD *)&a4, a5);
      break;
    case 7:
      result = -[EMFPlusPlayer playStringFormat:in_size:objectIndex:](self, "playStringFormat:in_size:objectIndex:", a3, *(_QWORD *)&a4, a5);
      break;
    case 8:
      result = -[EMFPlusPlayer playImageAttributes:in_size:objectIndex:](self, "playImageAttributes:in_size:objectIndex:", a3, *(_QWORD *)&a4, a5);
      break;
    case 9:
      result = -[EMFPlusPlayer playCustomLineCap:in_size:objectIndex:](self, "playCustomLineCap:in_size:objectIndex:", a3, *(_QWORD *)&a4, a5);
      break;
    case 0xA:
      result = -[EMFPlusPlayer playGraphics:in_size:objectIndex:](self, "playGraphics:in_size:objectIndex:", a3, *(_QWORD *)&a4, a5);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)canvasInWorldCoordinates
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGContext *v10;
  void *v11;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  -[MFPGraphics canvas](self->mGraphics, "canvas");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = TCCurrentGraphicsContext();
  memset(&v16, 0, sizeof(v16));
  CGContextGetCTM(&v16, v10);
  v14 = v16;
  CGAffineTransformInvert(&v15, &v14);
  v16 = v15;
  +[OITSUBezierPath bezierPathWithRect:](OITSUBezierPath, "bezierPathWithRect:", v3, v5, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;
  objc_msgSend(v11, "transformUsingAffineTransform:", &v13);
  return v11;
}

- (int)playFillPath:(id)a3 in_pData:(const char *)a4 in_size:(unsigned int)a5 in_flags:(unsigned __int16)a6
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MFPSolidBrush *v14;
  uint64_t v15;
  void *v16;
  int v17;

  v9 = a3;
  v10 = *(unsigned __int8 *)a4;
  if ((a6 & 0x8000) != 0)
  {
    +[OITSUColor colorWithBinaryRed:green:blue:alpha:](OITSUColor, "colorWithBinaryRed:green:blue:alpha:", *((unsigned __int8 *)a4 + 2), *((unsigned __int8 *)a4 + 1), *(unsigned __int8 *)a4, *((unsigned __int8 *)a4 + 3));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MFPSolidBrush initWithColor:]([MFPSolidBrush alloc], "initWithColor:", v12);
  }
  else
  {
    -[MFPGraphics objectTable](self->mGraphics, "objectTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_opt_class();
    TSUDynamicCast(v13, (uint64_t)v12);
    v14 = (MFPSolidBrush *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v15 = objc_opt_class();
      TSUDynamicCast(v15, (uint64_t)v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "brush");
      v14 = (MFPSolidBrush *)objc_claimAutoreleasedReturnValue();

    }
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MFPGraphics fillPath:brush:](self->mGraphics, "fillPath:brush:", v9, v14);
    v17 = 0;
  }
  else
  {
    v17 = -1;
  }

  return v17;
}

- (int)playStrokePath:(id)a3 in_pData:(const char *)a4 in_size:(unsigned int)a5 in_flags:(unsigned __int16)a6
{
  unsigned __int8 v6;
  id v8;
  void *v9;
  void *v10;
  int v11;

  v6 = a6;
  v8 = a3;
  -[MFPGraphics objectTable](self->mGraphics, "objectTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MFPGraphics strokePath:pen:](self->mGraphics, "strokePath:pen:", v8, v10);
    v11 = 0;
  }
  else
  {
    v11 = -7;
  }

  return v11;
}

- (int)playClear:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  void *v7;
  void *v8;
  MFPSolidBrush *v9;

  -[EMFPlusPlayer canvasInWorldCoordinates](self, "canvasInWorldCoordinates", a3, *(_QWORD *)&a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUColor colorWithBinaryRed:green:blue:alpha:](OITSUColor, "colorWithBinaryRed:green:blue:alpha:", *((unsigned __int8 *)a3 + 2), *((unsigned __int8 *)a3 + 1), *(unsigned __int8 *)a3, *((unsigned __int8 *)a3 + 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MFPSolidBrush initWithColor:]([MFPSolidBrush alloc], "initWithColor:", v8);
  -[MFPGraphics fillPath:brush:](self->mGraphics, "fillPath:brush:", v7, v9);

  return 0;
}

- (int)playFillEllipse:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v9;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  +[OITSUBezierPath bezierPathWithOvalInRect:](OITSUBezierPath, "bezierPathWithOvalInRect:", readRect((const unsigned __int8 *)a3 + 4, a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[EMFPlusPlayer playFillPath:in_pData:in_size:in_flags:](self, "playFillPath:in_pData:in_size:in_flags:", v9, a3, v6, v5);

  return v5;
}

- (int)playDrawEllipse:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v9;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  +[OITSUBezierPath bezierPathWithOvalInRect:](OITSUBezierPath, "bezierPathWithOvalInRect:", readRect((const unsigned __int8 *)a3, a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[EMFPlusPlayer playStrokePath:in_pData:in_size:in_flags:](self, "playStrokePath:in_pData:in_size:in_flags:", v9, a3, v6, v5);

  return v5;
}

- (int)playFillRects:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  OITSUBezierPath *v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  const unsigned __int8 *v14;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v9 = objc_alloc_init(OITSUBezierPath);
  if (v6 >= 8)
  {
    v11 = *((_DWORD *)a3 + 1);
    if ((v5 & 0x4000) != 0)
      v12 = 8;
    else
      v12 = 16;
    v13 = v11 * (unint64_t)v12;
    v10 = -7;
    if ((v13 & 0xFFFFFFFF00000000) == 0 && v13 <= v6)
    {
      if (v11)
      {
        v14 = (const unsigned __int8 *)(a3 + 8);
        do
        {
          -[OITSUBezierPath appendBezierPathWithRect:](v9, "appendBezierPathWithRect:", readRect(v14, v5));
          v14 += v12;
          --v11;
        }
        while (v11);
      }
      v10 = -[EMFPlusPlayer playFillPath:in_pData:in_size:in_flags:](self, "playFillPath:in_pData:in_size:in_flags:", v9, a3, v6, v5);
    }
  }
  else
  {
    v10 = -7;
  }

  return v10;
}

- (int)playDrawRects:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  int v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  int v14;
  OITSUBezierPath *v15;
  const unsigned __int8 *v16;
  uint64_t v17;

  if (a4 < 4)
    return -7;
  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v9 = *(_DWORD *)a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");
  v12 = (v5 & 0x4000) != 0 ? 3 : 4;
  v13 = ((v9 << v12) + 4);

  if (v11 < v13)
    return -7;
  v15 = objc_alloc_init(OITSUBezierPath);
  if (v9)
  {
    v16 = (const unsigned __int8 *)(a3 + 4);
    if ((v5 & 0x4000) != 0)
      v17 = 8;
    else
      v17 = 16;
    do
    {
      -[OITSUBezierPath appendBezierPathWithRect:](v15, "appendBezierPathWithRect:", readRect(v16, v5));
      v16 += v17;
      --v9;
    }
    while (v9);
  }
  v14 = -[EMFPlusPlayer playStrokePath:in_pData:in_size:in_flags:](self, "playStrokePath:in_pData:in_size:in_flags:", v15, a3, v6, v5);

  return v14;
}

- (int)playFillPolygon:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  OITSUBezierPath *v9;
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  const unsigned __int8 *v14;
  unsigned int v15;
  double Point;

  v5 = a4 - 8;
  if (a4 < 8)
    return -7;
  v7 = a5;
  v9 = objc_alloc_init(OITSUBezierPath);
  v10 = *((_DWORD *)a3 + 1);
  if ((v7 & 0x4000) != 0)
    v11 = 4;
  else
    v11 = 8;
  if (v10)
    v12 = v5 >= v11;
  else
    v12 = 0;
  if (v12)
  {
    v14 = (const unsigned __int8 *)(a3 + 8);
    v15 = 1;
    do
    {
      Point = readPoint(v14, v7);
      if (v15 == 1)
        -[OITSUBezierPath moveToPoint:](v9, "moveToPoint:", Point);
      else
        -[OITSUBezierPath lineToPoint:](v9, "lineToPoint:", Point);
      v13 = (v5 - v11);
      if (v15 >= v10)
        break;
      v14 += v11;
      ++v15;
      LODWORD(v5) = v5 - v11;
    }
    while (v5 >= v11);
  }
  else
  {
    v13 = v5;
  }
  -[OITSUBezierPath closePath](v9, "closePath");
  v6 = -[EMFPlusPlayer playFillPath:in_pData:in_size:in_flags:](self, "playFillPath:in_pData:in_size:in_flags:", v9, a3, v13, v7);

  return v6;
}

- (int)playDrawLines:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  OITSUBezierPath *v9;
  BOOL v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  const unsigned __int8 *v16;
  double Point;

  v5 = a5;
  v9 = objc_alloc_init(OITSUBezierPath);
  v10 = a4 >= 4;
  v11 = a4 - 4;
  if (v10)
  {
    v13 = *(_DWORD *)a3;
    if ((v5 & 0x4000) != 0)
      v14 = 4;
    else
      v14 = 8;
    if (!v13)
    {
LABEL_14:
      v12 = -[EMFPlusPlayer playStrokePath:in_pData:in_size:in_flags:](self, "playStrokePath:in_pData:in_size:in_flags:", v9, a3, v11, v5);
      goto LABEL_15;
    }
    v15 = 0;
    v16 = (const unsigned __int8 *)(a3 + 4);
    while (1)
    {
      v10 = v11 >= v14;
      v11 = (v11 - v14);
      if (!v10)
        break;
      Point = readPoint(v16, v5);
      if (v15)
        -[OITSUBezierPath lineToPoint:](v9, "lineToPoint:", Point);
      else
        -[OITSUBezierPath moveToPoint:](v9, "moveToPoint:", Point);
      v16 += v14;
      if (v13 == ++v15)
        goto LABEL_14;
    }
  }
  v12 = -7;
LABEL_15:

  return v12;
}

- (int)playDrawArc:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  float v9;
  float v10;
  float v11;
  float v12;
  double Rect;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  OITSUBezierPath *v20;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 0);
  v10 = v9;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 4);
  v12 = v11;
  Rect = readRect((const unsigned __int8 *)a3 + 8, v5);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = objc_alloc_init(OITSUBezierPath);
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v20, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 1, 1, Rect, v15, v17, v19, v10, v12);
  LODWORD(v5) = -[EMFPlusPlayer playStrokePath:in_pData:in_size:in_flags:](self, "playStrokePath:in_pData:in_size:in_flags:", v20, a3, v6, v5);

  return v5;
}

- (int)playFillPie:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  float v9;
  float v10;
  float v11;
  float v12;
  double Rect;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  OITSUBezierPath *v20;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 4);
  v10 = v9;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 8);
  v12 = v11;
  Rect = readRect((const unsigned __int8 *)a3 + 12, v5);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = objc_alloc_init(OITSUBezierPath);
  -[OITSUBezierPath moveToPoint:](v20, "moveToPoint:", TSUCenterOfRect(Rect, v15, v17, v19));
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v20, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 1, 0, Rect, v15, v17, v19, v10, v12);
  -[OITSUBezierPath closePath](v20, "closePath");
  LODWORD(v5) = -[EMFPlusPlayer playFillPath:in_pData:in_size:in_flags:](self, "playFillPath:in_pData:in_size:in_flags:", v20, a3, v6, v5);

  return v5;
}

- (int)playDrawPie:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  float v9;
  float v10;
  float v11;
  float v12;
  double Rect;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  OITSUBezierPath *v20;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 0);
  v10 = v9;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 4);
  v12 = v11;
  Rect = readRect((const unsigned __int8 *)a3 + 8, v5);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = objc_alloc_init(OITSUBezierPath);
  -[OITSUBezierPath moveToPoint:](v20, "moveToPoint:", TSUCenterOfRect(Rect, v15, v17, v19));
  -[OITSUBezierPath appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:](v20, "appendBezierPathWithArcWithEllipseBounds:startAngle:swingAngle:angleType:startNewPath:", 1, 0, Rect, v15, v17, v19, v10, v12);
  -[OITSUBezierPath closePath](v20, "closePath");
  LODWORD(v5) = -[EMFPlusPlayer playStrokePath:in_pData:in_size:in_flags:](self, "playStrokePath:in_pData:in_size:in_flags:", v20, a3, v6, v5);

  return v5;
}

- (int)playDrawBeziers:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  unsigned int v5;
  int v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  const unsigned __int8 *v14;
  unsigned int v15;
  unsigned int v16;
  BOOL v17;
  uint64_t v18;
  double Point;
  char *v20;
  uint64_t v21;
  EMFPlusPlayer *v23;
  OITSUBezierPath *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a4 - 4;
  if (a4 >= 4)
  {
    v7 = a5;
    v24 = objc_alloc_init(OITSUBezierPath);
    if ((v7 & 0x4000) != 0)
      v10 = 4;
    else
      v10 = 8;
    v11 = v5 - v10;
    if (v5 >= v10)
    {
      v12 = *(unsigned __int16 *)a3;
      -[OITSUBezierPath moveToPoint:](v24, "moveToPoint:", readPoint((const unsigned __int8 *)a3 + 4, v7));
      v23 = self;
      if ((v12 - 1) < 3)
      {
LABEL_20:
        v6 = -[EMFPlusPlayer playStrokePath:in_pData:in_size:in_flags:](v23, "playStrokePath:in_pData:in_size:in_flags:", v24, a3, v11, v7, v23, a3);
        goto LABEL_21;
      }
      v13 = 0;
      v14 = (const unsigned __int8 *)&a3[v10 + 4];
      if ((v7 & 0x4000) != 0)
        v15 = 12;
      else
        v15 = 24;
      if ((v12 - 1) / 3u <= 1)
        v16 = 1;
      else
        v16 = (v12 - 1) / 3u;
      while (1)
      {
        v17 = v11 >= v15;
        v11 = v11 - v15;
        if (!v17)
          break;
        v18 = 0;
        v25 = *MEMORY[0x24BDBEFB0];
        v26 = v25;
        v27 = v25;
        do
        {
          Point = readPoint(v14, v7);
          v20 = (char *)&v25 + v18;
          *(double *)v20 = Point;
          *((_QWORD *)v20 + 1) = v21;
          v14 += v10;
          v18 += 16;
        }
        while (v18 != 48);
        -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v24, "curveToPoint:controlPoint1:controlPoint2:", v27, v25, v26);
        if (++v13 == v16)
          goto LABEL_20;
      }
    }
    v6 = -7;
LABEL_21:

    return v6;
  }
  return -7;
}

- (int)playFillClosedCurve:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  OITSUBezierPath *v9;
  unsigned int v11;
  float v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  char v16;
  unsigned int v17;
  uint64_t v18;
  int v19;
  float v20;
  double *v21;
  uint64_t v22;
  const unsigned __int8 *v23;
  uint64_t v24;
  double Point;
  double *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v34;
  uint64_t v35;
  unint64_t v37;
  EMFPlusPlayer *v38;
  int v39;
  float64x2_t v40;
  int v41;

  v5 = a5;
  v9 = objc_alloc_init(OITSUBezierPath);
  _CF = a4 >= 0xC;
  v11 = a4 - 12;
  if (_CF
    && ((+[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 4), v13 = *((unsigned __int8 *)a3 + 8), v14 = *((unsigned __int8 *)a3 + 11), v15 = v13 | (unsigned __int16)(*((unsigned __int8 *)a3 + 9) << 8) | (*((unsigned __int8 *)a3 + 10) << 16) & 0xFFFFFF | (v14 << 24), (v5 & 0x4000) != 0)? (v16 = 2): (v16 = 3), v17 = (_DWORD)v15 << v16, v18 = v11 - v17, v11 >= v17))
  {
    v20 = v12;
    v39 = *((unsigned __int8 *)a3 + 9);
    v41 = *((unsigned __int8 *)a3 + 10);
    v21 = (double *)operator new[]();
    if ((_DWORD)v15)
    {
      v37 = __PAIR64__(v18, v13);
      v38 = self;
      v22 = 0;
      v23 = (const unsigned __int8 *)(a3 + 12);
      if ((v5 & 0x4000) != 0)
        v24 = 4;
      else
        v24 = 8;
      do
      {
        Point = readPoint(v23, v5);
        v26 = &v21[v22];
        *v26 = Point;
        *((_QWORD *)v26 + 1) = v27;
        v23 += v24;
        v22 += 2;
      }
      while (2 * v15 != v22);
      -[OITSUBezierPath moveToPoint:](v9, "moveToPoint:", *v21, v21[1]);
      self = v38;
      v13 = v37;
      v18 = HIDWORD(v37);
    }
    v28 = 0;
    v29 = (v14 << 24) + (v41 << 16) + (v39 << 8) + v13 - 1;
    __asm { FMOV            V0.2D, #3.0 }
    v40 = _Q0;
    while (v15 != v28)
    {
      v34 = v28 + 1;
      v35 = (v28 + 1);
      if (v15 - 1 == v28)
        v35 = 0;
      -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v9, "curveToPoint:controlPoint1:controlPoint2:", v21[2 * v35], v21[2 * v35 + 1], vaddq_f64(*(float64x2_t *)&v21[2 * v28], vdivq_f64(vmulq_n_f64(vsubq_f64(*(float64x2_t *)&v21[2 * v35], *(float64x2_t *)&v21[2 * ((v29 + (int)v28) % v15)]), v20), v40)), vaddq_f64(*(float64x2_t *)&v21[2 * v35], vdivq_f64(vmulq_n_f64(vsubq_f64(*(float64x2_t *)&v21[2 * v28], *(float64x2_t *)&v21[2 * (((int)v28 + 2) % v15)]), v20), v40)), v37,
        v38);
      v28 = v34;
    }
    -[OITSUBezierPath closePath](v9, "closePath");
    MEMORY[0x22E2DD3F0](v21, 0x1000C80451B5BE8);
    v19 = -[EMFPlusPlayer playFillPath:in_pData:in_size:in_flags:](self, "playFillPath:in_pData:in_size:in_flags:", v9, a3, v18, v5);
  }
  else
  {
    v19 = -7;
  }

  return v19;
}

- (int)playDrawClosedCurve:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  float v8;
  float v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  int v21;
  OITSUBezierPath *v22;
  uint64_t v23;
  double *v24;
  const unsigned __int8 *v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v36;
  uint64_t v37;
  unsigned int v39;
  int v41;
  const char *v42;
  int v43;
  float64x2_t v44;
  unint64_t v45;

  if (a4 < 8)
    return -7;
  v5 = a5;
  v6 = *(_QWORD *)&a4;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 0);
  v9 = v8;
  v10 = *((unsigned __int8 *)a3 + 4);
  v11 = *((unsigned __int8 *)a3 + 5);
  v12 = *((unsigned __int8 *)a3 + 6);
  v42 = a3;
  v13 = *((unsigned __int8 *)a3 + 7);
  v14 = (v5 & 0x4000) != 0 ? 4 : 8;
  v39 = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v15, "unsignedIntegerValue");
  v16 = v10 | (unsigned __int16)(v11 << 8) | (v12 << 16) & 0xFFFFFF | (v13 << 24);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v11;
  v43 = v10;
  v18 = objc_msgSend(v17, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "unsignedIntegerValue") * v18 + 8;

  if (v45 < v20)
    return -7;
  v22 = objc_alloc_init(OITSUBezierPath);
  v23 = operator new[]();
  v24 = (double *)v23;
  if ((_DWORD)v16)
  {
    v25 = (const unsigned __int8 *)(v42 + 8);
    v26 = (double *)(v23 + 8);
    v27 = v16;
    do
    {
      *(v26 - 1) = readPoint(v25, v5);
      *(_QWORD *)v26 = v28;
      v25 += v14;
      v26 += 2;
      --v27;
    }
    while (v27);
  }
  -[OITSUBezierPath moveToPoint:](v22, "moveToPoint:", *v24, v24[1]);
  v29 = 0;
  v30 = (v13 << 24) + (v12 << 16) + (v41 << 8) + v43 - 1;
  __asm { FMOV            V0.2D, #3.0 }
  v44 = _Q0;
  while (v16 != v29)
  {
    v36 = v29 + 1;
    v37 = (v29 + 1);
    if (v16 - 1 == v29)
      v37 = 0;
    -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v22, "curveToPoint:controlPoint1:controlPoint2:", v24[2 * v37], v24[2 * v37 + 1], vaddq_f64(*(float64x2_t *)&v24[2 * v29], vdivq_f64(vmulq_n_f64(vsubq_f64(*(float64x2_t *)&v24[2 * v37], *(float64x2_t *)&v24[2 * ((v30 + (int)v29) % v16)]), v9), v44)), vaddq_f64(*(float64x2_t *)&v24[2 * v37], vdivq_f64(vmulq_n_f64(vsubq_f64(*(float64x2_t *)&v24[2 * v29], *(float64x2_t *)&v24[2 * (((int)v29 + 2) % v16)]), v9), v44)));
    v29 = v36;
  }
  -[OITSUBezierPath closePath](v22, "closePath");
  MEMORY[0x22E2DD3F0](v24, 0x1000C80451B5BE8);
  v21 = -[EMFPlusPlayer playStrokePath:in_pData:in_size:in_flags:](self, "playStrokePath:in_pData:in_size:in_flags:", v22, v42, v39, v5);

  return v21;
}

- (int)playDrawCurve:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  char v9;
  unsigned int v10;
  float v11;
  uint64_t v12;
  int v13;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  float v19;
  OITSUBezierPath *v20;
  uint64_t v21;
  uint64_t v22;
  const unsigned __int8 *v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v35;
  int v36;
  unsigned int v37;
  unsigned int v38;
  float64x2_t v39;
  unsigned int v40;
  int v41;
  int v42;
  int v43;
  EMFPlusPlayer *v44;
  unsigned int v45;
  int v46;
  float64x2_t v47;
  uint64_t v48;

  if (a4 < 0x10)
    return -7;
  v5 = a5;
  v9 = (a5 & 0x4000) != 0 ? 2 : 3;
  v10 = (a4 - 16) >> v9;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 0);
  v12 = *((unsigned int *)a3 + 3);
  if (v12 > v10)
    return -7;
  v15 = *((unsigned __int8 *)a3 + 4) | (unsigned __int16)(*((unsigned __int8 *)a3 + 5) << 8) | (*((unsigned __int8 *)a3
                                                                                                + 6) << 16) & 0xFFFFFF | (*((unsigned __int8 *)a3 + 7) << 24);
  v16 = *((unsigned int *)a3 + 2);
  v13 = -7;
  v17 = v16 + v15;
  if (!__CFADD__((_DWORD)v16, v15) && v17 >= v16 && v17 <= v12)
  {
    v19 = v11;
    v41 = *((unsigned __int8 *)a3 + 7);
    v42 = *((unsigned __int8 *)a3 + 5);
    v43 = *((unsigned __int8 *)a3 + 6);
    v45 = a4;
    v46 = *((unsigned __int8 *)a3 + 4);
    v44 = self;
    v20 = objc_alloc_init(OITSUBezierPath);
    v21 = operator new[]();
    v22 = v21;
    v48 = v12;
    if ((_DWORD)v12)
    {
      v23 = (const unsigned __int8 *)(a3 + 16);
      if ((v5 & 0x4000) != 0)
        v24 = 4;
      else
        v24 = 8;
      v25 = (double *)(v21 + 8);
      v26 = v48;
      do
      {
        *(v25 - 1) = readPoint(v23, v5);
        *(_QWORD *)v25 = v27;
        v23 += v24;
        v25 += 2;
        --v26;
      }
      while (v26);
    }
    -[OITSUBezierPath moveToPoint:](v20, "moveToPoint:", *(double *)(v22 + 16 * v15), *(double *)(v22 + 16 * v15 + 8));
    if ((_DWORD)v16)
    {
      v28 = 0;
      v29 = (v41 << 24) + (v43 << 16) + (v42 << 8) + v46;
      __asm { FMOV            V0.2D, #3.0 }
      v47 = _Q0;
      v35 = v29;
      do
      {
        v36 = v35;
        if (v35)
          v36 = 1;
        v37 = v29 + v28 - v36;
        v38 = v29 + v28 + 1;
        if (v38 >= (int)v48 - 1)
          v40 = v29 + v28 + 1;
        else
          v40 = v29 + v28 + 2;
        v39 = *(float64x2_t *)(v22 + 16 * (v29 + v28));
        -[OITSUBezierPath curveToPoint:controlPoint1:controlPoint2:](v20, "curveToPoint:controlPoint1:controlPoint2:", *(double *)(v22 + 16 * v38), *(double *)(v22 + 16 * v38 + 8), vaddq_f64(v39, vdivq_f64(vmulq_n_f64(vsubq_f64(*(float64x2_t *)(v22 + 16 * v38), *(float64x2_t *)(v22 + 16 * v37)), v19), v47)), vaddq_f64(*(float64x2_t *)(v22 + 16 * v38), vdivq_f64(vmulq_n_f64(vsubq_f64(v39, *(float64x2_t *)(v22 + 16 * v40)), v19), v47)));
        ++v28;
        ++v35;
      }
      while (v16 != v28);
    }
    MEMORY[0x22E2DD3F0](v22, 0x1000C80451B5BE8);
    v13 = -[EMFPlusPlayer playStrokePath:in_pData:in_size:in_flags:](v44, "playStrokePath:in_pData:in_size:in_flags:", v20, a3, v45, v5);

  }
  return v13;
}

- (int)playDrawPath:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  unsigned __int8 v5;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  MFPGraphics *mGraphics;
  void *v14;

  v5 = a5;
  -[MFPGraphics objectTable](self->mGraphics, "objectTable", a3, *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(unsigned __int8 *)a3;
  -[MFPGraphics objectTable](self->mGraphics, "objectTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  mGraphics = self->mGraphics;
  objc_msgSend(v9, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPGraphics strokePath:pen:](mGraphics, "strokePath:pen:", v14, v12);

  return 0;
}

- (int)playFillPath:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  -[MFPGraphics objectTable](self->mGraphics, "objectTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[EMFPlusPlayer playFillPath:in_pData:in_size:in_flags:](self, "playFillPath:in_pData:in_size:in_flags:", v11, a3, v6, v5);

  return v5;
}

- (int)playDrawImage:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  void *v8;
  void *v9;
  uint64_t v10;

  -[MFPGraphics objectTable](self->mGraphics, "objectTable", a3, *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *((unsigned __int16 *)a3 + 2);
  readFloat32Rect((const unsigned __int8 *)a3 + 8);
  objc_msgSend(v9, "drawInRect:fromRect:unit:effect:", v10, self->mEffect, readRect((const unsigned __int8 *)a3 + 24, a5));

  return 0;
}

- (int)playDrawImagePoints:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  double Float32Rect;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  const char *v20;
  char v21;
  float64_t *v22;
  uint64_t v23;
  CGContext *v24;
  uint64_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  int v30;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform transform;
  CGAffineTransform v35;
  float64x2_t v36[3];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[MFPGraphics objectTable](self->mGraphics, "objectTable", a3, *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *((unsigned __int16 *)a3 + 2);
  Float32Rect = readFloat32Rect((const unsigned __int8 *)a3 + 8);
  if (*((_WORD *)a3 + 12) == 3)
  {
    v15 = Float32Rect;
    v16 = v12;
    v17 = v13;
    v18 = v14;
    v19 = 0;
    v20 = a3 + 28;
    if ((a5 & 0x4000) != 0)
      v21 = 2;
    else
      v21 = 3;
    v22 = &v36[0].f64[1];
    do
    {
      *(v22 - 1) = readPoint((const unsigned __int8 *)&v20[(_DWORD)v19 << v21], a5);
      *(_QWORD *)v22 = v23;
      ++v19;
      v22 += 2;
    }
    while (v19 != 3);
    v24 = TCCurrentGraphicsContext();
    CGContextSaveGState(v24);
    memset(&v35, 0, sizeof(v35));
    CGContextGetCTM(&v35, v24);
    v33 = v35;
    CGAffineTransformInvert(&transform, &v33);
    CGContextConcatCTM(v24, &transform);
    v25 = 0;
    v26 = *(float64x2_t *)&v35.a;
    v27 = *(float64x2_t *)&v35.c;
    v28 = *(float64x2_t *)&v35.tx;
    do
    {
      v36[v25] = vaddq_f64(v28, vmlaq_n_f64(vmulq_n_f64(v27, v36[v25].f64[1]), v26, v36[v25].f64[0]));
      ++v25;
    }
    while (v25 != 3);
    v29 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
    *(float64x2_t *)&v32.a = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vsubq_f64(v36[1], v36[0]), v29)));
    *(float64x2_t *)&v32.c = vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vsubq_f64(v36[2], v36[0]), v29)));
    *(float64x2_t *)&v32.tx = vcvtq_f64_f32(vcvt_f32_f64(v36[0]));
    CGContextConcatCTM(v24, &v32);
    objc_msgSend(v9, "drawInRect:fromRect:unit:effect:", v10, self->mEffect, 0.0, 0.0, 100.0, 100.0, v15, v16, v17, v18);
    CGContextRestoreGState(v24);
    v30 = 0;
  }
  else
  {
    v30 = -7;
  }

  return v30;
}

+ (float)firstTabPosPastPos:(float)a3 stringFormat:(id)a4 isExplicit:(BOOL *)a5
{
  id v7;
  void *v8;
  int v9;
  float v10;
  float v11;
  int v12;
  uint64_t v13;
  int v14;

  v7 = a4;
  v8 = v7;
  if (a5)
    *a5 = 0;
  if (!v7)
    goto LABEL_16;
  v9 = objc_msgSend(v7, "tabStopCount");
  objc_msgSend(v8, "firstTabOffset");
  if (v9 < 1 || (v11 = v10, v10 < 0.0))
  {
    if (a5)
      *a5 = 0;
LABEL_16:
    v11 = a3;
    goto LABEL_17;
  }
  v12 = 0;
  do
  {
    if (a5)
      *a5 = v12 < v9;
    v13 = objc_msgSend(v8, "tabStops");
    if (v12 >= v9 - 1)
      v14 = v9 - 1;
    else
      v14 = v12;
    v11 = v11 + *(float *)(v13 + 4 * v14);
    ++v12;
  }
  while (v11 <= a3);
LABEL_17:

  return v11;
}

- (int)playDrawString:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v6;
  int v7;
  void *v10;
  void *v11;
  const __CTFont *v12;
  CGFloat Size;
  CGFloat Ascent;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CGContext *v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  __int16 v24;
  double Float32Rect;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  unsigned int v32;
  int v33;
  int v34;
  double v35;
  double Descent;
  CGFloat Leading;
  double Width;
  float AdvancesForGlyphs;
  float v40;
  unsigned int v41;
  uint64_t v42;
  _OWORD *v43;
  float v44;
  float v45;
  _OWORD *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  unsigned int v62;
  CFIndex v63;
  UniChar *v64;
  int v65;
  CGGlyph *v66;
  CGSize *v67;
  unsigned int v68;
  double v69;
  int v70;
  double v71;
  double v72;
  BOOL v73;
  float v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  uint64_t v78;
  unsigned int v79;
  float v80;
  float v81;
  float v82;
  _OWORD *v83;
  char *v84;
  char *v85;
  _OWORD *v86;
  char *v87;
  char *v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  char *v96;
  char *v97;
  char *v98;
  char *v99;
  uint64_t v100;
  char *v101;
  char *v102;
  char *v103;
  uint64_t v104;
  char *v105;
  char *v106;
  double MinY;
  double Height;
  CGFloat v109;
  unint64_t v110;
  float v111;
  unsigned int v112;
  float v113;
  unsigned int v114;
  double v115;
  double MaxY;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  unsigned int v123;
  double v124;
  double v125;
  CGFloat v126;
  float v127;
  float v128;
  BOOL v129;
  float v130;
  float v131;
  double MinX;
  double MaxX;
  uint64_t *v134;
  uint64_t v135;
  float v136;
  uint64_t v137;
  float v138;
  float v139;
  float v140;
  float v141;
  CGContext *v142;
  CGContext *v143;
  CGContext *v144;
  CGFloat v145;
  float v146;
  float v147;
  float *v148;
  float v149;
  float v150;
  double v151;
  float v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  float v156;
  void *v157;
  uint64_t v158;
  unint64_t v159;
  float v160;
  double v161;
  float v162;
  double v165;
  CGContext *v166;
  double v167;
  CGFloat v168;
  CGFloat v169;
  CGFloat v170;
  float v171;
  float v172;
  CGContext *v173;
  float v174;
  CGContext *v175;
  CGGlyph *v176;
  CGContext *v177;
  double v179;
  double v180;
  double v181;
  double v182;
  int v183;
  double v184;
  double v185;
  double v186;
  int v187;
  float v188;
  void *v189;
  void *v190;
  CGFont *font;
  char v192;
  float rect;
  double recta;
  void *v195;
  unsigned int v196;
  float v197;
  float v198;
  CGGlyph *v199;
  double v200;
  void *v201;
  int v202;
  float v203;
  UniChar *v204;
  float v205;
  unint64_t v206;
  float v207;
  void *v208;
  char v209;
  float v210;
  float v211;
  CGPoint Lpositions;
  UniChar v213;
  CGGlyph v214;
  char *v215;
  char *v216;
  char *v217;
  UniChar characters;
  CGGlyph glyphs[5];
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;

  if (a4 < 0x1C)
    return -7;
  v206 = *((unsigned __int16 *)a3 + 4);
  v6 = (2 * v206);
  if ((int)v6 + 28 > a4)
    return -7;
  -[MFPGraphics objectTable](self->mGraphics, "objectTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v192 = objc_msgSend(v11, "flags");
  v12 = (const __CTFont *)objc_msgSend(v11, "createCTFontWithGraphics:", self->mGraphics);
  Size = CTFontGetSize(v12);
  Ascent = CTFontGetAscent(v12);
  v15 = *(unsigned __int8 *)a3;
  if ((a5 & 0x8000) == 0)
  {
    -[MFPGraphics objectTable](self->mGraphics, "objectTable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "color");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      goto LABEL_6;
LABEL_9:
    v7 = 0;
    goto LABEL_191;
  }
  +[OITSUColor colorWithBinaryRed:green:blue:alpha:](OITSUColor, "colorWithBinaryRed:green:blue:alpha:", *((unsigned __int8 *)a3 + 2), *((unsigned __int8 *)a3 + 1), *(unsigned __int8 *)a3, *((unsigned __int8 *)a3 + 3));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_9;
LABEL_6:
  v19 = TCCurrentGraphicsContext();
  CGContextSaveGState(v19);
  objc_msgSend(v18, "set");
  v189 = v18;
  v190 = v11;
  v20 = *((unsigned __int8 *)a3 + 4);
  v21 = *((unsigned __int8 *)a3 + 5);
  -[MFPGraphics objectTable](self->mGraphics, "objectTable");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndex:", v20 | (v21 << 8));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "formatFlags");
  v181 = Ascent;
  v182 = Size;
  Float32Rect = readFloat32Rect((const unsigned __int8 *)a3 + 12);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v208 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3 + 28, v6, CFStringConvertEncodingToNSStringEncoding(0x14000100u));
  v201 = v23;
  if (v23)
  {
    v187 = objc_msgSend(v23, "alignment");
    v32 = v206;
    v33 = objc_msgSend(v23, "lineAlignment");
    v34 = objc_msgSend(v23, "trimming");
  }
  else
  {
    v33 = 0;
    v187 = 0;
    v34 = 1;
    v32 = v206;
  }
  v35 = CTFontGetAscent(v12);
  Descent = CTFontGetDescent(v12);
  Leading = CTFontGetLeading(v12);
  Width = 1000000.0;
  if ((v24 & 0x1000) == 0)
  {
    v220.origin.x = Float32Rect;
    v220.origin.y = v27;
    v220.size.width = v29;
    v220.size.height = v31;
    if (CGRectGetWidth(v220) > 0.0)
    {
      v221.origin.x = Float32Rect;
      v221.origin.y = v27;
      v221.size.width = v29;
      v221.size.height = v31;
      Width = CGRectGetWidth(v221);
    }
  }
  characters = 32;
  font = CTFontCopyGraphicsFont(v12, 0);
  CTFontGetGlyphsForCharacters(v12, &characters, glyphs, 1);
  v185 = Leading;
  v183 = v33;
  AdvancesForGlyphs = CTFontGetAdvancesForGlyphs(v12, kCTFontOrientationDefault, glyphs, 0, 1);
  rect = AdvancesForGlyphs;
  if ((v24 & 0x800) != 0)
    v40 = AdvancesForGlyphs;
  else
    v40 = 0.0;
  v215 = 0;
  v216 = 0;
  v217 = 0;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" \t\n"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
LABEL_123:
    v106 = v215;
    v105 = v216;
    v222.origin.x = Float32Rect;
    v222.origin.y = v27;
    v222.size.width = v29;
    v222.size.height = v31;
    MinY = CGRectGetMinY(v222);
    v223.origin.x = Float32Rect;
    v223.origin.y = v27;
    v223.size.width = v29;
    v223.size.height = v31;
    Height = CGRectGetHeight(v223);
    v224.origin.x = Float32Rect;
    v224.origin.y = v27;
    v224.size.width = v29;
    v224.size.height = v31;
    v109 = CGRectGetHeight(v224);
    v110 = v105 - v106;
    v111 = v35 + Descent + v185;
    v203 = v111;
    v112 = (float)(v111 * (float)(v110 >> 3));
    v113 = MinY + Height * (double)v183 * 0.5 - (double)(v183 * v112) * 0.5;
    v207 = v113;
    v114 = (v110 >> 3) - 1;
    if (v109 <= 0.0
      || (v225.origin.x = Float32Rect,
          v225.origin.y = v27,
          v225.size.width = v29,
          v225.size.height = v31,
          CGRectGetHeight(v225) >= (double)v112))
    {
      v123 = 0;
    }
    else
    {
      v226.origin.x = Float32Rect;
      v226.origin.y = v27;
      v226.size.width = v29;
      v226.size.height = v31;
      v115 = CGRectGetMinY(v226);
      v227.origin.x = Float32Rect;
      v227.origin.y = v27;
      v227.size.width = v29;
      v227.size.height = v31;
      MaxY = CGRectGetMaxY(v227);
      v117 = (v115 - v207) / v203;
      v118 = floorf(v117);
      v119 = ceilf(v117);
      if ((v24 & 0x2000) == 0)
        v119 = v118;
      v120 = (MaxY - v207) / v203;
      v121 = ceilf(v120);
      v122 = floorf(v120);
      if ((v24 & 0x2000) == 0)
        v122 = v121;
      if (v114 >= v119)
        v123 = v119;
      else
        v123 = (v110 >> 3) - 1;
      if (v114 >= v122)
        v114 = v122;
    }
    v228.origin.x = Float32Rect;
    v228.origin.y = v27;
    v228.size.width = v29;
    v228.size.height = v31;
    if (CGRectGetWidth(v228) != 0.0
      || (v229.origin.x = Float32Rect,
          v229.origin.y = v27,
          v229.size.width = v29,
          v229.size.height = v31,
          CGRectGetHeight(v229) != 0.0))
    {
      v230.origin.x = Float32Rect;
      v230.origin.y = v27;
      v230.size.width = v29;
      v230.size.height = v31;
      v124 = CGRectGetMinY(v230);
      v231.origin.x = Float32Rect;
      v231.origin.y = v27;
      v231.size.width = v29;
      v231.size.height = v31;
      v125 = CGRectGetMaxY(v231);
      v232.origin.x = Float32Rect;
      v232.origin.y = v27;
      v232.size.width = v29;
      v232.size.height = v31;
      v126 = CGRectGetHeight(v232);
      v129 = v126 == 0.0;
      if (v126 == 0.0)
      {
        v130 = v207;
      }
      else
      {
        v127 = v124;
        v130 = v127;
      }
      v210 = v130;
      if (v129)
      {
        v131 = (float)v112 + v207;
      }
      else
      {
        v128 = v125;
        v131 = v128;
      }
      v233.origin.x = Float32Rect;
      v233.origin.y = v27;
      v233.size.width = v29;
      v233.size.height = v31;
      MinX = CGRectGetMinX(v233);
      v234.origin.x = Float32Rect;
      v234.origin.y = v27;
      v234.size.width = v29;
      v234.size.height = v31;
      MaxX = CGRectGetMaxX(v234);
      v235.origin.x = Float32Rect;
      v235.origin.y = v27;
      v235.size.width = v29;
      v235.size.height = v31;
      if (CGRectGetWidth(v235) == 0.0)
      {
        if ((v110 >> 3))
        {
          v134 = (uint64_t *)v215;
          v135 = (v110 >> 3);
          v136 = 0.0;
          do
          {
            v137 = *v134++;
            v138 = *(float *)(v137 + 24) + *(float *)(v137 + 28);
            if (v138 > v136)
              v136 = v138;
            --v135;
          }
          while (v135);
        }
        else
        {
          v136 = 0.0;
        }
        v236.origin.x = Float32Rect;
        v236.origin.y = v27;
        v236.size.width = v29;
        v236.size.height = v31;
        v139 = CGRectGetMinX(v236) + (float)(v136 * (float)v187) * -0.5;
        v140 = v136 + v139;
      }
      else
      {
        v139 = MinX;
        v140 = MaxX;
      }
      v141 = v140 - v139;
      if ((float)(v140 - v139) > 0.0 && (float)(v131 - v210) > 0.0)
      {
        v142 = TCCurrentGraphicsContext();
        v237.origin.x = v139;
        v237.origin.y = v210;
        v237.size.width = v141;
        v237.size.height = (float)(v131 - v210);
        CGContextClipToRect(v142, v237);
      }
    }
    v143 = TCCurrentGraphicsContext();
    CGContextSetFont(v143, font);
    v144 = TCCurrentGraphicsContext();
    v145 = CTFontGetSize(v12);
    CGContextSetFontSize(v144, v145);
    if (v123 > v114)
    {
LABEL_157:
      v7 = 0;
      goto LABEL_188;
    }
    v146 = v182;
    v147 = v181;
    v200 = (double)v187;
    v197 = v147;
    v198 = (float)v187;
    recta = (float)(v146 / 12.0);
    v188 = v146 / 10.0;
    v184 = v146 * 0.05;
    v186 = v146;
    while (1)
    {
      v148 = *(float **)&v215[8 * v123];
      v149 = v148[6];
      v150 = v148[7];
      v238.origin.x = Float32Rect;
      v238.origin.y = v27;
      v238.size.width = v29;
      v238.size.height = v31;
      v151 = CGRectGetMinX(v238);
      v239.origin.x = Float32Rect;
      v239.origin.y = v27;
      v239.size.width = v29;
      v239.size.height = v31;
      v152 = v151 + CGRectGetWidth(v239) * v200 * 0.5 - ((float)((float)(v149 + v150) * v198) * 0.5 + 0.0);
      v211 = v152;
      v205 = v207 + (float)((float)v123 * v203);
      v153 = *(_QWORD *)v148;
      if (*((_QWORD *)v148 + 1) != *(_QWORD *)v148)
        break;
LABEL_178:
      v171 = v205 + v197;
      if ((v192 & 4) != 0)
      {
        v172 = v148[6];
        v173 = TCCurrentGraphicsContext();
        v242.size.width = v172;
        v242.origin.y = (float)(v188 + v171);
        v242.origin.x = v211;
        v242.size.height = recta;
        CGContextFillRect(v173, v242);
      }
      if ((v192 & 8) != 0)
      {
        v174 = v148[6];
        v175 = TCCurrentGraphicsContext();
        v243.size.width = v174;
        v243.origin.x = v211;
        v243.origin.y = v171 + v186 * -0.28;
        v243.size.height = v184;
        CGContextFillRect(v175, v243);
      }
      if (++v123 > v114)
        goto LABEL_157;
    }
    v154 = 0;
    while (1)
    {
      v155 = *(_QWORD *)(v153 + 8 * v154);
      v156 = *(float *)v155;
      v157 = malloc_type_malloc(*(_QWORD *)(v155 + 16) - *(_QWORD *)(v155 + 8), 0x1000040BDFB0063uLL);
      if (!v157)
        goto LABEL_187;
      v158 = *(_QWORD *)(v155 + 8);
      if (*(_QWORD *)(v155 + 16) != v158)
        break;
LABEL_177:
      free(v157);
      ++v154;
      v153 = *(_QWORD *)v148;
      if (v154 >= (uint64_t)(*((_QWORD *)v148 + 1) - *(_QWORD *)v148) >> 3)
        goto LABEL_178;
    }
    v159 = 0;
    v160 = v156 + v211;
    while (1)
    {
      v213 = 0;
      v213 = *(_WORD *)(v158 + 2 * v159);
      CTFontGetGlyphsForCharacters(v12, &v213, &v214, 1);
      v161 = CTFontGetAdvancesForGlyphs(v12, kCTFontOrientationDefault, &v214, 0, 1);
      v240.origin.x = Float32Rect;
      v240.origin.y = v27;
      v240.size.width = v29;
      v240.size.height = v31;
      v162 = v161;
      if (CGRectGetWidth(v240) <= 0.0 || (v24 & 0x1000) == 0 || v34 == 0)
      {
        v165 = v160;
      }
      else
      {
        v167 = Float32Rect;
        v168 = v27;
        v169 = v29;
        v170 = v31;
        v165 = v160;
        if (CGRectGetMinX(*(CGRect *)&v167) > v160)
          goto LABEL_176;
        v241.origin.x = Float32Rect;
        v241.origin.y = v27;
        v241.size.width = v29;
        v241.size.height = v31;
        if (CGRectGetMaxX(v241) < (float)(v160 + v162))
          goto LABEL_176;
      }
      Lpositions.x = v165;
      Lpositions.y = v205;
      v166 = TCCurrentGraphicsContext();
      CGContextShowGlyphsAtPositions(v166, &v214, &Lpositions, 1uLL);
LABEL_176:
      v160 = v160 + v162;
      ++v159;
      v158 = *(_QWORD *)(v155 + 8);
      if (v159 >= (*(_QWORD *)(v155 + 16) - v158) >> 1)
        goto LABEL_177;
    }
  }
  v179 = Descent;
  v180 = v35;
  v41 = 0;
  v42 = 0;
  v202 = 0;
  v43 = 0;
  v44 = Width;
  v209 = 1;
  v45 = 0.0;
  while (1)
  {
    while (1)
    {
      if (!v43)
      {
        v46 = (_OWORD *)operator new();
        v43 = v46;
        *v46 = 0u;
        v46[1] = 0u;
        v47 = v216;
        if (v216 >= v217)
        {
          v49 = (v216 - v215) >> 3;
          if ((unint64_t)(v49 + 1) >> 61)
            std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
          v50 = (v217 - v215) >> 2;
          if (v50 <= v49 + 1)
            v50 = v49 + 1;
          if ((unint64_t)(v217 - v215) >= 0x7FFFFFFFFFFFFFF8)
            v51 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v51 = v50;
          if (v51)
            v52 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>((uint64_t)&v217, v51);
          else
            v52 = 0;
          v53 = &v52[8 * v49];
          *(_QWORD *)v53 = v43;
          v48 = v53 + 8;
          v55 = v215;
          v54 = v216;
          if (v216 != v215)
          {
            do
            {
              v56 = *((_QWORD *)v54 - 1);
              v54 -= 8;
              *((_QWORD *)v53 - 1) = v56;
              v53 -= 8;
            }
            while (v54 != v55);
            v54 = v215;
          }
          v215 = v53;
          v216 = v48;
          v217 = &v52[8 * v51];
          if (v54)
            operator delete(v54);
        }
        else
        {
          *(_QWORD *)v216 = v46;
          v48 = v47 + 8;
        }
        v216 = v48;
      }
      v57 = objc_msgSend(v208, "characterAtIndex:", v41, *(_QWORD *)&v179, *(_QWORD *)&v180);
      if (v57 == 9)
      {
        if (v41 + 1 >= v32)
          v59 = 0;
        else
          v59 = objc_msgSend(v208, "characterAtIndex:", v41 + 1);
        v70 = objc_msgSend(v195, "characterIsMember:", v59);
        LOBYTE(Lpositions.x) = 0;
        *(float *)&v71 = v45;
        +[EMFPlusPlayer firstTabPosPastPos:stringFormat:isExplicit:](EMFPlusPlayer, "firstTabPosPastPos:stringFormat:isExplicit:", v201, &Lpositions, v71);
        v45 = *(float *)&v72;
        v73 = *(float *)&v72 < v44 || LOBYTE(Lpositions.x) == 0;
        v58 = v73;
        if (v73)
        {
          if (*(float *)&v72 <= v44)
          {
            v209 &= v42 ^ 1;
            if (v70)
            {
              v75 = 0;
              *((_DWORD *)v43 + 6) = LODWORD(v72);
            }
            else
            {
              v75 = v202;
            }
          }
          else
          {
            *((float *)v43 + 7) = v40 * (float)v202;
            LODWORD(v72) = 0;
            +[EMFPlusPlayer firstTabPosPastPos:stringFormat:isExplicit:](EMFPlusPlayer, "firstTabPosPastPos:stringFormat:isExplicit:", v201, 0, v72);
            v45 = v74;
            v43 = 0;
            v75 = 0;
            v209 = 1;
          }
        }
        else
        {
          if (v206 <= v41 + 1)
            v76 = v41 + 1;
          else
            v76 = v206;
          v77 = v76 - 1;
          v78 = -1;
          while ((unint64_t)v41 + v78 + 2 < v206)
          {
            ++v78;
            if (objc_msgSend(v208, "characterAtIndex:") != 32)
            {
              v77 = v41 + v78;
              break;
            }
          }
          v75 = 0;
          *((float *)v43 + 6) = v45;
          *((float *)v43 + 7) = rect * (float)(v77 - v41);
          v45 = 0.0;
          v209 = 1;
          v41 = v77;
          v43 = 0;
        }
        v202 = v75;
        goto LABEL_120;
      }
      if (v57 == 10)
      {
        v58 = 0;
        *((float *)v43 + 7) = v40 * (float)v202;
        v45 = 0.0;
        v209 = 1;
        v43 = 0;
        v202 = 0;
        goto LABEL_120;
      }
      if (v57 != 32)
        break;
      v58 = 0;
      v209 = 0;
      v45 = v45 + rect;
      ++v202;
LABEL_120:
      ++v41;
      v42 = v58;
      v32 = v206;
      if (v41 >= v206)
        goto LABEL_121;
    }
    v60 = v42;
    v61 = objc_msgSend(v208, "rangeOfCharacterFromSet:options:range:", v195, 0, v41, v32 - v41);
    if (v61 == -1)
      v62 = v32;
    else
      v62 = v61;
    v196 = v62;
    v63 = v62 - v41;
    v64 = (UniChar *)malloc_type_malloc(2 * (v63 + 1), 0x1000040BDFB0063uLL);
    v65 = v202;
    if (!v64)
      goto LABEL_187;
    v66 = (CGGlyph *)malloc_type_malloc(2 * v63, 0x1000040BDFB0063uLL);
    if (!v66)
      break;
    v199 = v66;
    v204 = v64;
    v67 = (CGSize *)malloc_type_malloc(16 * v63, 0x1000040451B5BE8uLL);
    if (!v67)
    {
      free(v204);
      v176 = v199;
      goto LABEL_186;
    }
    objc_msgSend(v208, "getCharacters:range:", v204, v41, v63);
    CTFontGetGlyphsForCharacters(v12, v204, v199, v63);
    CTFontGetAdvancesForGlyphs(v12, kCTFontOrientationDefault, v199, v67, v63);
    if (v196 == v41)
    {
      v68 = 0;
      *(float *)&v69 = v45;
    }
    else
    {
      v79 = 0;
      v68 = 0;
      v80 = v45;
      *(float *)&v69 = v45;
      do
      {
        v81 = v67[v79].width;
        v45 = v80 + v81;
        if ((float)(v80 + v81) <= v44)
        {
          ++v79;
        }
        else
        {
          v82 = v80 - *(float *)&v69;
          if ((v209 & 1) != 0)
          {
            EMFPlusDrawStringLine::addWord((EMFPlusDrawStringLine *)v43, *(float *)&v69, v80 - *(float *)&v69, &v204[v68], v79 - v68);
            *((float *)v43 + 6) = v80;
            *((_DWORD *)v43 + 7) = 0;
            v83 = (_OWORD *)operator new();
            v43 = v83;
            *v83 = 0u;
            v83[1] = 0u;
            v84 = v216;
            if (v216 >= v217)
            {
              v93 = (v216 - v215) >> 3;
              if ((unint64_t)(v93 + 1) >> 61)
LABEL_193:
                std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
              v94 = (v217 - v215) >> 2;
              if (v94 <= v93 + 1)
                v94 = v93 + 1;
              if ((unint64_t)(v217 - v215) >= 0x7FFFFFFFFFFFFFF8)
                v95 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v95 = v94;
              if (v95)
                v96 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>((uint64_t)&v217, v95);
              else
                v96 = 0;
              v101 = &v96[8 * v93];
              *(_QWORD *)v101 = v43;
              v85 = v101 + 8;
              v103 = v215;
              v102 = v216;
              if (v216 != v215)
              {
                do
                {
                  v104 = *((_QWORD *)v102 - 1);
                  v102 -= 8;
                  *((_QWORD *)v101 - 1) = v104;
                  v101 -= 8;
                }
                while (v102 != v103);
                v102 = v215;
              }
              v215 = v101;
              v216 = v85;
              v217 = &v96[8 * v95];
              if (v102)
                operator delete(v102);
            }
            else
            {
              *(_QWORD *)v216 = v83;
              v85 = v84 + 8;
            }
            v65 = 0;
            v60 = 0;
            v216 = v85;
            v209 = 1;
            LODWORD(v69) = 0;
            v68 = v79;
            v45 = 0.0;
          }
          else
          {
            *((float *)v43 + 7) = v40 * (float)v65;
            v86 = (_OWORD *)operator new();
            v43 = v86;
            HIDWORD(v69) = 0;
            *v86 = 0u;
            v86[1] = 0u;
            v87 = v216;
            if (v216 >= v217)
            {
              v89 = (v216 - v215) >> 3;
              if ((unint64_t)(v89 + 1) >> 61)
                goto LABEL_193;
              v90 = (v217 - v215) >> 2;
              if (v90 <= v89 + 1)
                v90 = v89 + 1;
              if ((unint64_t)(v217 - v215) >= 0x7FFFFFFFFFFFFFF8)
                v91 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v91 = v90;
              if (v91)
                v92 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>((uint64_t)&v217, v91);
              else
                v92 = 0;
              v97 = &v92[8 * v89];
              *(_QWORD *)v97 = v43;
              v88 = v97 + 8;
              v99 = v215;
              v98 = v216;
              if (v216 != v215)
              {
                do
                {
                  v100 = *((_QWORD *)v98 - 1);
                  v98 -= 8;
                  *((_QWORD *)v97 - 1) = v100;
                  v97 -= 8;
                }
                while (v98 != v99);
                v98 = v215;
              }
              v215 = v97;
              v216 = v88;
              v217 = &v92[8 * v91];
              if (v98)
                operator delete(v98);
            }
            else
            {
              *(_QWORD *)v216 = v86;
              v88 = v87 + 8;
            }
            v216 = v88;
            LODWORD(v69) = 0;
            if ((v60 & 1) != 0)
              +[EMFPlusPlayer firstTabPosPastPos:stringFormat:isExplicit:](EMFPlusPlayer, "firstTabPosPastPos:stringFormat:isExplicit:", v201, 0, v69);
            v65 = 0;
            v60 = 0;
            v45 = v82 + *(float *)&v69;
            v209 = 1;
          }
        }
        v80 = v45;
      }
      while (v79 < v63);
    }
    if (v68 < v63)
    {
      EMFPlusDrawStringLine::addWord((EMFPlusDrawStringLine *)v43, *(float *)&v69, v45 - *(float *)&v69, &v204[v68], v63 - v68);
      v65 = 0;
      v60 = 0;
      v209 = 0;
      *((float *)v43 + 6) = v45;
      *((_DWORD *)v43 + 7) = 0;
    }
    v202 = v65;
    free(v204);
    free(v199);
    free(v67);
    v41 = v196;
    v32 = v206;
    v42 = v60;
    if (v196 >= v206)
    {
LABEL_121:
      Descent = v179;
      v35 = v180;
      if (objc_msgSend(v208, "characterAtIndex:", v32 - 1) != 10)
        *((float *)v43 + 7) = v40 * (float)v202;
      goto LABEL_123;
    }
  }
  v176 = v64;
LABEL_186:
  free(v176);
LABEL_187:
  v7 = -4;
LABEL_188:
  CFRelease(font);
  CFRelease(v12);
  v177 = TCCurrentGraphicsContext();
  CGContextRestoreGState(v177);
  destroyPointerVectorElements<EMFPlusDrawStringLine>((uint64_t *)&v215);

  if (v215)
  {
    v216 = v215;
    operator delete(v215);
  }

  v18 = v189;
  v11 = v190;
LABEL_191:

  return v7;
}

- (int)playDrawDriverString:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  unsigned __int8 v5;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  CGFloat a;
  double v19;
  double c;
  double v21;
  double ty;
  double tx;
  char v24;
  unsigned int v25;
  unsigned int v26;
  void *v27;
  int v28;
  int v29;
  char v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  float v34;
  float v35;
  void *v36;
  double v37;
  double v38;
  int v39;
  CGContext *v40;
  void *v41;
  void *v42;
  const __CTFont *v43;
  CGFont *v44;
  double Ascent;
  CGContext *v46;
  CGContext *v47;
  CGFloat Size;
  float v49;
  double v50;
  CGContext *v51;
  float v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  CGContext *v57;
  CGContext *v58;
  double v60;
  double v61;
  CGFloat v62;
  CGFloat d;
  CGFloat b;
  double v65;
  float v66;
  void *v67;
  CGGlyph glyphs;
  UniChar characters;
  CGAffineTransform transform;
  CGAffineTransform v71;
  CGAffineTransform v72;
  void *v73[5];

  if (a4 < 4)
    return 0;
  v5 = a5;
  v9 = *(unsigned __int8 *)a3;
  if ((a5 & 0x8000) != 0)
  {
    +[OITSUColor colorWithBinaryRed:green:blue:alpha:](OITSUColor, "colorWithBinaryRed:green:blue:alpha:", *((unsigned __int8 *)a3 + 2), *((unsigned __int8 *)a3 + 1), v9, *((unsigned __int8 *)a3 + 3));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
      goto LABEL_7;
    return 0;
  }
  -[MFPGraphics objectTable](self->mGraphics, "objectTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  TSUDynamicCast(v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  TSUDynamicCast(v14, (uint64_t)v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v13 && v15)
  {
    objc_msgSend(v15, "brush");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "color");
  v17 = objc_claimAutoreleasedReturnValue();

  if (!v17)
    return 0;
LABEL_7:
  a = *MEMORY[0x24BDBD8B8];
  v19 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
  c = *(double *)(MEMORY[0x24BDBD8B8] + 16);
  v21 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
  tx = *(double *)(MEMORY[0x24BDBD8B8] + 32);
  ty = *(double *)(MEMORY[0x24BDBD8B8] + 40);
  v67 = (void *)v17;
  if (a4 < 0xA)
  {
    v25 = 0;
    v24 = 0;
LABEL_15:
    v27 = 0;
    v28 = 0;
    v26 = 16;
    goto LABEL_16;
  }
  v24 = a3[8];
  if (a4 < 0xE)
  {
    v25 = 0;
    goto LABEL_15;
  }
  v25 = *((unsigned __int16 *)a3 + 6);
  v26 = 2 * v25 + 16;
  if (v26 <= a4)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3 + 16, 2 * v25, CFStringConvertEncodingToNSStringEncoding(0x14000100u));
    v28 = 1;
  }
  else
  {
    v27 = 0;
    v28 = 0;
  }
LABEL_16:
  std::vector<CGPoint>::vector(v73, v25);
  v30 = v28 ^ 1;
  if (!v25)
    v30 = 1;
  if ((v30 & 1) != 0)
  {
    if (v28)
      goto LABEL_25;
  }
  else if (v26 + 16 * v25 <= a4)
  {
    v31 = 0;
    v32 = &a3[v26];
    v33 = v32;
    do
    {
      +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", v33, 0);
      *(double *)((char *)v73[0] + v31) = v34;
      +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", v33 + 4, 0);
      *(double *)((char *)v73[0] + v31 + 8) = v35;
      v31 += 16;
      v33 += 8;
    }
    while (16 * v25 != v31);
    if ((v24 & 1) != 0)
    {
      v36 = v67;
      readAffineTransform((const unsigned __int8 *)&v32[8 * v25], &v72.a);
      a = v72.a;
      c = v72.c;
      v71.a = v72.a;
      v71.b = v72.b;
      d = v72.d;
      b = v72.b;
      v71.c = v72.c;
      v71.d = v72.d;
      v71.tx = 0.0;
      v71.ty = 0.0;
      CGAffineTransformInvert(&v72, &v71);
      v37 = v72.a;
      v19 = v72.b;
      v38 = v72.c;
      v21 = v72.d;
      v62 = 0.0;
      v39 = 1;
      v65 = 0.0;
      tx = v72.tx;
      ty = v72.ty;
      goto LABEL_26;
    }
LABEL_25:
    v39 = 0;
    v62 = ty;
    d = v21;
    b = v19;
    v65 = tx;
    v38 = c;
    v37 = a;
    v36 = v67;
LABEL_26:
    if (self->mGraphics)
    {
      v40 = TCCurrentGraphicsContext();
      CGContextSaveGState(v40);
      objc_msgSend(v36, "set");
      -[MFPGraphics objectTable](self->mGraphics, "objectTable");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndex:", v5);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = (const __CTFont *)objc_msgSend(v42, "createCTFontWithGraphics:", self->mGraphics);
      v44 = CTFontCopyGraphicsFont(v43, 0);
      v61 = a;
      Ascent = CTFontGetAscent(v43);
      v46 = TCCurrentGraphicsContext();
      CGContextSetFont(v46, v44);
      v47 = TCCurrentGraphicsContext();
      Size = CTFontGetSize(v43);
      CGContextSetFontSize(v47, Size);
      v49 = Ascent;
      v66 = v49;
      v50 = 0.0;
      if (v39)
      {
        v60 = v21;
        v51 = TCCurrentGraphicsContext();
        transform.a = v61;
        transform.b = b;
        transform.c = c;
        transform.d = d;
        transform.tx = v65;
        transform.ty = v62;
        CGContextConcatCTM(v51, &transform);
        v52 = v65 + c * v66 + v61 * 0.0;
        v50 = (float)-v52;
      }
      if (v25)
      {
        v53 = 0;
        v54 = v66;
        do
        {
          characters = 0;
          characters = objc_msgSend(v27, "characterAtIndex:", v53, *(_QWORD *)&v60);
          glyphs = 0;
          CTFontGetGlyphsForCharacters(v43, &characters, &glyphs, 1);
          *(_OWORD *)&v72.a = *((_OWORD *)v73[0] + v53);
          v55 = v72.b - v54;
          v56 = v50 + v72.a;
          v72.a = v50 + v72.a;
          v72.b = v72.b - v54;
          if (v39)
          {
            v72.a = tx + v38 * v55 + v37 * v56;
            v72.b = ty + v21 * v55 + v19 * v56;
          }
          v57 = TCCurrentGraphicsContext();
          CGContextShowGlyphsAtPositions(v57, &glyphs, (const CGPoint *)&v72, 1uLL);
          ++v53;
        }
        while (v53 != v25);
      }
      v58 = TCCurrentGraphicsContext();
      CGContextRestoreGState(v58);
      CFRelease(v44);
      CFRelease(v43);

      v29 = 0;
    }
    else
    {
      v29 = -1;
    }
    goto LABEL_37;
  }
  v29 = -1;
  v36 = v67;
LABEL_37:
  if (v73[0])
  {
    v73[1] = v73[0];
    operator delete(v73[0]);
  }

  return v29;
}

- (int)playGetDC:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  -[EMFPlayer setIgnoreEMFRecords:](self->mOwner, "setIgnoreEMFRecords:", 0, *(_QWORD *)&a4, a5);
  return 0;
}

- (int)playSave:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  -[MFPGraphics saveGraphicsStateWithId:](self->mGraphics, "saveGraphicsStateWithId:", *(unsigned int *)a3, *(_QWORD *)&a4, a5);
  return 0;
}

- (int)playRestore:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  -[MFPGraphics restoreGraphicsStateOrEndContainerWithId:](self->mGraphics, "restoreGraphicsStateOrEndContainerWithId:", *(unsigned int *)a3, *(_QWORD *)&a4, a5);
  return 0;
}

- (int)playBeginContainer:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  double Float32Rect;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v5 = a5;
  Float32Rect = readFloat32Rect((const unsigned __int8 *)a3);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = readFloat32Rect((const unsigned __int8 *)a3 + 16);
  -[MFPGraphics beginContainerWithId:boundsInParent:bounds:boundsUnit:](self->mGraphics, "beginContainerWithId:boundsInParent:bounds:boundsUnit:", *((unsigned int *)a3 + 8), v5, Float32Rect, v10, v12, v14, v15, v16, v17, v18);
  return 0;
}

- (int)playBeginContainerNoParams:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  -[MFPGraphics beginContainerNoParamsWithId:](self->mGraphics, "beginContainerNoParamsWithId:", *(unsigned int *)a3, *(_QWORD *)&a4, a5);
  return 0;
}

- (int)playEndContainer:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  -[MFPGraphics restoreGraphicsStateOrEndContainerWithId:](self->mGraphics, "restoreGraphicsStateOrEndContainerWithId:", *(unsigned int *)a3, *(_QWORD *)&a4, a5);
  return 0;
}

- (int)playSetWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  void *v5;
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  -[MFPGraphics currentState](self->mGraphics, "currentState", readAffineTransform((const unsigned __int8 *)a3, (double *)&v8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  objc_msgSend(v5, "setWorldTransform:", v7);

  return 0;
}

- (int)playResetWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  void *v5;
  __int128 v6;
  _OWORD v8[3];

  -[MFPGraphics currentState](self->mGraphics, "currentState", a3, *(_QWORD *)&a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v8[0] = *MEMORY[0x24BDBD8B8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v5, "setWorldTransform:", v8);

  return 0;
}

- (int)playMultiplyWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  void *v6;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  v5 = (a5 >> 13) & 1;
  -[MFPGraphics currentState](self->mGraphics, "currentState", readAffineTransform((const unsigned __int8 *)a3, (double *)&v9));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  objc_msgSend(v6, "multiplyWorldTransformBy:order:", v8, v5);

  return 0;
}

- (int)playTranslateWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  unsigned int v5;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  void *v12;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v5 = a5;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 0);
  v9 = v8;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 4);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, v9, v10);
  v11 = (v5 >> 13) & 1;
  -[MFPGraphics currentState](self->mGraphics, "currentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v15;
  objc_msgSend(v12, "multiplyWorldTransformBy:order:", &v14, v11);

  return 0;
}

- (int)playScaleWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  unsigned int v5;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  void *v12;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v5 = a5;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 0);
  v9 = v8;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 4);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v9, v10);
  v11 = (v5 >> 13) & 1;
  -[MFPGraphics currentState](self->mGraphics, "currentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v15;
  objc_msgSend(v12, "multiplyWorldTransformBy:order:", &v14, v11);

  return 0;
}

- (int)playRotateWorldTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  unsigned int v5;
  float v7;
  uint64_t v8;
  void *v9;
  CGAffineTransform v11;
  CGAffineTransform v12;

  v5 = a5;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 0);
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeRotation(&v12, v7 * 3.14159265 / 180.0);
  v8 = (v5 >> 13) & 1;
  -[MFPGraphics currentState](self->mGraphics, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v12;
  objc_msgSend(v9, "multiplyWorldTransformBy:order:", &v11, v8);

  return 0;
}

- (int)playSetPageTransform:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  MFPGraphics *mGraphics;
  void *v8;
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v5 = a5;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 0);
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  mGraphics = self->mGraphics;
  if (mGraphics)
  {
    -[MFPGraphics pageTransformWithScale:unit:](mGraphics, "pageTransformWithScale:unit:", v5);
    mGraphics = self->mGraphics;
  }
  -[MFPGraphics currentState](mGraphics, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v11;
  v10[1] = v12;
  v10[2] = v13;
  objc_msgSend(v8, "setPageTransform:", v10);

  return 0;
}

- (int)playResetClip:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  -[MFPGraphics areThereOpenContainers](self->mGraphics, "areThereOpenContainers", a3, *(_QWORD *)&a4, a5);
  return 0;
}

- (int)setClipPath:(id)a3 flags:(unsigned __int16)a4
{
  unsigned int v4;
  id v6;

  v4 = a4;
  v6 = a3;
  if (v4 <= 0xFF)
  {
    -[MFPGraphics areThereOpenContainers](self->mGraphics, "areThereOpenContainers");
LABEL_4:
    objc_msgSend(v6, "addClip");
    goto LABEL_5;
  }
  if ((v4 & 0xFF00) == 0x100)
    goto LABEL_4;
LABEL_5:

  return 0;
}

- (int)playSetClipRect:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  void *v7;

  v5 = a5;
  +[OITSUBezierPath bezierPathWithRect:](OITSUBezierPath, "bezierPathWithRect:", readRect((const unsigned __int8 *)a3, a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFPlusPlayer setClipPath:flags:](self, "setClipPath:flags:", v7, v5);

  return 0;
}

- (int)playSetClipPath:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;

  v5 = a5;
  -[MFPGraphics objectTable](self->mGraphics, "objectTable", a3, *(_QWORD *)&a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMFPlusPlayer setClipPath:flags:](self, "setClipPath:flags:", v9, v5);

  }
  return 0;
}

- (int)playSetClipRegion:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playOffsetClip:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playSetRenderingOrigin:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  int v5;
  int v6;
  CGContext *v7;
  CGSize v9;

  v5 = *(_DWORD *)a3;
  v6 = *((_DWORD *)a3 + 1);
  v7 = TCCurrentGraphicsContext();
  v9.width = (double)v5;
  v9.height = (double)v6;
  CGContextSetPatternPhase(v7, v9);
  return 0;
}

- (int)playSetAntiAliasMode:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  int v5;
  CGContext *v6;

  v5 = a5;
  v6 = TCCurrentGraphicsContext();
  CGContextSetShouldAntialias(v6, v5 != 0);
  return 0;
}

- (int)playSetTextRenderingHint:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playSetTextContrast:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playSetInterpolationMode:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  CGInterpolationQuality v5;
  CGContext *v6;

  if ((a5 - 1) > 6)
    v5 = kCGInterpolationDefault;
  else
    v5 = dword_22A4C08E4[(__int16)(a5 - 1)];
  v6 = TCCurrentGraphicsContext();
  CGContextSetInterpolationQuality(v6, v5);
  return 0;
}

- (int)playSetPixelOffsetMode:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playSetCompositingMode:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playSetCompositingQuality:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  return 0;
}

- (int)playBlurEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  int v6;
  int v7;
  _BOOL8 v8;
  MFPBlurEffect *v9;
  double v10;
  MFPEffect *v11;
  MFPEffect *mEffect;

  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 0);
  v7 = v6;
  v8 = *((_DWORD *)a3 + 1) != 0;
  v9 = [MFPBlurEffect alloc];
  LODWORD(v10) = v7;
  v11 = -[MFPBlurEffect initWithRadius:expandEdge:](v9, "initWithRadius:expandEdge:", v8, v10);
  mEffect = self->mEffect;
  self->mEffect = v11;

  return 0;
}

- (int)playSharpenEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  int v6;
  int v7;
  int v8;
  int v9;
  MFPSharpenEffect *v10;
  double v11;
  double v12;
  MFPEffect *v13;
  MFPEffect *mEffect;

  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 0);
  v7 = v6;
  +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, 4);
  v9 = v8;
  v10 = [MFPSharpenEffect alloc];
  LODWORD(v11) = v9;
  LODWORD(v12) = v7;
  v13 = -[MFPSharpenEffect initWithAmount:radius:](v10, "initWithAmount:radius:", v11, v12);
  mEffect = self->mEffect;
  self->mEffect = v13;

  return 0;
}

- (int)playColorMatrixEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  MFPColorMatrixEffect *v10;
  MFPEffect *mEffect;
  _BYTE v13[100];
  uint64_t v14;

  v6 = 0;
  v7 = 0;
  v14 = *MEMORY[0x24BDAC8D0];
  do
  {
    for (i = 0; i != 20; i += 4)
    {
      +[MFByteUtils readFloat32FromByteArray:in_offset:](MFByteUtils, "readFloat32FromByteArray:in_offset:", a3, (v6 + i));
      *(_DWORD *)&v13[v6 + i] = v9;
    }
    ++v7;
    v6 += 20;
  }
  while (v7 != 5);
  v10 = -[MFPColorMatrixEffect initWithColorMatrix:]([MFPColorMatrixEffect alloc], "initWithColorMatrix:", v13);
  mEffect = self->mEffect;
  self->mEffect = &v10->super;

  return 0;
}

- (int)playColorLUTEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  MFPColorLUTEffect *v5;
  MFPEffect *mEffect;

  v5 = -[MFPColorLUTEffect initWithLUTA:LUTR:LUTG:LUTB:]([MFPColorLUTEffect alloc], "initWithLUTA:LUTR:LUTG:LUTB:", a3, a3 + 256, a3 + 512, a3 + 768);
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playBrightnessContrastEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  MFPBrightnessContrastEffect *v5;
  MFPEffect *mEffect;

  v5 = -[MFPBrightnessContrastEffect initWithBrightness:contrast:]([MFPBrightnessContrastEffect alloc], "initWithBrightness:contrast:", *(unsigned int *)a3, *((unsigned int *)a3 + 1));
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playHueSaturationLightnessEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  MFPHueSaturationLightnessEffect *v5;
  MFPEffect *mEffect;

  v5 = -[MFPHueSaturationLightnessEffect initWithHueChange:saturationChange:lightnessChange:]([MFPHueSaturationLightnessEffect alloc], "initWithHueChange:saturationChange:lightnessChange:", *(unsigned int *)a3, *((unsigned int *)a3 + 1), *((unsigned int *)a3 + 2));
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playLevelsEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  MFPLevelsEffect *v5;
  MFPEffect *mEffect;

  v5 = -[MFPLevelsEffect initWithHighlight:midtone:shadow:]([MFPLevelsEffect alloc], "initWithHighlight:midtone:shadow:", *(unsigned int *)a3, *((unsigned int *)a3 + 1), *((unsigned int *)a3 + 2));
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playTintEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  MFPTintEffect *v5;
  MFPEffect *mEffect;

  v5 = -[MFPTintEffect initWithHue:amount:]([MFPTintEffect alloc], "initWithHue:amount:", *(unsigned int *)a3, *((unsigned int *)a3 + 1));
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playColorBalanceEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  MFPColorBalanceEffect *v5;
  MFPEffect *mEffect;

  v5 = -[MFPColorBalanceEffect initWithCyanRed:magentaGreen:yellowBlue:]([MFPColorBalanceEffect alloc], "initWithCyanRed:magentaGreen:yellowBlue:", *(unsigned int *)a3, *((unsigned int *)a3 + 1), *((unsigned int *)a3 + 2));
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playRedEyeCorrectionEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  unint64_t v6;
  uint64_t v7;
  double *v8;
  unsigned __int16 *v9;
  int v10;
  int v11;
  double v12;
  double v13;
  MFPRedEyeCorrectionEffect *v14;
  MFPEffect *mEffect;
  void *__p[3];

  v6 = *(unsigned int *)a3;
  std::vector<CGRect>::vector(__p, v6);
  if ((_DWORD)v6)
  {
    v7 = 0;
    v8 = (double *)((char *)__p[0] + 16);
    do
    {
      v9 = (unsigned __int16 *)&a3[(v7 & 0xFFFFFFF0) + 8];
      v10 = *v9;
      v11 = v9[2];
      v12 = (double)(v9[4] - v10);
      v13 = (double)(v9[6] - v11);
      *(v8 - 2) = (double)v10;
      *(v8 - 1) = (double)v11;
      *v8 = v12;
      v8[1] = v13;
      v8 += 4;
      v7 += 16;
    }
    while (16 * v6 != v7);
  }
  v14 = -[MFPRedEyeCorrectionEffect initWithAreas:]([MFPRedEyeCorrectionEffect alloc], "initWithAreas:", __p);
  mEffect = self->mEffect;
  self->mEffect = &v14->super;

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return 0;
}

- (int)playColorCurveEffectWithData:(const char *)a3 size:(unsigned int)a4
{
  MFPColorCurveEffect *v5;
  MFPEffect *mEffect;

  v5 = -[MFPColorCurveEffect initWithAdjustment:channel:adjustValue:]([MFPColorCurveEffect alloc], "initWithAdjustment:channel:adjustValue:", *(unsigned int *)a3, *((unsigned int *)a3 + 1), *((unsigned int *)a3 + 2));
  mEffect = self->mEffect;
  self->mEffect = &v5->super;

  return 0;
}

- (int)playSerializableObject:(const char *)a3 in_size:(unsigned int)a4 in_flags:(unsigned __int16)a5
{
  int result;
  uint16x8_t v8;
  int v9;
  uint64_t v10;
  const char *v11;

  if (a4 < 0x14)
    return -7;
  v8 = vmovl_u8(*(uint8x8_t *)(a3 + 8));
  v9 = +[EMFPlusPlayer serializableObjectTypeForGUID:](EMFPlusPlayer, "serializableObjectTypeForGUID:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%08X-%04hX-%04hX-%02hX%02hX-%02hX%02hX%02hX%02hX%02hX%02hX"), *(unsigned int *)a3, *((unsigned __int16 *)a3 + 2), *((unsigned __int16 *)a3 + 3), v8.u16[0], v8.u16[1], v8.u16[2], v8.u16[3], v8.u16[4], v8.u16[5], v8.u16[6], v8.u16[7]));
  v10 = *((unsigned __int16 *)a3 + 8);
  v11 = a3 + 20;
  switch(v9)
  {
    case 1:
      result = -[EMFPlusPlayer playBlurEffectWithData:size:](self, "playBlurEffectWithData:size:", v11, v10);
      break;
    case 2:
      result = -[EMFPlusPlayer playSharpenEffectWithData:size:](self, "playSharpenEffectWithData:size:", v11, v10);
      break;
    case 3:
      result = -[EMFPlusPlayer playColorMatrixEffectWithData:size:](self, "playColorMatrixEffectWithData:size:", v11, v10);
      break;
    case 4:
      result = -[EMFPlusPlayer playColorLUTEffectWithData:size:](self, "playColorLUTEffectWithData:size:", v11, v10);
      break;
    case 5:
      result = -[EMFPlusPlayer playBrightnessContrastEffectWithData:size:](self, "playBrightnessContrastEffectWithData:size:", v11, v10);
      break;
    case 6:
      result = -[EMFPlusPlayer playHueSaturationLightnessEffectWithData:size:](self, "playHueSaturationLightnessEffectWithData:size:", v11, v10);
      break;
    case 7:
      result = -[EMFPlusPlayer playLevelsEffectWithData:size:](self, "playLevelsEffectWithData:size:", v11, v10);
      break;
    case 8:
      result = -[EMFPlusPlayer playTintEffectWithData:size:](self, "playTintEffectWithData:size:", v11, v10);
      break;
    case 9:
      result = -[EMFPlusPlayer playColorBalanceEffectWithData:size:](self, "playColorBalanceEffectWithData:size:", v11, v10);
      break;
    case 10:
      result = -[EMFPlusPlayer playRedEyeCorrectionEffectWithData:size:](self, "playRedEyeCorrectionEffectWithData:size:", v11, v10);
      break;
    case 11:
      result = -[EMFPlusPlayer playColorCurveEffectWithData:size:](self, "playColorCurveEffectWithData:size:", v11, v10);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (int)playRecord:(int)a3 pData:(const char *)a4 dataSize:(unsigned int)a5 flags:(unsigned __int16)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  MFPEffect *v11;
  int v12;
  int v13;
  MFPEffect *mEffect;
  BOOL v15;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v9 = *(_QWORD *)&a3;
  v11 = self->mEffect;
  switch((int)v9)
  {
    case 16385:
      v12 = -[EMFPlusPlayer playHeader:in_size:in_flags:](self, "playHeader:in_size:in_flags:", a4, v7, v6);
      break;
    case 16388:
      v12 = -[EMFPlusPlayer playGetDC:in_size:in_flags:](self, "playGetDC:in_size:in_flags:", a4, v7, v6);
      break;
    case 16392:
      v12 = -[EMFPlusPlayer playObject:in_size:in_flags:](self, "playObject:in_size:in_flags:", a4, v7, v6);
      break;
    case 16393:
      v12 = -[EMFPlusPlayer playClear:in_size:in_flags:](self, "playClear:in_size:in_flags:", a4, v7, v6);
      break;
    case 16394:
      v12 = -[EMFPlusPlayer playFillRects:in_size:in_flags:](self, "playFillRects:in_size:in_flags:", a4, v7, v6);
      break;
    case 16395:
      v12 = -[EMFPlusPlayer playDrawRects:in_size:in_flags:](self, "playDrawRects:in_size:in_flags:", a4, v7, v6);
      break;
    case 16396:
      v12 = -[EMFPlusPlayer playFillPolygon:in_size:in_flags:](self, "playFillPolygon:in_size:in_flags:", a4, v7, v6);
      break;
    case 16397:
      v12 = -[EMFPlusPlayer playDrawLines:in_size:in_flags:](self, "playDrawLines:in_size:in_flags:", a4, v7, v6);
      break;
    case 16398:
      v12 = -[EMFPlusPlayer playFillEllipse:in_size:in_flags:](self, "playFillEllipse:in_size:in_flags:", a4, v7, v6);
      break;
    case 16399:
      v12 = -[EMFPlusPlayer playDrawEllipse:in_size:in_flags:](self, "playDrawEllipse:in_size:in_flags:", a4, v7, v6);
      break;
    case 16400:
      v12 = -[EMFPlusPlayer playFillPie:in_size:in_flags:](self, "playFillPie:in_size:in_flags:", a4, v7, v6);
      break;
    case 16401:
      v12 = -[EMFPlusPlayer playDrawPie:in_size:in_flags:](self, "playDrawPie:in_size:in_flags:", a4, v7, v6);
      break;
    case 16402:
      v12 = -[EMFPlusPlayer playDrawArc:in_size:in_flags:](self, "playDrawArc:in_size:in_flags:", a4, v7, v6);
      break;
    case 16404:
      v12 = -[EMFPlusPlayer playFillPath:in_size:in_flags:](self, "playFillPath:in_size:in_flags:", a4, v7, v6);
      break;
    case 16405:
      v12 = -[EMFPlusPlayer playDrawPath:in_size:in_flags:](self, "playDrawPath:in_size:in_flags:", a4, v7, v6);
      break;
    case 16406:
      v12 = -[EMFPlusPlayer playFillClosedCurve:in_size:in_flags:](self, "playFillClosedCurve:in_size:in_flags:", a4, v7, v6);
      break;
    case 16407:
      v12 = -[EMFPlusPlayer playDrawClosedCurve:in_size:in_flags:](self, "playDrawClosedCurve:in_size:in_flags:", a4, v7, v6);
      break;
    case 16408:
      v12 = -[EMFPlusPlayer playDrawCurve:in_size:in_flags:](self, "playDrawCurve:in_size:in_flags:", a4, v7, v6);
      break;
    case 16409:
      v12 = -[EMFPlusPlayer playDrawBeziers:in_size:in_flags:](self, "playDrawBeziers:in_size:in_flags:", a4, v7, v6);
      break;
    case 16410:
      v12 = -[EMFPlusPlayer playDrawImage:in_size:in_flags:](self, "playDrawImage:in_size:in_flags:", a4, v7, v6);
      break;
    case 16411:
      v12 = -[EMFPlusPlayer playDrawImagePoints:in_size:in_flags:](self, "playDrawImagePoints:in_size:in_flags:", a4, v7, v6);
      break;
    case 16412:
      v12 = -[EMFPlusPlayer playDrawString:in_size:in_flags:](self, "playDrawString:in_size:in_flags:", a4, v7, v6);
      break;
    case 16413:
      v12 = -[EMFPlusPlayer playSetRenderingOrigin:in_size:in_flags:](self, "playSetRenderingOrigin:in_size:in_flags:", a4, v7, v6);
      break;
    case 16414:
      v12 = -[EMFPlusPlayer playSetAntiAliasMode:in_size:in_flags:](self, "playSetAntiAliasMode:in_size:in_flags:", a4, v7, v6);
      break;
    case 16415:
      v12 = -[EMFPlusPlayer playSetTextRenderingHint:in_size:in_flags:](self, "playSetTextRenderingHint:in_size:in_flags:", a4, v7, v6);
      break;
    case 16416:
      v12 = -[EMFPlusPlayer playSetTextContrast:in_size:in_flags:](self, "playSetTextContrast:in_size:in_flags:", a4, v7, v6);
      break;
    case 16417:
      v12 = -[EMFPlusPlayer playSetInterpolationMode:in_size:in_flags:](self, "playSetInterpolationMode:in_size:in_flags:", a4, v7, v6);
      break;
    case 16418:
      v12 = -[EMFPlusPlayer playSetPixelOffsetMode:in_size:in_flags:](self, "playSetPixelOffsetMode:in_size:in_flags:", a4, v7, v6);
      break;
    case 16419:
      v12 = -[EMFPlusPlayer playSetCompositingMode:in_size:in_flags:](self, "playSetCompositingMode:in_size:in_flags:", a4, v7, v6);
      break;
    case 16420:
      v12 = -[EMFPlusPlayer playSetCompositingQuality:in_size:in_flags:](self, "playSetCompositingQuality:in_size:in_flags:", a4, v7, v6);
      break;
    case 16421:
      v12 = -[EMFPlusPlayer playSave:in_size:in_flags:](self, "playSave:in_size:in_flags:", a4, v7, v6);
      break;
    case 16422:
      v12 = -[EMFPlusPlayer playRestore:in_size:in_flags:](self, "playRestore:in_size:in_flags:", a4, v7, v6);
      break;
    case 16423:
      v12 = -[EMFPlusPlayer playBeginContainer:in_size:in_flags:](self, "playBeginContainer:in_size:in_flags:", a4, v7, v6);
      break;
    case 16424:
      v12 = -[EMFPlusPlayer playBeginContainerNoParams:in_size:in_flags:](self, "playBeginContainerNoParams:in_size:in_flags:", a4, v7, v6);
      break;
    case 16425:
      v12 = -[EMFPlusPlayer playEndContainer:in_size:in_flags:](self, "playEndContainer:in_size:in_flags:", a4, v7, v6);
      break;
    case 16426:
      v12 = -[EMFPlusPlayer playSetWorldTransform:in_size:in_flags:](self, "playSetWorldTransform:in_size:in_flags:", a4, v7, v6);
      break;
    case 16427:
      v12 = -[EMFPlusPlayer playResetWorldTransform:in_size:in_flags:](self, "playResetWorldTransform:in_size:in_flags:", a4, v7, v6);
      break;
    case 16428:
      v12 = -[EMFPlusPlayer playMultiplyWorldTransform:in_size:in_flags:](self, "playMultiplyWorldTransform:in_size:in_flags:", a4, v7, v6);
      break;
    case 16429:
      v12 = -[EMFPlusPlayer playTranslateWorldTransform:in_size:in_flags:](self, "playTranslateWorldTransform:in_size:in_flags:", a4, v7, v6);
      break;
    case 16430:
      v12 = -[EMFPlusPlayer playScaleWorldTransform:in_size:in_flags:](self, "playScaleWorldTransform:in_size:in_flags:", a4, v7, v6);
      break;
    case 16431:
      v12 = -[EMFPlusPlayer playRotateWorldTransform:in_size:in_flags:](self, "playRotateWorldTransform:in_size:in_flags:", a4, v7, v6);
      break;
    case 16432:
      v12 = -[EMFPlusPlayer playSetPageTransform:in_size:in_flags:](self, "playSetPageTransform:in_size:in_flags:", a4, v7, v6);
      break;
    case 16433:
      v12 = -[EMFPlusPlayer playResetClip:in_size:in_flags:](self, "playResetClip:in_size:in_flags:", a4, v7, v6);
      break;
    case 16434:
      v12 = -[EMFPlusPlayer playSetClipRect:in_size:in_flags:](self, "playSetClipRect:in_size:in_flags:", a4, v7, v6);
      break;
    case 16435:
      v12 = -[EMFPlusPlayer playSetClipPath:in_size:in_flags:](self, "playSetClipPath:in_size:in_flags:", a4, v7, v6);
      break;
    case 16436:
      v12 = -[EMFPlusPlayer playSetClipRegion:in_size:in_flags:](self, "playSetClipRegion:in_size:in_flags:", a4, v7, v6);
      break;
    case 16437:
      v12 = -[EMFPlusPlayer playOffsetClip:in_size:in_flags:](self, "playOffsetClip:in_size:in_flags:", a4, v7, v6);
      break;
    case 16438:
      v12 = -[EMFPlusPlayer playDrawDriverString:in_size:in_flags:](self, "playDrawDriverString:in_size:in_flags:", a4, v7, v6);
      break;
    case 16440:
      v12 = -[EMFPlusPlayer playSerializableObject:in_size:in_flags:](self, "playSerializableObject:in_size:in_flags:", a4, v7, v6);
      break;
    default:
      v12 = -[EMFPlusPlayer playUnknown:in_size:in_type:in_flags:](self, "playUnknown:in_size:in_type:in_flags:", a4, v7, v9, v6);
      break;
  }
  v13 = v12;
  mEffect = self->mEffect;
  if (mEffect)
    v15 = mEffect == v11;
  else
    v15 = 0;
  if (v15)
    -[EMFPlusPlayer setEffect:](self, "setEffect:", 0);

  return v13;
}

- (void)resetLargeRecord
{
  self->mLargeType = 0x4000;
  self->mLargeFlags = 0;
  self->mLargeSize = 0;
  -[NSMutableData setLength:](self->mLargeData, "setLength:", 0);
}

- (int)play:(const char *)a3 in_size:(unsigned int)a4
{
  unsigned int v4;
  char v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  unsigned int v18;
  uint64_t v19;
  int mLargeType;
  unsigned int v21;
  unsigned int mLargeSize;

  v4 = a4;
  if (a4 >= 0xC)
  {
    v7 = 0;
    while (1)
    {
      v8 = *((_DWORD *)a3 + 1);
      if (v8 < 0xC)
        return -7;
      v9 = *((_DWORD *)a3 + 2);
      if (v8 != v9 + 12)
        return -7;
      if (v8 >= v4)
        v10 = v4;
      else
        v10 = *((_DWORD *)a3 + 1);
      if (v8 >= v4)
        v11 = v8 - v4;
      else
        v11 = 0;
      v12 = v9 - v11;
      if (v9 == v11)
      {
        v13 = 0;
        goto LABEL_20;
      }
      v14 = *(unsigned __int16 *)a3;
      v15 = *((__int16 *)a3 + 1);
      if ((v14 - 16394) < 0xD || (_DWORD)v14 == 16412 || (_DWORD)v14 == 16438 || (v15 & 0x80000000) == 0)
      {
        if (self->mLargeType != 0x4000)
        {
          -[EMFPlusPlayer resetLargeRecord](self, "resetLargeRecord");
          v7 = 1;
        }
        v16 = -[EMFPlusPlayer playRecord:pData:dataSize:flags:](self, "playRecord:pData:dataSize:flags:", v14, a3 + 12, v12, (unsigned __int16)v15);
        goto LABEL_17;
      }
      v18 = *((_DWORD *)a3 + 3);
      v19 = (v12 - 4);
      mLargeType = self->mLargeType;
      if (mLargeType == 0x4000)
      {
        if (v18 <= v19)
          goto LABEL_43;
        self->mLargeType = v14;
        self->mLargeFlags = v15;
        self->mLargeSize = v18;
        -[NSMutableData setLength:](self->mLargeData, "setLength:", 0);
        -[NSMutableData appendBytes:length:](self->mLargeData, "appendBytes:length:", a3 + 16, v19);
      }
      else
      {
        if (__PAIR64__(self->mLargeFlags, mLargeType) != __PAIR64__((unsigned __int16)v15, v14)
          || v18 != self->mLargeSize)
        {
LABEL_43:
          -[EMFPlusPlayer resetLargeRecord](self, "resetLargeRecord");
          return -7;
        }
        -[NSMutableData appendBytes:length:](self->mLargeData, "appendBytes:length:", a3 + 16, v19);
        v21 = -[NSMutableData length](self->mLargeData, "length");
        mLargeSize = self->mLargeSize;
        if (mLargeSize == v21)
        {
          v16 = -[EMFPlusPlayer playRecord:pData:dataSize:flags:](self, "playRecord:pData:dataSize:flags:", self->mLargeType, -[NSMutableData bytes](self->mLargeData, "bytes"), self->mLargeSize, self->mLargeFlags);
          -[EMFPlusPlayer resetLargeRecord](self, "resetLargeRecord");
          goto LABEL_17;
        }
        if (mLargeSize < v21)
          goto LABEL_43;
      }
      v16 = 0;
LABEL_17:
      v7 |= v16 == -7;
      if (v16 == -7)
        v13 = 0;
      else
        v13 = v16;
LABEL_20:
      a3 += v10;
      v4 -= v10;
      if (v4 < 0xC || v13 != 0)
        goto LABEL_38;
    }
  }
  v7 = 0;
  v13 = 0;
LABEL_38:
  if (((v13 == 0) & v7) != 0)
    v13 = -7;
  if (v4)
    return -7;
  else
    return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEffect, 0);
  objc_storeStrong((id *)&self->mLargeData, 0);
  objc_storeStrong((id *)&self->mOwner, 0);
  objc_storeStrong((id *)&self->mGraphics, 0);
}

@end
