@implementation EMBordersProperty

- (EMBordersProperty)initWithEDBorders:(id)a3
{
  id v4;
  EMBordersProperty *v5;
  EMBordersProperty *v6;
  void *v7;
  uint64_t v8;
  OITSUColor *mBorderColor;
  void *v10;
  uint64_t v11;
  OITSUColor *mBorderLeftColor;
  int *mBorderStyle;
  int *mBorderWidth;
  OITSUColor *v15;
  OITSUColor *v16;
  void *v17;
  uint64_t v18;
  OITSUColor *mBorderBottomColor;
  OITSUColor *v20;
  OITSUColor *v21;
  void *v22;
  uint64_t v23;
  OITSUColor *mBorderRightColor;
  OITSUColor *v25;
  OITSUColor *v26;
  uint64_t v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)EMBordersProperty;
  v5 = -[EMBordersProperty init](&v29, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "topBorder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", objc_msgSend(v7, "type"), 0);
      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", objc_msgSend(v7, "type"), 1);
      objc_msgSend(v7, "color");
      v8 = objc_claimAutoreleasedReturnValue();
      mBorderColor = v6->mBorderColor;
      v6->mBorderColor = (OITSUColor *)v8;

      objc_storeStrong((id *)&v6->mBorderTopColor, v6->mBorderColor);
      objc_msgSend(v4, "leftBorder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", objc_msgSend(v10, "type"), 2);
      objc_msgSend(v10, "color");
      v11 = objc_claimAutoreleasedReturnValue();
      mBorderLeftColor = v6->mBorderLeftColor;
      v6->mBorderLeftColor = (OITSUColor *)v11;

      mBorderStyle = v6->mBorderStyle;
      if (v6->mBorderStyle[2] != v6->mBorderStyle[0])
        *mBorderStyle = -1;
      mBorderWidth = v6->mBorderWidth;
      if (v6->mBorderWidth[2] != v6->mBorderWidth[0])
        *mBorderWidth = -1;
      v15 = v6->mBorderColor;
      if (v15 && !-[OITSUColor isEqual:](v15, "isEqual:", v6->mBorderLeftColor))
      {
        v16 = v6->mBorderColor;
        v6->mBorderColor = 0;

      }
      objc_msgSend(v4, "bottomBorder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", objc_msgSend(v17, "type"), 3);
      objc_msgSend(v17, "color");
      v18 = objc_claimAutoreleasedReturnValue();
      mBorderBottomColor = v6->mBorderBottomColor;
      v6->mBorderBottomColor = (OITSUColor *)v18;

      if (v6->mBorderStyle[3] != v6->mBorderStyle[0])
        *mBorderStyle = -1;
      if (v6->mBorderWidth[3] != *mBorderWidth)
        *mBorderWidth = -1;
      v20 = v6->mBorderColor;
      if (v20 && !-[OITSUColor isEqual:](v20, "isEqual:", v6->mBorderBottomColor))
      {
        v21 = v6->mBorderColor;
        v6->mBorderColor = 0;

      }
      objc_msgSend(v4, "rightBorder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", objc_msgSend(v22, "type"), 4);
      objc_msgSend(v22, "color");
      v23 = objc_claimAutoreleasedReturnValue();
      mBorderRightColor = v6->mBorderRightColor;
      v6->mBorderRightColor = (OITSUColor *)v23;

      if (v6->mBorderStyle[4] != v6->mBorderStyle[0])
        *mBorderStyle = -1;
      if (v6->mBorderWidth[4] != *mBorderWidth)
        *mBorderWidth = -1;
      v25 = v6->mBorderColor;
      if (v25 && !-[OITSUColor isEqual:](v25, "isEqual:", v6->mBorderRightColor))
      {
        v26 = v6->mBorderColor;
        v6->mBorderColor = 0;

      }
    }
    else
    {
      -[EMBordersProperty setBorderStyleAndWidth:location:](v5, "setBorderStyleAndWidth:location:", 6, 1);
      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", 13, 2);
      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", 12, 3);
      -[EMBordersProperty setBorderStyleAndWidth:location:](v6, "setBorderStyleAndWidth:location:", 0, 4);
      v6->mBorderStyle[0] = -1;
      v6->mBorderWidth[0] = -1;
      +[OITSUColor blackColor](OITSUColor, "blackColor");
      v27 = objc_claimAutoreleasedReturnValue();
      v22 = v6->mBorderColor;
      v6->mBorderColor = (OITSUColor *)v27;
    }

  }
  return v6;
}

- (void)setBorderStyleAndWidth:(int)a3 location:(unsigned int)a4
{
  int *mBorderStyle;
  uint64_t v5;
  int v6;
  int v7;
  int *v8;

  switch(a3)
  {
    case 3:
    case 5:
    case 8:
      mBorderStyle = self->mBorderStyle;
      v5 = a4;
      v6 = 3;
      goto LABEL_5;
    case 4:
      mBorderStyle = self->mBorderStyle;
      v5 = a4;
      v6 = 4;
LABEL_5:
      mBorderStyle[a4] = v6;
      v7 = 1;
      break;
    case 6:
      v8 = self->mBorderStyle;
      v5 = a4;
      v7 = 1;
      goto LABEL_10;
    case 11:
      v5 = a4;
      self->mBorderStyle[a4] = 1;
      v7 = 2;
      break;
    case 12:
      v5 = a4;
      self->mBorderStyle[a4] = 1;
      v7 = 3;
      break;
    case 13:
      v8 = self->mBorderStyle;
      v5 = a4;
      v7 = 2;
LABEL_10:
      v8[a4] = v7;
      break;
    default:
      v7 = 0;
      v5 = a4;
      self->mBorderStyle[a4] = 0;
      break;
  }
  self->mBorderWidth[v5] = v7;
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

- (id)cssStringForName:(id)a3
{
  __CFString *v3;

  if (self->mBorderStyle[0])
  {
    -[EMBordersProperty cssString](self, "cssString", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_24F3BFFF8;
  }
  return v3;
}

- (id)cssString
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[EMBordersProperty styleString](self, "styleString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBordersProperty widthString](self, "widthString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMBordersProperty colorString](self, "colorString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") || objc_msgSend(v4, "length") || objc_msgSend(v5, "length"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (objc_msgSend(v3, "length"))
      objc_msgSend(v6, "appendString:", v3);
    if (objc_msgSend(v4, "length"))
      objc_msgSend(v6, "appendString:", v4);
    if (objc_msgSend(v5, "length"))
      objc_msgSend(v6, "appendString:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)styleString
{
  void *v3;
  __objc2_class **p_superclass;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  -[EMBordersProperty styleHashNumber](self, "styleHashNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_superclass = CMDiagramNodeLayout.superclass;
  +[EMWorkbookMapper borderStyleCache](EMWorkbookMapper, "borderStyleCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    goto LABEL_19;
  }
  if (self->mBorderStyle[0] == -1)
  {
    v14[0] = CFSTR("border-top-style");
    v14[1] = CFSTR("border-left-style");
    v14[2] = CFSTR("border-bottom-style");
    v9 = 0;
    v7 = 0;
    v14[3] = CFSTR("border-right-style");
    do
    {
      -[EMBordersProperty stringFromStyleEnum:](self, "stringFromStyleEnum:", self->mBorderStyle[dword_22A4D5590[v9]]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if (!v7)
          v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
        objc_msgSend(v7, "appendString:", v14[v9]);
        objc_msgSend(v7, "appendString:", v10);
      }

      ++v9;
    }
    while (v9 != 4);
    v11 = 3;
    p_superclass = (__objc2_class **)(CMDiagramNodeLayout + 8);
    do

    while (v11 != -1);
    if (v7)
      goto LABEL_18;
  }
  else
  {
    -[EMBordersProperty stringFromStyleEnum:](self, "stringFromStyleEnum:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", 0x24F3E6E78);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendString:", v8);
    }
    else
    {
      v7 = 0;
    }

    if (v7)
    {
LABEL_18:
      objc_msgSend(p_superclass + 194, "borderStyleCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v7, v3);

    }
  }
LABEL_19:

  return v7;
}

- (id)styleHashNumber
{
  uint64_t v2;

  v2 = self->mBorderStyle[0];
  if ((_DWORD)v2 == -1)
    v2 = vaddvq_s32(vmulq_s32(*(int32x4_t *)&self->mBorderStyle[1], (int32x4_t)xmmword_22A4D5580));
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
}

- (id)stringFromStyleEnum:(int)a3
{
  if (a3 > 4)
    return CFSTR(":solid;");
  else
    return (id)qword_24F3BF8C8[a3];
}

- (id)widthString
{
  void *v3;
  __objc2_class **p_superclass;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  -[EMBordersProperty widthHashNumber](self, "widthHashNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_superclass = CMDiagramNodeLayout.superclass;
  +[EMWorkbookMapper borderWidthCache](EMWorkbookMapper, "borderWidthCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    goto LABEL_19;
  }
  if (self->mBorderStyle[0] == -1)
  {
    v14[0] = CFSTR("border-top-width");
    v14[1] = CFSTR("border-left-width");
    v14[2] = CFSTR("border-bottom-width");
    v9 = 0;
    v7 = 0;
    v14[3] = CFSTR("border-right-width");
    do
    {
      -[EMBordersProperty stringFromWidthEnum:](self, "stringFromWidthEnum:", self->mBorderWidth[dword_22A4D5590[v9]]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if (!v7)
          v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
        objc_msgSend(v7, "appendString:", v14[v9]);
        objc_msgSend(v7, "appendString:", v10);
      }

      ++v9;
    }
    while (v9 != 4);
    v11 = 3;
    p_superclass = (__objc2_class **)(CMDiagramNodeLayout + 8);
    do

    while (v11 != -1);
    if (v7)
      goto LABEL_18;
  }
  else
  {
    -[EMBordersProperty stringFromWidthEnum:](self, "stringFromWidthEnum:", self->mBorderWidth[0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", 0x24F3E6EF8);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendString:", v8);
    }
    else
    {
      v7 = 0;
    }

    if (v7)
    {
LABEL_18:
      objc_msgSend(p_superclass + 194, "borderWidthCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v7, v3);

    }
  }
LABEL_19:

  return v7;
}

- (id)widthHashNumber
{
  uint64_t v2;

  v2 = self->mBorderWidth[0];
  if ((_DWORD)v2 == -1)
    v2 = vaddvq_s32(vmulq_s32(*(int32x4_t *)&self->mBorderWidth[1], (int32x4_t)xmmword_22A4D5580));
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
}

- (id)stringFromWidthEnum:(int)a3
{
  if (a3 > 3)
    return CFSTR(":solid;");
  else
    return (id)qword_24F3BF8F0[a3];
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
    -[EMBordersProperty stringFromColor:](self, "stringFromColor:", self->mBorderColor);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", 0x24F3E6E98);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMBordersProperty stringFromColor:](self, "stringFromColor:", self->mBorderTopColor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v5);

    objc_msgSend(v3, "appendString:", 0x24F3E6DB8);
    -[EMBordersProperty stringFromColor:](self, "stringFromColor:", self->mBorderLeftColor);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v6);

    objc_msgSend(v3, "appendString:", 0x24F3E6D38);
    -[EMBordersProperty stringFromColor:](self, "stringFromColor:", self->mBorderBottomColor);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v7);

    objc_msgSend(v3, "appendString:", 0x24F3E6E18);
    -[EMBordersProperty stringFromColor:](self, "stringFromColor:", self->mBorderRightColor);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  return v3;
}

- (id)stringFromColor:(id)a3
{
  id v3;
  __CFString *v4;
  CMColorProperty *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isBlack") & 1) != 0)
  {
    v4 = CFSTR(":black;");
  }
  else
  {
    v5 = -[CMColorProperty initWithColor:]([CMColorProperty alloc], "initWithColor:", v3);
    -[CMColorProperty cssStringForName:](v5, "cssStringForName:", &stru_24F3BFFF8);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (-[EMBordersProperty isNoneAtLocation:](self, "isNoneAtLocation:", 0)
      && (objc_msgSend(v5, "isNoneAtLocation:", 0) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v6 = -[EMBordersProperty hasSameColorsAs:](self, "hasSameColorsAs:", v5)
        && -[EMBordersProperty hasSameStylesAs:](self, "hasSameStylesAs:", v5)
        && -[EMBordersProperty hasSameWidthsAs:](self, "hasSameWidthsAs:", v5);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  EMBordersProperty *v4;
  id *p_isa;
  uint64_t i;
  uint64_t j;
  id *v8;

  v4 = -[EMBordersProperty init](+[EMBordersProperty allocWithZone:](EMBordersProperty, "allocWithZone:", a3), "init");
  p_isa = (id *)&v4->super.super.isa;
  if (v4)
  {
    objc_storeStrong((id *)&v4->mBorderColor, self->mBorderColor);
    objc_storeStrong(p_isa + 3, self->mBorderTopColor);
    objc_storeStrong(p_isa + 4, self->mBorderLeftColor);
    objc_storeStrong(p_isa + 5, self->mBorderBottomColor);
    objc_storeStrong(p_isa + 6, self->mBorderRightColor);
    for (i = 0; i != 5; ++i)
      *(_DWORD *)((char *)p_isa + i * 4 + 56) = self->mBorderStyle[i];
    for (j = 0; j != 5; ++j)
      *(_DWORD *)((char *)p_isa + j * 4 + 76) = self->mBorderWidth[j];
    v8 = p_isa;
  }

  return p_isa;
}

- (EMBordersProperty)initWithOADStroke:(id)a3
{
  id v4;
  EMBordersProperty *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  OITSUColor *mBorderColor;
  void *v15;
  char v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  uint64_t v23;
  OITSUColor *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)EMBordersProperty;
  v5 = -[EMBordersProperty init](&v26, sel_init);
  if (!v5)
    goto LABEL_19;
  if (!objc_msgSend(v4, "isFillOverridden")
    || (objc_msgSend(v4, "fill"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) == 0))
  {
    v5->mBorderStyle[0] = 0;
    goto LABEL_19;
  }
  objc_msgSend(v4, "fill");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5->mBorderWidth[0] = 1;
  if (objc_msgSend(v4, "isDashOverridden"))
  {
    objc_msgSend(v4, "dash");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "dash");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "type");

      if (v11)
      {
        v12 = 3;
        goto LABEL_14;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v4, "isCompoundTypeOverridden") && objc_msgSend(v4, "compoundType"))
  {
    v5->mBorderStyle[0] = 2;
    v5->mBorderWidth[0] = 2;
    goto LABEL_15;
  }
  v12 = 1;
LABEL_14:
  v5->mBorderStyle[0] = v12;
LABEL_15:
  +[OITSUColor blackColor](OITSUColor, "blackColor");
  v13 = objc_claimAutoreleasedReturnValue();
  mBorderColor = v5->mBorderColor;
  v5->mBorderColor = (OITSUColor *)v13;

  if (objc_msgSend(v8, "isColorOverridden"))
  {
    objc_msgSend(v8, "color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) != 0)
    {
      objc_msgSend(v8, "color");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "red");
      v19 = v18;
      objc_msgSend(v17, "green");
      v21 = v20;
      objc_msgSend(v17, "blue");
      +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", v19, v21, v22, 1.0);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v5->mBorderColor;
      v5->mBorderColor = (OITSUColor *)v23;

    }
  }

LABEL_19:
  return v5;
}

- (id)borderColor
{
  return self->mBorderColor;
}

- (int)borderStyles
{
  return self->mBorderStyle;
}

- (int)borderWidths
{
  return self->mBorderWidth;
}

- (BOOL)isNoneAtLocation:(int)a3
{
  return self->mBorderStyle[a3] == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBorderRightColor, 0);
  objc_storeStrong((id *)&self->mBorderBottomColor, 0);
  objc_storeStrong((id *)&self->mBorderLeftColor, 0);
  objc_storeStrong((id *)&self->mBorderTopColor, 0);
  objc_storeStrong((id *)&self->mBorderColor, 0);
}

- (BOOL)hasSameStylesAs:(id)a3
{
  int *v4;
  int v5;
  int v6;

  v4 = (int *)objc_msgSend(a3, "borderStyles");
  v5 = self->mBorderStyle[0];
  v6 = *v4;
  if (v5 != -1)
    return v6 == v5;
  return v6 == -1
      && v4[1] == self->mBorderStyle[1]
      && v4[2] == self->mBorderStyle[2]
      && v4[3] == self->mBorderStyle[3]
      && v4[4] == self->mBorderStyle[4];
}

- (BOOL)hasSameWidthsAs:(id)a3
{
  int *v4;
  int v5;
  int v6;

  v4 = (int *)objc_msgSend(a3, "borderWidths");
  v5 = self->mBorderWidth[0];
  v6 = *v4;
  if (v5 != -1)
    return v6 == v5;
  return v6 == -1
      && v4[1] == self->mBorderWidth[1]
      && v4[2] == self->mBorderWidth[2]
      && v4[3] == self->mBorderWidth[3]
      && v4[4] == self->mBorderWidth[4];
}

- (BOOL)hasSameColorsAs:(id)a3
{
  id v4;
  void *v5;
  OITSUColor *mBorderColor;
  void *v7;

  v4 = a3;
  v5 = v4;
  mBorderColor = self->mBorderColor;
  if (mBorderColor)
  {
    objc_msgSend(v4, "borderColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(mBorderColor) = -[OITSUColor isEqual:](mBorderColor, "isEqual:", v7);

  }
  return (char)mBorderColor;
}

@end
