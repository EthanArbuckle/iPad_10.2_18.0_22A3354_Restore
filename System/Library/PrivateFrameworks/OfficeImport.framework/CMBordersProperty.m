@implementation CMBordersProperty

- (CMBordersProperty)init
{
  CMBordersProperty *v2;
  CMBordersProperty *v3;
  uint64_t i;
  OITSUColor *mBorderColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMBordersProperty;
  v2 = -[CMBordersProperty init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    for (i = 0; i != 5; ++i)
    {
      v2->mBorderStyle[i] = -1;
      v2->mBorderWidth[i] = -1;
    }
    mBorderColor = v2->mBorderColor;
    v2->mBorderColor = 0;

    v3->mCustomWidth = 0;
  }
  return v3;
}

- (void)adjustValues
{
  int v2;
  int v3;
  OITSUColor *mBorderTopColor;

  if (self->mBorderStyle[0] == -1)
  {
    v2 = self->mBorderStyle[1];
    if (v2 == self->mBorderStyle[2] && v2 == self->mBorderStyle[3] && v2 == self->mBorderStyle[4])
      self->mBorderStyle[0] = v2;
  }
  if (self->mBorderWidth[0] == -1)
  {
    v3 = self->mBorderWidth[1];
    if (v3 == self->mBorderWidth[2] && v3 == self->mBorderWidth[3] && v3 == self->mBorderWidth[4])
      self->mBorderWidth[0] = v3;
  }
  if (!self->mBorderColor)
  {
    mBorderTopColor = self->mBorderTopColor;
    if (mBorderTopColor == self->mBorderLeftColor
      && mBorderTopColor == self->mBorderRightColor
      && mBorderTopColor == self->mBorderBottomColor)
    {
      objc_storeStrong((id *)&self->mBorderColor, mBorderTopColor);
    }
  }
}

- (id)cssStringForName:(id)a3
{
  __CFString *v3;

  if (self->mBorderStyle[0])
  {
    -[CMBordersProperty cssString](self, "cssString", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("border-style:none;");
  }
  return v3;
}

- (id)cssString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16A8];
  -[CMBordersProperty styleString](self, "styleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CMBordersProperty widthString](self, "widthString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

  -[CMBordersProperty colorString](self, "colorString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v7);

  return v5;
}

- (id)styleString
{
  unsigned int *mBorderStyle;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  mBorderStyle = (unsigned int *)self->mBorderStyle;
  if (self->mBorderStyle[0] != -1)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", 0x24F3E6E78);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMBordersProperty stringFromStyleEnum:](self, "stringFromStyleEnum:", *mBorderStyle);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v5);
    v6 = v4;
LABEL_12:

    goto LABEL_13;
  }
  if (self->mBorderStyle[1] == -1)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24F3BFFF8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", 0x24F3E6EB8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMBordersProperty stringFromStyleEnum:](self, "stringFromStyleEnum:", mBorderStyle[1]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v8);

    v6 = v7;
  }
  if (mBorderStyle[2] != -1)
  {
    objc_msgSend(v6, "appendString:", 0x24F3E6DD8);
    -[CMBordersProperty stringFromStyleEnum:](self, "stringFromStyleEnum:", mBorderStyle[2]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v9);

  }
  if (mBorderStyle[3] != -1)
  {
    objc_msgSend(v6, "appendString:", 0x24F3E6D58);
    -[CMBordersProperty stringFromStyleEnum:](self, "stringFromStyleEnum:", mBorderStyle[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v10);

  }
  if (mBorderStyle[4] != -1)
  {
    objc_msgSend(v6, "appendString:", 0x24F3E6E38);
    -[CMBordersProperty stringFromStyleEnum:](self, "stringFromStyleEnum:", mBorderStyle[4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v5);
    goto LABEL_12;
  }
LABEL_13:
  v11 = v6;

  return v11;
}

- (id)stringFromStyleEnum:(int)a3
{
  if (a3 > 4)
    return CFSTR(":solid;");
  else
    return off_24F3BF540[a3];
}

- (id)widthString
{
  unsigned int *mBorderWidth;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  mBorderWidth = (unsigned int *)self->mBorderWidth;
  if (self->mBorderWidth[0] != -1)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", 0x24F3E6EF8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMBordersProperty stringFromWidthEnum:](self, "stringFromWidthEnum:", *mBorderWidth);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v5);
    v6 = v4;
LABEL_12:

    goto LABEL_13;
  }
  if (self->mBorderWidth[1] == -1)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", &stru_24F3BFFF8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", 0x24F3E6ED8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMBordersProperty stringFromWidthEnum:](self, "stringFromWidthEnum:", mBorderWidth[1]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v8);

    v6 = v7;
  }
  if (mBorderWidth[2] != -1)
  {
    objc_msgSend(v6, "appendString:", 0x24F3E6DF8);
    -[CMBordersProperty stringFromWidthEnum:](self, "stringFromWidthEnum:", mBorderWidth[2]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v9);

  }
  if (mBorderWidth[3] != -1)
  {
    objc_msgSend(v6, "appendString:", 0x24F3E6D78);
    -[CMBordersProperty stringFromWidthEnum:](self, "stringFromWidthEnum:", mBorderWidth[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v10);

  }
  if (mBorderWidth[4] != -1)
  {
    objc_msgSend(v6, "appendString:", 0x24F3E6E58);
    -[CMBordersProperty stringFromWidthEnum:](self, "stringFromWidthEnum:", mBorderWidth[4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v5);
    goto LABEL_12;
  }
LABEL_13:
  v11 = v6;

  return v11;
}

- (id)stringFromWidthEnum:(int)a3
{
  __CFString *v4;

  v4 = CFSTR(":0;");
  switch(a3)
  {
    case 0:
      return v4;
    case 2:
      return CFSTR(":medium;");
    case 3:
      return CFSTR(":thick;");
    case 4:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(": %d;"), self->mCustomWidth);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v4;
    default:
      v4 = CFSTR(":thin;");
      return v4;
  }
}

- (id)colorString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->mBorderColor)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", 0x24F3E6D98);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMBordersProperty stringFromColor:](self, "stringFromColor:", self->mBorderColor);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", 0x24F3E6E98);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMBordersProperty stringFromColor:](self, "stringFromColor:", self->mBorderTopColor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v5);

    objc_msgSend(v3, "appendString:", 0x24F3E6DB8);
    -[CMBordersProperty stringFromColor:](self, "stringFromColor:", self->mBorderLeftColor);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v6);

    objc_msgSend(v3, "appendString:", 0x24F3E6D38);
    -[CMBordersProperty stringFromColor:](self, "stringFromColor:", self->mBorderBottomColor);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v7);

    objc_msgSend(v3, "appendString:", 0x24F3E6E18);
    -[CMBordersProperty stringFromColor:](self, "stringFromColor:", self->mBorderRightColor);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  return v3;
}

- (id)stringFromColor:(id)a3
{
  id v3;
  __CFString *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CMColorProperty *v9;

  v3 = a3;
  if ((objc_msgSend(v3, "isBlack") & 1) != 0
    || (objc_msgSend(v3, "redComponent"), v5 == 1.0)
    && (objc_msgSend(v3, "greenComponent"), v6 == 1.0)
    && (objc_msgSend(v3, "blueComponent"), v7 == 1.0)
    && (objc_msgSend(v3, "alphaComponent"), v8 == 0.0))
  {
    v4 = CFSTR(":black;");
  }
  else
  {
    v9 = -[CMColorProperty initWithColor:]([CMColorProperty alloc], "initWithColor:", v3);
    -[CMColorProperty cssStringForName:](v9, "cssStringForName:", &stru_24F3BFFF8);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (CMBordersProperty)initWithOADStroke:(id)a3
{
  id v4;
  CMBordersProperty *v5;
  CMBordersProperty *v6;
  float v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v16;
  OITSUColor *mBorderColor;
  void *v18;
  char v19;
  void *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  uint64_t v26;
  OITSUColor *v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CMBordersProperty;
  v5 = -[CMBordersProperty init](&v28, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_10;
  v5->mCustomWidth = 0;
  if (!objc_msgSend(v4, "isFillOverridden")
    || (objc_msgSend(v4, "width"), v7 == 0.0)
    || (objc_msgSend(v4, "fill"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        (isKindOfClass & 1) == 0))
  {
    v6->mBorderStyle[0] = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "fill");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v6->mBorderWidth[0] = 1;
  if (objc_msgSend(v4, "isDashOverridden"))
  {
    objc_msgSend(v4, "dash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "dash");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "type");

      if (v13)
      {
        v14 = 3;
        goto LABEL_16;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v4, "isCompoundTypeOverridden") && objc_msgSend(v4, "compoundType"))
  {
    v6->mBorderStyle[0] = 2;
    v6->mBorderWidth[0] = 2;
    goto LABEL_17;
  }
  v14 = 1;
LABEL_16:
  v6->mBorderStyle[0] = v14;
LABEL_17:
  +[OITSUColor blackColor](OITSUColor, "blackColor");
  v16 = objc_claimAutoreleasedReturnValue();
  mBorderColor = v6->mBorderColor;
  v6->mBorderColor = (OITSUColor *)v16;

  if (objc_msgSend(v10, "isColorOverridden"))
  {
    objc_msgSend(v10, "color");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) != 0)
    {
      objc_msgSend(v10, "color");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "red");
      v22 = v21;
      objc_msgSend(v20, "green");
      v24 = v23;
      objc_msgSend(v20, "blue");
      +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", v22, v24, v25, 1.0);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v6->mBorderColor;
      v6->mBorderColor = (OITSUColor *)v26;

    }
  }

LABEL_10:
  return v6;
}

+ (BOOL)isStroked:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;

  v3 = a3;
  if (objc_msgSend(v3, "isFillOverridden"))
  {
    objc_msgSend(v3, "fill");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)setFromOadStroke:(id)a3 atLocation:(int)a4 state:(id)a5
{
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  int *mBorderWidth;
  void *v13;
  void *v14;
  int v15;
  int *mBorderStyle;
  int v17;
  float v18;
  float v19;
  void *v20;
  int *v21;
  id v22;

  v22 = a3;
  v8 = a5;
  if (!objc_msgSend(v22, "isFillOverridden")
    || (objc_msgSend(v22, "fill"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v9,
        (isKindOfClass & 1) == 0))
  {
    self->mBorderStyle[a4] = 0;
    goto LABEL_23;
  }
  objc_msgSend(v22, "fill");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  mBorderWidth = self->mBorderWidth;
  self->mBorderWidth[a4] = 1;
  if (objc_msgSend(v22, "isDashOverridden"))
  {
    objc_msgSend(v22, "dash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v22, "dash");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "type");

      if (v15)
      {
        mBorderStyle = self->mBorderStyle;
        v17 = 3;
        goto LABEL_13;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v22, "isCompoundTypeOverridden") && objc_msgSend(v22, "compoundType"))
  {
    self->mBorderStyle[a4] = 2;
    mBorderWidth[a4] = 2;
    goto LABEL_14;
  }
  mBorderStyle = self->mBorderStyle;
  v17 = 1;
LABEL_13:
  mBorderStyle[a4] = v17;
LABEL_14:
  if (objc_msgSend(v22, "isWidthOverridden"))
  {
    objc_msgSend(v22, "width");
    if (v18 > 1.5)
    {
      *mBorderWidth = 4;
      objc_msgSend(v22, "width");
      self->mCustomWidth = (int)v19;
    }
  }
  if (objc_msgSend(v11, "isColorOverridden"))
  {
    +[CMColorProperty nsColorFromOADFill:state:](CMColorProperty, "nsColorFromOADFill:state:", v11, v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a4 - 1) >= 4)
      v21 = &OBJC_IVAR___CMBordersProperty_mBorderColor;
    else
      v21 = off_24F3BF520[a4 - 1];
    objc_storeStrong((id *)((char *)&self->super.super.isa + *v21), v20);

  }
LABEL_23:

}

- (BOOL)isNoneAtLocation:(int)a3
{
  return self->mBorderStyle[a3] == 0;
}

- (void)setNoneAtLocation:(int)a3
{
  int *mBorderStyle;

  mBorderStyle = self->mBorderStyle;
  self->mBorderStyle[a3] = 0;
  if (a3)
  {
    if (*mBorderStyle)
      *mBorderStyle = -1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBorderRightColor, 0);
  objc_storeStrong((id *)&self->mBorderBottomColor, 0);
  objc_storeStrong((id *)&self->mBorderLeftColor, 0);
  objc_storeStrong((id *)&self->mBorderTopColor, 0);
  objc_storeStrong((id *)&self->mBorderColor, 0);
}

@end
