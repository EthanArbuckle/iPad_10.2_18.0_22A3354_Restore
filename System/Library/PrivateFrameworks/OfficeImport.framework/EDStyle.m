@implementation EDStyle

- (EDStyle)initWithResources:(id)a3
{
  id v4;
  EDStyle *v5;
  EDStyle *v6;
  __int128 v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDStyle;
  v5 = -[EDStyle init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    *(_QWORD *)&v7 = -1;
    *((_QWORD *)&v7 + 1) = -1;
    *(_OWORD *)&v6->mParentIndex = xmmword_22A4C1930;
    *(_OWORD *)&v6->mFontIndex = v7;
    *(_OWORD *)&v6->mAlignmentInfoIndex = v7;
    v6->mIndex = -1;
    *(_QWORD *)&v6->mContentFormatOverridden = 0;
    *(_QWORD *)&v6->mFillApplied = 0;
  }

  return v6;
}

- (void)setParentIndex:(unint64_t)a3
{
  if (!self->mDoNotModify)
    self->mParentIndex = a3;
}

- (void)setFontIndex:(unint64_t)a3
{
  if (!self->mDoNotModify)
  {
    *(_WORD *)&self->mFontOverridden = 257;
    self->mFontIndex = a3;
  }
}

- (void)setAlignmentInfo:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->mDoNotModify)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    objc_msgSend(WeakRetained, "alignmentInfos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    self->mAlignmentInfoIndex = objc_msgSend(v6, "addOrEquivalentObject:", v7);
    *(_WORD *)&self->mAlignmentInfoOverridden = 257;

    v4 = v7;
  }

}

- (void)setBorders:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->mDoNotModify)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    objc_msgSend(WeakRetained, "borders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    self->mBordersIndex = objc_msgSend(v6, "addOrEquivalentObject:", v7);
    *(_WORD *)&self->mBordersOverridden = 257;

    v4 = v7;
  }

}

- (void)setFill:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->mDoNotModify)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    objc_msgSend(WeakRetained, "fills");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    self->mFillIndex = objc_msgSend(v6, "addOrEquivalentObject:", v7);
    *(_WORD *)&self->mFillOverridden = 257;

    v4 = v7;
  }

}

- (void)setProtection:(id)a3
{
  EDProtection *v5;
  EDProtection *v6;

  v5 = (EDProtection *)a3;
  if (!self->mDoNotModify && self->mProtection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mProtection, a3);
    v5 = v6;
    *(_WORD *)&self->mProtectionOverridden = 257;
  }

}

- (void)setContentFormatId:(unint64_t)a3
{
  if (!self->mDoNotModify)
  {
    *(_WORD *)&self->mContentFormatOverridden = 257;
    self->mContentFormatId = a3;
  }
}

- (void)setFontOverridden:(BOOL)a3
{
  if (!self->mDoNotModify)
    self->mFontOverridden = a3;
}

- (void)setAlignmentInfoOverridden:(BOOL)a3
{
  if (!self->mDoNotModify)
    self->mAlignmentInfoOverridden = a3;
}

- (void)setBordersOverridden:(BOOL)a3
{
  if (!self->mDoNotModify)
    self->mBordersOverridden = a3;
}

- (void)setFillOverridden:(BOOL)a3
{
  if (!self->mDoNotModify)
    self->mFillOverridden = a3;
}

- (void)setProtectionOverridden:(BOOL)a3
{
  if (!self->mDoNotModify)
    self->mProtectionOverridden = a3;
}

- (void)setContentFormatOverridden:(BOOL)a3
{
  if (!self->mDoNotModify)
    self->mContentFormatOverridden = a3;
}

- (void)setDoNotModify:(BOOL)a3
{
  self->mDoNotModify = a3;
}

- (void)setIndex:(unint64_t)a3
{
  self->mIndex = a3;
}

- (EDFont)font
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "fonts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mFontIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (EDFont *)v5;
}

- (BOOL)isAlignmentInfoOverridden
{
  return self->mAlignmentInfoOverridden;
}

- (BOOL)isBordersOverridden
{
  return self->mBordersOverridden;
}

- (EDFill)fill
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "fills");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mFillIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (EDFill *)v5;
}

- (EDAlignmentInfo)alignmentInfo
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "alignmentInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mAlignmentInfoIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (EDAlignmentInfo *)v5;
}

- (unint64_t)index
{
  return self->mIndex;
}

- (EDBorders)borders
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "borders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mBordersIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (EDBorders *)v5;
}

- (BOOL)isContentFormatOverridden
{
  return self->mContentFormatOverridden;
}

- (unint64_t)contentFormatId
{
  return self->mContentFormatId;
}

- (EDContentFormat)contentFormat
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "contentFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectWithKey:", self->mContentFormatId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (EDContentFormat *)v5;
}

- (BOOL)isFontOverridden
{
  return self->mFontOverridden;
}

- (void)setBordersIndex:(unint64_t)a3
{
  if (!self->mDoNotModify)
  {
    *(_WORD *)&self->mBordersOverridden = 257;
    self->mBordersIndex = a3;
  }
}

- (void)setFillIndex:(unint64_t)a3
{
  if (!self->mDoNotModify)
  {
    *(_WORD *)&self->mFillOverridden = 257;
    self->mFillIndex = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v5 = objc_alloc((Class)objc_opt_class());
  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v7 = objc_msgSend(v5, "initWithResources:", WeakRetained);

  if (v7)
  {
    *(_QWORD *)(v7 + 16) = self->mParentIndex;
    *(_QWORD *)(v7 + 24) = self->mContentFormatId;
    *(_QWORD *)(v7 + 32) = self->mFontIndex;
    *(_QWORD *)(v7 + 40) = self->mFillIndex;
    *(_QWORD *)(v7 + 48) = self->mAlignmentInfoIndex;
    *(_QWORD *)(v7 + 56) = self->mBordersIndex;
    v8 = -[EDProtection copyWithZone:](self->mProtection, "copyWithZone:", a3);
    v9 = *(void **)(v7 + 64);
    *(_QWORD *)(v7 + 64) = v8;

    *(_QWORD *)(v7 + 72) = self->mIndex;
    *(_BYTE *)(v7 + 80) = self->mContentFormatOverridden;
    *(_BYTE *)(v7 + 82) = self->mFontOverridden;
    *(_BYTE *)(v7 + 84) = self->mFillOverridden;
    *(_BYTE *)(v7 + 86) = self->mAlignmentInfoOverridden;
    *(_BYTE *)(v7 + 88) = self->mBordersOverridden;
    *(_BYTE *)(v7 + 90) = self->mProtectionOverridden;
    *(_BYTE *)(v7 + 83) = self->mFontApplied;
    *(_BYTE *)(v7 + 85) = self->mFillApplied;
    *(_BYTE *)(v7 + 87) = self->mAlignmentInfoApplied;
    *(_BYTE *)(v7 + 89) = self->mBordersApplied;
    *(_BYTE *)(v7 + 81) = self->mContentFormatApplied;
    *(_BYTE *)(v7 + 91) = self->mProtectionApplied;
    *(_BYTE *)(v7 + 92) = 0;
    v10 = (id)v7;
  }

  return (id)v7;
}

- (void)setFont:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->mDoNotModify)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    objc_msgSend(WeakRetained, "fonts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    self->mFontIndex = objc_msgSend(v6, "addOrEquivalentObject:", v7);
    *(_WORD *)&self->mFontOverridden = 257;

    v4 = v7;
  }

}

- (BOOL)isEqual:(id)a3
{
  EDStyle *v4;
  EDStyle *v5;
  BOOL v6;

  v4 = (EDStyle *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDStyle isEqualToStyle:](self, "isEqualToStyle:", v5);

  return v6;
}

- (BOOL)isEqualToStyle:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  BOOL v6;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  v6 = self->mContentFormatOverridden == v4[80]
    && self->mFontOverridden == v4[82]
    && self->mFillOverridden == v4[84]
    && self->mAlignmentInfoOverridden == v4[86]
    && self->mBordersOverridden == v4[88]
    && self->mProtectionOverridden == v4[90]
    && self->mParentIndex == *((_QWORD *)v4 + 2)
    && -[EDStyle isEquivalentToStyle:](self, "isEquivalentToStyle:", v4);

  return v6;
}

- (BOOL)isEquivalentToStyle:(id)a3
{
  char *v4;
  _QWORD *v5;
  EDProtection *mProtection;
  char v7;

  v4 = (char *)a3;
  v5 = v4;
  if (*(_OWORD *)&self->mContentFormatId == *(_OWORD *)(v4 + 24)
    && self->mFillIndex == *((_QWORD *)v4 + 5)
    && self->mBordersIndex == *((_QWORD *)v4 + 7)
    && self->mAlignmentInfoIndex == *((_QWORD *)v4 + 6))
  {
    mProtection = self->mProtection;
    if (mProtection == (EDProtection *)v5[8])
      v7 = 1;
    else
      v7 = -[EDProtection isEqual:](mProtection, "isEqual:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)styleWithResources:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithResources:", v3);

  return v4;
}

- (unint64_t)hash
{
  return (self->mFontIndex << 12)
       + (self->mParentIndex << 16)
       + (self->mBordersIndex << 8)
       + 16 * self->mContentFormatId
       + self->mFillIndex;
}

- (void)setContentFormat:(id)a3
{
  id v4;
  unint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (!self->mDoNotModify)
  {
    *(_WORD *)&self->mContentFormatOverridden = 257;
    v9 = v4;
    v5 = objc_msgSend(v4, "formatId");
    if (v5 == -1)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
      objc_msgSend(WeakRetained, "contentFormats");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "addOrEquivalentObject:", v9));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self->mContentFormatId = objc_msgSend(v8, "formatId");

    }
    else
    {
      self->mContentFormatId = v5;
    }
    v4 = v9;
  }

}

- (BOOL)isFillOverridden
{
  return self->mFillOverridden;
}

- (BOOL)isCenterAcrossAligned
{
  void *v2;
  void *v3;
  BOOL v4;

  -[EDStyle alignmentInfo](self, "alignmentInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "horizontalAlignment") == 6;
  else
    v4 = 0;

  return v4;
}

- (BOOL)isProtectionOverridden
{
  return self->mProtectionOverridden;
}

- (EDProtection)protection
{
  return self->mProtection;
}

- (id)parent
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_msgSend(WeakRetained, "styles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectAtIndex:", self->mParentIndex);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setParent:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->mDoNotModify)
  {
    v7 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    objc_msgSend(WeakRetained, "styles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    self->mParentIndex = objc_msgSend(v6, "addObject:", v7);
    v4 = v7;
  }

}

- (BOOL)isContentFormatApplied
{
  return self->mContentFormatApplied;
}

- (void)setContentFormatApplied:(BOOL)a3
{
  self->mContentFormatApplied = a3;
}

- (BOOL)isFontApplied
{
  return self->mFontApplied;
}

- (void)setFontApplied:(BOOL)a3
{
  self->mFontApplied = a3;
}

- (BOOL)isFillApplied
{
  return self->mFillApplied;
}

- (void)setFillApplied:(BOOL)a3
{
  self->mFillApplied = a3;
}

- (BOOL)isAlignmentInfoApplied
{
  return self->mAlignmentInfoApplied;
}

- (void)setAlignmentInfoApplied:(BOOL)a3
{
  self->mAlignmentInfoApplied = a3;
}

- (BOOL)isBordersApplied
{
  return self->mBordersApplied;
}

- (void)setBordersApplied:(BOOL)a3
{
  self->mBordersApplied = a3;
}

- (BOOL)isProtectionApplied
{
  return self->mProtectionApplied;
}

- (void)setProtectionApplied:(BOOL)a3
{
  self->mProtectionApplied = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProtection, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)fontIndex
{
  return self->mFontIndex;
}

- (unint64_t)parentIndex
{
  return self->mParentIndex;
}

- (unint64_t)bordersIndex
{
  return self->mBordersIndex;
}

- (unint64_t)fillIndex
{
  return self->mFillIndex;
}

- (unint64_t)alignmentInfoIndex
{
  return self->mAlignmentInfoIndex;
}

- (void)setAlignmentInfoIndex:(unint64_t)a3
{
  if (!self->mDoNotModify)
  {
    *(_WORD *)&self->mAlignmentInfoOverridden = 257;
    self->mAlignmentInfoIndex = a3;
  }
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDStyle;
  -[EDStyle description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
