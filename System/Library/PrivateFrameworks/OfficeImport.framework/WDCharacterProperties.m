@implementation WDCharacterProperties

- (WDCharacterProperties)initWithDocument:(id)a3
{
  id v4;
  WDCharacterProperties *v5;
  WDCharacterProperties *v6;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDCharacterProperties;
  v5 = -[WDCharacterProperties init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    *(_WORD *)&v6->mOriginal = 1;
    v6->mResolved = 0;
    mOriginalProperties = v6->mOriginalProperties;
    v6->mOriginalProperties = 0;

    mTrackedProperties = v6->mTrackedProperties;
    v6->mTrackedProperties = 0;

  }
  return v6;
}

- (void)setResolveMode:(int)a3
{
  self->mTracked = a3 == 1;
  self->mResolved = a3 == 2;
  self->mOriginal = a3 == 0;
}

- (void)setBold:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setBold:](mTrackedProperties, "setBold:", v3);
  objc_msgSend(*p_mTrackedProperties, "setBoldOverridden:", 1);
}

- (void)setItalic:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setItalic:](mTrackedProperties, "setItalic:", v3);
  objc_msgSend(*p_mTrackedProperties, "setItalicOverridden:", 1);
}

- (void)setOutline:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setOutline:](mTrackedProperties, "setOutline:", v3);
  objc_msgSend(*p_mTrackedProperties, "setOutlineOverridden:", 1);
}

- (void)setShadow:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setShadow:](mTrackedProperties, "setShadow:", v3);
  objc_msgSend(*p_mTrackedProperties, "setShadowOverridden:", 1);
}

- (void)setEmbossed:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setEmbossed:](mTrackedProperties, "setEmbossed:", v3);
  objc_msgSend(*p_mTrackedProperties, "setEmbossedOverridden:", 1);
}

- (void)setImprint:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setImprint:](mTrackedProperties, "setImprint:", v3);
  objc_msgSend(*p_mTrackedProperties, "setImprintOverridden:", 1);
}

- (void)setUnderline:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setUnderline:](mTrackedProperties, "setUnderline:", v3);
  objc_msgSend(*p_mTrackedProperties, "setUnderlineOverridden:", 1);
}

- (void)setUnderlineColor:(id)a3
{
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  id v12;

  v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      -[WDCharacterPropertiesValues setUnderlineColor:](v4, "setUnderlineColor:", v12);
      -[WDCharacterPropertiesValues setUnderlineColorOverridden:](*p_mTrackedProperties, "setUnderlineColorOverridden:", 1);
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    v4 = mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_8;
    v10 = objc_alloc_init(WDCharacterPropertiesValues);
    v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
      goto LABEL_8;
  }

}

- (void)setStrikeThrough:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setStrikeThrough:](mTrackedProperties, "setStrikeThrough:", v3);
  objc_msgSend(*p_mTrackedProperties, "setStrikeThroughOverridden:", 1);
}

- (void)setDoubleStrikeThrough:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setDoubleStrikeThrough:](mTrackedProperties, "setDoubleStrikeThrough:", v3);
  objc_msgSend(*p_mTrackedProperties, "setDoubleStrikeThroughOverridden:", 1);
}

- (id)mutableBorder
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *v5;
  void *v6;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  void *v12;
  WDBorder *v13;

  if (!self->mTracked)
  {
    if (self->mOriginal)
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties
        || (v10 = objc_alloc_init(WDCharacterPropertiesValues),
            v11 = self->mOriginalProperties,
            self->mOriginalProperties = v10,
            v11,
            (mOriginalProperties = self->mOriginalProperties) != 0))
      {
        -[WDCharacterPropertiesValues border](mOriginalProperties, "border");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = self->mOriginalProperties;
        if (!v12)
        {
          -[WDCharacterPropertiesValues setBorderOverridden:](v7, "setBorderOverridden:", 1);
          v8 = self->mOriginalProperties;
          goto LABEL_13;
        }
        goto LABEL_10;
      }
    }
LABEL_11:
    v13 = 0;
    return v13;
  }
  mTrackedProperties = self->mTrackedProperties;
  if (!mTrackedProperties)
  {
    v4 = objc_alloc_init(WDCharacterPropertiesValues);
    v5 = self->mTrackedProperties;
    self->mTrackedProperties = v4;

    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_11;
  }
  -[WDCharacterPropertiesValues border](mTrackedProperties, "border");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->mTrackedProperties;
  if (!v6)
  {
    -[WDCharacterPropertiesValues setBorderOverridden:](v7, "setBorderOverridden:", 1);
    v8 = self->mTrackedProperties;
LABEL_13:
    v13 = objc_alloc_init(WDBorder);
    -[WDCharacterPropertiesValues setBorder:](v8, "setBorder:", v13);
    return v13;
  }
LABEL_10:
  -[WDCharacterPropertiesValues border](v7, "border");
  v13 = (WDBorder *)objc_claimAutoreleasedReturnValue();
  return v13;
}

- (void)setColor:(id)a3
{
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  id v12;

  v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      -[WDCharacterPropertiesValues setColor:](v4, "setColor:", v12);
      -[WDCharacterPropertiesValues setColorOverridden:](*p_mTrackedProperties, "setColorOverridden:", 1);
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    v4 = mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_8;
    v10 = objc_alloc_init(WDCharacterPropertiesValues);
    v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
      goto LABEL_8;
  }

}

- (id)mutableShading
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *v5;
  void *v6;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  void *v12;
  WDShading *v13;

  if (!self->mTracked)
  {
    if (self->mOriginal)
    {
      mOriginalProperties = self->mOriginalProperties;
      if (mOriginalProperties
        || (v10 = objc_alloc_init(WDCharacterPropertiesValues),
            v11 = self->mOriginalProperties,
            self->mOriginalProperties = v10,
            v11,
            (mOriginalProperties = self->mOriginalProperties) != 0))
      {
        -[WDCharacterPropertiesValues shading](mOriginalProperties, "shading");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = self->mOriginalProperties;
        if (!v12)
        {
          -[WDCharacterPropertiesValues setShadingOverridden:](v7, "setShadingOverridden:", 1);
          v8 = self->mOriginalProperties;
          goto LABEL_13;
        }
        goto LABEL_10;
      }
    }
LABEL_11:
    v13 = 0;
    return v13;
  }
  mTrackedProperties = self->mTrackedProperties;
  if (!mTrackedProperties)
  {
    v4 = objc_alloc_init(WDCharacterPropertiesValues);
    v5 = self->mTrackedProperties;
    self->mTrackedProperties = v4;

    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_11;
  }
  -[WDCharacterPropertiesValues shading](mTrackedProperties, "shading");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->mTrackedProperties;
  if (!v6)
  {
    -[WDCharacterPropertiesValues setShadingOverridden:](v7, "setShadingOverridden:", 1);
    v8 = self->mTrackedProperties;
LABEL_13:
    v13 = objc_alloc_init(WDShading);
    -[WDCharacterPropertiesValues setShading:](v8, "setShading:", v13);
    return v13;
  }
LABEL_10:
  -[WDCharacterPropertiesValues shading](v7, "shading");
  v13 = (WDShading *)objc_claimAutoreleasedReturnValue();
  return v13;
}

- (void)setHighlightColor:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setHighlightColor:](mTrackedProperties, "setHighlightColor:", v3);
  objc_msgSend(*p_mTrackedProperties, "setHighlightColorOverridden:", 1);
}

- (void)setSmallCaps:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setSmallCaps:](mTrackedProperties, "setSmallCaps:", v3);
  objc_msgSend(*p_mTrackedProperties, "setSmallCapsOverridden:", 1);
}

- (void)setCaps:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setCaps:](mTrackedProperties, "setCaps:", v3);
  objc_msgSend(*p_mTrackedProperties, "setCapsOverridden:", 1);
}

- (void)setHidden:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setHidden:](mTrackedProperties, "setHidden:", v3);
  objc_msgSend(*p_mTrackedProperties, "setHiddenOverridden:", 1);
}

- (void)setSpacing:(signed __int16)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setSpacing:](mTrackedProperties, "setSpacing:", v3);
  objc_msgSend(*p_mTrackedProperties, "setSpacingOverridden:", 1);
}

- (void)setPosition:(signed __int16)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setPosition:](mTrackedProperties, "setPosition:", v3);
  objc_msgSend(*p_mTrackedProperties, "setPositionOverridden:", 1);
}

- (void)setVerticalAlign:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setVerticalAlign:](mTrackedProperties, "setVerticalAlign:", v3);
  objc_msgSend(*p_mTrackedProperties, "setVerticalAlignOverridden:", 1);
}

- (void)setFontSize:(unsigned __int16)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setFontSize:](mTrackedProperties, "setFontSize:", v3);
  objc_msgSend(*p_mTrackedProperties, "setFontSizeOverridden:", 1);
}

- (void)setKerning:(unsigned __int16)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setKerning:](mTrackedProperties, "setKerning:", v3);
  objc_msgSend(*p_mTrackedProperties, "setKerningOverridden:", 1);
}

- (void)setFont:(id)a3
{
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    if (self->mTracked)
    {
      mTrackedProperties = self->mTrackedProperties;
      p_mTrackedProperties = &self->mTrackedProperties;
      v4 = mTrackedProperties;
      if (mTrackedProperties
        || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
            v8 = *p_mTrackedProperties,
            *p_mTrackedProperties = v7,
            v8,
            (v4 = *p_mTrackedProperties) != 0))
      {
LABEL_9:
        -[WDCharacterPropertiesValues setFont:](v4, "setFont:", v12);
        -[WDCharacterPropertiesValues setFontOverridden:](*p_mTrackedProperties, "setFontOverridden:", 1);
      }
    }
    else if (self->mOriginal)
    {
      mOriginalProperties = self->mOriginalProperties;
      p_mTrackedProperties = &self->mOriginalProperties;
      v4 = mOriginalProperties;
      if (mOriginalProperties)
        goto LABEL_9;
      v10 = objc_alloc_init(WDCharacterPropertiesValues);
      v11 = *p_mTrackedProperties;
      *p_mTrackedProperties = v10;

      v4 = *p_mTrackedProperties;
      if (*p_mTrackedProperties)
        goto LABEL_9;
    }
  }

}

- (void)setFarEastFont:(id)a3
{
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    if (self->mTracked)
    {
      mTrackedProperties = self->mTrackedProperties;
      p_mTrackedProperties = &self->mTrackedProperties;
      v4 = mTrackedProperties;
      if (mTrackedProperties
        || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
            v8 = *p_mTrackedProperties,
            *p_mTrackedProperties = v7,
            v8,
            (v4 = *p_mTrackedProperties) != 0))
      {
LABEL_9:
        -[WDCharacterPropertiesValues setFarEastFont:](v4, "setFarEastFont:", v12);
        -[WDCharacterPropertiesValues setFarEastFontOverridden:](*p_mTrackedProperties, "setFarEastFontOverridden:", 1);
      }
    }
    else if (self->mOriginal)
    {
      mOriginalProperties = self->mOriginalProperties;
      p_mTrackedProperties = &self->mOriginalProperties;
      v4 = mOriginalProperties;
      if (mOriginalProperties)
        goto LABEL_9;
      v10 = objc_alloc_init(WDCharacterPropertiesValues);
      v11 = *p_mTrackedProperties;
      *p_mTrackedProperties = v10;

      v4 = *p_mTrackedProperties;
      if (*p_mTrackedProperties)
        goto LABEL_9;
    }
  }

}

- (void)setExtendedFont:(id)a3
{
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    if (self->mTracked)
    {
      mTrackedProperties = self->mTrackedProperties;
      p_mTrackedProperties = &self->mTrackedProperties;
      v4 = mTrackedProperties;
      if (mTrackedProperties
        || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
            v8 = *p_mTrackedProperties,
            *p_mTrackedProperties = v7,
            v8,
            (v4 = *p_mTrackedProperties) != 0))
      {
LABEL_9:
        -[WDCharacterPropertiesValues setExtendedFont:](v4, "setExtendedFont:", v12);
        -[WDCharacterPropertiesValues setExtendedFontOverridden:](*p_mTrackedProperties, "setExtendedFontOverridden:", 1);
      }
    }
    else if (self->mOriginal)
    {
      mOriginalProperties = self->mOriginalProperties;
      p_mTrackedProperties = &self->mOriginalProperties;
      v4 = mOriginalProperties;
      if (mOriginalProperties)
        goto LABEL_9;
      v10 = objc_alloc_init(WDCharacterPropertiesValues);
      v11 = *p_mTrackedProperties;
      *p_mTrackedProperties = v10;

      v4 = *p_mTrackedProperties;
      if (*p_mTrackedProperties)
        goto LABEL_9;
    }
  }

}

- (void)setSymbolFont:(id)a3
{
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  id v12;

  v12 = a3;
  if (v12)
  {
    if (self->mTracked)
    {
      mTrackedProperties = self->mTrackedProperties;
      p_mTrackedProperties = &self->mTrackedProperties;
      v4 = mTrackedProperties;
      if (mTrackedProperties
        || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
            v8 = *p_mTrackedProperties,
            *p_mTrackedProperties = v7,
            v8,
            (v4 = *p_mTrackedProperties) != 0))
      {
LABEL_9:
        -[WDCharacterPropertiesValues setSymbolFont:](v4, "setSymbolFont:", v12);
        -[WDCharacterPropertiesValues setSymbolFontOverridden:](*p_mTrackedProperties, "setSymbolFontOverridden:", 1);
      }
    }
    else if (self->mOriginal)
    {
      mOriginalProperties = self->mOriginalProperties;
      p_mTrackedProperties = &self->mOriginalProperties;
      v4 = mOriginalProperties;
      if (mOriginalProperties)
        goto LABEL_9;
      v10 = objc_alloc_init(WDCharacterPropertiesValues);
      v11 = *p_mTrackedProperties;
      *p_mTrackedProperties = v10;

      v4 = *p_mTrackedProperties;
      if (*p_mTrackedProperties)
        goto LABEL_9;
    }
  }

}

- (void)setLanguageForDefaultText:(int)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setLanguageForDefaultText:](mTrackedProperties, "setLanguageForDefaultText:", v3);
  objc_msgSend(*p_mTrackedProperties, "setLanguageForDefaultTextOverridden:", 1);
}

- (void)setLanguageForFarEast:(int)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setLanguageForFarEast:](mTrackedProperties, "setLanguageForFarEast:", v3);
  objc_msgSend(*p_mTrackedProperties, "setLanguageForFarEastOverridden:", 1);
}

- (void)setLanguageForBiText:(int)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setLanguageForBiText:](mTrackedProperties, "setLanguageForBiText:", v3);
  objc_msgSend(*p_mTrackedProperties, "setLanguageForBiTextOverridden:", 1);
}

- (void)setDeleted:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setDeleted:](mTrackedProperties, "setDeleted:", v3);
  objc_msgSend(*p_mTrackedProperties, "setDeletedOverridden:", 1);
}

- (void)setEdited:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setEdited:](mTrackedProperties, "setEdited:", v3);
  objc_msgSend(*p_mTrackedProperties, "setEditedOverridden:", 1);
}

- (void)setFormattingChanged:(int)a3
{
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setFormattingChanged:](mTrackedProperties, "setFormattingChanged:", a3 != 0);
  objc_msgSend(*p_mTrackedProperties, "setFormattingChangedOverridden:", 1);
}

- (void)clearBaseStyle
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (mTrackedProperties = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues baseStyleOverridden](mTrackedProperties, "baseStyleOverridden"))
  {
    v3 = 24;
LABEL_8:
    objc_msgSend(*(id *)((char *)&self->super.isa + v3), "setBaseStyleOverridden:", 0);
    objc_msgSend(*(id *)((char *)&self->super.isa + v3), "setBaseStyle:", 0);
    return;
  }
  if (self->mOriginal
    || self->mResolved
    && (mOriginalProperties = self->mOriginalProperties) != 0
    && -[WDCharacterPropertiesValues baseStyleOverridden](mOriginalProperties, "baseStyleOverridden"))
  {
    v3 = 16;
    goto LABEL_8;
  }
}

- (void)setFontSizeForBiText:(unsigned __int16)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setFontSizeForBiText:](mTrackedProperties, "setFontSizeForBiText:", v3);
  objc_msgSend(*p_mTrackedProperties, "setFontSizeForBiTextOverridden:", 1);
}

- (void)setColorAuto:(BOOL)a3
{
  _BOOL8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setColorAuto:](mTrackedProperties, "setColorAuto:", v3);
  objc_msgSend(*p_mTrackedProperties, "setColorAutoOverridden:", 1);
}

- (BOOL)isListCharacterPictureBulletOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues listCharacterPictureBulletOverridden](v4, "listCharacterPictureBulletOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues listCharacterPictureBulletOverridden](mTrackedProperties, "listCharacterPictureBulletOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues listCharacterPictureBulletOverridden](mOriginalProperties, "listCharacterPictureBulletOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues listCharacterPictureBulletOverridden](mTrackedProperties, "listCharacterPictureBulletOverridden");
  }
  return 0;
}

- (void)setSpecialCharacter:(BOOL)a3
{
  _BOOL8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setSpecialCharacter:](mTrackedProperties, "setSpecialCharacter:", v3);
  objc_msgSend(*p_mTrackedProperties, "setSpecialCharacterOverridden:", 1);
}

- (void)setBaseStyle:(id)a3
{
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  id v12;

  v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      -[WDCharacterPropertiesValues setBaseStyle:](v4, "setBaseStyle:", v12);
      -[WDCharacterPropertiesValues setBaseStyleOverridden:](*p_mTrackedProperties, "setBaseStyleOverridden:", v12 != 0);
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    v4 = mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_8;
    v10 = objc_alloc_init(WDCharacterPropertiesValues);
    v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
      goto LABEL_8;
  }

}

- (BOOL)isRightToLeftOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues rightToLeftOverridden](v4, "rightToLeftOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues rightToLeftOverridden](mTrackedProperties, "rightToLeftOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues rightToLeftOverridden](mOriginalProperties, "rightToLeftOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues rightToLeftOverridden](mTrackedProperties, "rightToLeftOverridden");
  }
  return 0;
}

- (BOOL)isDeletedOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues deletedOverridden](v4, "deletedOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues deletedOverridden](mTrackedProperties, "deletedOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues deletedOverridden](mOriginalProperties, "deletedOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues deletedOverridden](mTrackedProperties, "deletedOverridden");
  }
  return 0;
}

- (BOOL)isBaseStyleOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues baseStyleOverridden](v4, "baseStyleOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues baseStyleOverridden](mTrackedProperties, "baseStyleOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues baseStyleOverridden](mOriginalProperties, "baseStyleOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues baseStyleOverridden](mTrackedProperties, "baseStyleOverridden");
  }
  return 0;
}

- (BOOL)isBoldOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues boldOverridden](v4, "boldOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues boldOverridden](mTrackedProperties, "boldOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues boldOverridden](mOriginalProperties, "boldOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues boldOverridden](mTrackedProperties, "boldOverridden");
  }
  return 0;
}

- (BOOL)isItalicOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues italicOverridden](v4, "italicOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues italicOverridden](mTrackedProperties, "italicOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues italicOverridden](mOriginalProperties, "italicOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues italicOverridden](mTrackedProperties, "italicOverridden");
  }
  return 0;
}

- (BOOL)isStrikeThroughOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues strikeThroughOverridden](v4, "strikeThroughOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues strikeThroughOverridden](mTrackedProperties, "strikeThroughOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues strikeThroughOverridden](mOriginalProperties, "strikeThroughOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues strikeThroughOverridden](mTrackedProperties, "strikeThroughOverridden");
  }
  return 0;
}

- (BOOL)isDoubleStrikeThroughOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues doubleStrikeThroughOverridden](v4, "doubleStrikeThroughOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues doubleStrikeThroughOverridden](mTrackedProperties, "doubleStrikeThroughOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues doubleStrikeThroughOverridden](mOriginalProperties, "doubleStrikeThroughOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues doubleStrikeThroughOverridden](mTrackedProperties, "doubleStrikeThroughOverridden");
  }
  return 0;
}

- (BOOL)isFontSizeOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues fontSizeOverridden](v4, "fontSizeOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues fontSizeOverridden](mTrackedProperties, "fontSizeOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues fontSizeOverridden](mOriginalProperties, "fontSizeOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues fontSizeOverridden](mTrackedProperties, "fontSizeOverridden");
  }
  return 0;
}

- (unsigned)fontSize
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues fontSizeOverridden](mTrackedProperties, "fontSizeOverridden"))
        return -[WDCharacterPropertiesValues fontSize](*p_mTrackedProperties, "fontSize");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues fontSizeOverridden](v5, "fontSizeOverridden")))
  {
    return -[WDCharacterPropertiesValues fontSize](*p_mTrackedProperties, "fontSize");
  }
  else
  {
    return 20;
  }
}

- (BOOL)isVerticalAlignOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues verticalAlignOverridden](v4, "verticalAlignOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues verticalAlignOverridden](mTrackedProperties, "verticalAlignOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues verticalAlignOverridden](mOriginalProperties, "verticalAlignOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues verticalAlignOverridden](mTrackedProperties, "verticalAlignOverridden");
  }
  return 0;
}

- (BOOL)isFontOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues fontOverridden](v4, "fontOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues fontOverridden](mTrackedProperties, "fontOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues fontOverridden](mOriginalProperties, "fontOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues fontOverridden](mTrackedProperties, "fontOverridden");
  }
  return 0;
}

- (BOOL)isUnderlineOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues underlineOverridden](v4, "underlineOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues underlineOverridden](mTrackedProperties, "underlineOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues underlineOverridden](mOriginalProperties, "underlineOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues underlineOverridden](mTrackedProperties, "underlineOverridden");
  }
  return 0;
}

- (BOOL)isSmallCapsOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues smallCapsOverridden](v4, "smallCapsOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues smallCapsOverridden](mTrackedProperties, "smallCapsOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues smallCapsOverridden](mOriginalProperties, "smallCapsOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues smallCapsOverridden](mTrackedProperties, "smallCapsOverridden");
  }
  return 0;
}

- (BOOL)isCapsOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues capsOverridden](v4, "capsOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues capsOverridden](mTrackedProperties, "capsOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues capsOverridden](mOriginalProperties, "capsOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues capsOverridden](mTrackedProperties, "capsOverridden");
  }
  return 0;
}

- (BOOL)isColorOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues colorOverridden](v4, "colorOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues colorOverridden](mTrackedProperties, "colorOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues colorOverridden](mOriginalProperties, "colorOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues colorOverridden](mTrackedProperties, "colorOverridden");
  }
  return 0;
}

- (BOOL)isShadingOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues shadingOverridden](v4, "shadingOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues shadingOverridden](mTrackedProperties, "shadingOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues shadingOverridden](mOriginalProperties, "shadingOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues shadingOverridden](mTrackedProperties, "shadingOverridden");
  }
  return 0;
}

- (int)underline
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues underlineOverridden](mTrackedProperties, "underlineOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues underlineOverridden](v5, "underlineOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues underline](*p_mTrackedProperties, "underline");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isHiddenOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues hiddenOverridden](v4, "hiddenOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues hiddenOverridden](mTrackedProperties, "hiddenOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues hiddenOverridden](mOriginalProperties, "hiddenOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues hiddenOverridden](mTrackedProperties, "hiddenOverridden");
  }
  return 0;
}

- (int)bold
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues boldOverridden](mTrackedProperties, "boldOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues boldOverridden](v5, "boldOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues bold](*p_mTrackedProperties, "bold");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (int)italic
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues italicOverridden](mTrackedProperties, "italicOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues italicOverridden](v5, "italicOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues italic](*p_mTrackedProperties, "italic");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (id)baseStyle
{
  WDCharacterPropertiesValues *v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *mOriginalProperties;
  void *v6;
  id WeakRetained;
  void *v8;

  if ((self->mTracked || self->mResolved)
    && (v3 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues baseStyleOverridden](v3, "baseStyleOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
  }
  else
  {
    if (!self->mOriginal && !self->mResolved
      || (mOriginalProperties = self->mOriginalProperties) == 0
      || !-[WDCharacterPropertiesValues baseStyleOverridden](mOriginalProperties, "baseStyleOverridden"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
      objc_msgSend(WeakRetained, "styleSheet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "defaultCharacterStyle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
    mTrackedProperties = self->mOriginalProperties;
  }
  -[WDCharacterPropertiesValues baseStyle](mTrackedProperties, "baseStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)color
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues colorOverridden](mTrackedProperties, "colorOverridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "colorOverridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues color](*p_mTrackedProperties, "color");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (id)font
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues fontOverridden](mTrackedProperties, "fontOverridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "fontOverridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues font](*p_mTrackedProperties, "font");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (int)caps
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues capsOverridden](mTrackedProperties, "capsOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues capsOverridden](v5, "capsOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues caps](*p_mTrackedProperties, "caps");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (int)verticalAlign
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues verticalAlignOverridden](mTrackedProperties, "verticalAlignOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues verticalAlignOverridden](v5, "verticalAlignOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues verticalAlign](*p_mTrackedProperties, "verticalAlign");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setListCharacterPictureBullet:(BOOL)a3
{
  _BOOL8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setListCharacterPictureBullet:](mTrackedProperties, "setListCharacterPictureBullet:", v3);
  objc_msgSend(*p_mTrackedProperties, "setListCharacterPictureBulletOverridden:", 1);
}

- (void)setCharPositionOfPictureBulletInBookmark:(int)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setCharPositionOfPictureBulletInBookmark:](mTrackedProperties, "setCharPositionOfPictureBulletInBookmark:", v3);
  objc_msgSend(*p_mTrackedProperties, "setCharPositionOfPictureBulletInBookmarkOverridden:", 1);
}

- (BOOL)isListCharacterPictureBullet
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues listCharacterPictureBulletOverridden](mTrackedProperties, "listCharacterPictureBulletOverridden"))
      {
        return -[WDCharacterPropertiesValues listCharacterPictureBullet](*p_mTrackedProperties, "listCharacterPictureBullet");
      }
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues listCharacterPictureBulletOverridden](v5, "listCharacterPictureBulletOverridden")))
  {
    return -[WDCharacterPropertiesValues listCharacterPictureBullet](*p_mTrackedProperties, "listCharacterPictureBullet");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isCharPositionOfPictureBulletInBookmarkOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues charPositionOfPictureBulletInBookmarkOverridden](v4, "charPositionOfPictureBulletInBookmarkOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues charPositionOfPictureBulletInBookmarkOverridden](mTrackedProperties, "charPositionOfPictureBulletInBookmarkOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues charPositionOfPictureBulletInBookmarkOverridden](mOriginalProperties, "charPositionOfPictureBulletInBookmarkOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues charPositionOfPictureBulletInBookmarkOverridden](mTrackedProperties, "charPositionOfPictureBulletInBookmarkOverridden");
  }
  return 0;
}

- (int)charPositionOfPictureBulletInBookmark
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues charPositionOfPictureBulletInBookmarkOverridden](mTrackedProperties, "charPositionOfPictureBulletInBookmarkOverridden"))
      {
        return -[WDCharacterPropertiesValues charPositionOfPictureBulletInBookmark](*p_mTrackedProperties, "charPositionOfPictureBulletInBookmark");
      }
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues charPositionOfPictureBulletInBookmarkOverridden](v5, "charPositionOfPictureBulletInBookmarkOverridden")))
  {
    return -[WDCharacterPropertiesValues charPositionOfPictureBulletInBookmark](*p_mTrackedProperties, "charPositionOfPictureBulletInBookmark");
  }
  else
  {
    return 0;
  }
}

- (WDDocument)document
{
  return (WDDocument *)objc_loadWeakRetained((id *)&self->mDocument);
}

- (void)negateFormattingChangesWithDefaults:(id)a3
{
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  void *v6;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  WDCharacterPropertiesValues *v13;
  WDCharacterPropertiesValues *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  WDCharacterPropertiesValues *v21;
  WDCharacterPropertiesValues *v22;
  void *v23;
  WDCharacterPropertiesValues *v24;
  void *v25;
  WDCharacterPropertiesValues *v26;
  void *v27;
  void *v28;
  WDCharacterPropertiesValues *v29;
  void *v30;
  WDCharacterPropertiesValues *v31;
  void *v32;
  void *v33;
  WDCharacterPropertiesValues *v34;
  void *v35;
  WDCharacterPropertiesValues *v36;
  void *v37;
  void *v38;
  WDCharacterPropertiesValues *v39;
  WDCharacterPropertiesValues *v40;
  uint64_t v41;
  WDCharacterPropertiesValues *v42;
  WDCharacterPropertiesValues *v43;
  WDCharacterPropertiesValues *v44;
  WDCharacterPropertiesValues *v45;
  WDCharacterPropertiesValues *v46;
  WDCharacterPropertiesValues *v47;
  WDCharacterPropertiesValues *v48;
  WDCharacterPropertiesValues *v49;
  WDCharacterPropertiesValues *v50;
  WDCharacterPropertiesValues *v51;
  WDCharacterPropertiesValues *v52;
  WDCharacterPropertiesValues *v53;
  void *v54;
  WDCharacterPropertiesValues *v55;
  WDCharacterPropertiesValues *v56;
  double v57;
  int v58;
  WDCharacterPropertiesValues *v59;
  WDCharacterPropertiesValues *v60;
  WDCharacterPropertiesValues *v61;
  WDCharacterPropertiesValues *v62;
  WDCharacterPropertiesValues *v63;
  WDCharacterPropertiesValues *v64;
  WDCharacterPropertiesValues *v65;
  WDCharacterPropertiesValues *v66;
  uint64_t v67;
  WDCharacterPropertiesValues *v68;
  WDCharacterPropertiesValues *v69;
  void *v70;
  WDCharacterPropertiesValues *v71;
  WDCharacterPropertiesValues *v72;
  WDCharacterPropertiesValues *v73;
  WDCharacterPropertiesValues *v74;
  WDCharacterPropertiesValues *v75;
  WDCharacterPropertiesValues *v76;
  WDCharacterPropertiesValues *v77;
  WDCharacterPropertiesValues *v78;
  WDCharacterPropertiesValues *v79;
  WDCharacterPropertiesValues *v80;
  WDCharacterPropertiesValues *v81;
  WDCharacterPropertiesValues *v82;
  WDCharacterPropertiesValues *v83;
  WDCharacterPropertiesValues *v84;
  WDCharacterPropertiesValues *v85;
  WDCharacterPropertiesValues *v86;
  WDCharacterPropertiesValues *v87;
  WDCharacterPropertiesValues *v88;
  WDCharacterPropertiesValues *v89;
  WDCharacterPropertiesValues *v90;
  uint64_t v91;
  WDCharacterPropertiesValues *v92;
  WDCharacterPropertiesValues *v93;
  uint64_t v94;
  WDCharacterPropertiesValues *v95;
  WDCharacterPropertiesValues *v96;
  uint64_t v97;
  WDCharacterPropertiesValues *v98;
  WDCharacterPropertiesValues *v99;
  uint64_t v100;
  WDCharacterPropertiesValues *v101;
  WDCharacterPropertiesValues *v102;
  uint64_t v103;
  WDCharacterPropertiesValues *v104;
  WDCharacterPropertiesValues *v105;
  WDCharacterPropertiesValues *v106;
  WDCharacterPropertiesValues *v107;
  WDCharacterPropertiesValues *v108;
  WDCharacterPropertiesValues *v109;
  void *v110;
  WDCharacterPropertiesValues *v111;
  WDCharacterPropertiesValues *v112;
  WDCharacterPropertiesValues *v113;
  WDCharacterPropertiesValues *v114;
  uint64_t v115;
  WDCharacterPropertiesValues *v116;
  WDCharacterPropertiesValues *v117;
  WDCharacterPropertiesValues *v118;
  WDCharacterPropertiesValues *v119;
  WDCharacterPropertiesValues *v120;
  WDCharacterPropertiesValues *v121;
  WDCharacterPropertiesValues *v122;
  WDCharacterPropertiesValues *v123;
  uint64_t v124;
  WDCharacterPropertiesValues *v125;
  WDCharacterPropertiesValues *v126;
  uint64_t v127;
  WDCharacterPropertiesValues *v128;
  WDCharacterPropertiesValues *v129;
  uint64_t v130;
  id v131;

  v131 = a3;
  -[WDCharacterProperties setResolveMode:](self, "setResolveMode:", 2);
  if (-[WDCharacterProperties isFormattingChangedOverridden](self, "isFormattingChangedOverridden")
    && -[WDCharacterProperties formattingChanged](self, "formattingChanged"))
  {
    -[WDCharacterProperties setResolveMode:](self, "setResolveMode:", 1);
    objc_msgSend(v131, "setResolveMode:", 2);
    mOriginalProperties = self->mOriginalProperties;
    if (!mOriginalProperties)
      goto LABEL_296;
    if (-[WDCharacterPropertiesValues baseStyleOverridden](mOriginalProperties, "baseStyleOverridden"))
    {
      mTrackedProperties = self->mTrackedProperties;
      if (!mTrackedProperties
        || !-[WDCharacterPropertiesValues baseStyleOverridden](mTrackedProperties, "baseStyleOverridden"))
      {
        if (objc_msgSend(v131, "isBaseStyleOverridden"))
        {
          objc_msgSend(v131, "baseStyle");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          -[WDCharacterProperties setBaseStyle:](self, "setBaseStyle:", v6);

        }
      }
    }
    v7 = self->mOriginalProperties;
    if (!v7)
      goto LABEL_296;
    if (-[WDCharacterPropertiesValues borderOverridden](v7, "borderOverridden"))
    {
      v8 = self->mTrackedProperties;
      if (!v8 || !-[WDCharacterPropertiesValues borderOverridden](v8, "borderOverridden"))
      {
        -[WDCharacterProperties mutableBorder](self, "mutableBorder");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDCharacterPropertiesValues border](self->mOriginalProperties, "border");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "style");

        if (v11)
        {
          objc_msgSend(v9, "setNullBorder");
        }
        else if (objc_msgSend(v131, "isBorderOverridden"))
        {
          objc_msgSend(v131, "border");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setBorder:", v12);

        }
        else
        {
          objc_msgSend(v9, "setSingleBlackBorder");
        }

      }
    }
    v13 = self->mOriginalProperties;
    if (!v13)
      goto LABEL_296;
    if (-[WDCharacterPropertiesValues shadingOverridden](v13, "shadingOverridden"))
    {
      v14 = self->mTrackedProperties;
      if (!v14 || !-[WDCharacterPropertiesValues shadingOverridden](v14, "shadingOverridden"))
      {
        -[WDCharacterProperties mutableShading](self, "mutableShading");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDCharacterPropertiesValues shading](self->mOriginalProperties, "shading");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "style");

        if (v17)
        {
          objc_msgSend(v15, "setStyle:", 0);
          +[WDShading autoForegroundColor](WDShading, "autoForegroundColor");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setForeground:", v18);

          +[WDShading autoBackgroundColor](WDShading, "autoBackgroundColor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setBackground:", v19);
        }
        else if (objc_msgSend(v131, "isShadingOverridden"))
        {
          objc_msgSend(v131, "shading");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setShading:", v19);
        }
        else
        {
          objc_msgSend(v15, "setStyle:", 1);
          +[OITSUColor blackColor](OITSUColor, "blackColor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setForeground:", v20);

          +[OITSUColor whiteColor](OITSUColor, "whiteColor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setBackground:", v19);
        }

      }
    }
    v21 = self->mOriginalProperties;
    if (!v21)
      goto LABEL_296;
    if (-[WDCharacterPropertiesValues fontOverridden](v21, "fontOverridden"))
    {
      v22 = self->mTrackedProperties;
      if (!v22 || !-[WDCharacterPropertiesValues fontOverridden](v22, "fontOverridden"))
      {
        if (objc_msgSend(v131, "isFontOverridden"))
        {
          objc_msgSend(v131, "font");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[WDCharacterProperties setFont:](self, "setFont:", v23);

        }
      }
    }
    v24 = self->mOriginalProperties;
    if (!v24)
      goto LABEL_296;
    -[WDCharacterPropertiesValues extendedFont](v24, "extendedFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = self->mTrackedProperties;
      if (v26)
      {
        -[WDCharacterPropertiesValues extendedFont](v26, "extendedFont");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
          goto LABEL_43;
      }
      else
      {

      }
      if (objc_msgSend(v131, "isExtendedFontOverridden"))
      {
        objc_msgSend(v131, "extendedFont");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDCharacterProperties setExtendedFont:](self, "setExtendedFont:", v28);

      }
    }
LABEL_43:
    v29 = self->mOriginalProperties;
    if (!v29)
      goto LABEL_296;
    -[WDCharacterPropertiesValues farEastFont](v29, "farEastFont");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = self->mTrackedProperties;
      if (v31)
      {
        -[WDCharacterPropertiesValues farEastFont](v31, "farEastFont");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
          goto LABEL_51;
      }
      else
      {

      }
      if (objc_msgSend(v131, "isFarEastFontOverridden"))
      {
        objc_msgSend(v131, "farEastFont");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[WDCharacterProperties setFarEastFont:](self, "setFarEastFont:", v33);

      }
    }
LABEL_51:
    v34 = self->mOriginalProperties;
    if (v34)
    {
      -[WDCharacterPropertiesValues symbolFont](v34, "symbolFont");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v36 = self->mTrackedProperties;
        if (!v36)
        {

          goto LABEL_57;
        }
        -[WDCharacterPropertiesValues symbolFont](v36, "symbolFont");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v37)
        {
LABEL_57:
          if (objc_msgSend(v131, "isSymbolFontOverridden"))
          {
            objc_msgSend(v131, "symbolFont");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[WDCharacterProperties setSymbolFont:](self, "setSymbolFont:", v38);

          }
        }
      }
      v39 = self->mOriginalProperties;
      if (v39)
      {
        if (-[WDCharacterPropertiesValues symbolCharacterOverridden](v39, "symbolCharacterOverridden"))
        {
          v40 = self->mTrackedProperties;
          if (!v40 || !-[WDCharacterPropertiesValues symbolCharacterOverridden](v40, "symbolCharacterOverridden"))
          {
            if (objc_msgSend(v131, "isSymbolCharacterOverridden"))
              v41 = objc_msgSend(v131, "symbolCharacter");
            else
              v41 = 0;
            -[WDCharacterProperties setSymbolCharacter:](self, "setSymbolCharacter:", v41);
          }
        }
        v42 = self->mOriginalProperties;
        if (v42)
        {
          if (-[WDCharacterPropertiesValues boldOverridden](v42, "boldOverridden"))
          {
            v43 = self->mTrackedProperties;
            if (!v43 || !-[WDCharacterPropertiesValues boldOverridden](v43, "boldOverridden"))
              -[WDCharacterProperties setBold:](self, "setBold:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues bold](self->mOriginalProperties, "bold")));
          }
          v44 = self->mOriginalProperties;
          if (v44)
          {
            if (-[WDCharacterPropertiesValues boldForBiTextOverridden](v44, "boldForBiTextOverridden"))
            {
              v45 = self->mTrackedProperties;
              if (!v45 || !-[WDCharacterPropertiesValues boldForBiTextOverridden](v45, "boldForBiTextOverridden"))
                -[WDCharacterProperties setBoldForBiText:](self, "setBoldForBiText:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues boldForBiText](self->mOriginalProperties, "boldForBiText")));
            }
            v46 = self->mOriginalProperties;
            if (v46)
            {
              if (-[WDCharacterPropertiesValues italicOverridden](v46, "italicOverridden"))
              {
                v47 = self->mTrackedProperties;
                if (!v47 || !-[WDCharacterPropertiesValues italicOverridden](v47, "italicOverridden"))
                  -[WDCharacterProperties setItalic:](self, "setItalic:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues italic](self->mOriginalProperties, "italic")));
              }
              v48 = self->mOriginalProperties;
              if (v48)
              {
                if (-[WDCharacterPropertiesValues italicForBiTextOverridden](v48, "italicForBiTextOverridden"))
                {
                  v49 = self->mTrackedProperties;
                  if (!v49
                    || !-[WDCharacterPropertiesValues italicForBiTextOverridden](v49, "italicForBiTextOverridden"))
                  {
                    -[WDCharacterProperties setItalicForBiText:](self, "setItalicForBiText:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues italicForBiText](self->mOriginalProperties, "italicForBiText")));
                  }
                }
                v50 = self->mOriginalProperties;
                if (v50)
                {
                  if (-[WDCharacterPropertiesValues outlineOverridden](v50, "outlineOverridden"))
                  {
                    v51 = self->mTrackedProperties;
                    if (!v51 || !-[WDCharacterPropertiesValues outlineOverridden](v51, "outlineOverridden"))
                      -[WDCharacterProperties setOutline:](self, "setOutline:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues outline](self->mOriginalProperties, "outline")));
                  }
                  v52 = self->mOriginalProperties;
                  if (v52)
                  {
                    if (-[WDCharacterPropertiesValues outlineColorOverridden](v52, "outlineColorOverridden"))
                    {
                      v53 = self->mTrackedProperties;
                      if (!v53 || !-[WDCharacterPropertiesValues outlineColorOverridden](v53, "outlineColorOverridden"))
                      {
                        if (objc_msgSend(v131, "isOutlineColorOverridden"))
                          objc_msgSend(v131, "outlineColor");
                        else
                          +[OITSUColor clearColor](OITSUColor, "clearColor");
                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                        -[WDCharacterProperties setOutlineColor:](self, "setOutlineColor:", v54);

                      }
                    }
                    v55 = self->mOriginalProperties;
                    if (v55)
                    {
                      if (-[WDCharacterPropertiesValues outline2010WidthOverridden](v55, "outline2010WidthOverridden"))
                      {
                        v56 = self->mTrackedProperties;
                        if (!v56
                          || !-[WDCharacterPropertiesValues outline2010WidthOverridden](v56, "outline2010WidthOverridden"))
                        {
                          -[WDCharacterPropertiesValues outline2010Width](self->mOriginalProperties, "outline2010Width");
                          if (*(float *)&v57 == 0.0)
                          {
                            v58 = objc_msgSend(v131, "isOutline2010WidthOverridden");
                            LODWORD(v57) = 3.0;
                            if (v58)
                              objc_msgSend(v131, "outline2010Width", v57);
                          }
                          else
                          {
                            LODWORD(v57) = 0;
                          }
                          -[WDCharacterProperties setOutline2010Width:](self, "setOutline2010Width:", v57);
                        }
                      }
                      v59 = self->mOriginalProperties;
                      if (v59)
                      {
                        if (-[WDCharacterPropertiesValues shadowOverridden](v59, "shadowOverridden"))
                        {
                          v60 = self->mTrackedProperties;
                          if (!v60 || !-[WDCharacterPropertiesValues shadowOverridden](v60, "shadowOverridden"))
                            -[WDCharacterProperties setShadow:](self, "setShadow:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues shadow](self->mOriginalProperties, "shadow")));
                        }
                        v61 = self->mOriginalProperties;
                        if (v61)
                        {
                          if (-[WDCharacterPropertiesValues embossedOverridden](v61, "embossedOverridden"))
                          {
                            v62 = self->mTrackedProperties;
                            if (!v62 || !-[WDCharacterPropertiesValues embossedOverridden](v62, "embossedOverridden"))
                              -[WDCharacterProperties setEmbossed:](self, "setEmbossed:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues embossed](self->mOriginalProperties, "embossed")));
                          }
                          v63 = self->mOriginalProperties;
                          if (v63)
                          {
                            if (-[WDCharacterPropertiesValues imprintOverridden](v63, "imprintOverridden"))
                            {
                              v64 = self->mTrackedProperties;
                              if (!v64 || !-[WDCharacterPropertiesValues imprintOverridden](v64, "imprintOverridden"))
                                -[WDCharacterProperties setImprint:](self, "setImprint:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues imprint](self->mOriginalProperties, "imprint")));
                            }
                            v65 = self->mOriginalProperties;
                            if (v65)
                            {
                              if (-[WDCharacterPropertiesValues underlineOverridden](v65, "underlineOverridden"))
                              {
                                v66 = self->mTrackedProperties;
                                if (!v66
                                  || !-[WDCharacterPropertiesValues underlineOverridden](v66, "underlineOverridden"))
                                {
                                  if (-[WDCharacterPropertiesValues underline](self->mOriginalProperties, "underline"))
                                  {
                                    v67 = 0;
                                  }
                                  else if (objc_msgSend(v131, "isUnderlineOverridden"))
                                  {
                                    v67 = objc_msgSend(v131, "underline");
                                  }
                                  else
                                  {
                                    v67 = 1;
                                  }
                                  -[WDCharacterProperties setUnderline:](self, "setUnderline:", v67);
                                }
                              }
                              v68 = self->mOriginalProperties;
                              if (v68)
                              {
                                if (-[WDCharacterPropertiesValues underlineColorOverridden](v68, "underlineColorOverridden"))
                                {
                                  v69 = self->mTrackedProperties;
                                  if (!v69
                                    || !-[WDCharacterPropertiesValues underlineColorOverridden](v69, "underlineColorOverridden"))
                                  {
                                    if (objc_msgSend(v131, "isUnderlineColorOverridden"))
                                      objc_msgSend(v131, "underlineColor");
                                    else
                                      +[OITSUColor clearColor](OITSUColor, "clearColor");
                                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                                    -[WDCharacterProperties setUnderlineColor:](self, "setUnderlineColor:", v70);

                                  }
                                }
                                v71 = self->mOriginalProperties;
                                if (v71)
                                {
                                  if (-[WDCharacterPropertiesValues strikeThroughOverridden](v71, "strikeThroughOverridden"))
                                  {
                                    v72 = self->mTrackedProperties;
                                    if (!v72
                                      || !-[WDCharacterPropertiesValues strikeThroughOverridden](v72, "strikeThroughOverridden"))
                                    {
                                      -[WDCharacterProperties setStrikeThrough:](self, "setStrikeThrough:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues strikeThrough](self->mOriginalProperties, "strikeThrough")));
                                    }
                                  }
                                  v73 = self->mOriginalProperties;
                                  if (v73)
                                  {
                                    if (-[WDCharacterPropertiesValues doubleStrikeThroughOverridden](v73, "doubleStrikeThroughOverridden"))
                                    {
                                      v74 = self->mTrackedProperties;
                                      if (!v74
                                        || !-[WDCharacterPropertiesValues doubleStrikeThroughOverridden](v74, "doubleStrikeThroughOverridden"))
                                      {
                                        -[WDCharacterProperties setDoubleStrikeThrough:](self, "setDoubleStrikeThrough:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues doubleStrikeThrough](self->mOriginalProperties, "doubleStrikeThrough")));
                                      }
                                    }
                                    v75 = self->mOriginalProperties;
                                    if (v75)
                                    {
                                      if (-[WDCharacterPropertiesValues ligatureOverridden](v75, "ligatureOverridden"))
                                      {
                                        v76 = self->mTrackedProperties;
                                        if (!v76
                                          || !-[WDCharacterPropertiesValues ligatureOverridden](v76, "ligatureOverridden"))
                                        {
                                          -[WDCharacterProperties setLigature:](self, "setLigature:", 0);
                                        }
                                      }
                                      v77 = self->mOriginalProperties;
                                      if (v77)
                                      {
                                        if (-[WDCharacterPropertiesValues highlightOverridden](v77, "highlightOverridden"))
                                        {
                                          v78 = self->mTrackedProperties;
                                          if (!v78
                                            || !-[WDCharacterPropertiesValues highlightOverridden](v78, "highlightOverridden"))
                                          {
                                            -[WDCharacterProperties setHighlight:](self, "setHighlight:", -[WDCharacterPropertiesValues highlight](self->mOriginalProperties, "highlight") ^ 1);
                                          }
                                        }
                                        v79 = self->mOriginalProperties;
                                        if (v79)
                                        {
                                          if (-[WDCharacterPropertiesValues highlightColorOverridden](v79, "highlightColorOverridden"))
                                          {
                                            v80 = self->mTrackedProperties;
                                            if (!v80
                                              || !-[WDCharacterPropertiesValues highlightColorOverridden](v80, "highlightColorOverridden"))
                                            {
                                              -[WDCharacterProperties setHighlightColor:](self, "setHighlightColor:", 0);
                                            }
                                          }
                                          v81 = self->mOriginalProperties;
                                          if (v81)
                                          {
                                            if (-[WDCharacterPropertiesValues smallCapsOverridden](v81, "smallCapsOverridden"))
                                            {
                                              v82 = self->mTrackedProperties;
                                              if (!v82
                                                || !-[WDCharacterPropertiesValues smallCapsOverridden](v82, "smallCapsOverridden"))
                                              {
                                                -[WDCharacterProperties setSmallCaps:](self, "setSmallCaps:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues smallCaps](self->mOriginalProperties, "smallCaps")));
                                              }
                                            }
                                            v83 = self->mOriginalProperties;
                                            if (v83)
                                            {
                                              if (-[WDCharacterPropertiesValues capsOverridden](v83, "capsOverridden"))
                                              {
                                                v84 = self->mTrackedProperties;
                                                if (!v84
                                                  || !-[WDCharacterPropertiesValues capsOverridden](v84, "capsOverridden"))
                                                {
                                                  -[WDCharacterProperties setCaps:](self, "setCaps:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues caps](self->mOriginalProperties, "caps")));
                                                }
                                              }
                                              v85 = self->mOriginalProperties;
                                              if (v85)
                                              {
                                                if (-[WDCharacterPropertiesValues lowerCaseOverridden](v85, "lowerCaseOverridden"))
                                                {
                                                  v86 = self->mTrackedProperties;
                                                  if (!v86
                                                    || !-[WDCharacterPropertiesValues lowerCaseOverridden](v86, "lowerCaseOverridden"))
                                                  {
                                                    -[WDCharacterProperties setLowerCase:](self, "setLowerCase:", -[WDCharacterPropertiesValues lowerCase](self->mOriginalProperties, "lowerCase") ^ 1);
                                                  }
                                                }
                                                v87 = self->mOriginalProperties;
                                                if (v87)
                                                {
                                                  if (-[WDCharacterPropertiesValues hiddenOverridden](v87, "hiddenOverridden"))
                                                  {
                                                    v88 = self->mTrackedProperties;
                                                    if (!v88
                                                      || !-[WDCharacterPropertiesValues hiddenOverridden](v88, "hiddenOverridden"))
                                                    {
                                                      -[WDCharacterProperties setHidden:](self, "setHidden:", -[WDCharacterProperties reverseBooleanProperty:](self, "reverseBooleanProperty:", -[WDCharacterPropertiesValues hidden](self->mOriginalProperties, "hidden")));
                                                    }
                                                  }
                                                  v89 = self->mOriginalProperties;
                                                  if (v89)
                                                  {
                                                    if (-[WDCharacterPropertiesValues spacingOverridden](v89, "spacingOverridden"))
                                                    {
                                                      v90 = self->mTrackedProperties;
                                                      if (!v90
                                                        || !-[WDCharacterPropertiesValues spacingOverridden](v90, "spacingOverridden"))
                                                      {
                                                        if (objc_msgSend(v131, "isSpacingOverridden"))
                                                          v91 = objc_msgSend(v131, "spacing");
                                                        else
                                                          v91 = 0;
                                                        -[WDCharacterProperties setSpacing:](self, "setSpacing:", v91);
                                                      }
                                                    }
                                                    v92 = self->mOriginalProperties;
                                                    if (v92)
                                                    {
                                                      if (-[WDCharacterPropertiesValues positionOverridden](v92, "positionOverridden"))
                                                      {
                                                        v93 = self->mTrackedProperties;
                                                        if (!v93
                                                          || !-[WDCharacterPropertiesValues positionOverridden](v93, "positionOverridden"))
                                                        {
                                                          if (objc_msgSend(v131, "isPositionOverridden"))
                                                            v94 = objc_msgSend(v131, "position");
                                                          else
                                                            v94 = 0;
                                                          -[WDCharacterProperties setPosition:](self, "setPosition:", v94);
                                                        }
                                                      }
                                                      v95 = self->mOriginalProperties;
                                                      if (v95)
                                                      {
                                                        if (-[WDCharacterPropertiesValues kerningOverridden](v95, "kerningOverridden"))
                                                        {
                                                          v96 = self->mTrackedProperties;
                                                          if (!v96
                                                            || !-[WDCharacterPropertiesValues kerningOverridden](v96, "kerningOverridden"))
                                                          {
                                                            if (objc_msgSend(v131, "isKerningOverridden"))
                                                              v97 = objc_msgSend(v131, "kerning");
                                                            else
                                                              v97 = 0;
                                                            -[WDCharacterProperties setKerning:](self, "setKerning:", v97);
                                                          }
                                                        }
                                                        v98 = self->mOriginalProperties;
                                                        if (v98)
                                                        {
                                                          if (-[WDCharacterPropertiesValues textScaleOverridden](v98, "textScaleOverridden"))
                                                          {
                                                            v99 = self->mTrackedProperties;
                                                            if (!v99
                                                              || !-[WDCharacterPropertiesValues textScaleOverridden](v99, "textScaleOverridden"))
                                                            {
                                                              if (objc_msgSend(v131, "isTextScaleOverridden"))v100 = objc_msgSend(v131, "textScale");
                                                              else
                                                                v100 = 0;
                                                              -[WDCharacterProperties setTextScale:](self, "setTextScale:", v100);
                                                            }
                                                          }
                                                          v101 = self->mOriginalProperties;
                                                          if (v101)
                                                          {
                                                            if (-[WDCharacterPropertiesValues fontSizeOverridden](v101, "fontSizeOverridden"))
                                                            {
                                                              v102 = self->mTrackedProperties;
                                                              if (!v102
                                                                || !-[WDCharacterPropertiesValues fontSizeOverridden](v102, "fontSizeOverridden"))
                                                              {
                                                                if (objc_msgSend(v131, "isFontSizeOverridden"))v103 = objc_msgSend(v131, "fontSize");
                                                                else
                                                                  v103 = 22;
                                                                -[WDCharacterProperties setFontSize:](self, "setFontSize:", v103);
                                                              }
                                                            }
                                                            v104 = self->mOriginalProperties;
                                                            if (v104)
                                                            {
                                                              if (-[WDCharacterPropertiesValues verticalAlignOverridden](v104, "verticalAlignOverridden"))
                                                              {
                                                                v105 = self->mTrackedProperties;
                                                                if (!v105
                                                                  || !-[WDCharacterPropertiesValues verticalAlignOverridden](v105, "verticalAlignOverridden"))
                                                                {
                                                                  -[WDCharacterProperties setVerticalAlign:](self, "setVerticalAlign:", 0);
                                                                }
                                                              }
                                                              v106 = self->mOriginalProperties;
                                                              if (v106)
                                                              {
                                                                if (-[WDCharacterPropertiesValues emphasisMarkOverridden](v106, "emphasisMarkOverridden"))
                                                                {
                                                                  v107 = self->mTrackedProperties;
                                                                  if (!v107
                                                                    || !-[WDCharacterPropertiesValues emphasisMarkOverridden](v107, "emphasisMarkOverridden"))
                                                                  {
                                                                    -[WDCharacterProperties setEmphasisMark:](self, "setEmphasisMark:", 0);
                                                                  }
                                                                }
                                                                v108 = self->mOriginalProperties;
                                                                if (v108)
                                                                {
                                                                  if (-[WDCharacterPropertiesValues colorOverridden](v108, "colorOverridden"))
                                                                  {
                                                                    v109 = self->mTrackedProperties;
                                                                    if (!v109
                                                                      || !-[WDCharacterPropertiesValues colorOverridden](v109, "colorOverridden"))
                                                                    {
                                                                      if (objc_msgSend(v131, "isColorOverridden"))objc_msgSend(v131, "color");
                                                                      else
                                                                        +[OITSUColor clearColor](OITSUColor, "clearColor");
                                                                      v110 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      -[WDCharacterProperties setColor:](self, "setColor:", v110);

                                                                    }
                                                                  }
                                                                  v111 = self->mOriginalProperties;
                                                                  if (v111)
                                                                  {
                                                                    if (-[WDCharacterPropertiesValues colorAutoOverridden](v111, "colorAutoOverridden"))
                                                                    {
                                                                      v112 = self->mTrackedProperties;
                                                                      if (!v112
                                                                        || !-[WDCharacterPropertiesValues colorAutoOverridden](v112, "colorAutoOverridden"))
                                                                      {
                                                                        -[WDCharacterProperties setColorAuto:](self, "setColorAuto:", -[WDCharacterPropertiesValues colorAuto](self->mOriginalProperties, "colorAuto") ^ 1);
                                                                      }
                                                                    }
                                                                    v113 = self->mOriginalProperties;
                                                                    if (v113)
                                                                    {
                                                                      if (-[WDCharacterPropertiesValues languageForDefaultTextOverridden](v113, "languageForDefaultTextOverridden"))
                                                                      {
                                                                        v114 = self->mTrackedProperties;
                                                                        if (!v114
                                                                          || !-[WDCharacterPropertiesValues languageForDefaultTextOverridden](v114, "languageForDefaultTextOverridden"))
                                                                        {
                                                                          if (objc_msgSend(v131, "isLanguageForDefaultTextOverridden"))v115 = objc_msgSend(v131, "languageForDefaultText");
                                                                          else
                                                                            v115 = 0;
                                                                          -[WDCharacterProperties setLanguageForDefaultText:](self, "setLanguageForDefaultText:", v115);
                                                                        }
                                                                      }
                                                                      v116 = self->mOriginalProperties;
                                                                      if (v116)
                                                                      {
                                                                        if (-[WDCharacterPropertiesValues specialCharacterOverridden](v116, "specialCharacterOverridden"))
                                                                        {
                                                                          v117 = self->mTrackedProperties;
                                                                          if (!v117
                                                                            || !-[WDCharacterPropertiesValues specialCharacterOverridden](v117, "specialCharacterOverridden"))
                                                                          {
                                                                            -[WDCharacterProperties setSpecialCharacter:](self, "setSpecialCharacter:", -[WDCharacterPropertiesValues specialCharacter](self->mOriginalProperties, "specialCharacter") ^ 1);
                                                                          }
                                                                        }
                                                                        v118 = self->mOriginalProperties;
                                                                        if (v118)
                                                                        {
                                                                          if (-[WDCharacterPropertiesValues listCharacterPictureBulletOverridden](v118, "listCharacterPictureBulletOverridden"))
                                                                          {
                                                                            v119 = self->mTrackedProperties;
                                                                            if (!v119
                                                                              || !-[WDCharacterPropertiesValues listCharacterPictureBulletOverridden](v119, "listCharacterPictureBulletOverridden"))
                                                                            {
                                                                              -[WDCharacterProperties setListCharacterPictureBullet:](self, "setListCharacterPictureBullet:", -[WDCharacterPropertiesValues listCharacterPictureBullet](self->mOriginalProperties, "listCharacterPictureBullet") ^ 1);
                                                                            }
                                                                          }
                                                                          v120 = self->mOriginalProperties;
                                                                          if (v120)
                                                                          {
                                                                            if (-[WDCharacterPropertiesValues charPositionOfPictureBulletInBookmarkOverridden](v120, "charPositionOfPictureBulletInBookmarkOverridden"))
                                                                            {
                                                                              v121 = self->mTrackedProperties;
                                                                              if (v121)
                                                                                -[WDCharacterPropertiesValues charPositionOfPictureBulletInBookmarkOverridden](v121, "charPositionOfPictureBulletInBookmarkOverridden");
                                                                            }
                                                                            v122 = self->mOriginalProperties;
                                                                            if (v122)
                                                                            {
                                                                              if (-[WDCharacterPropertiesValues languageForFarEastOverridden](v122, "languageForFarEastOverridden"))
                                                                              {
                                                                                v123 = self->mTrackedProperties;
                                                                                if (!v123
                                                                                  || !-[WDCharacterPropertiesValues languageForFarEastOverridden](v123, "languageForFarEastOverridden"))
                                                                                {
                                                                                  if (objc_msgSend(v131, "isLanguageForFarEastOverridden"))
                                                                                    v124 = objc_msgSend(v131, "languageForFarEast");
                                                                                  else
                                                                                    v124 = 0;
                                                                                  -[WDCharacterProperties setLanguageForFarEast:](self, "setLanguageForFarEast:", v124);
                                                                                }
                                                                              }
                                                                              v125 = self->mOriginalProperties;
                                                                              if (v125)
                                                                              {
                                                                                if (-[WDCharacterPropertiesValues languageForBiTextOverridden](v125, "languageForBiTextOverridden"))
                                                                                {
                                                                                  v126 = self->mTrackedProperties;
                                                                                  if (!v126
                                                                                    || !-[WDCharacterPropertiesValues languageForBiTextOverridden](v126, "languageForBiTextOverridden"))
                                                                                  {
                                                                                    if (objc_msgSend(v131, "isLanguageForBiTextOverridden"))
                                                                                      v127 = objc_msgSend(v131, "languageForBiText");
                                                                                    else
                                                                                      v127 = 0;
                                                                                    -[WDCharacterProperties setLanguageForBiText:](self, "setLanguageForBiText:", v127);
                                                                                  }
                                                                                }
                                                                                v128 = self->mOriginalProperties;
                                                                                if (v128)
                                                                                {
                                                                                  if (-[WDCharacterPropertiesValues fontSizeForBiTextOverridden](v128, "fontSizeForBiTextOverridden"))
                                                                                  {
                                                                                    v129 = self->mTrackedProperties;
                                                                                    if (!v129
                                                                                      || !-[WDCharacterPropertiesValues fontSizeForBiTextOverridden](v129, "fontSizeForBiTextOverridden"))
                                                                                    {
                                                                                      if (objc_msgSend(v131, "isFontSizeForBiTextOverridden"))
                                                                                        v130 = objc_msgSend(v131, "fontSizeForBiText");
                                                                                      else
                                                                                        v130 = 22;
                                                                                      -[WDCharacterProperties setFontSizeForBiText:](self, "setFontSizeForBiText:", v130);
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_296:
    -[WDCharacterProperties setResolveMode:](self, "setResolveMode:", 2);
  }

}

- (BOOL)isFormattingChangedOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues formattingChangedOverridden](v4, "formattingChangedOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues formattingChangedOverridden](mTrackedProperties, "formattingChangedOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues formattingChangedOverridden](mOriginalProperties, "formattingChangedOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues formattingChangedOverridden](mTrackedProperties, "formattingChangedOverridden");
  }
  return 0;
}

- (int)formattingChanged
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues formattingChangedOverridden](mTrackedProperties, "formattingChangedOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues formattingChangedOverridden](v5, "formattingChangedOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues formattingChanged](*p_mTrackedProperties, "formattingChanged");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (int)doubleStrikeThrough
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues doubleStrikeThroughOverridden](mTrackedProperties, "doubleStrikeThroughOverridden"))
      {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues doubleStrikeThroughOverridden](v5, "doubleStrikeThroughOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues doubleStrikeThrough](*p_mTrackedProperties, "doubleStrikeThrough");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setSymbolCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setSymbolCharacter:](mTrackedProperties, "setSymbolCharacter:", v3);
  objc_msgSend(*p_mTrackedProperties, "setSymbolCharacterOverridden:", 1);
}

- (int)smallCaps
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues smallCapsOverridden](mTrackedProperties, "smallCapsOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues smallCapsOverridden](v5, "smallCapsOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues smallCaps](*p_mTrackedProperties, "smallCaps");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setEditDate:(id)a3
{
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  id v12;

  v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      -[WDCharacterPropertiesValues setEditDate:](v4, "setEditDate:", v12);
      -[WDCharacterPropertiesValues setEditDateOverridden:](*p_mTrackedProperties, "setEditDateOverridden:", 1);
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    v4 = mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_8;
    v10 = objc_alloc_init(WDCharacterPropertiesValues);
    v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
      goto LABEL_8;
  }

}

- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setIndexToAuthorIDOfEdit:](mTrackedProperties, "setIndexToAuthorIDOfEdit:", v3);
  objc_msgSend(*p_mTrackedProperties, "setIndexToAuthorIDOfEditOverridden:", 1);
}

- (id)editDate
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues editDateOverridden](mTrackedProperties, "editDateOverridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "editDateOverridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues editDate](*p_mTrackedProperties, "editDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (unsigned)indexToAuthorIDOfEdit
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues indexToAuthorIDOfEditOverridden](mTrackedProperties, "indexToAuthorIDOfEditOverridden"))
      {
        return -[WDCharacterPropertiesValues indexToAuthorIDOfEdit](*p_mTrackedProperties, "indexToAuthorIDOfEdit");
      }
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues indexToAuthorIDOfEditOverridden](v5, "indexToAuthorIDOfEditOverridden")))
  {
    return -[WDCharacterPropertiesValues indexToAuthorIDOfEdit](*p_mTrackedProperties, "indexToAuthorIDOfEdit");
  }
  else
  {
    return 0;
  }
}

- (void)setDeletionDate:(id)a3
{
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  id v12;

  v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      -[WDCharacterPropertiesValues setDeletionDate:](v4, "setDeletionDate:", v12);
      -[WDCharacterPropertiesValues setDeletionDateOverridden:](*p_mTrackedProperties, "setDeletionDateOverridden:", 1);
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    v4 = mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_8;
    v10 = objc_alloc_init(WDCharacterPropertiesValues);
    v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
      goto LABEL_8;
  }

}

- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setIndexToAuthorIDOfDeletion:](mTrackedProperties, "setIndexToAuthorIDOfDeletion:", v3);
  objc_msgSend(*p_mTrackedProperties, "setIndexToAuthorIDOfDeletionOverridden:", 1);
}

- (id)deletionDate
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues deletionDateOverridden](mTrackedProperties, "deletionDateOverridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "deletionDateOverridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues deletionDate](*p_mTrackedProperties, "deletionDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (unsigned)indexToAuthorIDOfDeletion
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues indexToAuthorIDOfDeletionOverridden](mTrackedProperties, "indexToAuthorIDOfDeletionOverridden"))
      {
        return -[WDCharacterPropertiesValues indexToAuthorIDOfDeletion](*p_mTrackedProperties, "indexToAuthorIDOfDeletion");
      }
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues indexToAuthorIDOfDeletionOverridden](v5, "indexToAuthorIDOfDeletionOverridden")))
  {
    return -[WDCharacterPropertiesValues indexToAuthorIDOfDeletion](*p_mTrackedProperties, "indexToAuthorIDOfDeletion");
  }
  else
  {
    return 0;
  }
}

- (int)deleted
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues deletedOverridden](mTrackedProperties, "deletedOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues deletedOverridden](v5, "deletedOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues deleted](*p_mTrackedProperties, "deleted");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (int)hidden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues hiddenOverridden](mTrackedProperties, "hiddenOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues hiddenOverridden](v5, "hiddenOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues hidden](*p_mTrackedProperties, "hidden");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setHighlight:(BOOL)a3
{
  _BOOL8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setHighlight:](mTrackedProperties, "setHighlight:", v3);
  objc_msgSend(*p_mTrackedProperties, "setHighlightOverridden:", 1);
}

- (id)shading
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues shadingOverridden](mTrackedProperties, "shadingOverridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "shadingOverridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues shading](*p_mTrackedProperties, "shading");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (void)setRightToLeft:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setRightToLeft:](mTrackedProperties, "setRightToLeft:", v3);
  objc_msgSend(*p_mTrackedProperties, "setRightToLeftOverridden:", 1);
}

- (int)rightToLeft
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues rightToLeftOverridden](mTrackedProperties, "rightToLeftOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues rightToLeftOverridden](v5, "rightToLeftOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues rightToLeft](*p_mTrackedProperties, "rightToLeft");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (int)strikeThrough
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues strikeThroughOverridden](mTrackedProperties, "strikeThroughOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues strikeThroughOverridden](v5, "strikeThroughOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues strikeThrough](*p_mTrackedProperties, "strikeThrough");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setIndexToAuthorIDOfFormattingChange:](mTrackedProperties, "setIndexToAuthorIDOfFormattingChange:", v3);
  objc_msgSend(*p_mTrackedProperties, "setIndexToAuthorIDOfFormattingChangeOverridden:", 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  WDCharacterProperties *v4;
  id WeakRetained;
  WDCharacterPropertiesValues *mOriginalProperties;
  uint64_t v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mTrackedProperties;
  uint64_t v10;
  WDCharacterPropertiesValues *v11;
  WDCharacterProperties *v12;

  v4 = -[WDCharacterProperties init](+[WDCharacterProperties allocWithZone:](WDCharacterProperties, "allocWithZone:", a3), "init");
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    objc_storeWeak((id *)&v4->mDocument, WeakRetained);

    v4->mOriginal = self->mOriginal;
    v4->mTracked = self->mTracked;
    v4->mResolved = self->mResolved;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      v7 = -[WDCharacterPropertiesValues copy](mOriginalProperties, "copy");
      v8 = v4->mOriginalProperties;
      v4->mOriginalProperties = (WDCharacterPropertiesValues *)v7;

    }
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      v10 = -[WDCharacterPropertiesValues copy](mTrackedProperties, "copy");
      v11 = v4->mTrackedProperties;
      v4->mTrackedProperties = (WDCharacterPropertiesValues *)v10;

    }
    v12 = v4;
  }

  return v4;
}

- (void)copyPropertiesInto:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  WDCharacterPropertiesValues *mOriginalProperties;
  uint64_t v10;
  void *v11;
  WDCharacterPropertiesValues *mTrackedProperties;
  uint64_t v13;
  void *v14;
  _QWORD *v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)v4[2];
    v15 = v4;
    if (v6)
    {
      v4[2] = 0;

      v5 = v15;
    }
    v7 = (void *)v5[3];
    if (v7)
    {
      v15[3] = 0;

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    objc_storeWeak((id *)v15 + 4, WeakRetained);

    *((_BYTE *)v15 + 8) = self->mOriginal;
    *((_BYTE *)v15 + 9) = self->mTracked;
    *((_BYTE *)v15 + 10) = self->mResolved;
    mOriginalProperties = self->mOriginalProperties;
    if (mOriginalProperties)
    {
      v10 = -[WDCharacterPropertiesValues copy](mOriginalProperties, "copy");
      v11 = (void *)v15[2];
      v15[2] = v10;

    }
    mTrackedProperties = self->mTrackedProperties;
    v5 = v15;
    if (mTrackedProperties)
    {
      v13 = -[WDCharacterPropertiesValues copy](mTrackedProperties, "copy");
      v14 = (void *)v15[3];
      v15[3] = v13;

      v5 = v15;
    }
  }

}

- (BOOL)isAnythingOverridden
{
  return (self->mOriginal || self->mResolved)
      && -[WDCharacterProperties isAnythingOverriddenIn:](self, "isAnythingOverriddenIn:", self->mOriginalProperties)
      || (self->mTracked || self->mResolved)
      && -[WDCharacterProperties isAnythingOverriddenIn:](self, "isAnythingOverriddenIn:", self->mTrackedProperties);
}

- (int)resolveMode
{
  if (self->mOriginal)
    return 0;
  if (self->mTracked)
    return 1;
  return 2 * self->mResolved;
}

- (void)applyPropertiesFrom:(id)a3 ifOverriddenIn:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isBorderOverridden") && objc_msgSend(v18, "isBorderOverridden"))
  {
    -[WDCharacterProperties mutableBorder](self, "mutableBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "border");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorder:", v8);

  }
  if (objc_msgSend(v6, "isShadingOverridden") && objc_msgSend(v18, "isShadingOverridden"))
  {
    -[WDCharacterProperties mutableShading](self, "mutableShading");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "shading");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShading:", v10);

  }
  if (objc_msgSend(v6, "isFontOverridden") && objc_msgSend(v18, "isFontOverridden"))
  {
    objc_msgSend(v18, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterProperties setFont:](self, "setFont:", v11);

  }
  if (objc_msgSend(v6, "isExtendedFontOverridden")
    && objc_msgSend(v18, "isExtendedFontOverridden"))
  {
    objc_msgSend(v18, "extendedFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterProperties setExtendedFont:](self, "setExtendedFont:", v12);

  }
  if (objc_msgSend(v6, "isFarEastFontOverridden")
    && objc_msgSend(v18, "isFarEastFontOverridden"))
  {
    objc_msgSend(v18, "farEastFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterProperties setFarEastFont:](self, "setFarEastFont:", v13);

  }
  if (objc_msgSend(v6, "isSymbolFontOverridden")
    && objc_msgSend(v18, "isSymbolFontOverridden"))
  {
    objc_msgSend(v18, "symbolFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterProperties setSymbolFont:](self, "setSymbolFont:", v14);

  }
  if (objc_msgSend(v6, "isSymbolCharacterOverridden")
    && objc_msgSend(v18, "isSymbolCharacterOverridden"))
  {
    -[WDCharacterProperties setSymbolCharacter:](self, "setSymbolCharacter:", objc_msgSend(v18, "symbolCharacter"));
  }
  if (objc_msgSend(v6, "isBoldOverridden") && objc_msgSend(v18, "isBoldOverridden"))
    -[WDCharacterProperties setBold:](self, "setBold:", objc_msgSend(v18, "bold"));
  if (objc_msgSend(v6, "isBoldForBiTextOverridden")
    && objc_msgSend(v18, "isBoldForBiTextOverridden"))
  {
    -[WDCharacterProperties setBoldForBiText:](self, "setBoldForBiText:", objc_msgSend(v18, "boldForBiText"));
  }
  if (objc_msgSend(v6, "isItalicOverridden") && objc_msgSend(v18, "isItalicOverridden"))
    -[WDCharacterProperties setItalic:](self, "setItalic:", objc_msgSend(v18, "italic"));
  if (objc_msgSend(v6, "isItalicForBiTextOverridden")
    && objc_msgSend(v18, "isItalicForBiTextOverridden"))
  {
    -[WDCharacterProperties setItalicForBiText:](self, "setItalicForBiText:", objc_msgSend(v18, "italicForBiText"));
  }
  if (objc_msgSend(v6, "isOutlineOverridden") && objc_msgSend(v18, "isOutlineOverridden"))
    -[WDCharacterProperties setOutline:](self, "setOutline:", objc_msgSend(v18, "outline"));
  if (objc_msgSend(v6, "isOutlineColorOverridden")
    && objc_msgSend(v18, "isOutlineColorOverridden"))
  {
    objc_msgSend(v18, "outlineColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterProperties setOutlineColor:](self, "setOutlineColor:", v15);

  }
  if (objc_msgSend(v6, "isOutline2010WidthOverridden")
    && objc_msgSend(v18, "isOutline2010WidthOverridden"))
  {
    objc_msgSend(v18, "outline2010Width");
    -[WDCharacterProperties setOutline2010Width:](self, "setOutline2010Width:");
  }
  if (objc_msgSend(v6, "isEmbossedOverridden") && objc_msgSend(v18, "isEmbossedOverridden"))
    -[WDCharacterProperties setEmbossed:](self, "setEmbossed:", objc_msgSend(v18, "embossed"));
  if (objc_msgSend(v6, "isImprintOverridden") && objc_msgSend(v18, "isImprintOverridden"))
    -[WDCharacterProperties setImprint:](self, "setImprint:", objc_msgSend(v18, "imprint"));
  if (objc_msgSend(v6, "isShadowOverridden") && objc_msgSend(v18, "isShadowOverridden"))
    -[WDCharacterProperties setShadow:](self, "setShadow:", objc_msgSend(v18, "shadow"));
  if (objc_msgSend(v6, "isKerningOverridden") && objc_msgSend(v18, "isKerningOverridden"))
    -[WDCharacterProperties setKerning:](self, "setKerning:", objc_msgSend(v18, "kerning"));
  if (objc_msgSend(v6, "isTextScaleOverridden")
    && objc_msgSend(v18, "isTextScaleOverridden"))
  {
    -[WDCharacterProperties setTextScale:](self, "setTextScale:", objc_msgSend(v18, "textScale"));
  }
  if (objc_msgSend(v6, "isUnderlineColorOverridden")
    && objc_msgSend(v18, "isUnderlineColorOverridden"))
  {
    objc_msgSend(v18, "underlineColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterProperties setUnderlineColor:](self, "setUnderlineColor:", v16);

  }
  if (objc_msgSend(v6, "isUnderlineOverridden")
    && objc_msgSend(v18, "isUnderlineOverridden"))
  {
    -[WDCharacterProperties setUnderline:](self, "setUnderline:", objc_msgSend(v18, "underline"));
  }
  if (objc_msgSend(v6, "isStrikeThroughOverridden")
    && objc_msgSend(v18, "isStrikeThroughOverridden"))
  {
    -[WDCharacterProperties setStrikeThrough:](self, "setStrikeThrough:", objc_msgSend(v18, "strikeThrough"));
  }
  if (objc_msgSend(v6, "isDoubleStrikeThroughOverridden")
    && objc_msgSend(v18, "isDoubleStrikeThroughOverridden"))
  {
    -[WDCharacterProperties setDoubleStrikeThrough:](self, "setDoubleStrikeThrough:", objc_msgSend(v18, "doubleStrikeThrough"));
  }
  if (objc_msgSend(v6, "isLigatureOverridden") && objc_msgSend(v18, "isLigatureOverridden"))
    -[WDCharacterProperties setLigature:](self, "setLigature:", objc_msgSend(v18, "ligature"));
  if (objc_msgSend(v6, "isHighlightOverridden")
    && objc_msgSend(v18, "isHighlightOverridden"))
  {
    -[WDCharacterProperties setHighlight:](self, "setHighlight:", objc_msgSend(v18, "isHighlight"));
  }
  if (objc_msgSend(v6, "isHighlightColorOverridden")
    && objc_msgSend(v18, "isHighlightColorOverridden"))
  {
    -[WDCharacterProperties setHighlightColor:](self, "setHighlightColor:", objc_msgSend(v18, "highlightColor"));
  }
  if (objc_msgSend(v6, "isSmallCapsOverridden")
    && objc_msgSend(v18, "isSmallCapsOverridden"))
  {
    -[WDCharacterProperties setSmallCaps:](self, "setSmallCaps:", objc_msgSend(v18, "smallCaps"));
  }
  if (objc_msgSend(v6, "isCapsOverridden") && objc_msgSend(v18, "isCapsOverridden"))
    -[WDCharacterProperties setCaps:](self, "setCaps:", objc_msgSend(v18, "caps"));
  if (objc_msgSend(v6, "isLowerCaseOverridden")
    && objc_msgSend(v18, "isLowerCaseOverridden"))
  {
    -[WDCharacterProperties setLowerCase:](self, "setLowerCase:", objc_msgSend(v18, "isLowerCase"));
  }
  if (objc_msgSend(v6, "isHiddenOverridden") && objc_msgSend(v18, "isHiddenOverridden"))
    -[WDCharacterProperties setHidden:](self, "setHidden:", objc_msgSend(v18, "hidden"));
  if (objc_msgSend(v6, "isSpacingOverridden") && objc_msgSend(v18, "isSpacingOverridden"))
    -[WDCharacterProperties setSpacing:](self, "setSpacing:", objc_msgSend(v18, "spacing"));
  if (objc_msgSend(v6, "isPositionOverridden") && objc_msgSend(v18, "isPositionOverridden"))
    -[WDCharacterProperties setPosition:](self, "setPosition:", objc_msgSend(v18, "position"));
  if (objc_msgSend(v6, "isFontSizeOverridden") && objc_msgSend(v18, "isFontSizeOverridden"))
    -[WDCharacterProperties setFontSize:](self, "setFontSize:", objc_msgSend(v18, "fontSize"));
  if (objc_msgSend(v6, "isVerticalAlignOverridden")
    && objc_msgSend(v18, "isVerticalAlignOverridden"))
  {
    -[WDCharacterProperties setVerticalAlign:](self, "setVerticalAlign:", objc_msgSend(v18, "verticalAlign"));
  }
  if (objc_msgSend(v6, "isEmphasisMarkOverridden")
    && objc_msgSend(v18, "isEmphasisMarkOverridden"))
  {
    -[WDCharacterProperties setEmphasisMark:](self, "setEmphasisMark:", objc_msgSend(v18, "emphasisMark"));
  }
  if (objc_msgSend(v6, "isColorOverridden") && objc_msgSend(v18, "isColorOverridden"))
  {
    objc_msgSend(v18, "color");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDCharacterProperties setColor:](self, "setColor:", v17);

  }
  if (objc_msgSend(v6, "isColorAutoOverridden")
    && objc_msgSend(v18, "isColorAutoOverridden"))
  {
    -[WDCharacterProperties setColorAuto:](self, "setColorAuto:", objc_msgSend(v18, "isColorAuto"));
  }
  if (objc_msgSend(v6, "isLanguageForDefaultTextOverridden")
    && objc_msgSend(v18, "isLanguageForDefaultTextOverridden"))
  {
    -[WDCharacterProperties setLanguageForDefaultText:](self, "setLanguageForDefaultText:", objc_msgSend(v18, "languageForDefaultText"));
  }
  if (objc_msgSend(v6, "isSpecialCharacterOverridden")
    && objc_msgSend(v18, "isSpecialCharacterOverridden"))
  {
    -[WDCharacterProperties setSpecialCharacter:](self, "setSpecialCharacter:", objc_msgSend(v18, "isSpecialCharacter"));
  }
  if (objc_msgSend(v6, "isListCharacterPictureBulletOverridden")
    && objc_msgSend(v18, "isListCharacterPictureBulletOverridden"))
  {
    -[WDCharacterProperties setListCharacterPictureBullet:](self, "setListCharacterPictureBullet:", objc_msgSend(v18, "isListCharacterPictureBullet"));
  }
  if (objc_msgSend(v6, "isCharPositionOfPictureBulletInBookmarkOverridden")
    && objc_msgSend(v18, "isCharPositionOfPictureBulletInBookmarkOverridden"))
  {
    -[WDCharacterProperties setCharPositionOfPictureBulletInBookmark:](self, "setCharPositionOfPictureBulletInBookmark:", objc_msgSend(v18, "charPositionOfPictureBulletInBookmark"));
  }
  if (objc_msgSend(v6, "isLanguageForFarEastOverridden")
    && objc_msgSend(v18, "isLanguageForFarEastOverridden"))
  {
    -[WDCharacterProperties setLanguageForFarEast:](self, "setLanguageForFarEast:", objc_msgSend(v18, "languageForFarEast"));
  }
  if (objc_msgSend(v6, "isLanguageForBiTextOverridden")
    && objc_msgSend(v18, "isLanguageForBiTextOverridden"))
  {
    -[WDCharacterProperties setLanguageForBiText:](self, "setLanguageForBiText:", objc_msgSend(v18, "languageForBiText"));
  }
  if (objc_msgSend(v6, "isFontSizeForBiTextOverridden")
    && objc_msgSend(v18, "isFontSizeForBiTextOverridden"))
  {
    -[WDCharacterProperties setFontSizeForBiText:](self, "setFontSizeForBiText:", objc_msgSend(v18, "fontSizeForBiText"));
  }

}

- (void)removeEmptyFormattingChanges:(id)a3
{
  WDCharacterPropertiesValues *mOriginalProperties;
  id *p_mOriginalProperties;
  id v6;
  void *v7;
  void *v8;
  WDCharacterPropertiesValues *v9;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  char v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  char v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  char v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  char v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  char v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  char v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  char v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  char v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  char v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  char v73;
  int v74;
  id v75;
  int v76;
  id v77;
  int v78;
  id v79;
  int v80;
  id v81;
  int v82;
  id v83;
  int v84;
  id v85;
  _BOOL4 v86;
  id v87;
  int v88;
  id v89;
  uint64_t v90;
  BOOL v91;
  id v92;
  int v93;
  id v94;
  int v95;
  id v96;
  int v97;
  id v98;
  int v99;
  id v100;
  int v101;
  id v102;
  int v103;
  id v104;
  int v105;
  id v106;
  int v107;
  id v108;
  int v109;
  float v110;
  float v111;
  float v112;
  float v113;
  int v114;
  id v115;
  int v116;
  id v117;
  int v118;
  id v119;
  int v120;
  id v121;
  int v122;
  id v123;
  id v124;
  int v125;
  id v126;
  int v127;
  id v128;
  int v129;
  id v130;
  int v131;
  id v132;
  int v133;
  id v134;
  int v135;
  id v136;
  int v137;
  id v138;
  int v139;
  id v140;
  int v141;
  id v142;
  int v143;
  id v144;
  int v145;
  id v146;
  int v147;
  id v148;
  float v149;
  float v150;
  float v151;
  float v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  _BOOL4 v159;
  id v160;

  v160 = a3;
  objc_msgSend(v160, "setResolveMode:", 0);
  p_mOriginalProperties = (id *)&self->mOriginalProperties;
  mOriginalProperties = self->mOriginalProperties;
  if (mOriginalProperties
    && -[WDCharacterPropertiesValues baseStyleOverridden](mOriginalProperties, "baseStyleOverridden")
    && objc_msgSend(v160, "isBaseStyleOverridden"))
  {
    v6 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      objc_msgSend(*p_mOriginalProperties, "baseStyle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v160, "baseStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    if (v7 == v8)
    {
      objc_msgSend(*p_mOriginalProperties, "setBaseStyleOverridden:", 0);
      objc_msgSend(*p_mOriginalProperties, "setBaseStyle:", 0);
    }
  }
  objc_msgSend(v160, "setResolveMode:", 1);
  mTrackedProperties = self->mTrackedProperties;
  p_mTrackedProperties = (id *)&self->mTrackedProperties;
  v9 = mTrackedProperties;
  if (!mTrackedProperties)
    goto LABEL_27;
  if (-[WDCharacterPropertiesValues baseStyleOverridden](v9, "baseStyleOverridden")
    && objc_msgSend(v160, "isBaseStyleOverridden"))
  {
    v12 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      objc_msgSend(*p_mTrackedProperties, "baseStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v160, "baseStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    if (v13 == v14)
    {
      objc_msgSend(*p_mTrackedProperties, "setBaseStyleOverridden:", 0);
      objc_msgSend(*p_mTrackedProperties, "setBaseStyle:", 0);
    }
  }
  if (!*p_mTrackedProperties)
  {
LABEL_27:
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 1;
    goto LABEL_265;
  }
  if (objc_msgSend(*p_mTrackedProperties, "baseStyleOverridden"))
  {
    if (*p_mOriginalProperties && objc_msgSend(*p_mOriginalProperties, "baseStyleOverridden"))
    {
      v15 = *p_mOriginalProperties;
      if (*p_mOriginalProperties)
      {
        objc_msgSend(*p_mOriginalProperties, "baseStyle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      v22 = *p_mTrackedProperties;
      if (*p_mTrackedProperties)
      {
        objc_msgSend(*p_mTrackedProperties, "baseStyle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }
      v21 = objc_msgSend(v16, "isEqual:", v23);
      if (v22)

      if (v15)
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 1;
  }
  if (!*p_mTrackedProperties)
    goto LABEL_264;
  if (objc_msgSend(*p_mTrackedProperties, "borderOverridden"))
  {
    if (!*p_mOriginalProperties || !objc_msgSend(*p_mOriginalProperties, "borderOverridden"))
      goto LABEL_53;
    v24 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      objc_msgSend(*p_mOriginalProperties, "border");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v26 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      objc_msgSend(*p_mTrackedProperties, "border");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    v28 = objc_msgSend(v25, "isEqual:", v27);
    if (v26)

    if (v24)
    if ((v28 & 1) == 0)
LABEL_53:
      v21 = 0;
  }
  if (!*p_mTrackedProperties)
    goto LABEL_264;
  if (objc_msgSend(*p_mTrackedProperties, "shadingOverridden"))
  {
    if (!*p_mOriginalProperties || !objc_msgSend(*p_mOriginalProperties, "shadingOverridden"))
      goto LABEL_69;
    v29 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      objc_msgSend(*p_mOriginalProperties, "shading");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    v31 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      objc_msgSend(*p_mTrackedProperties, "shading");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
    v33 = objc_msgSend(v30, "isEqual:", v32);
    if (v31)

    if (v29)
    if ((v33 & 1) == 0)
LABEL_69:
      v21 = 0;
  }
  if (!*p_mTrackedProperties)
    goto LABEL_264;
  if (objc_msgSend(*p_mTrackedProperties, "fontOverridden"))
  {
    if (!*p_mOriginalProperties || !objc_msgSend(*p_mOriginalProperties, "fontOverridden"))
      goto LABEL_85;
    v34 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      objc_msgSend(*p_mOriginalProperties, "font");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    v36 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      objc_msgSend(*p_mTrackedProperties, "font");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }
    v38 = objc_msgSend(v35, "isEqual:", v37);
    if (v36)

    if (v34)
    if ((v38 & 1) == 0)
LABEL_85:
      v21 = 0;
  }
  if (!*p_mTrackedProperties)
    goto LABEL_264;
  if (objc_msgSend(*p_mTrackedProperties, "extendedFontOverridden"))
  {
    if (!*p_mOriginalProperties || !objc_msgSend(*p_mOriginalProperties, "extendedFontOverridden"))
      goto LABEL_101;
    v39 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      objc_msgSend(*p_mOriginalProperties, "extendedFont");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = 0;
    }
    v41 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      objc_msgSend(*p_mTrackedProperties, "extendedFont");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v42 = 0;
    }
    v43 = objc_msgSend(v40, "isEqual:", v42);
    if (v41)

    if (v39)
    if ((v43 & 1) == 0)
LABEL_101:
      v21 = 0;
  }
  if (!*p_mTrackedProperties)
    goto LABEL_264;
  if (objc_msgSend(*p_mTrackedProperties, "farEastFontOverridden"))
  {
    if (!*p_mOriginalProperties || !objc_msgSend(*p_mOriginalProperties, "farEastFontOverridden"))
      goto LABEL_117;
    v44 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      objc_msgSend(*p_mOriginalProperties, "farEastFont");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = 0;
    }
    v46 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      objc_msgSend(*p_mTrackedProperties, "farEastFont");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = 0;
    }
    v48 = objc_msgSend(v45, "isEqual:", v47);
    if (v46)

    if (v44)
    if ((v48 & 1) == 0)
LABEL_117:
      v21 = 0;
  }
  if (!*p_mTrackedProperties)
    goto LABEL_264;
  if (objc_msgSend(*p_mTrackedProperties, "symbolFontOverridden"))
  {
    if (!*p_mOriginalProperties || !objc_msgSend(*p_mOriginalProperties, "symbolFontOverridden"))
      goto LABEL_133;
    v49 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      objc_msgSend(*p_mOriginalProperties, "symbolFont");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = 0;
    }
    v51 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      objc_msgSend(*p_mTrackedProperties, "symbolFont");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = 0;
    }
    v53 = objc_msgSend(v50, "isEqual:", v52);
    if (v51)

    if (v49)
    if ((v53 & 1) == 0)
LABEL_133:
      v21 = 0;
  }
  if (!*p_mTrackedProperties)
    goto LABEL_264;
  if (objc_msgSend(*p_mTrackedProperties, "underlineColorOverridden"))
  {
    if (!*p_mOriginalProperties || !objc_msgSend(*p_mOriginalProperties, "underlineColorOverridden"))
      goto LABEL_149;
    v54 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      objc_msgSend(*p_mOriginalProperties, "underlineColor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v55 = 0;
    }
    v56 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      objc_msgSend(*p_mTrackedProperties, "underlineColor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = 0;
    }
    v58 = objc_msgSend(v55, "isEqual:", v57);
    if (v56)

    if (v54)
    if ((v58 & 1) == 0)
LABEL_149:
      v21 = 0;
  }
  if (!*p_mTrackedProperties)
    goto LABEL_264;
  if (objc_msgSend(*p_mTrackedProperties, "colorOverridden"))
  {
    if (!*p_mOriginalProperties || !objc_msgSend(*p_mOriginalProperties, "colorOverridden"))
      goto LABEL_165;
    v59 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      objc_msgSend(*p_mOriginalProperties, "color");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = 0;
    }
    v61 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      objc_msgSend(*p_mTrackedProperties, "color");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v62 = 0;
    }
    v63 = objc_msgSend(v60, "isEqual:", v62);
    if (v61)

    if (v59)
    if ((v63 & 1) == 0)
LABEL_165:
      v21 = 0;
  }
  if (!*p_mTrackedProperties)
    goto LABEL_264;
  if (objc_msgSend(*p_mTrackedProperties, "shadow2010Overridden"))
  {
    if (!*p_mOriginalProperties || !objc_msgSend(*p_mOriginalProperties, "shadow2010Overridden"))
      goto LABEL_181;
    v64 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      objc_msgSend(*p_mOriginalProperties, "shadow2010");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v65 = 0;
    }
    v66 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      objc_msgSend(*p_mTrackedProperties, "shadow2010");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v67 = 0;
    }
    v68 = objc_msgSend(v65, "isEqual:", v67);
    if (v66)

    if (v64)
    if ((v68 & 1) == 0)
LABEL_181:
      v21 = 0;
  }
  if (!*p_mTrackedProperties)
    goto LABEL_264;
  if (objc_msgSend(*p_mTrackedProperties, "reflectionOverridden"))
  {
    if (!*p_mOriginalProperties || !objc_msgSend(*p_mOriginalProperties, "reflectionOverridden"))
      goto LABEL_197;
    v69 = *p_mOriginalProperties;
    if (*p_mOriginalProperties)
    {
      objc_msgSend(*p_mOriginalProperties, "reflection");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = 0;
    }
    v71 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
    {
      objc_msgSend(*p_mTrackedProperties, "reflection");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v72 = 0;
    }
    v73 = objc_msgSend(v70, "isEqual:", v72);
    if (v71)

    if (v69)
    if ((v73 & 1) == 0)
LABEL_197:
      v21 = 0;
  }
  if (!*p_mTrackedProperties)
    goto LABEL_264;
  if (!objc_msgSend(*p_mTrackedProperties, "symbolCharacterOverridden"))
    goto LABEL_208;
  if (*p_mOriginalProperties && objc_msgSend(*p_mOriginalProperties, "symbolCharacterOverridden"))
  {
    if (*p_mOriginalProperties)
      v74 = objc_msgSend(*p_mOriginalProperties, "symbolCharacter");
    else
      v74 = 0;
    v75 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
      LODWORD(v75) = objc_msgSend(v75, "symbolCharacter");
    if (v74 == (_DWORD)v75)
    {
LABEL_208:
      if (!*p_mTrackedProperties)
        goto LABEL_264;
      if (!objc_msgSend(*p_mTrackedProperties, "boldOverridden"))
        goto LABEL_257;
      if (*p_mOriginalProperties && objc_msgSend(*p_mOriginalProperties, "boldOverridden"))
      {
        if (*p_mOriginalProperties)
          v76 = objc_msgSend(*p_mOriginalProperties, "bold");
        else
          v76 = 0;
        v77 = *p_mTrackedProperties;
        if (*p_mTrackedProperties)
          LODWORD(v77) = objc_msgSend(v77, "bold");
        if (v76 == (_DWORD)v77)
        {
LABEL_257:
          if (!*p_mTrackedProperties)
            goto LABEL_264;
          if (!objc_msgSend(*p_mTrackedProperties, "boldForBiTextOverridden"))
            goto LABEL_618;
          if (*p_mOriginalProperties && objc_msgSend(*p_mOriginalProperties, "boldForBiTextOverridden"))
          {
            if (*p_mOriginalProperties)
              v78 = objc_msgSend(*p_mOriginalProperties, "boldForBiText");
            else
              v78 = 0;
            v79 = *p_mTrackedProperties;
            if (*p_mTrackedProperties)
              LODWORD(v79) = objc_msgSend(v79, "boldForBiText");
            if (v78 == (_DWORD)v79)
            {
LABEL_618:
              if (!*p_mTrackedProperties)
                goto LABEL_264;
              if (!objc_msgSend(*p_mTrackedProperties, "italicOverridden"))
                goto LABEL_619;
              if (*p_mOriginalProperties && objc_msgSend(*p_mOriginalProperties, "italicOverridden"))
              {
                if (*p_mOriginalProperties)
                  v80 = objc_msgSend(*p_mOriginalProperties, "italic");
                else
                  v80 = 0;
                v81 = *p_mTrackedProperties;
                if (*p_mTrackedProperties)
                  LODWORD(v81) = objc_msgSend(v81, "italic");
                if (v80 == (_DWORD)v81)
                {
LABEL_619:
                  if (!*p_mTrackedProperties)
                    goto LABEL_264;
                  if (!objc_msgSend(*p_mTrackedProperties, "italicForBiTextOverridden"))
                    goto LABEL_620;
                  if (*p_mOriginalProperties
                    && objc_msgSend(*p_mOriginalProperties, "italicForBiTextOverridden"))
                  {
                    if (*p_mOriginalProperties)
                      v82 = objc_msgSend(*p_mOriginalProperties, "italicForBiText");
                    else
                      v82 = 0;
                    v83 = *p_mTrackedProperties;
                    if (*p_mTrackedProperties)
                      LODWORD(v83) = objc_msgSend(v83, "italicForBiText");
                    if (v82 == (_DWORD)v83)
                    {
LABEL_620:
                      if (!*p_mTrackedProperties)
                        goto LABEL_264;
                      if (!objc_msgSend(*p_mTrackedProperties, "outlineOverridden"))
                        goto LABEL_621;
                      if (*p_mOriginalProperties
                        && objc_msgSend(*p_mOriginalProperties, "outlineOverridden"))
                      {
                        if (*p_mOriginalProperties)
                          v84 = objc_msgSend(*p_mOriginalProperties, "outline");
                        else
                          v84 = 0;
                        v85 = *p_mTrackedProperties;
                        if (*p_mTrackedProperties)
                          LODWORD(v85) = objc_msgSend(v85, "outline");
                        if (v84 == (_DWORD)v85)
                        {
LABEL_621:
                          if (*p_mTrackedProperties)
                          {
                            if (objc_msgSend(*p_mTrackedProperties, "outlineColorOverridden"))
                            {
                              if (!*p_mOriginalProperties
                                || !objc_msgSend(*p_mOriginalProperties, "outlineColorOverridden"))
                              {
                                goto LABEL_595;
                              }
                              v18 = *p_mOriginalProperties != 0;
                              if (*p_mOriginalProperties)
                              {
                                objc_msgSend(*p_mOriginalProperties, "outlineColor");
                                v158 = (void *)objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                v158 = 0;
                              }
                              v17 = *p_mTrackedProperties != 0;
                              if (*p_mTrackedProperties)
                              {
                                objc_msgSend(*p_mTrackedProperties, "outlineColor");
                                v157 = (void *)objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                v157 = 0;
                              }
                              if (v158 != v157)
                              {
LABEL_422:
                                LOBYTE(v86) = 1;
                                if (!v17)
                                {
LABEL_587:
                                  if (!v18)
                                  {
LABEL_589:
                                    if (!v86 && (v21 & 1) != 0)
                                    {
                                      if (*p_mOriginalProperties)
                                        objc_msgSend(*p_mOriginalProperties, "setFormattingChangedOverridden:", 0);
                                      if (*p_mTrackedProperties)
                                        objc_msgSend(*p_mTrackedProperties, "setFormattingChangedOverridden:", 0);
                                    }
                                    goto LABEL_595;
                                  }
LABEL_588:

                                  goto LABEL_589;
                                }
LABEL_274:

                                if (!v18)
                                  goto LABEL_589;
                                goto LABEL_588;
                              }
                            }
                            else
                            {
                              v18 = 0;
                              v17 = 0;
                            }
                            if (!*p_mTrackedProperties)
                              goto LABEL_454;
                            if (objc_msgSend(*p_mTrackedProperties, "outline2010WidthOverridden"))
                            {
                              if (!*p_mOriginalProperties
                                || !objc_msgSend(*p_mOriginalProperties, "outline2010WidthOverridden"))
                              {
                                goto LABEL_422;
                              }
                              v110 = 0.0;
                              v111 = 0.0;
                              if (*p_mOriginalProperties)
                              {
                                objc_msgSend(*p_mOriginalProperties, "outline2010Width");
                                v111 = v112;
                              }
                              if (*p_mTrackedProperties)
                              {
                                objc_msgSend(*p_mTrackedProperties, "outline2010Width");
                                v110 = v113;
                              }
                              if (v111 != v110)
                                goto LABEL_422;
                            }
                            if (!*p_mTrackedProperties)
                              goto LABEL_454;
                            if (objc_msgSend(*p_mTrackedProperties, "shadowOverridden"))
                            {
                              if (!*p_mOriginalProperties
                                || !objc_msgSend(*p_mOriginalProperties, "shadowOverridden"))
                              {
                                goto LABEL_422;
                              }
                              if (*p_mOriginalProperties)
                                v114 = objc_msgSend(*p_mOriginalProperties, "shadow");
                              else
                                v114 = 0;
                              v123 = *p_mTrackedProperties;
                              if (*p_mTrackedProperties)
                                LODWORD(v123) = objc_msgSend(v123, "shadow");
                              if (v114 != (_DWORD)v123)
                                goto LABEL_422;
                            }
                            if (*p_mTrackedProperties
                              && objc_msgSend(*p_mTrackedProperties, "reflectionOverridden"))
                            {
                              if (!*p_mOriginalProperties
                                || !objc_msgSend(*p_mOriginalProperties, "reflectionOverridden"))
                              {
                                goto LABEL_422;
                              }
                              v19 = *p_mOriginalProperties != 0;
                              if (*p_mOriginalProperties)
                              {
                                objc_msgSend(*p_mOriginalProperties, "reflection");
                                v156 = (void *)objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                v156 = 0;
                              }
                              v20 = *p_mTrackedProperties != 0;
                              if (*p_mTrackedProperties)
                              {
                                objc_msgSend(*p_mTrackedProperties, "reflection");
                                v155 = (void *)objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                v155 = 0;
                              }
                              if (v156 != v155)
                              {
LABEL_470:
                                LOBYTE(v86) = 1;
                                if (!v20)
                                  goto LABEL_585;
                                goto LABEL_272;
                              }
                            }
                            else
                            {
LABEL_454:
                              v19 = 0;
                              v20 = 0;
                            }
LABEL_265:
                            if (!*p_mTrackedProperties)
                            {
                              LOBYTE(v86) = 0;
                              if (!v20)
                                goto LABEL_585;
                              goto LABEL_272;
                            }
                            if (objc_msgSend(*p_mTrackedProperties, "shadow2010Overridden"))
                            {
                              if (!*p_mOriginalProperties
                                || !objc_msgSend(*p_mOriginalProperties, "shadow2010Overridden"))
                              {
                                goto LABEL_470;
                              }
                              v159 = *p_mOriginalProperties != 0;
                              if (*p_mOriginalProperties)
                              {
                                objc_msgSend(*p_mOriginalProperties, "shadow2010");
                                v154 = (void *)objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                v154 = 0;
                              }
                              v89 = *p_mTrackedProperties;
                              v86 = *p_mTrackedProperties != 0;
                              if (*p_mTrackedProperties)
                              {
                                objc_msgSend(*p_mTrackedProperties, "shadow2010");
                                v90 = objc_claimAutoreleasedReturnValue();
                              }
                              else
                              {
                                v90 = 0;
                              }
                              v153 = (void *)v90;
                              if (v154 != (void *)v90)
                                goto LABEL_610;
                              v87 = *p_mTrackedProperties;
                              if (!*p_mTrackedProperties)
                              {
                                v91 = 0;
                                if (!v89)
                                  goto LABEL_583;
                                goto LABEL_611;
                              }
                            }
                            else
                            {
                              v86 = 0;
                              v87 = *p_mTrackedProperties;
                              if (!*p_mTrackedProperties)
                                goto LABEL_584;
                              v159 = 0;
                            }
                            if (!objc_msgSend(v87, "kerningOverridden", v153))
                              goto LABEL_622;
                            if (*p_mOriginalProperties
                              && objc_msgSend(*p_mOriginalProperties, "kerningOverridden"))
                            {
                              if (*p_mOriginalProperties)
                                v88 = objc_msgSend(*p_mOriginalProperties, "kerning");
                              else
                                v88 = 0;
                              v92 = *p_mTrackedProperties;
                              if (*p_mTrackedProperties)
                                LODWORD(v92) = objc_msgSend(v92, "kerning");
                              if (v88 == (_DWORD)v92)
                              {
LABEL_622:
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "textScaleOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "textScaleOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v93 = objc_msgSend(*p_mOriginalProperties, "textScale");
                                  else
                                    v93 = 0;
                                  v94 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v94) = objc_msgSend(v94, "textScale");
                                  if (v93 != (_DWORD)v94)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "embossedOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "embossedOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v95 = objc_msgSend(*p_mOriginalProperties, "embossed");
                                  else
                                    v95 = 0;
                                  v96 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v96) = objc_msgSend(v96, "embossed");
                                  if (v95 != (_DWORD)v96)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "imprintOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "imprintOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v97 = objc_msgSend(*p_mOriginalProperties, "imprint");
                                  else
                                    v97 = 0;
                                  v98 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v98) = objc_msgSend(v98, "imprint");
                                  if (v97 != (_DWORD)v98)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "underlineOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "underlineOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v99 = objc_msgSend(*p_mOriginalProperties, "underline");
                                  else
                                    v99 = 0;
                                  v100 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v100) = objc_msgSend(v100, "underline");
                                  if (v99 != (_DWORD)v100)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "strikeThroughOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "strikeThroughOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v101 = objc_msgSend(*p_mOriginalProperties, "strikeThrough");
                                  else
                                    v101 = 0;
                                  v102 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v102) = objc_msgSend(v102, "strikeThrough");
                                  if (v101 != (_DWORD)v102)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "doubleStrikeThroughOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "doubleStrikeThroughOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v103 = objc_msgSend(*p_mOriginalProperties, "doubleStrikeThrough");
                                  else
                                    v103 = 0;
                                  v104 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v104) = objc_msgSend(v104, "doubleStrikeThrough");
                                  if (v103 != (_DWORD)v104)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "ligatureOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "ligatureOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v105 = objc_msgSend(*p_mOriginalProperties, "ligature");
                                  else
                                    v105 = 0;
                                  v106 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v106) = objc_msgSend(v106, "ligature");
                                  if (v105 != (_DWORD)v106)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "highlightOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "highlightOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v107 = objc_msgSend(*p_mOriginalProperties, "highlight");
                                  else
                                    v107 = 0;
                                  v108 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v108) = objc_msgSend(v108, "highlight");
                                  if (v107 != (_DWORD)v108)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "highlightColorOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "highlightColorOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v109 = objc_msgSend(*p_mOriginalProperties, "highlightColor");
                                  else
                                    v109 = 0;
                                  v115 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v115) = objc_msgSend(v115, "highlightColor");
                                  if (v109 != (_DWORD)v115)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "smallCapsOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "smallCapsOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v116 = objc_msgSend(*p_mOriginalProperties, "smallCapsOverridden");
                                  else
                                    v116 = 0;
                                  v117 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v117) = objc_msgSend(v117, "smallCapsOverridden");
                                  if (v116 != (_DWORD)v117)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "capsOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "capsOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v118 = objc_msgSend(*p_mOriginalProperties, "capsOverridden");
                                  else
                                    v118 = 0;
                                  v119 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v119) = objc_msgSend(v119, "capsOverridden");
                                  if (v118 != (_DWORD)v119)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "lowerCaseOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "lowerCaseOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v120 = objc_msgSend(*p_mOriginalProperties, "lowerCase");
                                  else
                                    v120 = 0;
                                  v121 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v121) = objc_msgSend(v121, "lowerCase");
                                  if (v120 != (_DWORD)v121)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "hiddenOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "hiddenOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v122 = objc_msgSend(*p_mOriginalProperties, "hidden");
                                  else
                                    v122 = 0;
                                  v124 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v124) = objc_msgSend(v124, "hidden");
                                  if (v122 != (_DWORD)v124)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "spacingOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "spacingOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v125 = objc_msgSend(*p_mOriginalProperties, "spacing");
                                  else
                                    v125 = 0;
                                  v126 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v126) = objc_msgSend(v126, "spacing");
                                  if (v125 != (_DWORD)v126)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "positionOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "positionOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v127 = objc_msgSend(*p_mOriginalProperties, "position");
                                  else
                                    v127 = 0;
                                  v128 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v128) = objc_msgSend(v128, "position");
                                  if (v127 != (_DWORD)v128)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "fontSizeOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "fontSizeOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v129 = objc_msgSend(*p_mOriginalProperties, "fontSize");
                                  else
                                    v129 = 0;
                                  v130 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v130) = objc_msgSend(v130, "fontSize");
                                  if (v129 != (_DWORD)v130)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "verticalAlignOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "verticalAlignOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v131 = objc_msgSend(*p_mOriginalProperties, "verticalAlign");
                                  else
                                    v131 = 0;
                                  v132 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v132) = objc_msgSend(v132, "verticalAlign");
                                  if (v131 != (_DWORD)v132)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "emphasisMarkOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "emphasisMarkOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v133 = objc_msgSend(*p_mOriginalProperties, "emphasisMark");
                                  else
                                    v133 = 0;
                                  v134 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v134) = objc_msgSend(v134, "emphasisMark");
                                  if (v133 != (_DWORD)v134)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "colorAutoOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "colorAutoOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v135 = objc_msgSend(*p_mOriginalProperties, "colorAuto");
                                  else
                                    v135 = 0;
                                  v136 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v136) = objc_msgSend(v136, "colorAuto");
                                  if (v135 != (_DWORD)v136)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "languageForDefaultTextOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "languageForDefaultTextOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v137 = objc_msgSend(*p_mOriginalProperties, "languageForDefaultText");
                                  else
                                    v137 = 0;
                                  v138 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v138) = objc_msgSend(v138, "languageForDefaultText");
                                  if (v137 != (_DWORD)v138)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "specialCharacterOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "specialCharacterOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v139 = objc_msgSend(*p_mOriginalProperties, "specialCharacter");
                                  else
                                    v139 = 0;
                                  v140 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v140) = objc_msgSend(v140, "specialCharacter");
                                  if (v139 != (_DWORD)v140)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "listCharacterPictureBulletOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "listCharacterPictureBulletOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v141 = objc_msgSend(*p_mOriginalProperties, "listCharacterPictureBullet");
                                  else
                                    v141 = 0;
                                  v142 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v142) = objc_msgSend(v142, "listCharacterPictureBullet");
                                  if (v141 != (_DWORD)v142)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "charPositionOfPictureBulletInBookmarkOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "charPositionOfPictureBulletInBookmarkOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v143 = objc_msgSend(*p_mOriginalProperties, "charPositionOfPictureBulletInBookmark");
                                  else
                                    v143 = 0;
                                  v144 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v144) = objc_msgSend(v144, "charPositionOfPictureBulletInBookmark");
                                  if (v143 != (_DWORD)v144)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                  goto LABEL_582;
                                if (objc_msgSend(*p_mTrackedProperties, "languageForFarEastOverridden"))
                                {
                                  if (!*p_mOriginalProperties
                                    || !objc_msgSend(*p_mOriginalProperties, "languageForFarEastOverridden"))
                                  {
                                    goto LABEL_610;
                                  }
                                  if (*p_mOriginalProperties)
                                    v145 = objc_msgSend(*p_mOriginalProperties, "languageForFarEast");
                                  else
                                    v145 = 0;
                                  v146 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v146) = objc_msgSend(v146, "languageForFarEast");
                                  if (v145 != (_DWORD)v146)
                                    goto LABEL_610;
                                }
                                if (!*p_mTrackedProperties)
                                {
LABEL_582:
                                  v91 = 0;
                                  if (!v86)
                                    goto LABEL_583;
                                  goto LABEL_611;
                                }
                                if (!objc_msgSend(*p_mTrackedProperties, "languageForBiTextOverridden"))
                                  goto LABEL_623;
                                if (*p_mOriginalProperties
                                  && objc_msgSend(*p_mOriginalProperties, "languageForBiTextOverridden"))
                                {
                                  if (*p_mOriginalProperties)
                                    v147 = objc_msgSend(*p_mOriginalProperties, "languageForBiText");
                                  else
                                    v147 = 0;
                                  v148 = *p_mTrackedProperties;
                                  if (*p_mTrackedProperties)
                                    LODWORD(v148) = objc_msgSend(v148, "languageForBiText");
                                  if (v147 == (_DWORD)v148)
                                  {
LABEL_623:
                                    if (!*p_mTrackedProperties
                                      || !objc_msgSend(*p_mTrackedProperties, "shadow2010OpacityOverridden"))
                                    {
                                      v91 = 0;
                                      if (!v86)
                                        goto LABEL_583;
                                      goto LABEL_611;
                                    }
                                    if (*p_mOriginalProperties
                                      && objc_msgSend(*p_mOriginalProperties, "shadow2010OpacityOverridden"))
                                    {
                                      v149 = 0.0;
                                      v150 = 0.0;
                                      if (*p_mOriginalProperties)
                                      {
                                        objc_msgSend(*p_mOriginalProperties, "shadow2010Opacity");
                                        v150 = v151;
                                      }
                                      if (*p_mTrackedProperties)
                                      {
                                        objc_msgSend(*p_mTrackedProperties, "shadow2010Opacity");
                                        v149 = v152;
                                      }
                                      v91 = v150 != v149;
                                      if (!v86)
                                      {
LABEL_583:
                                        LOBYTE(v86) = v91;
                                        if (!v159)
                                          goto LABEL_584;
                                        goto LABEL_612;
                                      }
LABEL_611:

                                      LOBYTE(v86) = v91;
                                      if (!v159)
                                      {
LABEL_584:
                                        if (!v20)
                                          goto LABEL_585;
                                        goto LABEL_272;
                                      }
LABEL_612:

                                      LOBYTE(v86) = v91;
                                      if (!v20)
                                      {
LABEL_585:
                                        if (v19)
                                        {
LABEL_586:

                                          if (!v17)
                                            goto LABEL_587;
                                          goto LABEL_274;
                                        }
LABEL_273:
                                        if (!v17)
                                          goto LABEL_587;
                                        goto LABEL_274;
                                      }
LABEL_272:

                                      if (v19)
                                        goto LABEL_586;
                                      goto LABEL_273;
                                    }
                                  }
                                }
                              }
                            }
LABEL_610:
                            v91 = 1;
                            if (!v86)
                              goto LABEL_583;
                            goto LABEL_611;
                          }
LABEL_264:
                          v17 = 0;
                          v18 = 0;
                          v19 = 0;
                          v20 = 0;
                          goto LABEL_265;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_595:

}

- (id)border
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues borderOverridden](mTrackedProperties, "borderOverridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "borderOverridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues border](*p_mTrackedProperties, "border");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (BOOL)isBorderOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues borderOverridden](v4, "borderOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues borderOverridden](mTrackedProperties, "borderOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues borderOverridden](mOriginalProperties, "borderOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues borderOverridden](mTrackedProperties, "borderOverridden");
  }
  return 0;
}

- (id)extendedFont
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues extendedFontOverridden](mTrackedProperties, "extendedFontOverridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "extendedFontOverridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues extendedFont](*p_mTrackedProperties, "extendedFont");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (BOOL)isExtendedFontOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues extendedFontOverridden](v4, "extendedFontOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues extendedFontOverridden](mTrackedProperties, "extendedFontOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues extendedFontOverridden](mOriginalProperties, "extendedFontOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues extendedFontOverridden](mTrackedProperties, "extendedFontOverridden");
  }
  return 0;
}

- (id)farEastFont
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues farEastFontOverridden](mTrackedProperties, "farEastFontOverridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "farEastFontOverridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues farEastFont](*p_mTrackedProperties, "farEastFont");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (BOOL)isFarEastFontOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues farEastFontOverridden](v4, "farEastFontOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues farEastFontOverridden](mTrackedProperties, "farEastFontOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues farEastFontOverridden](mOriginalProperties, "farEastFontOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues farEastFontOverridden](mTrackedProperties, "farEastFontOverridden");
  }
  return 0;
}

- (id)symbolFont
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues symbolFontOverridden](mTrackedProperties, "symbolFontOverridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "symbolFontOverridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues symbolFont](*p_mTrackedProperties, "symbolFont");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (BOOL)isSymbolFontOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues symbolFontOverridden](v4, "symbolFontOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues symbolFontOverridden](mTrackedProperties, "symbolFontOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues symbolFontOverridden](mOriginalProperties, "symbolFontOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues symbolFontOverridden](mTrackedProperties, "symbolFontOverridden");
  }
  return 0;
}

- (id)fontForFontType:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0:
      -[WDCharacterProperties font](self, "font", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[WDCharacterProperties farEastFont](self, "farEastFont", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[WDCharacterProperties extendedFont](self, "extendedFont", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[WDCharacterProperties symbolFont](self, "symbolFont", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)isFontOverriddenForFontType:(int)a3
{
  BOOL result;

  switch(a3)
  {
    case 0:
      result = -[WDCharacterProperties isFontOverridden](self, "isFontOverridden");
      break;
    case 1:
      result = -[WDCharacterProperties isFarEastFontOverridden](self, "isFarEastFontOverridden");
      break;
    case 2:
      result = -[WDCharacterProperties isExtendedFontOverridden](self, "isExtendedFontOverridden");
      break;
    case 3:
      result = -[WDCharacterProperties isSymbolFontOverridden](self, "isSymbolFontOverridden");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)setFont:(id)a3 forFontType:(int)a4
{
  id v6;

  v6 = a3;
  switch(a4)
  {
    case 0:
      -[WDCharacterProperties setFont:](self, "setFont:", v6);
      goto LABEL_3;
    case 1:
LABEL_3:
      -[WDCharacterProperties setFarEastFont:](self, "setFarEastFont:", v6);
      goto LABEL_4;
    case 2:
LABEL_4:
      -[WDCharacterProperties setExtendedFont:](self, "setExtendedFont:", v6);
      goto LABEL_5;
    case 3:
LABEL_5:
      -[WDCharacterProperties setSymbolFont:](self, "setSymbolFont:", v6);
      break;
    default:
      break;
  }

}

+ (SEL)fontSelectorForFontType:(int)a3
{
  SEL result;

  switch(a3)
  {
    case 0:
      result = sel_font;
      break;
    case 1:
      result = sel_farEastFont;
      break;
    case 2:
      result = sel_extendedFont;
      break;
    case 3:
      result = sel_symbolFont;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (SEL)fontOverriddenSelectorForFontType:(int)a3
{
  SEL result;

  switch(a3)
  {
    case 0:
      result = sel_isFontOverridden;
      break;
    case 1:
      result = sel_isFarEastFontOverridden;
      break;
    case 2:
      result = sel_isExtendedFontOverridden;
      break;
    case 3:
      result = sel_isSymbolFontOverridden;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (SEL)setFontSelectorForFontType:(int)a3
{
  SEL result;

  switch(a3)
  {
    case 0:
      result = sel_setFont_;
      break;
    case 1:
      result = sel_setFarEastFont_;
      break;
    case 2:
      result = sel_setExtendedFont_;
      break;
    case 3:
      result = sel_setSymbolFont_;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (int)fontHint
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues fontHintOverridden](mTrackedProperties, "fontHintOverridden"))
        return -[WDCharacterPropertiesValues fontHint](*p_mTrackedProperties, "fontHint");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues fontHintOverridden](v5, "fontHintOverridden")))
  {
    return -[WDCharacterPropertiesValues fontHint](*p_mTrackedProperties, "fontHint");
  }
  else
  {
    return -1;
  }
}

- (void)setFontHint:(int)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  if ((a3 - 4) >= 0xFFFFFFFD)
  {
    v3 = *(_QWORD *)&a3;
    if (self->mTracked)
    {
      p_mTrackedProperties = (id *)&self->mTrackedProperties;
      mTrackedProperties = self->mTrackedProperties;
      if (mTrackedProperties)
        goto LABEL_9;
    }
    else
    {
      if (!self->mOriginal)
        return;
      p_mTrackedProperties = (id *)&self->mOriginalProperties;
      mTrackedProperties = self->mOriginalProperties;
      if (mTrackedProperties)
        goto LABEL_9;
    }
    v6 = objc_alloc_init(WDCharacterPropertiesValues);
    v7 = *p_mTrackedProperties;
    *p_mTrackedProperties = v6;

    mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
    if (!*p_mTrackedProperties)
      return;
LABEL_9:
    -[WDCharacterPropertiesValues setFontHint:](mTrackedProperties, "setFontHint:", v3);
    objc_msgSend(*p_mTrackedProperties, "setFontHintOverridden:", 1);
  }
}

- (BOOL)isFontHintOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues fontHintOverridden](v4, "fontHintOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues fontHintOverridden](mTrackedProperties, "fontHintOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues fontHintOverridden](mOriginalProperties, "fontHintOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues fontHintOverridden](mTrackedProperties, "fontHintOverridden");
  }
  return 0;
}

- (unsigned)symbolCharacter
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues symbolCharacterOverridden](mTrackedProperties, "symbolCharacterOverridden"))
        return -[WDCharacterPropertiesValues symbolCharacter](*p_mTrackedProperties, "symbolCharacter");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues symbolCharacterOverridden](v5, "symbolCharacterOverridden")))
  {
    return -[WDCharacterPropertiesValues symbolCharacter](*p_mTrackedProperties, "symbolCharacter");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isSymbolCharacterOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues symbolCharacterOverridden](v4, "symbolCharacterOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues symbolCharacterOverridden](mTrackedProperties, "symbolCharacterOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues symbolCharacterOverridden](mOriginalProperties, "symbolCharacterOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues symbolCharacterOverridden](mTrackedProperties, "symbolCharacterOverridden");
  }
  return 0;
}

- (int)boldForBiText
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues boldForBiTextOverridden](mTrackedProperties, "boldForBiTextOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues boldForBiTextOverridden](v5, "boldForBiTextOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues boldForBiText](*p_mTrackedProperties, "boldForBiText");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setBoldForBiText:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setBoldForBiText:](mTrackedProperties, "setBoldForBiText:", v3);
  objc_msgSend(*p_mTrackedProperties, "setBoldForBiTextOverridden:", 1);
}

- (BOOL)isBoldForBiTextOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues boldForBiTextOverridden](v4, "boldForBiTextOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues boldForBiTextOverridden](mTrackedProperties, "boldForBiTextOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues boldForBiTextOverridden](mOriginalProperties, "boldForBiTextOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues boldForBiTextOverridden](mTrackedProperties, "boldForBiTextOverridden");
  }
  return 0;
}

- (int)italicForBiText
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues italicForBiTextOverridden](mTrackedProperties, "italicForBiTextOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues italicForBiTextOverridden](v5, "italicForBiTextOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues italicForBiText](*p_mTrackedProperties, "italicForBiText");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setItalicForBiText:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setItalicForBiText:](mTrackedProperties, "setItalicForBiText:", v3);
  objc_msgSend(*p_mTrackedProperties, "setItalicForBiTextOverridden:", 1);
}

- (BOOL)isItalicForBiTextOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues italicForBiTextOverridden](v4, "italicForBiTextOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues italicForBiTextOverridden](mTrackedProperties, "italicForBiTextOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues italicForBiTextOverridden](mOriginalProperties, "italicForBiTextOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues italicForBiTextOverridden](mTrackedProperties, "italicForBiTextOverridden");
  }
  return 0;
}

- (int)outline
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues outlineOverridden](mTrackedProperties, "outlineOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues outlineOverridden](v5, "outlineOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues outline](*p_mTrackedProperties, "outline");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isOutlineOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues outlineOverridden](v4, "outlineOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues outlineOverridden](mTrackedProperties, "outlineOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues outlineOverridden](mOriginalProperties, "outlineOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues outlineOverridden](mTrackedProperties, "outlineOverridden");
  }
  return 0;
}

- (id)outlineColor
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues outlineColorOverridden](mTrackedProperties, "outlineColorOverridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "outlineColorOverridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues outlineColor](*p_mTrackedProperties, "outlineColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (void)setOutlineColor:(id)a3
{
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  id v12;

  v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      -[WDCharacterPropertiesValues setOutlineColor:](v4, "setOutlineColor:", v12);
      -[WDCharacterPropertiesValues setOutlineColorOverridden:](*p_mTrackedProperties, "setOutlineColorOverridden:", 1);
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    v4 = mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_8;
    v10 = objc_alloc_init(WDCharacterPropertiesValues);
    v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
      goto LABEL_8;
  }

}

- (BOOL)isOutlineColorOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues outlineColorOverridden](v4, "outlineColorOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues outlineColorOverridden](mTrackedProperties, "outlineColorOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues outlineColorOverridden](mOriginalProperties, "outlineColorOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues outlineColorOverridden](mTrackedProperties, "outlineColorOverridden");
  }
  return 0;
}

- (float)outline2010Width
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;
  float result;

  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || !-[WDCharacterPropertiesValues outline2010WidthOverridden](mTrackedProperties, "outline2010WidthOverridden"))
  {
    if (!self->mOriginal && !self->mResolved)
      return 0.0;
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties)
      return 0.0;
    p_mTrackedProperties = p_mOriginalProperties;
    if (!-[WDCharacterPropertiesValues outline2010WidthOverridden](v5, "outline2010WidthOverridden"))
      return 0.0;
  }
  -[WDCharacterPropertiesValues outline2010Width](*p_mTrackedProperties, "outline2010Width");
  return result;
}

- (void)setOutline2010Width:(float)a3
{
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;
  double v8;

  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  *(float *)&v8 = a3;
  -[WDCharacterPropertiesValues setOutline2010Width:](mTrackedProperties, "setOutline2010Width:", v8);
  objc_msgSend(*p_mTrackedProperties, "setOutline2010WidthOverridden:", 1);
}

- (BOOL)isOutline2010WidthOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues outline2010WidthOverridden](v4, "outline2010WidthOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues outline2010WidthOverridden](mTrackedProperties, "outline2010WidthOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues outline2010WidthOverridden](mOriginalProperties, "outline2010WidthOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues outline2010WidthOverridden](mTrackedProperties, "outline2010WidthOverridden");
  }
  return 0;
}

- (int)embossed
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues embossedOverridden](mTrackedProperties, "embossedOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues embossedOverridden](v5, "embossedOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues embossed](*p_mTrackedProperties, "embossed");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isEmbossedOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues embossedOverridden](v4, "embossedOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues embossedOverridden](mTrackedProperties, "embossedOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues embossedOverridden](mOriginalProperties, "embossedOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues embossedOverridden](mTrackedProperties, "embossedOverridden");
  }
  return 0;
}

- (int)imprint
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues imprintOverridden](mTrackedProperties, "imprintOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues imprintOverridden](v5, "imprintOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues imprint](*p_mTrackedProperties, "imprint");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isImprintOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues imprintOverridden](v4, "imprintOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues imprintOverridden](mTrackedProperties, "imprintOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues imprintOverridden](mOriginalProperties, "imprintOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues imprintOverridden](mTrackedProperties, "imprintOverridden");
  }
  return 0;
}

- (int)shadow
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues shadowOverridden](mTrackedProperties, "shadowOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues shadowOverridden](v5, "shadowOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues shadow](*p_mTrackedProperties, "shadow");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isShadowOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues shadowOverridden](v4, "shadowOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues shadowOverridden](mTrackedProperties, "shadowOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues shadowOverridden](mOriginalProperties, "shadowOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues shadowOverridden](mTrackedProperties, "shadowOverridden");
  }
  return 0;
}

- (float)shadow2010Opacity
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;
  float result;

  if (!self->mTracked && !self->mResolved
    || (p_mTrackedProperties = &self->mTrackedProperties, (mTrackedProperties = self->mTrackedProperties) == 0)
    || !-[WDCharacterPropertiesValues shadow2010OpacityOverridden](mTrackedProperties, "shadow2010OpacityOverridden"))
  {
    if (!self->mOriginal && !self->mResolved)
      return 0.0;
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (!mOriginalProperties)
      return 0.0;
    p_mTrackedProperties = p_mOriginalProperties;
    if (!-[WDCharacterPropertiesValues shadow2010OpacityOverridden](v5, "shadow2010OpacityOverridden"))
      return 0.0;
  }
  -[WDCharacterPropertiesValues shadow2010Opacity](*p_mTrackedProperties, "shadow2010Opacity");
  return result;
}

- (void)setShadow2010Opacity:(float)a3
{
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;
  double v8;

  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  *(float *)&v8 = a3;
  -[WDCharacterPropertiesValues setShadow2010Opacity:](mTrackedProperties, "setShadow2010Opacity:", v8);
  objc_msgSend(*p_mTrackedProperties, "setShadow2010OpacityOverridden:", 1);
}

- (BOOL)isShadow2010OpacityOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues shadow2010OpacityOverridden](v4, "shadow2010OpacityOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues shadow2010OpacityOverridden](mTrackedProperties, "shadow2010OpacityOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues shadow2010OpacityOverridden](mOriginalProperties, "shadow2010OpacityOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues shadow2010OpacityOverridden](mTrackedProperties, "shadow2010OpacityOverridden");
  }
  return 0;
}

- (id)underlineColor
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues underlineColorOverridden](mTrackedProperties, "underlineColorOverridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "underlineColorOverridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues underlineColor](*p_mTrackedProperties, "underlineColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (BOOL)isUnderlineColorOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues underlineColorOverridden](v4, "underlineColorOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues underlineColorOverridden](mTrackedProperties, "underlineColorOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues underlineColorOverridden](mOriginalProperties, "underlineColorOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues underlineColorOverridden](mTrackedProperties, "underlineColorOverridden");
  }
  return 0;
}

- (unsigned)kerning
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues kerningOverridden](mTrackedProperties, "kerningOverridden"))
        return -[WDCharacterPropertiesValues kerning](*p_mTrackedProperties, "kerning");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues kerningOverridden](v5, "kerningOverridden")))
  {
    return -[WDCharacterPropertiesValues kerning](*p_mTrackedProperties, "kerning");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isKerningOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues kerningOverridden](v4, "kerningOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues kerningOverridden](mTrackedProperties, "kerningOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues kerningOverridden](mOriginalProperties, "kerningOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues kerningOverridden](mTrackedProperties, "kerningOverridden");
  }
  return 0;
}

- (unsigned)textScale
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues textScaleOverridden](mTrackedProperties, "textScaleOverridden"))
        return -[WDCharacterPropertiesValues textScale](*p_mTrackedProperties, "textScale");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues textScaleOverridden](v5, "textScaleOverridden")))
  {
    return -[WDCharacterPropertiesValues textScale](*p_mTrackedProperties, "textScale");
  }
  else
  {
    return 100;
  }
}

- (void)setTextScale:(unsigned __int16)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setTextScale:](mTrackedProperties, "setTextScale:", v3);
  objc_msgSend(*p_mTrackedProperties, "setTextScaleOverridden:", 1);
}

- (BOOL)isTextScaleOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues textScaleOverridden](v4, "textScaleOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues textScaleOverridden](mTrackedProperties, "textScaleOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues textScaleOverridden](mOriginalProperties, "textScaleOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues textScaleOverridden](mTrackedProperties, "textScaleOverridden");
  }
  return 0;
}

- (BOOL)isHighlight
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues highlightOverridden](mTrackedProperties, "highlightOverridden"))
        return -[WDCharacterPropertiesValues highlight](*p_mTrackedProperties, "highlight");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues highlightOverridden](v5, "highlightOverridden")))
  {
    return -[WDCharacterPropertiesValues highlight](*p_mTrackedProperties, "highlight");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isHighlightOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues highlightOverridden](v4, "highlightOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues highlightOverridden](mTrackedProperties, "highlightOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues highlightOverridden](mOriginalProperties, "highlightOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues highlightOverridden](mTrackedProperties, "highlightOverridden");
  }
  return 0;
}

- (int)highlightColor
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues highlightColorOverridden](mTrackedProperties, "highlightColorOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues highlightColorOverridden](v5, "highlightColorOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues highlightColor](*p_mTrackedProperties, "highlightColor");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isHighlightColorOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues highlightColorOverridden](v4, "highlightColorOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues highlightColorOverridden](mTrackedProperties, "highlightColorOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues highlightColorOverridden](mOriginalProperties, "highlightColorOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues highlightColorOverridden](mTrackedProperties, "highlightColorOverridden");
  }
  return 0;
}

- (int)ligature
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues ligatureOverridden](mTrackedProperties, "ligatureOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues ligatureOverridden](v5, "ligatureOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues ligature](*p_mTrackedProperties, "ligature");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setLigature:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setLigature:](mTrackedProperties, "setLigature:", v3);
  objc_msgSend(*p_mTrackedProperties, "setLigatureOverridden:", 1);
}

- (BOOL)isLigatureOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues ligatureOverridden](v4, "ligatureOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues ligatureOverridden](mTrackedProperties, "ligatureOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues ligatureOverridden](mOriginalProperties, "ligatureOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues ligatureOverridden](mTrackedProperties, "ligatureOverridden");
  }
  return 0;
}

- (BOOL)isLowerCase
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues lowerCaseOverridden](mTrackedProperties, "lowerCaseOverridden"))
        return -[WDCharacterPropertiesValues lowerCase](*p_mTrackedProperties, "lowerCase");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues lowerCaseOverridden](v5, "lowerCaseOverridden")))
  {
    return -[WDCharacterPropertiesValues lowerCase](*p_mTrackedProperties, "lowerCase");
  }
  else
  {
    return 0;
  }
}

- (void)setLowerCase:(BOOL)a3
{
  _BOOL8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setLowerCase:](mTrackedProperties, "setLowerCase:", v3);
  objc_msgSend(*p_mTrackedProperties, "setLowerCaseOverridden:", 1);
}

- (BOOL)isLowerCaseOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues lowerCaseOverridden](v4, "lowerCaseOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues lowerCaseOverridden](mTrackedProperties, "lowerCaseOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues lowerCaseOverridden](mOriginalProperties, "lowerCaseOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues lowerCaseOverridden](mTrackedProperties, "lowerCaseOverridden");
  }
  return 0;
}

- (signed)spacing
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues spacingOverridden](mTrackedProperties, "spacingOverridden"))
        return -[WDCharacterPropertiesValues spacing](*p_mTrackedProperties, "spacing");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues spacingOverridden](v5, "spacingOverridden")))
  {
    return -[WDCharacterPropertiesValues spacing](*p_mTrackedProperties, "spacing");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isSpacingOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues spacingOverridden](v4, "spacingOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues spacingOverridden](mTrackedProperties, "spacingOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues spacingOverridden](mOriginalProperties, "spacingOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues spacingOverridden](mTrackedProperties, "spacingOverridden");
  }
  return 0;
}

- (signed)position
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues positionOverridden](mTrackedProperties, "positionOverridden"))
        return -[WDCharacterPropertiesValues position](*p_mTrackedProperties, "position");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues positionOverridden](v5, "positionOverridden")))
  {
    return -[WDCharacterPropertiesValues position](*p_mTrackedProperties, "position");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isPositionOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues positionOverridden](v4, "positionOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues positionOverridden](mTrackedProperties, "positionOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues positionOverridden](mOriginalProperties, "positionOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues positionOverridden](mTrackedProperties, "positionOverridden");
  }
  return 0;
}

- (id)reflection
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues reflectionOverridden](mTrackedProperties, "reflectionOverridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "reflectionOverridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues reflection](*p_mTrackedProperties, "reflection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (void)setReflection:(id)a3
{
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  id v12;

  v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      -[WDCharacterPropertiesValues setReflection:](v4, "setReflection:", v12);
      -[WDCharacterPropertiesValues setReflectionOverridden:](*p_mTrackedProperties, "setReflectionOverridden:", 1);
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    v4 = mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_8;
    v10 = objc_alloc_init(WDCharacterPropertiesValues);
    v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
      goto LABEL_8;
  }

}

- (BOOL)isReflectionOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues reflectionOverridden](v4, "reflectionOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues reflectionOverridden](mTrackedProperties, "reflectionOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues reflectionOverridden](mOriginalProperties, "reflectionOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues reflectionOverridden](mTrackedProperties, "reflectionOverridden");
  }
  return 0;
}

- (id)shadow2010
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  void *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues shadow2010Overridden](mTrackedProperties, "shadow2010Overridden"))
        goto LABEL_9;
    }
  }
  if (!self->mOriginal && !self->mResolved)
  {
LABEL_10:
    v5 = 0;
    return v5;
  }
  mOriginalProperties = self->mOriginalProperties;
  p_mOriginalProperties = &self->mOriginalProperties;
  v5 = mOriginalProperties;
  if (mOriginalProperties)
  {
    p_mTrackedProperties = p_mOriginalProperties;
    if (objc_msgSend(v5, "shadow2010Overridden"))
    {
LABEL_9:
      -[WDCharacterPropertiesValues shadow2010](*p_mTrackedProperties, "shadow2010");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
    }
    goto LABEL_10;
  }
  return v5;
}

- (void)setShadow2010:(id)a3
{
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v7;
  WDCharacterPropertiesValues *v8;
  WDCharacterPropertiesValues *mOriginalProperties;
  WDCharacterPropertiesValues *v10;
  WDCharacterPropertiesValues *v11;
  id v12;

  v12 = a3;
  if (self->mTracked)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    v4 = mTrackedProperties;
    if (mTrackedProperties
      || (v7 = objc_alloc_init(WDCharacterPropertiesValues),
          v8 = *p_mTrackedProperties,
          *p_mTrackedProperties = v7,
          v8,
          (v4 = *p_mTrackedProperties) != 0))
    {
LABEL_8:
      -[WDCharacterPropertiesValues setShadow2010:](v4, "setShadow2010:", v12);
      -[WDCharacterPropertiesValues setShadow2010Overridden:](*p_mTrackedProperties, "setShadow2010Overridden:", 1);
    }
  }
  else if (self->mOriginal)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    v4 = mOriginalProperties;
    if (mOriginalProperties)
      goto LABEL_8;
    v10 = objc_alloc_init(WDCharacterPropertiesValues);
    v11 = *p_mTrackedProperties;
    *p_mTrackedProperties = v10;

    v4 = *p_mTrackedProperties;
    if (*p_mTrackedProperties)
      goto LABEL_8;
  }

}

- (BOOL)isShadow2010Overridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues shadow2010Overridden](v4, "shadow2010Overridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues shadow2010Overridden](mTrackedProperties, "shadow2010Overridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues shadow2010Overridden](mOriginalProperties, "shadow2010Overridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues shadow2010Overridden](mTrackedProperties, "shadow2010Overridden");
  }
  return 0;
}

- (int)emphasisMark
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues emphasisMarkOverridden](mTrackedProperties, "emphasisMarkOverridden"))
        return -[WDCharacterPropertiesValues emphasisMark](*p_mTrackedProperties, "emphasisMark");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues emphasisMarkOverridden](v5, "emphasisMarkOverridden")))
  {
    return -[WDCharacterPropertiesValues emphasisMark](*p_mTrackedProperties, "emphasisMark");
  }
  else
  {
    return 0;
  }
}

- (void)setEmphasisMark:(int)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setEmphasisMark:](mTrackedProperties, "setEmphasisMark:", v3);
  objc_msgSend(*p_mTrackedProperties, "setEmphasisMarkOverridden:", 1);
}

- (BOOL)isEmphasisMarkOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues emphasisMarkOverridden](v4, "emphasisMarkOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues emphasisMarkOverridden](mTrackedProperties, "emphasisMarkOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues emphasisMarkOverridden](mOriginalProperties, "emphasisMarkOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues emphasisMarkOverridden](mTrackedProperties, "emphasisMarkOverridden");
  }
  return 0;
}

- (BOOL)isColorAuto
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues colorAutoOverridden](mTrackedProperties, "colorAutoOverridden"))
        return -[WDCharacterPropertiesValues colorAuto](*p_mTrackedProperties, "colorAuto");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues colorAutoOverridden](v5, "colorAutoOverridden")))
  {
    return -[WDCharacterPropertiesValues colorAuto](*p_mTrackedProperties, "colorAuto");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isColorAutoOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues colorAutoOverridden](v4, "colorAutoOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues colorAutoOverridden](mTrackedProperties, "colorAutoOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues colorAutoOverridden](mOriginalProperties, "colorAutoOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues colorAutoOverridden](mTrackedProperties, "colorAutoOverridden");
  }
  return 0;
}

- (int)languageForDefaultText
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues languageForDefaultTextOverridden](mTrackedProperties, "languageForDefaultTextOverridden"))
      {
        return -[WDCharacterPropertiesValues languageForDefaultText](*p_mTrackedProperties, "languageForDefaultText");
      }
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues languageForDefaultTextOverridden](v5, "languageForDefaultTextOverridden")))
  {
    return -[WDCharacterPropertiesValues languageForDefaultText](*p_mTrackedProperties, "languageForDefaultText");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isLanguageForDefaultTextOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues languageForDefaultTextOverridden](v4, "languageForDefaultTextOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues languageForDefaultTextOverridden](mTrackedProperties, "languageForDefaultTextOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues languageForDefaultTextOverridden](mOriginalProperties, "languageForDefaultTextOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues languageForDefaultTextOverridden](mTrackedProperties, "languageForDefaultTextOverridden");
  }
  return 0;
}

- (int)useCsFont
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues useCsFontOverridden](mTrackedProperties, "useCsFontOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues useCsFontOverridden](v5, "useCsFontOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues useCsFont](*p_mTrackedProperties, "useCsFont");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setUseCsFont:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setUseCsFont:](mTrackedProperties, "setUseCsFont:", v3);
  objc_msgSend(*p_mTrackedProperties, "setUseCsFontOverridden:", 1);
}

- (BOOL)isUseCsFontOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues useCsFontOverridden](v4, "useCsFontOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues useCsFontOverridden](mTrackedProperties, "useCsFontOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues useCsFontOverridden](mOriginalProperties, "useCsFontOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues useCsFontOverridden](mTrackedProperties, "useCsFontOverridden");
  }
  return 0;
}

- (int)edited
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues editedOverridden](mTrackedProperties, "editedOverridden"))
        goto LABEL_9;
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues editedOverridden](v5, "editedOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues edited](*p_mTrackedProperties, "edited");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (BOOL)isEditedOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues editedOverridden](v4, "editedOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues editedOverridden](mTrackedProperties, "editedOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues editedOverridden](mOriginalProperties, "editedOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues editedOverridden](mTrackedProperties, "editedOverridden");
  }
  return 0;
}

- (BOOL)isIndexToAuthorIDOfDeletionOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues indexToAuthorIDOfDeletionOverridden](v4, "indexToAuthorIDOfDeletionOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues indexToAuthorIDOfDeletionOverridden](mTrackedProperties, "indexToAuthorIDOfDeletionOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues indexToAuthorIDOfDeletionOverridden](mOriginalProperties, "indexToAuthorIDOfDeletionOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues indexToAuthorIDOfDeletionOverridden](mTrackedProperties, "indexToAuthorIDOfDeletionOverridden");
  }
  return 0;
}

- (BOOL)isIndexToAuthorIDOfEditOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues indexToAuthorIDOfEditOverridden](v4, "indexToAuthorIDOfEditOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues indexToAuthorIDOfEditOverridden](mTrackedProperties, "indexToAuthorIDOfEditOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues indexToAuthorIDOfEditOverridden](mOriginalProperties, "indexToAuthorIDOfEditOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues indexToAuthorIDOfEditOverridden](mTrackedProperties, "indexToAuthorIDOfEditOverridden");
  }
  return 0;
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](mTrackedProperties, "indexToAuthorIDOfFormattingChangeOverridden"))
      {
        return -[WDCharacterPropertiesValues indexToAuthorIDOfFormattingChange](*p_mTrackedProperties, "indexToAuthorIDOfFormattingChange");
      }
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](v5, "indexToAuthorIDOfFormattingChangeOverridden")))
  {
    return -[WDCharacterPropertiesValues indexToAuthorIDOfFormattingChange](*p_mTrackedProperties, "indexToAuthorIDOfFormattingChange");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](v4, "indexToAuthorIDOfFormattingChangeOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](mTrackedProperties, "indexToAuthorIDOfFormattingChangeOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](mOriginalProperties, "indexToAuthorIDOfFormattingChangeOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues indexToAuthorIDOfFormattingChangeOverridden](mTrackedProperties, "indexToAuthorIDOfFormattingChangeOverridden");
  }
  return 0;
}

- (BOOL)isDeletionDateOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues deletionDateOverridden](v4, "deletionDateOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues deletionDateOverridden](mTrackedProperties, "deletionDateOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues deletionDateOverridden](mOriginalProperties, "deletionDateOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues deletionDateOverridden](mTrackedProperties, "deletionDateOverridden");
  }
  return 0;
}

- (BOOL)isEditDateOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues editDateOverridden](v4, "editDateOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues editDateOverridden](mTrackedProperties, "editDateOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues editDateOverridden](mOriginalProperties, "editDateOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues editDateOverridden](mTrackedProperties, "editDateOverridden");
  }
  return 0;
}

- (BOOL)deletionDifferentFrom:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;

  v4 = a3;
  if (v4)
  {
    v5 = -[WDCharacterProperties deletionDifferentFrom:mode:](self, "deletionDifferentFrom:mode:", v4, 0);
    v6 = v5 | -[WDCharacterProperties deletionDifferentFrom:mode:](self, "deletionDifferentFrom:mode:", v4, 1);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)editDifferentFrom:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;

  v4 = a3;
  if (v4)
  {
    v5 = -[WDCharacterProperties editDifferentFrom:mode:](self, "editDifferentFrom:mode:", v4, 0);
    v6 = v5 | -[WDCharacterProperties editDifferentFrom:mode:](self, "editDifferentFrom:mode:", v4, 1);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)formattingChangedDifferentFrom:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;

  v4 = a3;
  if (v4)
  {
    v5 = -[WDCharacterProperties formattingChangedDifferentFrom:mode:](self, "formattingChangedDifferentFrom:mode:", v4, 0);
    v6 = v5 | -[WDCharacterProperties formattingChangedDifferentFrom:mode:](self, "formattingChangedDifferentFrom:mode:", v4, 1);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)isSpecialCharacter
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues specialCharacterOverridden](mTrackedProperties, "specialCharacterOverridden"))
        return -[WDCharacterPropertiesValues specialCharacter](*p_mTrackedProperties, "specialCharacter");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues specialCharacterOverridden](v5, "specialCharacterOverridden")))
  {
    return -[WDCharacterPropertiesValues specialCharacter](*p_mTrackedProperties, "specialCharacter");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isSpecialCharacterOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues specialCharacterOverridden](v4, "specialCharacterOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues specialCharacterOverridden](mTrackedProperties, "specialCharacterOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues specialCharacterOverridden](mOriginalProperties, "specialCharacterOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues specialCharacterOverridden](mTrackedProperties, "specialCharacterOverridden");
  }
  return 0;
}

- (int)languageForFarEast
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues languageForFarEastOverridden](mTrackedProperties, "languageForFarEastOverridden"))
      {
        return -[WDCharacterPropertiesValues languageForFarEast](*p_mTrackedProperties, "languageForFarEast");
      }
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues languageForFarEastOverridden](v5, "languageForFarEastOverridden")))
  {
    return -[WDCharacterPropertiesValues languageForFarEast](*p_mTrackedProperties, "languageForFarEast");
  }
  else
  {
    return 1024;
  }
}

- (BOOL)isLanguageForFarEastOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues languageForFarEastOverridden](v4, "languageForFarEastOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues languageForFarEastOverridden](mTrackedProperties, "languageForFarEastOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues languageForFarEastOverridden](mOriginalProperties, "languageForFarEastOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues languageForFarEastOverridden](mTrackedProperties, "languageForFarEastOverridden");
  }
  return 0;
}

- (int)languageForBiText
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues languageForBiTextOverridden](mTrackedProperties, "languageForBiTextOverridden"))
        return -[WDCharacterPropertiesValues languageForBiText](*p_mTrackedProperties, "languageForBiText");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues languageForBiTextOverridden](v5, "languageForBiTextOverridden")))
  {
    return -[WDCharacterPropertiesValues languageForBiText](*p_mTrackedProperties, "languageForBiText");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isLanguageForBiTextOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues languageForBiTextOverridden](v4, "languageForBiTextOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues languageForBiTextOverridden](mTrackedProperties, "languageForBiTextOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues languageForBiTextOverridden](mOriginalProperties, "languageForBiTextOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues languageForBiTextOverridden](mTrackedProperties, "languageForBiTextOverridden");
  }
  return 0;
}

- (unsigned)fontSizeForBiText
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues fontSizeForBiTextOverridden](mTrackedProperties, "fontSizeForBiTextOverridden"))
        return -[WDCharacterPropertiesValues fontSizeForBiText](*p_mTrackedProperties, "fontSizeForBiText");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues fontSizeForBiTextOverridden](v5, "fontSizeForBiTextOverridden")))
  {
    return -[WDCharacterPropertiesValues fontSizeForBiText](*p_mTrackedProperties, "fontSizeForBiText");
  }
  else
  {
    return 0;
  }
}

- (BOOL)isFontSizeForBiTextOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues fontSizeForBiTextOverridden](v4, "fontSizeForBiTextOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues fontSizeForBiTextOverridden](mTrackedProperties, "fontSizeForBiTextOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues fontSizeForBiTextOverridden](mOriginalProperties, "fontSizeForBiTextOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues fontSizeForBiTextOverridden](mTrackedProperties, "fontSizeForBiTextOverridden");
  }
  return 0;
}

- (BOOL)embeddedObject
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues embeddedObjectOverridden](mTrackedProperties, "embeddedObjectOverridden"))
        return -[WDCharacterPropertiesValues embeddedObject](*p_mTrackedProperties, "embeddedObject");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues embeddedObjectOverridden](v5, "embeddedObjectOverridden")))
  {
    return -[WDCharacterPropertiesValues embeddedObject](*p_mTrackedProperties, "embeddedObject");
  }
  else
  {
    return 0;
  }
}

- (void)setEmbeddedObject:(BOOL)a3
{
  _BOOL8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setEmbeddedObject:](mTrackedProperties, "setEmbeddedObject:", v3);
  objc_msgSend(*p_mTrackedProperties, "setEmbeddedObjectOverridden:", 1);
}

- (BOOL)isEmbeddedObjectOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues embeddedObjectOverridden](v4, "embeddedObjectOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues embeddedObjectOverridden](mTrackedProperties, "embeddedObjectOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues embeddedObjectOverridden](mOriginalProperties, "embeddedObjectOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues embeddedObjectOverridden](mTrackedProperties, "embeddedObjectOverridden");
  }
  return 0;
}

- (BOOL)ole2
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues ole2Overridden](mTrackedProperties, "ole2Overridden"))
        return -[WDCharacterPropertiesValues ole2](*p_mTrackedProperties, "ole2");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties, -[WDCharacterPropertiesValues ole2Overridden](v5, "ole2Overridden")))
  {
    return -[WDCharacterPropertiesValues ole2](*p_mTrackedProperties, "ole2");
  }
  else
  {
    return 0;
  }
}

- (void)setOle2:(BOOL)a3
{
  _BOOL8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setOle2:](mTrackedProperties, "setOle2:", v3);
  objc_msgSend(*p_mTrackedProperties, "setOle2Overridden:", 1);
}

- (BOOL)isOle2Overridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues ole2Overridden](v4, "ole2Overridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues ole2Overridden](mTrackedProperties, "ole2Overridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues ole2Overridden](mOriginalProperties, "ole2Overridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues ole2Overridden](mTrackedProperties, "ole2Overridden");
  }
  return 0;
}

- (int)objectIDForOle2
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues objectIDForOle2Overridden](mTrackedProperties, "objectIDForOle2Overridden"))
        return -[WDCharacterPropertiesValues objectIDForOle2](*p_mTrackedProperties, "objectIDForOle2");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues objectIDForOle2Overridden](v5, "objectIDForOle2Overridden")))
  {
    return -[WDCharacterPropertiesValues objectIDForOle2](*p_mTrackedProperties, "objectIDForOle2");
  }
  else
  {
    return 0;
  }
}

- (void)setObjectIDForOle2:(int)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setObjectIDForOle2:](mTrackedProperties, "setObjectIDForOle2:", v3);
  objc_msgSend(*p_mTrackedProperties, "setObjectIDForOle2Overridden:", 1);
}

- (BOOL)isObjectIDForOle2Overridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues objectIDForOle2Overridden](v4, "objectIDForOle2Overridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues objectIDForOle2Overridden](mTrackedProperties, "objectIDForOle2Overridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues objectIDForOle2Overridden](mOriginalProperties, "objectIDForOle2Overridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues objectIDForOle2Overridden](mTrackedProperties, "objectIDForOle2Overridden");
  }
  return 0;
}

- (int)offsetToPictureData
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues offsetToPictureDataOverridden](mTrackedProperties, "offsetToPictureDataOverridden"))
      {
        return -[WDCharacterPropertiesValues offsetToPictureData](*p_mTrackedProperties, "offsetToPictureData");
      }
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues offsetToPictureDataOverridden](v5, "offsetToPictureDataOverridden")))
  {
    return -[WDCharacterPropertiesValues offsetToPictureData](*p_mTrackedProperties, "offsetToPictureData");
  }
  else
  {
    return 0;
  }
}

- (void)setOffsetToPictureData:(int)a3
{
  uint64_t v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setOffsetToPictureData:](mTrackedProperties, "setOffsetToPictureData:", v3);
  objc_msgSend(*p_mTrackedProperties, "setOffsetToPictureDataOverridden:", 1);
}

- (BOOL)isOffsetToPictureDataOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues offsetToPictureDataOverridden](v4, "offsetToPictureDataOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues offsetToPictureDataOverridden](mTrackedProperties, "offsetToPictureDataOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues offsetToPictureDataOverridden](mOriginalProperties, "offsetToPictureDataOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues offsetToPictureDataOverridden](mTrackedProperties, "offsetToPictureDataOverridden");
  }
  return 0;
}

- (BOOL)horizontalInVertical
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues horizontalInVerticalOverridden](mTrackedProperties, "horizontalInVerticalOverridden"))
      {
        return -[WDCharacterPropertiesValues horizontalInVertical](*p_mTrackedProperties, "horizontalInVertical");
      }
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues horizontalInVerticalOverridden](v5, "horizontalInVerticalOverridden")))
  {
    return -[WDCharacterPropertiesValues horizontalInVertical](*p_mTrackedProperties, "horizontalInVertical");
  }
  else
  {
    return 0;
  }
}

- (void)setHorizontalInVertical:(BOOL)a3
{
  _BOOL8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setHorizontalInVertical:](mTrackedProperties, "setHorizontalInVertical:", v3);
  objc_msgSend(*p_mTrackedProperties, "setHorizontalInVerticalOverridden:", 1);
}

- (BOOL)isHorizontalInVerticalOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues horizontalInVerticalOverridden](v4, "horizontalInVerticalOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues horizontalInVerticalOverridden](mTrackedProperties, "horizontalInVerticalOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues horizontalInVerticalOverridden](mOriginalProperties, "horizontalInVerticalOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues horizontalInVerticalOverridden](mTrackedProperties, "horizontalInVerticalOverridden");
  }
  return 0;
}

- (BOOL)compressHorizontalInVertical
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues compressHorizontalInVerticalOverridden](mTrackedProperties, "compressHorizontalInVerticalOverridden"))
      {
        return -[WDCharacterPropertiesValues compressHorizontalInVertical](*p_mTrackedProperties, "compressHorizontalInVertical");
      }
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues compressHorizontalInVerticalOverridden](v5, "compressHorizontalInVerticalOverridden")))
  {
    return -[WDCharacterPropertiesValues compressHorizontalInVertical](*p_mTrackedProperties, "compressHorizontalInVertical");
  }
  else
  {
    return 0;
  }
}

- (void)setCompressHorizontalInVertical:(BOOL)a3
{
  _BOOL8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setCompressHorizontalInVertical:](mTrackedProperties, "setCompressHorizontalInVertical:", v3);
  objc_msgSend(*p_mTrackedProperties, "setCompressHorizontalInVerticalOverridden:", 1);
}

- (BOOL)isCompressHorizontalInVerticalOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues compressHorizontalInVerticalOverridden](v4, "compressHorizontalInVerticalOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues compressHorizontalInVerticalOverridden](mTrackedProperties, "compressHorizontalInVerticalOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues compressHorizontalInVerticalOverridden](mOriginalProperties, "compressHorizontalInVerticalOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues compressHorizontalInVerticalOverridden](mTrackedProperties, "compressHorizontalInVerticalOverridden");
  }
  return 0;
}

- (BOOL)twoLinesInOne
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues twoLinesInOneOverridden](mTrackedProperties, "twoLinesInOneOverridden"))
        return -[WDCharacterPropertiesValues twoLinesInOne](*p_mTrackedProperties, "twoLinesInOne");
    }
  }
  if ((self->mOriginal || self->mResolved)
    && (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        (v5 = mOriginalProperties) != 0)
    && (p_mTrackedProperties = p_mOriginalProperties,
        -[WDCharacterPropertiesValues twoLinesInOneOverridden](v5, "twoLinesInOneOverridden")))
  {
    return -[WDCharacterPropertiesValues twoLinesInOne](*p_mTrackedProperties, "twoLinesInOne");
  }
  else
  {
    return 0;
  }
}

- (void)setTwoLinesInOne:(BOOL)a3
{
  _BOOL8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setTwoLinesInOne:](mTrackedProperties, "setTwoLinesInOne:", v3);
  objc_msgSend(*p_mTrackedProperties, "setTwoLinesInOneOverridden:", 1);
}

- (BOOL)isTwoLinesInOneOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues twoLinesInOneOverridden](v4, "twoLinesInOneOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues twoLinesInOneOverridden](mTrackedProperties, "twoLinesInOneOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues twoLinesInOneOverridden](mOriginalProperties, "twoLinesInOneOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues twoLinesInOneOverridden](mTrackedProperties, "twoLinesInOneOverridden");
  }
  return 0;
}

- (int)bracketTwoLinesInOne
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues **p_mTrackedProperties;
  WDCharacterPropertiesValues *v5;
  WDCharacterPropertiesValues **p_mOriginalProperties;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked || self->mResolved)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
    {
      if (-[WDCharacterPropertiesValues bracketTwoLinesInOneOverridden](mTrackedProperties, "bracketTwoLinesInOneOverridden"))
      {
        goto LABEL_9;
      }
    }
  }
  if (self->mOriginal || self->mResolved)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    v5 = mOriginalProperties;
    if (mOriginalProperties)
    {
      LODWORD(v5) = -[WDCharacterPropertiesValues bracketTwoLinesInOneOverridden](v5, "bracketTwoLinesInOneOverridden");
      p_mTrackedProperties = p_mOriginalProperties;
      if ((_DWORD)v5)
LABEL_9:
        LODWORD(v5) = -[WDCharacterPropertiesValues bracketTwoLinesInOne](*p_mTrackedProperties, "bracketTwoLinesInOne");
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return (int)v5;
}

- (void)setBracketTwoLinesInOne:(int)a3
{
  unsigned __int8 v3;
  WDCharacterPropertiesValues *mTrackedProperties;
  id *p_mTrackedProperties;
  WDCharacterPropertiesValues *v6;
  id v7;

  v3 = a3;
  if (self->mTracked)
  {
    p_mTrackedProperties = (id *)&self->mTrackedProperties;
    mTrackedProperties = self->mTrackedProperties;
    if (!mTrackedProperties)
      goto LABEL_6;
  }
  else
  {
    if (!self->mOriginal)
      return;
    p_mTrackedProperties = (id *)&self->mOriginalProperties;
    mTrackedProperties = self->mOriginalProperties;
    if (!mTrackedProperties)
    {
LABEL_6:
      v6 = objc_alloc_init(WDCharacterPropertiesValues);
      v7 = *p_mTrackedProperties;
      *p_mTrackedProperties = v6;

      mTrackedProperties = (WDCharacterPropertiesValues *)*p_mTrackedProperties;
      if (!*p_mTrackedProperties)
        return;
    }
  }
  -[WDCharacterPropertiesValues setBracketTwoLinesInOne:](mTrackedProperties, "setBracketTwoLinesInOne:", v3);
  objc_msgSend(*p_mTrackedProperties, "setBracketTwoLinesInOneOverridden:", 1);
}

- (BOOL)isBracketTwoLinesInOneOverridden
{
  WDCharacterPropertiesValues *mTrackedProperties;
  WDCharacterPropertiesValues *v4;
  WDCharacterPropertiesValues *mOriginalProperties;

  if (self->mTracked
    || self->mResolved
    && (v4 = self->mTrackedProperties) != 0
    && -[WDCharacterPropertiesValues bracketTwoLinesInOneOverridden](v4, "bracketTwoLinesInOneOverridden"))
  {
    mTrackedProperties = self->mTrackedProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues bracketTwoLinesInOneOverridden](mTrackedProperties, "bracketTwoLinesInOneOverridden");
  }
  else if (self->mOriginal
         || self->mResolved
         && (mOriginalProperties = self->mOriginalProperties) != 0
         && -[WDCharacterPropertiesValues bracketTwoLinesInOneOverridden](mOriginalProperties, "bracketTwoLinesInOneOverridden"))
  {
    mTrackedProperties = self->mOriginalProperties;
    if (mTrackedProperties)
      return -[WDCharacterPropertiesValues bracketTwoLinesInOneOverridden](mTrackedProperties, "bracketTwoLinesInOneOverridden");
  }
  return 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDCharacterProperties;
  -[WDCharacterProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mTrackedProperties, 0);
  objc_storeStrong((id *)&self->mOriginalProperties, 0);
}

- (BOOL)isAnythingOverriddenIn:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "baseStyleOverridden") & 1) != 0
      || (objc_msgSend(v4, "borderOverridden") & 1) != 0
      || (objc_msgSend(v4, "shadingOverridden") & 1) != 0
      || (objc_msgSend(v4, "fontOverridden") & 1) != 0
      || (objc_msgSend(v4, "extendedFontOverridden") & 1) != 0
      || (objc_msgSend(v4, "farEastFontOverridden") & 1) != 0
      || (objc_msgSend(v4, "symbolCharacterOverridden") & 1) != 0
      || (objc_msgSend(v4, "symbolFontOverridden") & 1) != 0
      || (objc_msgSend(v4, "boldOverridden") & 1) != 0
      || (objc_msgSend(v4, "boldForBiTextOverridden") & 1) != 0
      || (objc_msgSend(v4, "italicOverridden") & 1) != 0
      || (objc_msgSend(v4, "italicForBiTextOverridden") & 1) != 0
      || (objc_msgSend(v4, "outlineOverridden") & 1) != 0
      || (objc_msgSend(v4, "outlineColorOverridden") & 1) != 0
      || (objc_msgSend(v4, "outline2010WidthOverridden") & 1) != 0
      || (objc_msgSend(v4, "shadowOverridden") & 1) != 0
      || (objc_msgSend(v4, "embossedOverridden") & 1) != 0
      || (objc_msgSend(v4, "imprintOverridden") & 1) != 0
      || (objc_msgSend(v4, "underlineOverridden") & 1) != 0
      || (objc_msgSend(v4, "underlineColorOverridden") & 1) != 0
      || (objc_msgSend(v4, "strikeThroughOverridden") & 1) != 0
      || (objc_msgSend(v4, "doubleStrikeThroughOverridden") & 1) != 0
      || (objc_msgSend(v4, "ligatureOverridden") & 1) != 0
      || (objc_msgSend(v4, "highlightOverridden") & 1) != 0
      || (objc_msgSend(v4, "highlightColorOverridden") & 1) != 0
      || (objc_msgSend(v4, "smallCapsOverridden") & 1) != 0
      || (objc_msgSend(v4, "capsOverridden") & 1) != 0
      || (objc_msgSend(v4, "lowerCaseOverridden") & 1) != 0
      || (objc_msgSend(v4, "hiddenOverridden") & 1) != 0
      || (objc_msgSend(v4, "spacingOverridden") & 1) != 0
      || (objc_msgSend(v4, "positionOverridden") & 1) != 0
      || (objc_msgSend(v4, "kerningOverridden") & 1) != 0
      || (objc_msgSend(v4, "textScaleOverridden") & 1) != 0
      || (objc_msgSend(v4, "fontSizeOverridden") & 1) != 0
      || (objc_msgSend(v4, "rightToLeftOverridden") & 1) != 0
      || (objc_msgSend(v4, "useCsFontOverridden") & 1) != 0
      || (objc_msgSend(v4, "verticalAlignOverridden") & 1) != 0
      || (objc_msgSend(v4, "emphasisMarkOverridden") & 1) != 0
      || (objc_msgSend(v4, "reflectionOverridden") & 1) != 0
      || (objc_msgSend(v4, "shadow2010Overridden") & 1) != 0
      || (objc_msgSend(v4, "shadow2010OpacityOverridden") & 1) != 0
      || (objc_msgSend(v4, "colorOverridden") & 1) != 0
      || (objc_msgSend(v4, "colorAutoOverridden") & 1) != 0
      || (objc_msgSend(v4, "languageForDefaultTextOverridden") & 1) != 0
      || (objc_msgSend(v4, "deletedOverridden") & 1) != 0
      || (objc_msgSend(v4, "editedOverridden") & 1) != 0
      || (objc_msgSend(v4, "formattingChangedOverridden") & 1) != 0
      || (objc_msgSend(v4, "indexToAuthorIDOfDeletionOverridden") & 1) != 0
      || (objc_msgSend(v4, "indexToAuthorIDOfEditOverridden") & 1) != 0
      || (objc_msgSend(v4, "indexToAuthorIDOfFormattingChangeOverridden") & 1) != 0
      || (objc_msgSend(v4, "deletionDateOverridden") & 1) != 0
      || (objc_msgSend(v4, "editDateOverridden") & 1) != 0
      || (objc_msgSend(v4, "specialCharacterOverridden") & 1) != 0
      || (objc_msgSend(v4, "listCharacterPictureBulletOverridden") & 1) != 0
      || (objc_msgSend(v4, "charPositionOfPictureBulletInBookmarkOverridden") & 1) != 0
      || (objc_msgSend(v4, "languageForFarEastOverridden") & 1) != 0
      || (objc_msgSend(v4, "languageForBiTextOverridden") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v5 = objc_msgSend(v4, "fontSizeForBiTextOverridden");
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isBooleanProbablyDifferent:(unsigned __int8)a3 than:(unsigned __int8)a4
{
  int v4;
  int v5;

  if (a3 == 129)
    v4 = 1;
  else
    v4 = a3;
  if (v4 == 128)
    v4 = 0;
  if (a4 == 129)
    v5 = 1;
  else
    v5 = a4;
  if (v5 == 128)
    v5 = 0;
  return v4 != v5;
}

- (BOOL)deletionDifferentFrom:(id)a3 mode:(int)a4
{
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  void *v16;

  v6 = (char *)a3;
  if (v6)
  {
    if (a4)
    {
      if (a4 != 1)
      {
        v8 = 0;
        v10 = 0;
LABEL_22:
        LOBYTE(self) = 1;
        goto LABEL_24;
      }
      v7 = 24;
    }
    else
    {
      v7 = 16;
    }
    v8 = (unint64_t)*(id *)((char *)&self->super.isa + v7);
    v9 = (unint64_t)*(id *)&v6[v7];
    if (v8 | v9)
    {
      v10 = (void *)v9;
      if (!v8)
      {
        LOBYTE(self) = -[WDCharacterProperties isAnythingOverriddenIn:](self, "isAnythingOverriddenIn:", v9);
        v8 = 0;
        goto LABEL_24;
      }
      if (v9)
      {
        v11 = objc_msgSend((id)v8, "deletedOverridden");
        if (v11 == objc_msgSend(v10, "deletedOverridden")
          && (!objc_msgSend((id)v8, "deletedOverridden")
           || !-[WDCharacterProperties isBooleanProbablyDifferent:than:](self, "isBooleanProbablyDifferent:than:", objc_msgSend((id)v8, "deleted"), objc_msgSend(v10, "deleted"))))
        {
          v12 = objc_msgSend((id)v8, "indexToAuthorIDOfDeletionOverridden");
          if (v12 == objc_msgSend(v10, "indexToAuthorIDOfDeletionOverridden"))
          {
            if (!objc_msgSend((id)v8, "indexToAuthorIDOfDeletionOverridden")
              || (v13 = objc_msgSend((id)v8, "indexToAuthorIDOfDeletion"),
                  v13 == objc_msgSend(v10, "indexToAuthorIDOfDeletion")))
            {
              v14 = objc_msgSend((id)v8, "deletionDateOverridden");
              if (v14 == objc_msgSend(v10, "deletionDateOverridden"))
              {
                if (objc_msgSend((id)v8, "deletionDateOverridden"))
                {
                  objc_msgSend((id)v8, "deletionDate");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "deletionDate");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(self) = objc_msgSend(v15, "isEqualToDate:", v16) ^ 1;

                }
                else
                {
                  LOBYTE(self) = 0;
                }
                goto LABEL_24;
              }
            }
          }
        }
        goto LABEL_22;
      }
      LOBYTE(self) = -[WDCharacterProperties isAnythingOverriddenIn:](self, "isAnythingOverriddenIn:", v8);
    }
    else
    {
      LOBYTE(self) = 0;
      v8 = 0;
    }
    v10 = 0;
LABEL_24:

    goto LABEL_25;
  }
  LOBYTE(self) = 1;
LABEL_25:

  return (char)self;
}

- (BOOL)editDifferentFrom:(id)a3 mode:(int)a4
{
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  void *v15;
  void *v16;

  v6 = (char *)a3;
  if (v6)
  {
    if (a4)
    {
      if (a4 != 1)
      {
        v8 = 0;
        v10 = 0;
LABEL_22:
        LOBYTE(self) = 1;
        goto LABEL_24;
      }
      v7 = 24;
    }
    else
    {
      v7 = 16;
    }
    v8 = (unint64_t)*(id *)((char *)&self->super.isa + v7);
    v9 = (unint64_t)*(id *)&v6[v7];
    if (v8 | v9)
    {
      v10 = (void *)v9;
      if (!v8)
      {
        LOBYTE(self) = -[WDCharacterProperties isAnythingOverriddenIn:](self, "isAnythingOverriddenIn:", v9);
        v8 = 0;
        goto LABEL_24;
      }
      if (v9)
      {
        v11 = objc_msgSend((id)v8, "editedOverridden");
        if (v11 == objc_msgSend(v10, "editedOverridden")
          && (!objc_msgSend((id)v8, "editedOverridden")
           || !-[WDCharacterProperties isBooleanProbablyDifferent:than:](self, "isBooleanProbablyDifferent:than:", objc_msgSend((id)v8, "edited"), objc_msgSend(v10, "edited"))))
        {
          v12 = objc_msgSend((id)v8, "indexToAuthorIDOfEditOverridden");
          if (v12 == objc_msgSend(v10, "indexToAuthorIDOfEditOverridden"))
          {
            if (!objc_msgSend((id)v8, "indexToAuthorIDOfEditOverridden")
              || (v13 = objc_msgSend((id)v8, "indexToAuthorIDOfEdit"),
                  v13 == objc_msgSend(v10, "indexToAuthorIDOfEdit")))
            {
              v14 = objc_msgSend((id)v8, "editDateOverridden");
              if (v14 == objc_msgSend(v10, "editDateOverridden"))
              {
                if (objc_msgSend((id)v8, "editDateOverridden"))
                {
                  objc_msgSend((id)v8, "editDate");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "editDate");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(self) = objc_msgSend(v15, "isEqualToDate:", v16) ^ 1;

                }
                else
                {
                  LOBYTE(self) = 0;
                }
                goto LABEL_24;
              }
            }
          }
        }
        goto LABEL_22;
      }
      LOBYTE(self) = -[WDCharacterProperties isAnythingOverriddenIn:](self, "isAnythingOverriddenIn:", v8);
    }
    else
    {
      LOBYTE(self) = 0;
      v8 = 0;
    }
    v10 = 0;
LABEL_24:

    goto LABEL_25;
  }
  LOBYTE(self) = 1;
LABEL_25:

  return (char)self;
}

- (BOOL)formattingChangedDifferentFrom:(id)a3 mode:(int)a4
{
  char *v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  int v23;
  void *v24;
  void *v25;
  char v26;
  int v27;
  void *v28;
  void *v29;
  char v30;
  int v31;
  void *v32;
  void *v33;
  char v34;
  int v35;
  void *v36;
  void *v37;
  char v38;
  int v39;
  void *v40;
  void *v41;
  char v42;
  int v43;
  void *v44;
  void *v45;
  char v46;
  int v47;
  void *v48;
  void *v49;
  char v50;
  int v51;
  void *v52;
  void *v53;
  char v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  float v68;
  float v69;
  float v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;

  v6 = (char *)a3;
  if (v6)
  {
    if (a4)
    {
      if (a4 != 1)
      {
        v9 = 0;
        v11 = 0;
        goto LABEL_117;
      }
      v7 = 24;
    }
    else
    {
      v7 = 16;
    }
    v9 = (unint64_t)*(id *)((char *)&self->super.isa + v7);
    v10 = (unint64_t)*(id *)&v6[v7];
    if (v9 | v10)
    {
      v11 = (void *)v10;
      if (!v9)
      {
        v8 = -[WDCharacterProperties isAnythingOverriddenIn:](self, "isAnythingOverriddenIn:", v10);
        v9 = 0;
        goto LABEL_119;
      }
      if (v10)
      {
        v12 = objc_msgSend((id)v9, "formattingChangedOverridden");
        if (v12 == objc_msgSend(v11, "formattingChangedOverridden")
          && (!objc_msgSend((id)v9, "formattingChangedOverridden")
           || !-[WDCharacterProperties isBooleanProbablyDifferent:than:](self, "isBooleanProbablyDifferent:than:", objc_msgSend((id)v9, "formattingChanged"), objc_msgSend(v11, "formattingChanged"))))
        {
          v13 = objc_msgSend((id)v9, "indexToAuthorIDOfFormattingChangeOverridden");
          if (v13 == objc_msgSend(v11, "indexToAuthorIDOfFormattingChangeOverridden"))
          {
            if (!objc_msgSend((id)v9, "indexToAuthorIDOfFormattingChangeOverridden")
              || (v14 = objc_msgSend((id)v9, "indexToAuthorIDOfFormattingChange"),
                  v14 == objc_msgSend(v11, "indexToAuthorIDOfFormattingChange")))
            {
              v15 = objc_msgSend((id)v9, "baseStyleOverridden");
              if (v15 == objc_msgSend(v11, "baseStyleOverridden"))
              {
                if (!objc_msgSend((id)v9, "baseStyleOverridden")
                  || (objc_msgSend((id)v9, "baseStyle"),
                      v16 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v11, "baseStyle"),
                      v17 = (void *)objc_claimAutoreleasedReturnValue(),
                      v18 = objc_msgSend(v16, "isEqual:", v17),
                      v17,
                      v16,
                      (v18 & 1) != 0))
                {
                  v19 = objc_msgSend((id)v9, "borderOverridden");
                  if (v19 == objc_msgSend(v11, "borderOverridden"))
                  {
                    if (!objc_msgSend((id)v9, "borderOverridden")
                      || (objc_msgSend((id)v9, "border"),
                          v20 = (void *)objc_claimAutoreleasedReturnValue(),
                          objc_msgSend(v11, "border"),
                          v21 = (void *)objc_claimAutoreleasedReturnValue(),
                          v22 = objc_msgSend(v20, "isEqual:", v21),
                          v21,
                          v20,
                          (v22 & 1) != 0))
                    {
                      v23 = objc_msgSend((id)v9, "shadingOverridden");
                      if (v23 == objc_msgSend(v11, "shadingOverridden"))
                      {
                        if (!objc_msgSend((id)v9, "shadingOverridden")
                          || (objc_msgSend((id)v9, "shading"),
                              v24 = (void *)objc_claimAutoreleasedReturnValue(),
                              objc_msgSend(v11, "shading"),
                              v25 = (void *)objc_claimAutoreleasedReturnValue(),
                              v26 = objc_msgSend(v24, "isEqual:", v25),
                              v25,
                              v24,
                              (v26 & 1) != 0))
                        {
                          v27 = objc_msgSend((id)v9, "fontOverridden");
                          if (v27 == objc_msgSend(v11, "fontOverridden"))
                          {
                            if (!objc_msgSend((id)v9, "fontOverridden")
                              || (objc_msgSend((id)v9, "font"),
                                  v28 = (void *)objc_claimAutoreleasedReturnValue(),
                                  objc_msgSend(v11, "font"),
                                  v29 = (void *)objc_claimAutoreleasedReturnValue(),
                                  v30 = objc_msgSend(v28, "isEqual:", v29),
                                  v29,
                                  v28,
                                  (v30 & 1) != 0))
                            {
                              v31 = objc_msgSend((id)v9, "extendedFontOverridden");
                              if (v31 == objc_msgSend(v11, "extendedFontOverridden"))
                              {
                                if (!objc_msgSend((id)v9, "extendedFontOverridden")
                                  || (objc_msgSend((id)v9, "extendedFont"),
                                      v32 = (void *)objc_claimAutoreleasedReturnValue(),
                                      objc_msgSend(v11, "extendedFont"),
                                      v33 = (void *)objc_claimAutoreleasedReturnValue(),
                                      v34 = objc_msgSend(v32, "isEqual:", v33),
                                      v33,
                                      v32,
                                      (v34 & 1) != 0))
                                {
                                  v35 = objc_msgSend((id)v9, "farEastFontOverridden");
                                  if (v35 == objc_msgSend(v11, "farEastFontOverridden"))
                                  {
                                    if (!objc_msgSend((id)v9, "farEastFontOverridden")
                                      || (objc_msgSend((id)v9, "farEastFont"),
                                          v36 = (void *)objc_claimAutoreleasedReturnValue(),
                                          objc_msgSend(v11, "farEastFont"),
                                          v37 = (void *)objc_claimAutoreleasedReturnValue(),
                                          v38 = objc_msgSend(v36, "isEqual:", v37),
                                          v37,
                                          v36,
                                          (v38 & 1) != 0))
                                    {
                                      v39 = objc_msgSend((id)v9, "symbolFontOverridden");
                                      if (v39 == objc_msgSend(v11, "symbolFontOverridden"))
                                      {
                                        if (!objc_msgSend((id)v9, "symbolFontOverridden")
                                          || (objc_msgSend((id)v9, "symbolFont"),
                                              v40 = (void *)objc_claimAutoreleasedReturnValue(),
                                              objc_msgSend(v11, "symbolFont"),
                                              v41 = (void *)objc_claimAutoreleasedReturnValue(),
                                              v42 = objc_msgSend(v40, "isEqual:", v41),
                                              v41,
                                              v40,
                                              (v42 & 1) != 0))
                                        {
                                          v43 = objc_msgSend((id)v9, "outlineColorOverridden");
                                          if (v43 == objc_msgSend(v11, "outlineColorOverridden"))
                                          {
                                            if (!objc_msgSend((id)v9, "outlineColorOverridden")
                                              || (objc_msgSend((id)v9, "outlineColor"),
                                                  v44 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  objc_msgSend(v11, "outlineColor"),
                                                  v45 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  v46 = objc_msgSend(v44, "isEqual:", v45),
                                                  v45,
                                                  v44,
                                                  (v46 & 1) != 0))
                                            {
                                              v47 = objc_msgSend((id)v9, "underlineColorOverridden");
                                              if (v47 == objc_msgSend(v11, "underlineColorOverridden"))
                                              {
                                                if (!objc_msgSend((id)v9, "underlineColorOverridden")
                                                  || (objc_msgSend((id)v9, "underlineColor"),
                                                      v48 = (void *)objc_claimAutoreleasedReturnValue(),
                                                      objc_msgSend(v11, "underlineColor"),
                                                      v49 = (void *)objc_claimAutoreleasedReturnValue(),
                                                      v50 = objc_msgSend(v48, "isEqual:", v49),
                                                      v49,
                                                      v48,
                                                      (v50 & 1) != 0))
                                                {
                                                  v51 = objc_msgSend((id)v9, "colorOverridden");
                                                  if (v51 == objc_msgSend(v11, "colorOverridden"))
                                                  {
                                                    if (!objc_msgSend((id)v9, "colorOverridden")
                                                      || (objc_msgSend((id)v9, "color"),
                                                          v52 = (void *)objc_claimAutoreleasedReturnValue(),
                                                          objc_msgSend(v11, "color"),
                                                          v53 = (void *)objc_claimAutoreleasedReturnValue(),
                                                          v54 = objc_msgSend(v52, "isEqual:", v53),
                                                          v53,
                                                          v52,
                                                          (v54 & 1) != 0))
                                                    {
                                                      v55 = objc_msgSend((id)v9, "symbolCharacterOverridden");
                                                      if (v55 == objc_msgSend(v11, "symbolCharacterOverridden"))
                                                      {
                                                        v56 = objc_msgSend((id)v9, "symbolCharacter");
                                                        if (v56 == objc_msgSend(v11, "symbolCharacter"))
                                                        {
                                                          v57 = objc_msgSend((id)v9, "boldOverridden");
                                                          if (v57 == objc_msgSend(v11, "boldOverridden"))
                                                          {
                                                            v58 = objc_msgSend((id)v9, "bold");
                                                            if (v58 == objc_msgSend(v11, "bold"))
                                                            {
                                                              v59 = objc_msgSend((id)v9, "boldForBiTextOverridden");
                                                              if (v59 == objc_msgSend(v11, "boldForBiTextOverridden"))
                                                              {
                                                                v60 = objc_msgSend((id)v9, "boldForBiText");
                                                                if (v60 == objc_msgSend(v11, "boldForBiText"))
                                                                {
                                                                  v61 = objc_msgSend((id)v9, "italicOverridden");
                                                                  if (v61 == objc_msgSend(v11, "italicOverridden"))
                                                                  {
                                                                    v62 = objc_msgSend((id)v9, "italic");
                                                                    if (v62 == objc_msgSend(v11, "italic"))
                                                                    {
                                                                      v63 = objc_msgSend((id)v9, "italicForBiTextOverridden");
                                                                      if (v63 == objc_msgSend(v11, "italicForBiTextOverridden"))
                                                                      {
                                                                        v64 = objc_msgSend((id)v9, "italicForBiText");
                                                                        if (v64 == objc_msgSend(v11, "italicForBiText"))
                                                                        {
                                                                          v65 = objc_msgSend((id)v9, "outlineOverridden");
                                                                          if (v65 == objc_msgSend(v11, "outlineOverridden"))
                                                                          {
                                                                            v66 = objc_msgSend((id)v9, "outline");
                                                                            if (v66 == objc_msgSend(v11, "outline"))
                                                                            {
                                                                              v67 = objc_msgSend((id)v9, "outline2010WidthOverridden");
                                                                              if (v67 == objc_msgSend(v11, "outline2010WidthOverridden"))
                                                                              {
                                                                                objc_msgSend((id)v9, "outline2010Width");
                                                                                v69 = v68;
                                                                                objc_msgSend(v11, "outline2010Width");
                                                                                if (v69 == v70)
                                                                                {
                                                                                  v71 = objc_msgSend((id)v9, "shadowOverridden");
                                                                                  if (v71 == objc_msgSend(v11, "shadowOverridden"))
                                                                                  {
                                                                                    v72 = objc_msgSend((id)v9, "shadow");
                                                                                    if (v72 == objc_msgSend(v11, "shadow"))
                                                                                    {
                                                                                      v73 = objc_msgSend((id)v9, "embossedOverridden");
                                                                                      if (v73 == objc_msgSend(v11, "embossedOverridden"))
                                                                                      {
                                                                                        v74 = objc_msgSend((id)v9, "embossed");
                                                                                        if (v74 == objc_msgSend(v11, "embossed"))
                                                                                        {
                                                                                          v75 = objc_msgSend((id)v9, "imprintOverridden");
                                                                                          if (v75 == objc_msgSend(v11, "imprintOverridden"))
                                                                                          {
                                                                                            v76 = objc_msgSend((id)v9, "imprint");
                                                                                            if (v76 == objc_msgSend(v11, "imprint"))
                                                                                            {
                                                                                              v77 = objc_msgSend((id)v9, "underlineOverridden");
                                                                                              if (v77 == objc_msgSend(v11, "underlineOverridden"))
                                                                                              {
                                                                                                v78 = objc_msgSend((id)v9, "underline");
                                                                                                if (v78 == objc_msgSend(v11, "underline"))
                                                                                                {
                                                                                                  v79 = objc_msgSend((id)v9, "strikeThroughOverridden");
                                                                                                  if (v79 == objc_msgSend(v11, "strikeThroughOverridden"))
                                                                                                  {
                                                                                                    v80 = objc_msgSend((id)v9, "strikeThrough");
                                                                                                    if (v80 == objc_msgSend(v11, "strikeThrough"))
                                                                                                    {
                                                                                                      v81 = objc_msgSend((id)v9, "doubleStrikeThroughOverridden");
                                                                                                      if (v81 == objc_msgSend(v11, "doubleStrikeThroughOverridden"))
                                                                                                      {
                                                                                                        v82 = objc_msgSend((id)v9, "doubleStrikeThrough");
                                                                                                        if (v82 == objc_msgSend(v11, "doubleStrikeThrough"))
                                                                                                        {
                                                                                                          v83 = objc_msgSend((id)v9, "ligatureOverridden");
                                                                                                          if (v83 == objc_msgSend(v11, "ligatureOverridden"))
                                                                                                          {
                                                                                                            v84 = objc_msgSend((id)v9, "ligature");
                                                                                                            if (v84 == objc_msgSend(v11, "ligature"))
                                                                                                            {
                                                                                                              v85 = objc_msgSend((id)v9, "highlightOverridden");
                                                                                                              if (v85 == objc_msgSend(v11, "highlightOverridden"))
                                                                                                              {
                                                                                                                v86 = objc_msgSend((id)v9, "highlight");
                                                                                                                if (v86 == objc_msgSend(v11, "highlight"))
                                                                                                                {
                                                                                                                  v87 = objc_msgSend((id)v9, "highlightColorOverridden");
                                                                                                                  if (v87 == objc_msgSend(v11, "highlightColorOverridden"))
                                                                                                                  {
                                                                                                                    v88 = objc_msgSend((id)v9, "highlightColor");
                                                                                                                    if (v88 == objc_msgSend(v11, "highlightColor"))
                                                                                                                    {
                                                                                                                      v89 = objc_msgSend((id)v9, "smallCapsOverridden");
                                                                                                                      if (v89 == objc_msgSend(v11, "smallCapsOverridden"))
                                                                                                                      {
                                                                                                                        v90 = objc_msgSend((id)v9, "smallCaps");
                                                                                                                        if (v90 == objc_msgSend(v11, "smallCaps"))
                                                                                                                        {
                                                                                                                          v91 = objc_msgSend((id)v9, "capsOverridden");
                                                                                                                          if (v91 == objc_msgSend(v11, "capsOverridden"))
                                                                                                                          {
                                                                                                                            v92 = objc_msgSend((id)v9, "caps");
                                                                                                                            if (v92 == objc_msgSend(v11, "caps"))
                                                                                                                            {
                                                                                                                              v93 = objc_msgSend((id)v9, "lowerCaseOverridden");
                                                                                                                              if (v93 == objc_msgSend(v11, "lowerCaseOverridden"))
                                                                                                                              {
                                                                                                                                v94 = objc_msgSend((id)v9, "lowerCase");
                                                                                                                                if (v94 == objc_msgSend(v11, "lowerCase"))
                                                                                                                                {
                                                                                                                                  v95 = objc_msgSend((id)v9, "hiddenOverridden");
                                                                                                                                  if (v95 == objc_msgSend(v11, "hiddenOverridden"))
                                                                                                                                  {
                                                                                                                                    v96 = objc_msgSend((id)v9, "hidden");
                                                                                                                                    if (v96 == objc_msgSend(v11, "hidden"))
                                                                                                                                    {
                                                                                                                                      v97 = objc_msgSend((id)v9, "spacingOverridden");
                                                                                                                                      if (v97 == objc_msgSend(v11, "spacingOverridden"))
                                                                                                                                      {
                                                                                                                                        v98 = objc_msgSend((id)v9, "spacing");
                                                                                                                                        if (v98 == objc_msgSend(v11, "spacing"))
                                                                                                                                        {
                                                                                                                                          v99 = objc_msgSend((id)v9, "positionOverridden");
                                                                                                                                          if (v99 == objc_msgSend(v11, "positionOverridden"))
                                                                                                                                          {
                                                                                                                                            v100 = objc_msgSend((id)v9, "position");
                                                                                                                                            if (v100 == objc_msgSend(v11, "position"))
                                                                                                                                            {
                                                                                                                                              v101 = objc_msgSend((id)v9, "kerningOverridden");
                                                                                                                                              if (v101 == objc_msgSend(v11, "kerningOverridden"))
                                                                                                                                              {
                                                                                                                                                v102 = objc_msgSend((id)v9, "kerning");
                                                                                                                                                if (v102 == objc_msgSend(v11, "kerning"))
                                                                                                                                                {
                                                                                                                                                  v103 = objc_msgSend((id)v9, "textScaleOverridden");
                                                                                                                                                  if (v103 == objc_msgSend(v11, "textScaleOverridden"))
                                                                                                                                                  {
                                                                                                                                                    v104 = objc_msgSend((id)v9, "textScale");
                                                                                                                                                    if (v104 == objc_msgSend(v11, "textScale"))
                                                                                                                                                    {
                                                                                                                                                      v105 = objc_msgSend((id)v9, "fontSizeOverridden");
                                                                                                                                                      if (v105 == objc_msgSend(v11, "fontSizeOverridden"))
                                                                                                                                                      {
                                                                                                                                                        v106 = objc_msgSend((id)v9, "fontSize");
                                                                                                                                                        if (v106 == objc_msgSend(v11, "fontSize"))
                                                                                                                                                        {
                                                                                                                                                          v107 = objc_msgSend((id)v9, "verticalAlignOverridden");
                                                                                                                                                          if (v107 == objc_msgSend(v11, "verticalAlignOverridden"))
                                                                                                                                                          {
                                                                                                                                                            v108 = objc_msgSend((id)v9, "verticalAlign");
                                                                                                                                                            if (v108 == objc_msgSend(v11, "verticalAlign"))
                                                                                                                                                            {
                                                                                                                                                              v109 = objc_msgSend((id)v9, "emphasisMarkOverridden");
                                                                                                                                                              if (v109 == objc_msgSend(v11, "emphasisMarkOverridden"))
                                                                                                                                                              {
                                                                                                                                                                v110 = objc_msgSend((id)v9, "emphasisMark");
                                                                                                                                                                if (v110 == objc_msgSend(v11, "emphasisMark"))
                                                                                                                                                                {
                                                                                                                                                                  v111 = objc_msgSend((id)v9, "colorAutoOverridden");
                                                                                                                                                                  if (v111 == objc_msgSend(v11, "colorAutoOverridden"))
                                                                                                                                                                  {
                                                                                                                                                                    v112 = objc_msgSend((id)v9, "colorAuto");
                                                                                                                                                                    if (v112 == objc_msgSend(v11, "colorAuto"))
                                                                                                                                                                    {
                                                                                                                                                                      v113 = objc_msgSend((id)v9, "languageForDefaultTextOverridden");
                                                                                                                                                                      if (v113 == objc_msgSend(v11, "languageForDefaultTextOverridden"))
                                                                                                                                                                      {
                                                                                                                                                                        v114 = objc_msgSend((id)v9, "languageForDefaultText");
                                                                                                                                                                        if (v114 == objc_msgSend(v11, "languageForDefaultText"))
                                                                                                                                                                        {
                                                                                                                                                                          v115 = objc_msgSend((id)v9, "specialCharacterOverridden");
                                                                                                                                                                          if (v115 == objc_msgSend(v11, "specialCharacterOverridden"))
                                                                                                                                                                          {
                                                                                                                                                                            v116 = objc_msgSend((id)v9, "specialCharacter");
                                                                                                                                                                            if (v116 == objc_msgSend(v11, "specialCharacter"))
                                                                                                                                                                            {
                                                                                                                                                                              v117 = objc_msgSend((id)v9, "listCharacterPictureBulletOverridden");
                                                                                                                                                                              if (v117 == objc_msgSend(v11, "listCharacterPictureBulletOverridden"))
                                                                                                                                                                              {
                                                                                                                                                                                v118 = objc_msgSend((id)v9, "listCharacterPictureBullet");
                                                                                                                                                                                if (v118 == objc_msgSend(v11, "listCharacterPictureBullet"))
                                                                                                                                                                                {
                                                                                                                                                                                  v119 = objc_msgSend((id)v9, "charPositionOfPictureBulletInBookmarkOverridden");
                                                                                                                                                                                  if (v119 == objc_msgSend(v11, "charPositionOfPictureBulletInBookmarkOverridden"))
                                                                                                                                                                                  {
                                                                                                                                                                                    v120 = objc_msgSend((id)v9, "charPositionOfPictureBulletInBookmark");
                                                                                                                                                                                    if (v120 == objc_msgSend(v11, "charPositionOfPictureBulletInBookmark"))
                                                                                                                                                                                    {
                                                                                                                                                                                      v121 = objc_msgSend((id)v9, "languageForFarEastOverridden");
                                                                                                                                                                                      if (v121 == objc_msgSend(v11, "languageForFarEastOverridden"))
                                                                                                                                                                                      {
                                                                                                                                                                                        v122 = objc_msgSend((id)v9, "languageForFarEast");
                                                                                                                                                                                        if (v122 == objc_msgSend(v11, "languageForFarEast"))
                                                                                                                                                                                        {
                                                                                                                                                                                          v123 = objc_msgSend((id)v9, "languageForBiTextOverridden");
                                                                                                                                                                                          if (v123 == objc_msgSend(v11, "languageForBiTextOverridden"))
                                                                                                                                                                                          {
                                                                                                                                                                                            v124 = objc_msgSend((id)v9, "languageForBiText");
                                                                                                                                                                                            v8 = v124 != objc_msgSend(v11, "languageForBiText");
LABEL_119:

                                                                                                                                                                                            goto LABEL_120;
                                                                                                                                                                                          }
                                                                                                                                                                                        }
                                                                                                                                                                                      }
                                                                                                                                                                                    }
                                                                                                                                                                                  }
                                                                                                                                                                                }
                                                                                                                                                                              }
                                                                                                                                                                            }
                                                                                                                                                                          }
                                                                                                                                                                        }
                                                                                                                                                                      }
                                                                                                                                                                    }
                                                                                                                                                                  }
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_117:
        v8 = 1;
        goto LABEL_119;
      }
      v8 = -[WDCharacterProperties isAnythingOverriddenIn:](self, "isAnythingOverriddenIn:", v9);
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    v11 = 0;
    goto LABEL_119;
  }
  v8 = 1;
LABEL_120:

  return v8;
}

- (int)reverseBooleanProperty:(int)a3
{
  if (a3 > 127)
  {
    if (a3 != 128)
    {
      if (a3 == 129)
        return 128;
      return 0;
    }
    return 129;
  }
  else
  {
    return !a3;
  }
}

@end
