@implementation OADShapeStyle

- (void)setLineReference:(id)a3
{
  objc_storeStrong((id *)&self->mLineReference, a3);
}

- (void)setFillReference:(id)a3
{
  objc_storeStrong((id *)&self->mFillReference, a3);
}

- (void)setEffectReference:(id)a3
{
  objc_storeStrong((id *)&self->mEffectReference, a3);
}

- (void)setFontReference:(id)a3
{
  objc_storeStrong((id *)&self->mFontReference, a3);
}

- (void)applyToGraphicProperties:(id)a3 styleMatrix:(id)a4
{
  double v4;

  LODWORD(v4) = 1.0;
  -[OADShapeStyle applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:](self, "applyToGraphicProperties:styleMatrix:useNull:strokeWidthMultiplier:", a3, a4, 0, v4);
}

- (void)applyToGraphicProperties:(id)a3 styleMatrix:(id)a4 useNull:(BOOL)a5 strokeWidthMultiplier:(float)a6
{
  _BOOL4 v7;
  id v10;
  uint64_t v11;
  OADStyleMatrixReference *mLineReference;
  void *v13;
  void *v14;
  float v15;
  double v16;
  void *v17;
  void *v18;
  OADStyleMatrixReference *mFillReference;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  OADStyleMatrixReference *mEffectReference;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v7 = a5;
  v29 = a3;
  v10 = a4;
  v11 = objc_msgSend(v29, "isMergedWithParent");
  objc_msgSend(v29, "setMergedWithParent:", 0);
  mLineReference = self->mLineReference;
  if (mLineReference)
  {
    objc_msgSend(v10, "strokeAtIndex:", -[OADStyleMatrixReference matrixIndex](mLineReference, "matrixIndex"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      goto LABEL_7;
  }
  else
  {
    v13 = 0;
  }
  if (v7)
  {
    +[OADStroke nullStroke](OADStroke, "nullStroke");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  if (v13)
  {
    v14 = (void *)objc_msgSend(v13, "copy");

    if (a6 != 1.0)
    {
      objc_msgSend(v14, "width");
      *(float *)&v16 = v15 * a6;
      objc_msgSend(v14, "setWidth:", v16);
    }
    -[OADStyleMatrixReference color](self->mLineReference, "color");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v14, "setStyleColor:", v17);
    if ((objc_msgSend(v29, "hasStroke") & 1) != 0)
    {
      objc_msgSend(v29, "stroke");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setParent:", v14);

    }
    else
    {
      objc_msgSend(v29, "setStroke:", v14);
    }

  }
  else
  {
    v14 = 0;
  }
  mFillReference = self->mFillReference;
  if (mFillReference)
  {
    objc_msgSend(v10, "fillAtIndex:", -[OADStyleMatrixReference matrixIndex](mFillReference, "matrixIndex"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      goto LABEL_23;
  }
  else
  {
    v20 = 0;
  }
  if (v7)
  {
    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_23:
  if (v20)
  {
    v21 = (void *)objc_msgSend(v20, "copy");

    -[OADStyleMatrixReference color](self->mFillReference, "color");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v21, "setStyleColor:", v22);
    }
    else
    {
      +[OADNullFill nullFill](OADNullFill, "nullFill");
      v23 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v23;
    }
    if ((objc_msgSend(v29, "hasFill") & 1) != 0)
    {
      objc_msgSend(v29, "fill");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isMemberOfClass:", objc_opt_class()))
        objc_msgSend(v24, "setParent:", v21);

    }
    else
    {
      objc_msgSend(v21, "setDefinedByStyle:", 1);
      objc_msgSend(v29, "setFill:", v21);
    }

    v20 = v21;
  }
  if ((objc_msgSend(v29, "hasEffects") & 1) == 0)
  {
    mEffectReference = self->mEffectReference;
    if (mEffectReference)
    {
      objc_msgSend(v10, "effectsAtIndex:", -[OADStyleMatrixReference matrixIndex](mEffectReference, "matrixIndex"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    if (!v26 && v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v26)
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v26, 1);

      -[OADStyleMatrixReference color](self->mEffectReference, "color");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
        objc_msgSend(v27, "makeObjectsPerformSelector:withObject:", sel_setStyleColor_, v28);
      objc_msgSend(v29, "setEffects:", v27);

    }
  }
  objc_msgSend(v29, "setMergedWithParent:", v11);

}

- (void)applyToTextListStyle:(id)a3
{
  void *v4;
  uint64_t i;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "defaultProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADShapeStyle applyToParagraphProperties:](self, "applyToParagraphProperties:", v4);

  for (i = 0; i != 9; ++i)
  {
    objc_msgSend(v7, "propertiesForListLevel:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShapeStyle applyToParagraphProperties:](self, "applyToParagraphProperties:", v6);

  }
}

- (void)applyToParagraphProperties:(id)a3
{
  -[OADFontReference applyToParagraphProperties:](self->mFontReference, "applyToParagraphProperties:", a3);
}

- (void)applyToTextBody:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "overrideTextListStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[OADShapeStyle applyToTextListStyle:](self, "applyToTextListStyle:", v4);
  }
  else
  {
    v5 = objc_msgSend(v9, "paragraphCount");
    if (v5)
    {
      for (i = 0; i != v5; ++i)
      {
        objc_msgSend(v9, "paragraphAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "properties");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADShapeStyle applyToParagraphProperties:](self, "applyToParagraphProperties:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[OADStyleMatrixReference copyWithZone:](self->mLineReference, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[OADStyleMatrixReference copyWithZone:](self->mFillReference, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[OADStyleMatrixReference copyWithZone:](self->mEffectReference, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[OADFontReference copyWithZone:](self->mFontReference, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (id)fillReference
{
  return self->mFillReference;
}

- (id)lineReference
{
  return self->mLineReference;
}

- (id)fontReference
{
  return self->mFontReference;
}

- (void)setFillMatrixIndex:(unsigned int)a3 color:(id)a4
{
  OADStyleMatrixReference *v6;
  OADStyleMatrixReference *mFillReference;
  id v8;

  v8 = a4;
  v6 = -[OADStyleMatrixReference initWithMatrixIndex:color:]([OADStyleMatrixReference alloc], "initWithMatrixIndex:color:", a3, v8);
  mFillReference = self->mFillReference;
  self->mFillReference = v6;

}

- (void)setLineMatrixIndex:(unsigned int)a3 color:(id)a4
{
  OADStyleMatrixReference *v6;
  OADStyleMatrixReference *mLineReference;
  id v8;

  v8 = a4;
  v6 = -[OADStyleMatrixReference initWithMatrixIndex:color:]([OADStyleMatrixReference alloc], "initWithMatrixIndex:color:", a3, v8);
  mLineReference = self->mLineReference;
  self->mLineReference = v6;

}

- (void)setEffectMatrixIndex:(unsigned int)a3 color:(id)a4
{
  OADStyleMatrixReference *v6;
  OADStyleMatrixReference *mEffectReference;
  id v8;

  v8 = a4;
  v6 = -[OADStyleMatrixReference initWithMatrixIndex:color:]([OADStyleMatrixReference alloc], "initWithMatrixIndex:color:", a3, v8);
  mEffectReference = self->mEffectReference;
  self->mEffectReference = v6;

}

+ (id)defaultShapeStyle
{
  void *v2;
  OADShapeStyle *v3;
  void *v4;
  OADFontReference *v5;

  v2 = (void *)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle;
  if (!+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle)
  {
    v3 = objc_alloc_init(OADShapeStyle);
    v4 = (void *)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle;
    +[OADShapeStyle defaultShapeStyle]::defaultShapeStyle = (uint64_t)v3;

    objc_msgSend((id)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle, "setLineMatrixIndex:color:", 0, 0);
    objc_msgSend((id)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle, "setFillMatrixIndex:color:", 0, 0);
    objc_msgSend((id)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle, "setEffectMatrixIndex:color:", 0, 0);
    v5 = objc_alloc_init(OADFontReference);
    -[OADFontReference setIndex:](v5, "setIndex:", 0xFFFFFFFFLL);
    objc_msgSend((id)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle, "setFontReference:", v5);

    v2 = (void *)+[OADShapeStyle defaultShapeStyle]::defaultShapeStyle;
  }
  return v2;
}

+ (id)defaultOfficeShapeStyle
{
  void *v2;
  OADShapeStyle *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  OADFontReference *v11;
  void *v12;

  v2 = (void *)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle;
  if (!+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle)
  {
    v3 = objc_alloc_init(OADShapeStyle);
    v4 = (void *)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle;
    +[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle = (uint64_t)v3;

    v5 = (void *)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle;
    +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLineMatrixIndex:color:", 1, v6);

    v7 = (void *)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle;
    +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFillMatrixIndex:color:", 3, v8);

    v9 = (void *)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle;
    +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEffectMatrixIndex:color:", 2, v10);

    v11 = objc_alloc_init(OADFontReference);
    -[OADFontReference setIndex:](v11, "setIndex:", 1);
    +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADFontReference setColor:](v11, "setColor:", v12);

    objc_msgSend((id)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle, "setFontReference:", v11);
    v2 = (void *)+[OADShapeStyle defaultOfficeShapeStyle]::defaultOfficeShapeStyle;
  }
  return v2;
}

- (id)effectReference
{
  return self->mEffectReference;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[OITSUDescription descriptionWithObject:class:](OITSUDescription, "descriptionWithObject:class:", self, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStyleMatrixReference description](self->mLineReference, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("Line"), v4);

  -[OADStyleMatrixReference description](self->mFillReference, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("Fill"), v5);

  -[OADStyleMatrixReference description](self->mEffectReference, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("Effect"), v6);

  -[OADFontReference description](self->mFontReference, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("Font"), v7);

  objc_msgSend(v3, "descriptionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFontReference, 0);
  objc_storeStrong((id *)&self->mEffectReference, 0);
  objc_storeStrong((id *)&self->mFillReference, 0);
  objc_storeStrong((id *)&self->mLineReference, 0);
}

@end
