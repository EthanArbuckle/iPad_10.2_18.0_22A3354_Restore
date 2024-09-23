@implementation OADStroke

- (OADStroke)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADStroke;
  return -[OADProperties init](&v3, sel_init);
}

+ (id)defaultProperties
{
  if (+[OADStroke defaultProperties]::once != -1)
    dispatch_once(&+[OADStroke defaultProperties]::once, &__block_literal_global_144);
  return (id)+[OADStroke defaultProperties]::defaultProperties;
}

- (OADStroke)initWithDefaults
{
  OADStroke *v2;
  OADStroke *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)OADStroke;
  v2 = -[OADProperties initWithDefaults](&v15, sel_initWithDefaults);
  v3 = v2;
  if (v2)
  {
    -[OADStroke setColor:](v2, "setColor:", 0);
    +[OADNullFill nullFill](OADNullFill, "nullFill");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADStroke setFill:](v3, "setFill:", v4);

    +[OADPresetDash defaultProperties](OADPresetDash, "defaultProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[OADStroke setDash:](v3, "setDash:", v6);

    +[OADRoundLineJoin defaultProperties](OADRoundLineJoin, "defaultProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[OADStroke setJoin:](v3, "setJoin:", v8);

    +[OADLineEnd defaultProperties](OADLineEnd, "defaultProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[OADStroke setHead:](v3, "setHead:", v10);

    +[OADLineEnd defaultProperties](OADLineEnd, "defaultProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[OADStroke setTail:](v3, "setTail:", v12);

    LODWORD(v13) = 0.75;
    -[OADStroke setWidth:](v3, "setWidth:", v13);
    -[OADStroke setCap:](v3, "setCap:", 2);
    -[OADStroke setCompoundType:](v3, "setCompoundType:", 0);
    -[OADStroke setPenAlignment:](v3, "setPenAlignment:", 0);
  }
  return v3;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->mColor, a3);
  *((_BYTE *)self + 84) |= 1u;
}

- (void)setFill:(id)a3
{
  objc_storeStrong((id *)&self->mFill, a3);
}

- (void)setDash:(id)a3
{
  objc_storeStrong((id *)&self->mDash, a3);
}

- (void)setJoin:(id)a3
{
  objc_storeStrong((id *)&self->mJoin, a3);
}

- (void)setHead:(id)a3
{
  objc_storeStrong((id *)&self->mHead, a3);
}

- (void)setTail:(id)a3
{
  objc_storeStrong((id *)&self->mTail, a3);
}

- (void)setWidth:(float)a3
{
  self->mWidth = a3;
  *((_BYTE *)self + 84) |= 2u;
}

- (void)setCap:(unsigned __int8)a3
{
  self->mCap = a3;
  *((_BYTE *)self + 84) |= 4u;
}

- (void)setCompoundType:(unsigned __int8)a3
{
  self->mCompoundType = a3;
  *((_BYTE *)self + 84) |= 8u;
}

- (void)setPenAlignment:(int)a3
{
  self->mPenAlignment = a3;
  *((_BYTE *)self + 84) |= 0x10u;
}

- (void)setParent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  OADLineEnd *mHead;
  void *v9;
  OADLineEnd *mTail;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OADStroke;
  -[OADProperties setParent:](&v12, sel_setParent_, v4);
  if (self->mFill)
  {
    objc_msgSend(v4, "fill");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
      -[OADProperties setParent:](self->mFill, "setParent:", v5);

  }
  if (self->mDash)
  {
    objc_msgSend(v4, "dash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
      -[OADProperties setParent:](self->mDash, "setParent:", v6);

  }
  if (self->mJoin)
  {
    objc_msgSend(v4, "join");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
      -[OADProperties setParent:](self->mJoin, "setParent:", v7);

  }
  mHead = self->mHead;
  if (mHead)
  {
    objc_msgSend(v4, "head");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADProperties setParent:](mHead, "setParent:", v9);

  }
  mTail = self->mTail;
  if (mTail)
  {
    objc_msgSend(v4, "tail");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADProperties setParent:](mTail, "setParent:", v11);

  }
}

- (OADLineEnd)head
{
  id *v2;
  OADLineEnd *v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isHeadOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = (OADLineEnd *)v2[7];

  return v3;
}

- (OADLineEnd)tail
{
  id *v2;
  OADLineEnd *v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isTailOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = (OADLineEnd *)v2[8];

  return v3;
}

+ (id)nullStroke
{
  OADStroke *v2;
  void *v3;

  v2 = objc_alloc_init(OADStroke);
  +[OADNullFill nullFill](OADNullFill, "nullFill");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStroke setFill:](v2, "setFill:", v3);

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  unsigned __int8 *v7;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (unsigned __int8 *)v4;
    v6 = (*((_BYTE *)self + 84) & 1) == (v7[84] & 1)
      && ((*((_BYTE *)self + 84) & 1) == 0 || -[OADColor isEqual:](self->mColor, "isEqual:", *((_QWORD *)v7 + 3)))
      && TCObjectEqual((objc_object *)self->mFill, *((objc_object **)v7 + 4))
      && TCObjectEqual((objc_object *)self->mDash, *((objc_object **)v7 + 5))
      && TCObjectEqual((objc_object *)self->mJoin, *((objc_object **)v7 + 6))
      && TCObjectEqual((objc_object *)self->mHead, *((objc_object **)v7 + 7))
      && TCObjectEqual((objc_object *)self->mTail, *((objc_object **)v7 + 8))
      && ((v7[84] >> 1) & 1) == (*((_BYTE *)self + 84) & 2) >> 1
      && ((*((_BYTE *)self + 84) & 2) == 0 || self->mWidth == *((float *)v7 + 18))
      && ((v7[84] >> 2) & 1) == (*((_BYTE *)self + 84) & 4) >> 2
      && ((*((_BYTE *)self + 84) & 4) == 0 || self->mCap == v7[76])
      && ((v7[84] >> 3) & 1) == (*((_BYTE *)self + 84) & 8) >> 3
      && ((*((_BYTE *)self + 84) & 8) == 0 || self->mCompoundType == v7[77])
      && ((v7[84] >> 4) & 1) == (*((_BYTE *)self + 84) & 0x10) >> 4
      && ((*((_BYTE *)self + 84) & 0x10) == 0 || self->mPenAlignment == *((_DWORD *)v7 + 20));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)fill
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isFillOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[4];

  return v3;
}

- (BOOL)isFillOverridden
{
  return self->mFill || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unint64_t)hash
{
  unint64_t v3;
  OADFill *mFill;
  OADDash *mDash;
  OADLineJoin *mJoin;
  OADLineEnd *mHead;
  OADLineEnd *mTail;

  if ((*((_BYTE *)self + 84) & 1) != 0)
    v3 = -[OADColor hash](self->mColor, "hash");
  else
    v3 = 0;
  mFill = self->mFill;
  if (mFill)
    v3 ^= -[OADFill hash](mFill, "hash");
  mDash = self->mDash;
  if (mDash)
    v3 ^= -[OADDash hash](mDash, "hash");
  mJoin = self->mJoin;
  if (mJoin)
    v3 ^= -[OADProperties hash](mJoin, "hash");
  mHead = self->mHead;
  if (mHead)
    v3 ^= -[OADLineEnd hash](mHead, "hash");
  mTail = self->mTail;
  if (mTail)
    v3 ^= -[OADLineEnd hash](mTail, "hash");
  if ((*((_BYTE *)self + 84) & 2) != 0)
    v3 ^= (unint64_t)self->mWidth;
  if ((*((_BYTE *)self + 84) & 4) != 0)
    v3 ^= self->mCap;
  if ((*((_BYTE *)self + 84) & 8) != 0)
    v3 ^= self->mCompoundType;
  if ((*((_BYTE *)self + 84) & 0x10) != 0)
    v3 ^= self->mPenAlignment;
  return v3;
}

- (float)width
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isWidthOverridden);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[18];

  return v3;
}

- (BOOL)isWidthOverridden
{
  return (*((_BYTE *)self + 84) & 2) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isDashOverridden
{
  return self->mDash || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)dash
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isDashOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[5];

  return v3;
}

- (BOOL)isCompoundTypeOverridden
{
  return (*((_BYTE *)self + 84) & 8) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)compoundType
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isCompoundTypeOverridden);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[77];

  return v3;
}

- (id)color
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isColorOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

- (BOOL)isColorOverridden
{
  return (*((_BYTE *)self + 84) & 1) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  double v6;
  id v7;
  OADFill *mFill;
  id v9;
  OADDash *mDash;
  id v11;
  OADLineJoin *mJoin;
  id v13;
  OADLineEnd *mHead;
  id v15;
  OADLineEnd *mTail;
  id v17;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*((_BYTE *)self + 84) & 1) != 0)
  {
    v7 = -[OADColor copyWithZone:](self->mColor, "copyWithZone:", a3);
    objc_msgSend(v5, "setColor:", v7);

  }
  mFill = self->mFill;
  if (mFill)
  {
    v9 = -[OADFill copyWithZone:](mFill, "copyWithZone:", a3);
    objc_msgSend(v5, "setFill:", v9);

  }
  mDash = self->mDash;
  if (mDash)
  {
    v11 = -[OADDash copyWithZone:](mDash, "copyWithZone:", a3);
    objc_msgSend(v5, "setDash:", v11);

  }
  mJoin = self->mJoin;
  if (mJoin)
  {
    v13 = -[OADLineJoin copyWithZone:](mJoin, "copyWithZone:", a3);
    objc_msgSend(v5, "setJoin:", v13);

  }
  mHead = self->mHead;
  if (mHead)
  {
    v15 = -[OADLineEnd copyWithZone:](mHead, "copyWithZone:", a3);
    objc_msgSend(v5, "setHead:", v15);

  }
  mTail = self->mTail;
  if (mTail)
  {
    v17 = -[OADLineEnd copyWithZone:](mTail, "copyWithZone:", a3);
    objc_msgSend(v5, "setTail:", v17);

  }
  if ((*((_BYTE *)self + 84) & 2) != 0)
  {
    *(float *)&v6 = self->mWidth;
    objc_msgSend(v5, "setWidth:", v6);
  }
  if ((*((_BYTE *)self + 84) & 4) != 0)
    objc_msgSend(v5, "setCap:", self->mCap);
  if ((*((_BYTE *)self + 84) & 8) != 0)
    objc_msgSend(v5, "setCompoundType:", self->mCompoundType);
  if ((*((_BYTE *)self + 84) & 0x10) != 0)
    objc_msgSend(v5, "setPenAlignment:", self->mPenAlignment);
  return v5;
}

+ (id)blackStroke
{
  OADStroke *v2;
  void *v3;

  v2 = objc_alloc_init(OADStroke);
  +[OADSolidFill blackFill](OADSolidFill, "blackFill");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStroke setFill:](v2, "setFill:", v3);

  return v2;
}

- (void)setStyleColor:(id)a3
{
  -[OADFill setStyleColor:](self->mFill, "setStyleColor:", a3);
}

- (id)join
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isJoinOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[6];

  return v3;
}

- (BOOL)isJoinOverridden
{
  return self->mJoin || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADStroke;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADStroke isColorOverridden](self, "isColorOverridden")
      || -[OADStroke isFillOverridden](self, "isFillOverridden")
      || -[OADStroke isDashOverridden](self, "isDashOverridden")
      || -[OADStroke isJoinOverridden](self, "isJoinOverridden")
      || -[OADStroke isWidthOverridden](self, "isWidthOverridden")
      || -[OADStroke isCapOverridden](self, "isCapOverridden")
      || -[OADStroke isCompoundTypeOverridden](self, "isCompoundTypeOverridden")
      || -[OADStroke isPenAlignmentOverridden](self, "isPenAlignmentOverridden")
      || -[OADStroke isHeadOverridden](self, "isHeadOverridden")
      || -[OADStroke isTailOverridden](self, "isTailOverridden");
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_object *v7;
  void *v8;
  objc_object *v9;
  OADColor *mColor;
  OADFill **p_mFill;
  id v12;
  void *v13;
  id v14;
  void *v15;
  OADFill *v16;
  char isKindOfClass;
  uint64_t v18;
  OADFill *v19;
  OADDash **p_mDash;
  id v21;
  void *v22;
  id v23;
  void *v24;
  OADDash *v25;
  char v26;
  uint64_t v27;
  OADDash *v28;
  OADLineJoin **p_mJoin;
  id v30;
  void *v31;
  id v32;
  void *v33;
  OADLineJoin *v34;
  char v35;
  uint64_t v36;
  OADLineJoin *v37;
  OADLineEnd **p_mHead;
  id v39;
  void *v40;
  id v41;
  void *v42;
  OADLineEnd *v43;
  char v44;
  uint64_t v45;
  OADLineEnd *v46;
  OADLineEnd **p_mTail;
  id v48;
  void *v49;
  id v50;
  void *v51;
  OADLineEnd *v52;
  char v53;
  uint64_t v54;
  OADLineEnd *v55;
  id v56;
  float v57;
  float v58;
  float v59;
  id v60;
  int v61;
  id v62;
  int v63;
  id v64;
  int v65;
  objc_super v66;

  v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)OADStroke;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v66, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if ((*((_BYTE *)self + 84) & 1) != 0
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_isColorOverridden);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[OADStroke color](self, "color");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isColorOverridden);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "color");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    if (TCObjectEqual(v7, v9))
    {
      mColor = self->mColor;
      self->mColor = 0;

      *((_BYTE *)self + 84) &= ~1u;
    }
    else if ((*((_BYTE *)self + 84) & 1) == 0 && v6)
    {
      -[OADStroke setColor:](self, "setColor:", v7);
    }

  }
  p_mFill = &self->mFill;
  if (self->mFill
    || (-[OADProperties parent](self, "parent"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    -[OADStroke fill](self, "fill");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init((Class)objc_opt_class());

    -[OADStroke fill](self, "fill");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setParent:", v15);

    objc_storeStrong((id *)&self->mFill, v14);
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isFillOverridden);
    v16 = (OADFill *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v4, "fill");
      v16 = (OADFill *)objc_claimAutoreleasedReturnValue();
    }
    if (*p_mFill == v16)
    {
      v19 = v16;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "defaultProperties");
        v18 = objc_claimAutoreleasedReturnValue();

        v16 = (OADFill *)v18;
      }
      -[OADProperties changeParentPreservingEffectiveValues:](*p_mFill, "changeParentPreservingEffectiveValues:", v16);
      if ((isKindOfClass & 1) == 0 || -[OADProperties isAnythingOverridden](*p_mFill, "isAnythingOverridden"))
        goto LABEL_27;
      v19 = *p_mFill;
    }
    *p_mFill = 0;

LABEL_27:
  }
  p_mDash = &self->mDash;
  if (self->mDash
    || (-[OADProperties parent](self, "parent"),
        v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 != v4))
  {
    -[OADStroke dash](self, "dash");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init((Class)objc_opt_class());

    -[OADStroke dash](self, "dash");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setParent:", v24);

    objc_storeStrong((id *)&self->mDash, v23);
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isDashOverridden);
    v25 = (OADDash *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v4, "dash");
      v25 = (OADDash *)objc_claimAutoreleasedReturnValue();
    }
    if (*p_mDash == v25)
    {
      v28 = v25;
    }
    else
    {
      objc_opt_class();
      v26 = objc_opt_isKindOfClass();
      if ((v26 & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "defaultProperties");
        v27 = objc_claimAutoreleasedReturnValue();

        v25 = (OADDash *)v27;
      }
      -[OADProperties changeParentPreservingEffectiveValues:](*p_mDash, "changeParentPreservingEffectiveValues:", v25);
      if ((v26 & 1) == 0 || -[OADProperties isAnythingOverridden](*p_mDash, "isAnythingOverridden"))
        goto LABEL_40;
      v28 = *p_mDash;
    }
    *p_mDash = 0;

LABEL_40:
  }
  p_mJoin = &self->mJoin;
  if (self->mJoin
    || (-[OADProperties parent](self, "parent"),
        v30 = (id)objc_claimAutoreleasedReturnValue(),
        v30,
        v30 != v4))
  {
    -[OADStroke join](self, "join");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc_init((Class)objc_opt_class());

    -[OADStroke join](self, "join");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setParent:", v33);

    objc_storeStrong((id *)&self->mJoin, v32);
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isJoinOverridden);
    v34 = (OADLineJoin *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v4, "join");
      v34 = (OADLineJoin *)objc_claimAutoreleasedReturnValue();
    }
    if (*p_mJoin == v34)
    {
      v37 = v34;
    }
    else
    {
      objc_opt_class();
      v35 = objc_opt_isKindOfClass();
      if ((v35 & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "defaultProperties");
        v36 = objc_claimAutoreleasedReturnValue();

        v34 = (OADLineJoin *)v36;
      }
      -[OADProperties changeParentPreservingEffectiveValues:](*p_mJoin, "changeParentPreservingEffectiveValues:", v34);
      if ((v35 & 1) == 0 || -[OADProperties isAnythingOverridden](*p_mJoin, "isAnythingOverridden"))
        goto LABEL_53;
      v37 = *p_mJoin;
    }
    *p_mJoin = 0;

LABEL_53:
  }
  p_mHead = &self->mHead;
  if (self->mHead
    || (-[OADProperties parent](self, "parent"),
        v39 = (id)objc_claimAutoreleasedReturnValue(),
        v39,
        v39 != v4))
  {
    -[OADStroke head](self, "head");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_alloc_init((Class)objc_opt_class());

    -[OADStroke head](self, "head");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setParent:", v42);

    objc_storeStrong((id *)&self->mHead, v41);
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isHeadOverridden);
    v43 = (OADLineEnd *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v4, "head");
      v43 = (OADLineEnd *)objc_claimAutoreleasedReturnValue();
    }
    if (*p_mHead == v43)
    {
      v46 = v43;
    }
    else
    {
      objc_opt_class();
      v44 = objc_opt_isKindOfClass();
      if ((v44 & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "defaultProperties");
        v45 = objc_claimAutoreleasedReturnValue();

        v43 = (OADLineEnd *)v45;
      }
      -[OADProperties changeParentPreservingEffectiveValues:](*p_mHead, "changeParentPreservingEffectiveValues:", v43);
      if ((v44 & 1) == 0 || -[OADLineEnd isAnythingOverridden](*p_mHead, "isAnythingOverridden"))
        goto LABEL_66;
      v46 = *p_mHead;
    }
    *p_mHead = 0;

LABEL_66:
  }
  p_mTail = &self->mTail;
  if (self->mTail
    || (-[OADProperties parent](self, "parent"),
        v48 = (id)objc_claimAutoreleasedReturnValue(),
        v48,
        v48 != v4))
  {
    -[OADStroke tail](self, "tail");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_alloc_init((Class)objc_opt_class());

    -[OADStroke tail](self, "tail");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setParent:", v51);

    objc_storeStrong((id *)&self->mTail, v50);
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isTailOverridden);
    v52 = (OADLineEnd *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v4, "tail");
      v52 = (OADLineEnd *)objc_claimAutoreleasedReturnValue();
    }
    if (*p_mTail == v52)
    {
      v55 = v52;
    }
    else
    {
      objc_opt_class();
      v53 = objc_opt_isKindOfClass();
      if ((v53 & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "defaultProperties");
        v54 = objc_claimAutoreleasedReturnValue();

        v52 = (OADLineEnd *)v54;
      }
      -[OADProperties changeParentPreservingEffectiveValues:](*p_mTail, "changeParentPreservingEffectiveValues:", v52);
      if ((v53 & 1) == 0 || -[OADLineEnd isAnythingOverridden](*p_mTail, "isAnythingOverridden"))
        goto LABEL_79;
      v55 = *p_mTail;
    }
    *p_mTail = 0;

LABEL_79:
  }
  if ((*((_BYTE *)self + 84) & 2) != 0
    || (-[OADProperties parent](self, "parent"),
        v56 = (id)objc_claimAutoreleasedReturnValue(),
        v56,
        v56 != v4))
  {
    -[OADStroke width](self, "width");
    v58 = v57;
    objc_msgSend(v4, "width");
    if (v58 == v59)
    {
      *((_BYTE *)self + 84) &= ~2u;
    }
    else if ((*((_BYTE *)self + 84) & 2) == 0)
    {
      -[OADStroke width](self, "width");
      -[OADStroke setWidth:](self, "setWidth:");
    }
  }
  if ((*((_BYTE *)self + 84) & 4) != 0
    || (-[OADProperties parent](self, "parent"),
        v60 = (id)objc_claimAutoreleasedReturnValue(),
        v60,
        v60 != v4))
  {
    v61 = -[OADStroke cap](self, "cap");
    if (v61 == objc_msgSend(v4, "cap"))
    {
      *((_BYTE *)self + 84) &= ~4u;
    }
    else if ((*((_BYTE *)self + 84) & 4) == 0)
    {
      -[OADStroke setCap:](self, "setCap:", -[OADStroke cap](self, "cap"));
    }
  }
  if ((*((_BYTE *)self + 84) & 8) != 0
    || (-[OADProperties parent](self, "parent"),
        v62 = (id)objc_claimAutoreleasedReturnValue(),
        v62,
        v62 != v4))
  {
    v63 = -[OADStroke compoundType](self, "compoundType");
    if (v63 == objc_msgSend(v4, "compoundType"))
    {
      *((_BYTE *)self + 84) &= ~8u;
    }
    else if ((*((_BYTE *)self + 84) & 8) == 0)
    {
      -[OADStroke setCompoundType:](self, "setCompoundType:", -[OADStroke compoundType](self, "compoundType"));
    }
  }
  if ((*((_BYTE *)self + 84) & 0x10) != 0
    || (-[OADProperties parent](self, "parent"),
        v64 = (id)objc_claimAutoreleasedReturnValue(),
        v64,
        v64 != v4))
  {
    v65 = -[OADStroke penAlignment](self, "penAlignment");
    if (v65 == objc_msgSend(v4, "penAlignment"))
    {
      *((_BYTE *)self + 84) &= ~0x10u;
    }
    else if ((*((_BYTE *)self + 84) & 0x10) == 0)
    {
      -[OADStroke setPenAlignment:](self, "setPenAlignment:", -[OADStroke penAlignment](self, "penAlignment"));
    }
  }

}

- (void)removeUnnecessaryOverrides
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  objc_object *v7;
  objc_object *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  OADColor *mColor;
  void *v13;
  objc_object *v14;
  objc_object *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  OADFill *mFill;
  void *v20;
  objc_object *v21;
  objc_object *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  OADDash *mDash;
  void *v27;
  objc_object *v28;
  objc_object *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  OADLineJoin *mJoin;
  void *v34;
  objc_object *v35;
  objc_object *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  OADLineEnd *mHead;
  void *v41;
  objc_object *v42;
  objc_object *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  OADLineEnd *mTail;
  void *v48;
  float v49;
  float v50;
  double v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  void *v56;
  int v57;
  objc_super v58;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  v4 = -[OADProperties isMerged](self, "isMerged");
  v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
  -[OADProperties setMerged:](self, "setMerged:", 0);
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
  if (-[OADStroke isColorOverridden](self, "isColorOverridden"))
  {
    -[OADProperties parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADStroke color](self, "color");
    v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "color");
    v8 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_object removeUnnecessaryOverrides](v7, "removeUnnecessaryOverrides");
      v9 = objc_opt_class();
      if (v9 != objc_opt_class())
        goto LABEL_9;
      v10 = -[objc_object isMergedWithParent](v7, "isMergedWithParent");
      -[objc_object setMergedWithParent:](v7, "setMergedWithParent:", 0);
      v11 = -[objc_object isAnythingOverridden](v7, "isAnythingOverridden");
      -[objc_object setMergedWithParent:](v7, "setMergedWithParent:", v10);
      if ((v11 & 1) != 0)
        goto LABEL_9;
    }
    else if (!TCObjectEqual(v7, v8))
    {
LABEL_9:

      goto LABEL_10;
    }
    mColor = self->mColor;
    self->mColor = 0;

    *((_BYTE *)self + 84) &= ~1u;
    goto LABEL_9;
  }
LABEL_10:
  if (!-[OADStroke isFillOverridden](self, "isFillOverridden"))
    goto LABEL_18;
  -[OADProperties parent](self, "parent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStroke fill](self, "fill");
  v14 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fill");
  v15 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v14, "removeUnnecessaryOverrides");
    v16 = objc_opt_class();
    if (v16 != objc_opt_class())
      goto LABEL_17;
    v17 = -[objc_object isMergedWithParent](v14, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v14, "setMergedWithParent:", 0);
    v18 = -[objc_object isAnythingOverridden](v14, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v14, "setMergedWithParent:", v17);
    if ((v18 & 1) != 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (TCObjectEqual(v14, v15))
  {
LABEL_16:
    mFill = self->mFill;
    self->mFill = 0;

  }
LABEL_17:

LABEL_18:
  if (!-[OADStroke isDashOverridden](self, "isDashOverridden"))
    goto LABEL_26;
  -[OADProperties parent](self, "parent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStroke dash](self, "dash");
  v21 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dash");
  v22 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v21, "removeUnnecessaryOverrides");
    v23 = objc_opt_class();
    if (v23 != objc_opt_class())
      goto LABEL_25;
    v24 = -[objc_object isMergedWithParent](v21, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v21, "setMergedWithParent:", 0);
    v25 = -[objc_object isAnythingOverridden](v21, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v21, "setMergedWithParent:", v24);
    if ((v25 & 1) != 0)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (TCObjectEqual(v21, v22))
  {
LABEL_24:
    mDash = self->mDash;
    self->mDash = 0;

  }
LABEL_25:

LABEL_26:
  if (!-[OADStroke isJoinOverridden](self, "isJoinOverridden"))
    goto LABEL_34;
  -[OADProperties parent](self, "parent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStroke join](self, "join");
  v28 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "join");
  v29 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v28, "removeUnnecessaryOverrides");
    v30 = objc_opt_class();
    if (v30 != objc_opt_class())
      goto LABEL_33;
    v31 = -[objc_object isMergedWithParent](v28, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v28, "setMergedWithParent:", 0);
    v32 = -[objc_object isAnythingOverridden](v28, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v28, "setMergedWithParent:", v31);
    if ((v32 & 1) != 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  if (TCObjectEqual(v28, v29))
  {
LABEL_32:
    mJoin = self->mJoin;
    self->mJoin = 0;

  }
LABEL_33:

LABEL_34:
  if (!-[OADStroke isHeadOverridden](self, "isHeadOverridden"))
    goto LABEL_42;
  -[OADProperties parent](self, "parent");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStroke head](self, "head");
  v35 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "head");
  v36 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v35, "removeUnnecessaryOverrides");
    v37 = objc_opt_class();
    if (v37 != objc_opt_class())
      goto LABEL_41;
    v38 = -[objc_object isMergedWithParent](v35, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v35, "setMergedWithParent:", 0);
    v39 = -[objc_object isAnythingOverridden](v35, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v35, "setMergedWithParent:", v38);
    if ((v39 & 1) != 0)
      goto LABEL_41;
    goto LABEL_40;
  }
  if (TCObjectEqual(v35, v36))
  {
LABEL_40:
    mHead = self->mHead;
    self->mHead = 0;

  }
LABEL_41:

LABEL_42:
  if (-[OADStroke isTailOverridden](self, "isTailOverridden"))
  {
    -[OADProperties parent](self, "parent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADStroke tail](self, "tail");
    v42 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "tail");
    v43 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_object removeUnnecessaryOverrides](v42, "removeUnnecessaryOverrides");
      v44 = objc_opt_class();
      if (v44 != objc_opt_class())
        goto LABEL_49;
      v45 = -[objc_object isMergedWithParent](v42, "isMergedWithParent");
      -[objc_object setMergedWithParent:](v42, "setMergedWithParent:", 0);
      v46 = -[objc_object isAnythingOverridden](v42, "isAnythingOverridden");
      -[objc_object setMergedWithParent:](v42, "setMergedWithParent:", v45);
      if ((v46 & 1) != 0)
        goto LABEL_49;
    }
    else if (!TCObjectEqual(v42, v43))
    {
LABEL_49:

      goto LABEL_50;
    }
    mTail = self->mTail;
    self->mTail = 0;

    goto LABEL_49;
  }
LABEL_50:
  if (-[OADStroke isWidthOverridden](self, "isWidthOverridden"))
  {
    -[OADProperties parent](self, "parent");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADStroke width](self, "width");
    v50 = v49;
    objc_msgSend(v48, "width");
    if (v50 == *(float *)&v51)
    {
      LODWORD(v51) = 0.75;
      -[OADStroke setWidth:](self, "setWidth:", v51);
      *((_BYTE *)self + 84) &= ~2u;
    }

  }
  if (-[OADStroke isCapOverridden](self, "isCapOverridden"))
  {
    -[OADProperties parent](self, "parent");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = -[OADStroke cap](self, "cap");
    if (v53 == objc_msgSend(v52, "cap"))
    {
      -[OADStroke setCap:](self, "setCap:", 2);
      *((_BYTE *)self + 84) &= ~4u;
    }

  }
  if (-[OADStroke isCompoundTypeOverridden](self, "isCompoundTypeOverridden"))
  {
    -[OADProperties parent](self, "parent");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[OADStroke compoundType](self, "compoundType");
    if (v55 == objc_msgSend(v54, "compoundType"))
    {
      -[OADStroke setCompoundType:](self, "setCompoundType:", 0);
      *((_BYTE *)self + 84) &= ~8u;
    }

  }
  if (-[OADStroke isPenAlignmentOverridden](self, "isPenAlignmentOverridden"))
  {
    -[OADProperties parent](self, "parent");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[OADStroke penAlignment](self, "penAlignment");
    if (v57 == objc_msgSend(v56, "penAlignment"))
    {
      -[OADStroke setPenAlignment:](self, "setPenAlignment:", 0);
      *((_BYTE *)self + 84) &= ~0x10u;
    }

  }
  -[OADProperties setMerged:](self, "setMerged:", v4);
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
  v58.receiver = self;
  v58.super_class = (Class)OADStroke;
  -[OADProperties removeUnnecessaryOverrides](&v58, sel_removeUnnecessaryOverrides);
}

void __30__OADStroke_defaultProperties__block_invoke()
{
  OADStroke *v0;
  void *v1;

  v0 = -[OADStroke initWithDefaults]([OADStroke alloc], "initWithDefaults");
  v1 = (void *)+[OADStroke defaultProperties]::defaultProperties;
  +[OADStroke defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isHeadOverridden
{
  return self->mHead || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isTailOverridden
{
  return self->mTail || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)cap
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isCapOverridden);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[76];

  return v3;
}

- (BOOL)isCapOverridden
{
  return (*((_BYTE *)self + 84) & 4) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (int)penAlignment
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isPenAlignmentOverridden);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[20];

  return v3;
}

- (BOOL)isPenAlignmentOverridden
{
  return (*((_BYTE *)self + 84) & 0x10) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTail, 0);
  objc_storeStrong((id *)&self->mHead, 0);
  objc_storeStrong((id *)&self->mJoin, 0);
  objc_storeStrong((id *)&self->mDash, 0);
  objc_storeStrong((id *)&self->mFill, 0);
  objc_storeStrong((id *)&self->mColor, 0);
}

@end
