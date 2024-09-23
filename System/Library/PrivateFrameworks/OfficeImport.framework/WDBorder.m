@implementation WDBorder

- (WDBorder)init
{
  WDBorder *v2;
  uint64_t v3;
  OITSUColor *mColor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WDBorder;
  v2 = -[WDBorder init](&v6, sel_init);
  if (v2)
  {
    +[OITSUColor clearColor](OITSUColor, "clearColor");
    v3 = objc_claimAutoreleasedReturnValue();
    mColor = v2->mColor;
    v2->mColor = (OITSUColor *)v3;

  }
  return v2;
}

- (void)setStyle:(int)a3
{
  self->mStyle = a3;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->mColor, a3);
}

- (void)setWidth:(unsigned __int8)a3
{
  self->mWidth = a3;
}

- (void)setSpace:(unsigned __int8)a3
{
  self->mSpace = a3;
}

- (void)setShadow:(BOOL)a3
{
  self->mShadow = a3;
}

- (void)setFrame:(BOOL)a3
{
  self->mFrame = a3;
}

- (int)style
{
  return self->mStyle;
}

- (unsigned)width
{
  return self->mWidth;
}

- (id)color
{
  return self->mColor;
}

- (BOOL)isEqualToBorder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  OITSUColor *mColor;
  char v7;

  v4 = a3;
  v5 = v4;
  if (self->mStyle == *((_DWORD *)v4 + 2)
    && self->mWidth == *((unsigned __int8 *)v4 + 24)
    && self->mSpace == *((unsigned __int8 *)v4 + 25)
    && self->mShadow == *((unsigned __int8 *)v4 + 26)
    && self->mFrame == *((unsigned __int8 *)v4 + 27))
  {
    mColor = self->mColor;
    if (mColor == (OITSUColor *)v5[2])
      v7 = 1;
    else
      v7 = -[OITSUColor isEqual:](mColor, "isEqual:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WDBorder *v4;
  WDBorder *v5;
  BOOL v6;

  v4 = (WDBorder *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[WDBorder isEqualToBorder:](self, "isEqualToBorder:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t mSpace;
  objc_super v5;

  v2 = (self->mStyle << 16) | ((unint64_t)self->mWidth << 8);
  mSpace = self->mSpace;
  v5.receiver = self;
  v5.super_class = (Class)WDBorder;
  return (-[WDBorder hash](&v5, sel_hash) ^ mSpace) + v2;
}

- (void)setBorder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WDBorder setStyle:](self, "setStyle:", objc_msgSend(v5, "style"));
  objc_msgSend(v5, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDBorder setColor:](self, "setColor:", v4);

  -[WDBorder setWidth:](self, "setWidth:", objc_msgSend(v5, "width"));
  -[WDBorder setSpace:](self, "setSpace:", objc_msgSend(v5, "space"));
  -[WDBorder setShadow:](self, "setShadow:", objc_msgSend(v5, "shadow"));
  -[WDBorder setFrame:](self, "setFrame:", objc_msgSend(v5, "frame"));

}

- (void)setNullBorder
{
  void *v3;

  -[WDBorder setStyle:](self, "setStyle:", 0);
  +[OITSUColor clearColor](OITSUColor, "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDBorder setColor:](self, "setColor:", v3);

  -[WDBorder setWidth:](self, "setWidth:", 0);
  -[WDBorder setSpace:](self, "setSpace:", 0);
  -[WDBorder setShadow:](self, "setShadow:", 0);
  -[WDBorder setFrame:](self, "setFrame:", 0);
}

- (void)setSingleBlackBorder
{
  void *v3;

  -[WDBorder setStyle:](self, "setStyle:", 1);
  +[OITSUColor blackColor](OITSUColor, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDBorder setColor:](self, "setColor:", v3);

  -[WDBorder setWidth:](self, "setWidth:", 1);
  -[WDBorder setSpace:](self, "setSpace:", 0);
  -[WDBorder setShadow:](self, "setShadow:", 0);
  -[WDBorder setFrame:](self, "setFrame:", 0);
}

- (unsigned)space
{
  return self->mSpace;
}

- (BOOL)shadow
{
  return self->mShadow;
}

- (BOOL)frame
{
  return self->mFrame;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WDBorder *v4;
  WDBorder *v5;
  OITSUColor *v6;
  OITSUColor *mColor;

  v4 = -[WDBorder init](+[WDBorder allocWithZone:](WDBorder, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    v4->mStyle = self->mStyle;
    v6 = -[OITSUColor copy](self->mColor, "copy");
    mColor = v5->mColor;
    v5->mColor = v6;

    v5->mWidth = self->mWidth;
    v5->mSpace = self->mSpace;
    v5->mShadow = self->mShadow;
    v5->mFrame = self->mFrame;
  }
  return v5;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDBorder;
  -[WDBorder description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColor, 0);
}

@end
