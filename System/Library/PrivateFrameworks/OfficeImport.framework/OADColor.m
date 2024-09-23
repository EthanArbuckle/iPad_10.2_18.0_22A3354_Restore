@implementation OADColor

- (void)setTransforms:(id)a3
{
  id v4;
  NSMutableArray *mTransforms;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mTransforms = self->mTransforms;
  v8 = v4;
  if (v4 && !mTransforms)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->mTransforms;
    self->mTransforms = v6;

    mTransforms = self->mTransforms;
    v4 = v8;
  }
  -[NSMutableArray setArray:](mTransforms, "setArray:", v4);

}

- (unint64_t)hash
{
  return -[NSMutableArray count](self->mTransforms, "count");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *mTransforms;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  char v10;
  unint64_t v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    mTransforms = self->mTransforms;
    objc_msgSend(v5, "transforms");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(mTransforms) = (mTransforms == 0) ^ (v7 != 0);

    if ((mTransforms & 1) != 0
      && ((v8 = self->mTransforms) == 0
       || (objc_msgSend(v5, "transforms"),
           v9 = (void *)objc_claimAutoreleasedReturnValue(),
           v10 = -[NSMutableArray isEqualToArray:](v8, "isEqualToArray:", v9),
           v9,
           (v10 & 1) != 0)))
    {
      v11 = -[OADColor hash](self, "hash");
      v12 = v11 == objc_msgSend(v5, "hash");
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

  return v12;
}

- (id)transforms
{
  return self->mTransforms;
}

+ (id)tsuColorWithColor:(id)a3 colorMap:(id)a4 colorScheme:(id)a5 colorPalette:(id)a6
{
  id v10;
  void *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  void *v19;

  v10 = a3;
  +[OADColor rgbColorWithColor:colorMap:colorScheme:colorPalette:](OADColor, "rgbColorWithColor:colorMap:colorScheme:colorPalette:", v10, a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "alphaWithColor:", v10);
  v13 = v12;
  objc_msgSend(v11, "red");
  v15 = v14;
  objc_msgSend(v11, "green");
  v17 = v16;
  objc_msgSend(v11, "blue");
  +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", v15, v17, v18, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)rgbColorWithColor:(id)a3 colorMap:(id)a4 colorScheme:(id)a5 colorPalette:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v10 = a3;
  objc_msgSend(a1, "basicMapOfColor:colorMap:colorScheme:colorPalette:", v10, a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transforms");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[OADColorTransform colorByApplyingTransforms:toColor:](OADColorTransform, "colorByApplyingTransforms:toColor:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)basicMapOfColor:(id)a3 colorMap:(id)a4 colorScheme:(id)a5 colorPalette:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v10;
LABEL_5:
    v14 = v15;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "colorForIndex:", objc_msgSend(a1, "mapSchemeColorID:colorMap:", objc_msgSend(v10, "schemeColorIndex"), v11));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "basicMapOfColor:colorMap:colorScheme:colorPalette:", v16, v11, v12, v13);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v14 = (void *)v17;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v10;
    +[OITSUColor colorWithSystemColorID:](OITSUColor, "colorWithSystemColorID:", objc_msgSend(v16, "systemColorID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[OADRgbColor rgbColorWithTSUColor:](OADRgbColor, "rgbColorWithTSUColor:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "mapAdjustedColor:colorMap:colorScheme:colorPalette:", v10, v11, v12, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "colorWithIndex:", objc_msgSend(v10, "index"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    +[OADRgbColor rgbColorWithTSUColor:](OADRgbColor, "rgbColorWithTSUColor:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_2:
  v14 = 0;
LABEL_12:

  return v14;
}

+ (float)alphaWithColor:(id)a3
{
  void *v3;
  double v4;
  float v5;
  float v6;

  objc_msgSend(a3, "transforms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  +[OADColorTransform alphaByApplyingTransforms:toAlpha:](OADColorTransform, "alphaByApplyingTransforms:toAlpha:", v3, v4);
  v6 = v5;

  return v6;
}

+ (id)mapAdjustedColor:(id)a3 colorMap:(id)a4 colorScheme:(id)a5 colorPalette:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  double v22;
  double v23;
  double v24;
  int v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  void *v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "baseColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "basicMapOfColor:colorMap:colorScheme:colorPalette:", v14, v11, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "redByte");
  v17 = objc_msgSend(v15, "greenByte");
  v18 = objc_msgSend(v15, "blueByte");
  if (objc_msgSend(v10, "gray"))
  {
    v16 = (int)sqrt((double)(v16 * v16 + v17 * v17 + v18 * v18));
    v17 = v16;
    v18 = v16;
  }
  v19 = objc_msgSend(v10, "adjustmentParam");
  switch(objc_msgSend(v10, "adjustmentType"))
  {
    case 1u:
      v16 = (32897 * v19 * v16) >> 23;
      v17 = (32897 * v19 * v17) >> 23;
      v18 = (32897 * v19 * v18) >> 23;
      break;
    case 2u:
      v16 = ~((32897 * v19 * (v16 ^ 0xFF)) >> 23);
      v17 = ~((32897 * v19 * (v17 ^ 0xFF)) >> 23);
      v18 = ~((32897 * v19 * (v18 ^ 0xFF)) >> 23);
      break;
    case 3u:
      if (v19 + v16 >= 0xFF)
        LOBYTE(v16) = -1;
      else
        LOBYTE(v16) = v19 + v16;
      if (v19 + v17 >= 0xFF)
        LOBYTE(v17) = -1;
      else
        LOBYTE(v17) = v19 + v17;
      if (v19 + v18 >= 0xFF)
        LOBYTE(v18) = -1;
      else
        LOBYTE(v18) = v19 + v18;
      break;
    case 4u:
      v16 = (v16 - v19) & ((int)(v16 - v19) >> 31);
      v17 = (v17 - v19) & ((int)(v17 - v19) >> 31);
      v18 = (v18 - v19) & ((int)(v18 - v19) >> 31);
      break;
    case 5u:
      v16 = (v19 - v16) & ~((int)(v19 - v16) >> 31);
      v17 = (v19 - v17) & ~((int)(v19 - v17) >> 31);
      v18 = (v19 - v18) & ~((int)(v19 - v18) >> 31);
      break;
    case 6u:
      if (v16 >= v19 || v17 >= v19 || v18 >= v19)
      {
        LOBYTE(v16) = -1;
        LOBYTE(v17) = -1;
        LOBYTE(v18) = -1;
      }
      else
      {
        LOBYTE(v16) = 0;
        LOBYTE(v17) = 0;
        LOBYTE(v18) = 0;
      }
      break;
    default:
      break;
  }
  v20 = objc_msgSend(v10, "invert");
  v21 = objc_msgSend(v10, "invert128");
  v25 = v20 << 31 >> 31;
  v26 = v18 ^ v25;
  v27 = v17 ^ v25;
  v28 = v16 ^ v25;
  if (v21)
  {
    v28 ^= 0x80u;
    v27 ^= 0x80u;
    v26 ^= 0x80u;
  }
  *(float *)&v22 = (float)v28;
  *(float *)&v23 = (float)v27;
  *(float *)&v24 = (float)v26;
  +[OADRgbColor rgbColorWithRedByte:greenByte:blueByte:](OADRgbColor, "rgbColorWithRedByte:greenByte:blueByte:", v22, v23, v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (void)addTransform:(id)a3
{
  id v4;
  NSMutableArray *mTransforms;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mTransforms = self->mTransforms;
  v8 = v4;
  if (!mTransforms)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->mTransforms;
    self->mTransforms = v6;

    mTransforms = self->mTransforms;
    v4 = v8;
  }
  -[NSMutableArray addObject:](mTransforms, "addObject:", v4);

}

- (void)addTransformOfType:(int)a3 value:(float)a4
{
  double v6;
  OADValueColorTransform *v7;

  v7 = -[OADColorTransform initWithType:]([OADValueColorTransform alloc], "initWithType:", *(_QWORD *)&a3);
  *(float *)&v6 = a4;
  -[OADValueColorTransform setValue:](v7, "setValue:", v6);
  -[OADColor addTransform:](self, "addTransform:", v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)addTransformOfType:(int)a3
{
  OADColorTransform *v4;

  v4 = -[OADColorTransform initWithType:]([OADColorTransform alloc], "initWithType:", *(_QWORD *)&a3);
  -[OADColor addTransform:](self, "addTransform:");

}

+ (id)tsuColorWithRed:(float)a3 green:(float)a4 blue:(float)a5
{
  return +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", a3, a4, a5, 1.0);
}

+ (id)tsuColorWithRgbColor:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "red");
  v6 = v5;
  objc_msgSend(v4, "green");
  v8 = v7;
  objc_msgSend(v4, "blue");
  LODWORD(v10) = v9;
  LODWORD(v11) = v6;
  LODWORD(v12) = v8;
  objc_msgSend(a1, "tsuColorWithRed:green:blue:", v11, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADColor;
  -[OADColor description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int)mapSchemeColorID:(int)a3 colorMap:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  int v7;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = v5;
  v7 = v4 - 12;
  if ((v4 - 12) >= 4)
  {
    if (v5)
    {
      if (v4 < 0xC)
      {
        v7 = objc_msgSend(v5, "mappingForIndex:", v4);
        goto LABEL_8;
      }
    }
    else if (v4 <= 0xB)
    {
      v7 = dword_22A4BE530[(int)v4];
      goto LABEL_8;
    }
    v7 = -1;
  }
LABEL_8:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTransforms, 0);
}

@end
