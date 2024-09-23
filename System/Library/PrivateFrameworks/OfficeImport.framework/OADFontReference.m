@implementation OADFontReference

- (void)setIndex:(int)a3
{
  self->mIndex = a3;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->mColor, a3);
}

- (void)applyToParagraphProperties:(id)a3
{
  int mIndex;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  OADSolidFill *v9;
  id v10;

  v10 = a3;
  mIndex = self->mIndex;
  if (mIndex)
  {
    if (mIndex != 1)
      goto LABEL_15;
    v5 = CFSTR("+mn-lt");
    v6 = CFSTR("+mn-cs");
    v7 = CFSTR("+mn-ea");
  }
  else
  {
    v5 = CFSTR("+mj-lt");
    v6 = CFSTR("+mj-cs");
    v7 = CFSTR("+mj-ea");
  }
  v8 = objc_msgSend(v10, "isMergedWithParent");
  objc_msgSend(v10, "setMergedWithParent:", 0);
  if ((objc_msgSend(v10, "hasLatinFont") & 1) == 0)
    objc_msgSend(v10, "setLatinFont:", v5);
  if ((objc_msgSend(v10, "hasEastAsianFont") & 1) == 0)
    objc_msgSend(v10, "setEastAsianFont:", v7);
  if ((objc_msgSend(v10, "hasBidiFont") & 1) == 0)
    objc_msgSend(v10, "setBidiFont:", v6);
  if (self->mColor && (objc_msgSend(v10, "hasFill") & 1) == 0)
  {
    v9 = objc_alloc_init(OADSolidFill);
    -[OADSolidFill setColor:](v9, "setColor:", self->mColor);
    objc_msgSend(v10, "setFill:", v9);

  }
  objc_msgSend(v10, "setMergedWithParent:", v8);
LABEL_15:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  id v6;
  void *v7;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v5[2] = self->mIndex;
  v6 = -[OADColor copyWithZone:](self->mColor, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v6;

  return v5;
}

- (int)index
{
  return self->mIndex;
}

- (id)color
{
  return self->mColor;
}

- (unint64_t)hash
{
  uint64_t mIndex;

  mIndex = self->mIndex;
  return -[OADColor hash](self->mColor, "hash") ^ mIndex;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  OADColor **v7;
  OADColor *mColor;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (OADColor **)v4;
    if (self->mIndex == *((_DWORD *)v7 + 2))
    {
      mColor = self->mColor;
      if (mColor == v7[2])
        v6 = 1;
      else
        v6 = -[OADColor isEqual:](mColor, "isEqual:");
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADFontReference;
  -[OADFontReference description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
}

@end
