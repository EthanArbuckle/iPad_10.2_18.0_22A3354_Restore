@implementation WDSection

- (id).cxx_construct
{
  *((_QWORD *)self + 35) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 63) = 0;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *((_QWORD *)self + 58) = 0;
  *((_QWORD *)self + 59) = 0;
  return self;
}

- (WDSection)initWithDocument:(id)a3
{
  id v4;
  WDSection *v5;
  WDSection *v6;
  WDText *v7;
  WDText *mText;
  WDText *v9;
  WDText *mEvenPageHeader;
  WDText *v11;
  WDText *mOddPageHeader;
  WDText *v13;
  WDText *mFirstPageHeader;
  WDText *v15;
  WDText *mEvenPageFooter;
  WDText *v17;
  WDText *mOddPageFooter;
  WDText *v19;
  WDText *mFirstPageFooter;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WDSection;
  v5 = -[WDSection init](&v22, sel_init);
  v6 = v5;
  if (v5)
  {
    *((_BYTE *)v5 + 8) = *((_BYTE *)v5 + 8) & 0xF8 | 1;
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v4, 0);
    mText = v6->mText;
    v6->mText = v7;

    v9 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v4, 2);
    mEvenPageHeader = v6->mEvenPageHeader;
    v6->mEvenPageHeader = v9;

    v11 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v4, 2);
    mOddPageHeader = v6->mOddPageHeader;
    v6->mOddPageHeader = v11;

    v13 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v4, 2);
    mFirstPageHeader = v6->mFirstPageHeader;
    v6->mFirstPageHeader = v13;

    v15 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v4, 2);
    mEvenPageFooter = v6->mEvenPageFooter;
    v6->mEvenPageFooter = v15;

    v17 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v4, 2);
    mOddPageFooter = v6->mOddPageFooter;
    v6->mOddPageFooter = v17;

    v19 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v4, 2);
    mFirstPageFooter = v6->mFirstPageFooter;
    v6->mFirstPageFooter = v19;

  }
  return v6;
}

- (id)text
{
  return self->mText;
}

- (id)oddPageHeader
{
  return self->mOddPageHeader;
}

- (id)evenPageHeader
{
  return self->mEvenPageHeader;
}

- (id)firstPageHeader
{
  return self->mFirstPageHeader;
}

- (id)oddPageFooter
{
  return self->mOddPageFooter;
}

- (id)evenPageFooter
{
  return self->mEvenPageFooter;
}

- (id)firstPageFooter
{
  return self->mFirstPageFooter;
}

- (void)setResolveMode:(int)a3
{
  *((_BYTE *)self + 8) = (2 * (a3 == 1)) | (4 * (a3 == 2)) | (a3 == 0) | *((_BYTE *)self + 8) & 0xF8;
}

- (void)setPageWidth:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 336;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 112;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x40u;
}

- (void)setPageHeight:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 344;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 120;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x80u;
}

- (void)setLeftMargin:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 368;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 144;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x800u;
}

- (void)setRightMargin:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 376;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 152;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x1000u;
}

- (void)setTopMargin:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 384;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 160;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x2000u;
}

- (void)setBottomMargin:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 392;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 168;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x4000u;
}

- (void)setGutterMargin:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 416;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 192;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x20000u;
}

- (int)resolveMode
{
  unsigned int v2;
  int v3;

  v2 = *((unsigned __int8 *)self + 8);
  if ((v2 & 2) != 0)
    v3 = 1;
  else
    v3 = (v2 >> 1) & 2;
  if ((v2 & 1) != 0)
    return 0;
  else
    return v3;
}

- (BOOL)isColumnCountOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL4 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x80000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return *v2 >> 31;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x80000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x80000000) != 0)
        return *v2 >> 31;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = v5 & 0x80000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (void)setPageOrientation:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 356;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 132;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x200u;
}

- (BOOL)isPageWidthOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x40;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 6) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x40) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x40) != 0)
        return ((unint64_t)*v2 >> 6) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x40;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int64_t)pageWidth
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x40) != 0)
  {
    v3 = 336;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x40) == 0)
      return 0;
    v3 = 112;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (BOOL)isPageHeightOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x80;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 7) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x80) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x80) != 0)
        return ((unint64_t)*v2 >> 7) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x80;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int64_t)pageHeight
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x80) != 0)
  {
    v3 = 344;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x80) == 0)
      return 0;
    v3 = 120;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (int64_t)leftMargin
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x800) != 0)
  {
    v3 = 368;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x800) == 0)
      return 1800;
    v3 = 144;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (int64_t)rightMargin
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x1000) != 0)
  {
    v3 = 376;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x1000) == 0)
      return 1800;
    v3 = 152;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (int64_t)topMargin
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x2000) != 0)
  {
    v3 = 384;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x2000) == 0)
      return 1440;
    v3 = 160;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (int64_t)bottomMargin
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x4000) != 0)
  {
    v3 = 392;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x4000) == 0)
      return 1440;
    v3 = 168;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (BOOL)isLeftMarginOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x800;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 11) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x800) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x800) != 0)
        return ((unint64_t)*v2 >> 11) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x800;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)isRightMarginOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x1000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 12) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x1000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x1000) != 0)
        return ((unint64_t)*v2 >> 12) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x1000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)isTopMarginOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x2000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 13) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x2000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x2000) != 0)
        return ((unint64_t)*v2 >> 13) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x2000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)isBottomMarginOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x4000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 14) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x4000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x4000) != 0)
        return ((unint64_t)*v2 >> 14) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x4000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)isBreakTypeOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x20;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 5) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x20) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x20) != 0)
        return ((unint64_t)*v2 >> 5) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x20;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)isTitlePageOverridden
{
  unint64_t v2;
  _BOOL4 v3;
  unint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x2000000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 5) & 1;
      goto LABEL_10;
    }
    v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x2000000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x2000000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 5) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x2000000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (void)setTitlePage:(BOOL)a3
{
  uint64_t v3;
  unsigned int *v4;
  unint64_t v5;
  __int16 v6;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
  }
  v4 = (unsigned int *)((char *)self + v3);
  v5 = (*v4 | ((unint64_t)*((unsigned __int16 *)v4 + 2) << 32)) & 0xFFFFFFCFFFFFFFFFLL;
  v6 = 32;
  if (a3)
    v6 = 48;
  *v4 = *v4;
  *((_WORD *)v4 + 2) = v6 | WORD2(v5);
}

- (int64_t)headerMargin
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x8000) != 0)
  {
    v3 = 400;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x8000) == 0)
      return 720;
    v3 = 176;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (BOOL)titlePage
{
  unint64_t v2;
  unint64_t v3;
  _BOOL8 v4;

  if ((*((_BYTE *)self + 8) & 6) != 0
    && (v2 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                    + 110) << 32),
        (v2 & 0x2000000000) != 0))
  {
    return (v2 >> 36) & 1;
  }
  else if ((*((_BYTE *)self + 8) & 5) != 0)
  {
    v3 = *((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                 + 110) << 32);
    LOBYTE(v4) = (v3 & 0x2000000000) != 0 && (v3 & 0x1000000000) != 0;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setBreakType:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 328;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 104;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x20u;
}

- (void)setHeaderMargin:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 400;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 176;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x8000u;
}

- (void)setBorderDepth:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 428;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 204;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x80000u;
}

- (void)setBorderDisplay:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 432;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 208;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x100000u;
}

- (void)setBorderOffset:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 436;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 212;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x200000u;
}

- (void)setPageNumberStart:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 456;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 232;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x8000000u;
}

- (void)setPageNumberRestart:(BOOL)a3
{
  uint64_t v3;
  char *v4;
  unint64_t v5;
  int v6;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
  }
  v4 = (char *)self + v3;
  v5 = *(_DWORD *)v4 & 0xCFFFFFFF | ((unint64_t)*((unsigned __int16 *)v4 + 2) << 32);
  v6 = 0x20000000;
  if (a3)
    v6 = 805306368;
  *(_DWORD *)v4 = v6 | *(_DWORD *)v4 & 0xCFFFFFFF;
  *((_WORD *)v4 + 2) = WORD2(v5);
}

- (void)setColumnCount:(unsigned __int16)a3
{
  _DWORD *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *columnWidths;
  NSMutableArray *columnSpaces;

  v5 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    columnWidths = self->mTrackedProperties.columnWidths;
    self->mTrackedProperties.columnWidths = 0;

    columnSpaces = self->mTrackedProperties.columnSpaces;
    self->mTrackedProperties.columnSpaces = 0;

    self->mTrackedProperties.columnCount = a3;
    v5[56] |= 0x80000000;
  }
  else if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v6 = self->mOriginalProperties.columnWidths;
    self->mOriginalProperties.columnWidths = 0;

    v7 = self->mOriginalProperties.columnSpaces;
    self->mOriginalProperties.columnSpaces = 0;

    self->mOriginalProperties.columnCount = a3;
    *v5 |= 0x80000000;
    if ((v5[56] & 0x80000000) == 0)
    {
      v8 = self->mTrackedProperties.columnWidths;
      self->mTrackedProperties.columnWidths = 0;

      v9 = self->mTrackedProperties.columnSpaces;
      self->mTrackedProperties.columnSpaces = 0;

    }
  }
}

- (void)setColumnSpace:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 488;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 264;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_WORD *)((char *)&self->super.isa + v3 + 4) |= 4u;
}

- (unsigned)columnCount
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x80000000) != 0)
  {
    v3 = 480;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x80000000) == 0)
      return 0;
    v3 = 256;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (void)setFooterMargin:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 408;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 184;
  }
  *(Class *)((char *)&self->super.isa + v4) = (Class)a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x10000u;
}

- (int)breakType
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x20) != 0)
  {
    v3 = 328;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x20) == 0)
      return 2;
    v3 = 104;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (void)setLineNumberDistance:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 444;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 220;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x1000000u;
}

- (void)setColumnsEqualWidth:(BOOL)a3
{
  uint64_t v3;
  unsigned int *v4;
  unint64_t v5;
  __int16 v6;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
  }
  v4 = (unsigned int *)((char *)self + v3);
  v5 = (*v4 | ((unint64_t)*((unsigned __int16 *)v4 + 2) << 32)) & 0xFFFFFFFCFFFFFFFFLL;
  v6 = 2;
  if (a3)
    v6 = 3;
  *v4 = *v4;
  *((_WORD *)v4 + 2) = v6 | WORD2(v5);
}

- (void)appendColumnWidth:(int64_t)a3
{
  NSMutableArray *columnWidths;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    columnWidths = self->mTrackedProperties.columnWidths;
    if (!columnWidths)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = self->mTrackedProperties.columnWidths;
      self->mTrackedProperties.columnWidths = v6;

      columnWidths = self->mTrackedProperties.columnWidths;
    }
    goto LABEL_9;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    columnWidths = self->mOriginalProperties.columnWidths;
    if (!columnWidths)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v9 = self->mOriginalProperties.columnWidths;
      self->mOriginalProperties.columnWidths = v8;

      columnWidths = self->mOriginalProperties.columnWidths;
    }
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](columnWidths, "addObject:");

  }
}

- (void)appendColumnSpace:(int64_t)a3
{
  NSMutableArray *columnSpaces;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    columnSpaces = self->mTrackedProperties.columnSpaces;
    if (!columnSpaces)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = self->mTrackedProperties.columnSpaces;
      self->mTrackedProperties.columnSpaces = v6;

      columnSpaces = self->mTrackedProperties.columnSpaces;
    }
    goto LABEL_9;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    columnSpaces = self->mOriginalProperties.columnSpaces;
    if (!columnSpaces)
    {
      v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v9 = self->mOriginalProperties.columnSpaces;
      self->mOriginalProperties.columnSpaces = v8;

      columnSpaces = self->mOriginalProperties.columnSpaces;
    }
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](columnSpaces, "addObject:");

  }
}

- (void)setLineNumberIncrement:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 442;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 218;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x800000u;
}

- (void)setLineNumberRestart:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 448;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 224;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x2000000u;
}

- (BOOL)isColumnsEqualWidthOverridden
{
  unint64_t v2;
  _BOOL4 v3;
  unint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x200000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 1) & 1;
      goto LABEL_10;
    }
    v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x200000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x200000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 1) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x200000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (void)setPageNumberFormat:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 452;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 228;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x4000000u;
}

- (void)setVerticalJustification:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 496;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 272;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_WORD *)((char *)&self->super.isa + v3 + 4) |= 8u;
}

- (id)mutableRightBorder
{
  WDBorder *v2;
  WDBorder *rightBorder;
  WDBorder **p_rightBorder;
  uint64_t v5;
  WDBorder *v6;
  WDBorder *v7;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    rightBorder = self->mTrackedProperties.rightBorder;
    if (!rightBorder)
    {
      p_rightBorder = &self->mTrackedProperties.rightBorder;
      v5 = 512;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 0x10u;
      v6 = objc_alloc_init(WDBorder);
      v7 = *p_rightBorder;
      *p_rightBorder = v6;

      rightBorder = *p_rightBorder;
    }
LABEL_9:
    v2 = rightBorder;
    return v2;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    p_rightBorder = &self->mOriginalProperties.rightBorder;
    rightBorder = self->mOriginalProperties.rightBorder;
    if (!rightBorder)
    {
      v5 = 288;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v2 = 0;
  return v2;
}

- (void)setFormattingChanged:(BOOL)a3
{
  uint64_t v3;
  unsigned int *v4;
  unint64_t v5;
  __int16 v6;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
  }
  v4 = (unsigned int *)((char *)self + v3);
  v5 = (*v4 | ((unint64_t)*((unsigned __int16 *)v4 + 2) << 32)) & 0xFFFFFF3FFFFFFFFFLL;
  v6 = 128;
  if (a3)
    v6 = 192;
  *v4 = *v4;
  *((_WORD *)v4 + 2) = v6 | WORD2(v5);
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 500;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 276;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_WORD *)((char *)&self->super.isa + v3 + 4) |= 0x100u;
}

- (void)setFormattingChangeDate:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v8 = v5;
    v6 = 512;
    v7 = 504;
    goto LABEL_5;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v8 = v5;
    v6 = 288;
    v7 = 280;
LABEL_5:
    objc_storeStrong((id *)((char *)&self->super.isa + v7), a3);
    *(_WORD *)((char *)&self->super.isa + v6 + 4) |= 0x200u;
    v5 = v8;
  }

}

- (id)mutableTopBorder
{
  WDBorder *v2;
  WDBorder *topBorder;
  $C6FBB2F60FAB8DA2C926A6C0206BDD86 *p_mTrackedProperties;
  uint64_t v5;
  WDBorder *v6;
  WDBorder *v7;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    topBorder = self->mTrackedProperties.topBorder;
    if (!topBorder)
    {
      p_mTrackedProperties = &self->mTrackedProperties;
      v5 = 512;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 2u;
      v6 = objc_alloc_init(WDBorder);
      v7 = p_mTrackedProperties->topBorder;
      p_mTrackedProperties->topBorder = v6;

      topBorder = p_mTrackedProperties->topBorder;
    }
LABEL_9:
    v2 = topBorder;
    return v2;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    p_mTrackedProperties = &self->mOriginalProperties;
    topBorder = self->mOriginalProperties.topBorder;
    if (!topBorder)
    {
      v5 = 288;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v2 = 0;
  return v2;
}

- (id)mutableLeftBorder
{
  WDBorder *v2;
  WDBorder *leftBorder;
  WDBorder **p_leftBorder;
  uint64_t v5;
  WDBorder *v6;
  WDBorder *v7;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    leftBorder = self->mTrackedProperties.leftBorder;
    if (!leftBorder)
    {
      p_leftBorder = &self->mTrackedProperties.leftBorder;
      v5 = 512;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 4u;
      v6 = objc_alloc_init(WDBorder);
      v7 = *p_leftBorder;
      *p_leftBorder = v6;

      leftBorder = *p_leftBorder;
    }
LABEL_9:
    v2 = leftBorder;
    return v2;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    p_leftBorder = &self->mOriginalProperties.leftBorder;
    leftBorder = self->mOriginalProperties.leftBorder;
    if (!leftBorder)
    {
      v5 = 288;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v2 = 0;
  return v2;
}

- (id)mutableBottomBorder
{
  WDBorder *v2;
  WDBorder *bottomBorder;
  WDBorder **p_bottomBorder;
  uint64_t v5;
  WDBorder *v6;
  WDBorder *v7;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    bottomBorder = self->mTrackedProperties.bottomBorder;
    if (!bottomBorder)
    {
      p_bottomBorder = &self->mTrackedProperties.bottomBorder;
      v5 = 512;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 8u;
      v6 = objc_alloc_init(WDBorder);
      v7 = *p_bottomBorder;
      *p_bottomBorder = v6;

      bottomBorder = *p_bottomBorder;
    }
LABEL_9:
    v2 = bottomBorder;
    return v2;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    p_bottomBorder = &self->mOriginalProperties.bottomBorder;
    bottomBorder = self->mOriginalProperties.bottomBorder;
    if (!bottomBorder)
    {
      v5 = 288;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v2 = 0;
  return v2;
}

- (void)setPageScale:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 352;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 128;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x100u;
}

- (void)setTextDirection:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 360;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 136;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x400u;
}

- (void)setLineNumberStart:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 440;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 216;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x400000u;
}

- (unsigned)pageScale
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x100) != 0)
  {
    v3 = 352;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x100) == 0)
      return 1;
    v3 = 128;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isPageScaleOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x100;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 8) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x100) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x100) != 0)
        return ((unint64_t)*v2 >> 8) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x100;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)textDirection
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x400) != 0)
  {
    v3 = 360;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x400) == 0)
      return 1;
    v3 = 136;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isTextDirectionOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x400;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 10) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x400) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x400) != 0)
        return ((unint64_t)*v2 >> 10) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x400;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)pageOrientation
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x200) != 0)
  {
    v3 = 356;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x200) == 0)
      return 1;
    v3 = 132;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isPageOrientationOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x200;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 9) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x200) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x200) != 0)
        return ((unint64_t)*v2 >> 9) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x200;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)isHeaderMarginOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = (unsigned __int16)*((_DWORD *)&self->mTrackedProperties + 54) & 0x8000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 15) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x8000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x8000) != 0)
        return ((unint64_t)*v2 >> 15) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = (unsigned __int16)*((_DWORD *)&self->mTrackedProperties + 54) & 0x8000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int64_t)footerMargin
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x10000) != 0)
  {
    v3 = 408;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x10000) == 0)
      return 720;
    v3 = 184;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (BOOL)isFooterMarginOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x10000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 16) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x10000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x10000) != 0)
        return ((unint64_t)*v2 >> 16) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *(_QWORD *)&v5 & 0x10000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int64_t)gutterMargin
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x20000) != 0)
  {
    v3 = 416;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x20000) == 0)
      return 0;
    v3 = 192;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (BOOL)isGutterMarginOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x20000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 17) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x20000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x20000) != 0)
        return ((unint64_t)*v2 >> 17) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *(_QWORD *)&v5 & 0x20000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)rtlGutter
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x40000) != 0)
  {
    v3 = 424;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x40000) == 0)
      return 0;
    v3 = 200;
  }
  return *((_BYTE *)&self->super.isa + v3) != 0;
}

- (void)setRtlGutter:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 424;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 200;
  }
  *((_BYTE *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x40000u;
}

- (BOOL)isRtlGutterOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x40000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 18) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x40000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x40000) != 0)
        return ((unint64_t)*v2 >> 18) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *(_QWORD *)&v5 & 0x40000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (id)topBorder
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 2) != 0)
  {
    v3 = 296;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 2) == 0)
      return 0;
    v3 = 72;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isTopBorderOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 2;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 1) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 2) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 2) != 0)
        return ((unint64_t)*v2 >> 1) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 2;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (id)leftBorder
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 4) != 0)
  {
    v3 = 304;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 4) == 0)
      return 0;
    v3 = 80;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isLeftBorderOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 4;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 2) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 4) != 0)
        return ((unint64_t)*v2 >> 2) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 4;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (id)bottomBorder
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 8) != 0)
  {
    v3 = 312;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 8) == 0)
      return 0;
    v3 = 88;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isBottomBorderOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 8;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 3) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 8) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 8) != 0)
        return ((unint64_t)*v2 >> 3) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 8;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (id)rightBorder
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x10) != 0)
  {
    v3 = 320;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x10) == 0)
      return 0;
    v3 = 96;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isRightBorderOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x10;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 4) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 54) & 0x10) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x10) != 0)
        return ((unint64_t)*v2 >> 4) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x10;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)borderDepth
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x80000) != 0)
  {
    v3 = 428;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x80000) == 0)
      return 0;
    v3 = 204;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isBorderDepthOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x80000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 19) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x80000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x80000) != 0)
        return ((unint64_t)*v2 >> 19) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *(_QWORD *)&v5 & 0x80000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)borderDisplay
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x100000) != 0)
  {
    v3 = 432;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x100000) == 0)
      return 0;
    v3 = 208;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isBorderDisplayOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x100000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 20) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x100000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x100000) != 0)
        return ((unint64_t)*v2 >> 20) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *(_QWORD *)&v5 & 0x100000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)borderOffset
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x200000) != 0)
  {
    v3 = 436;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x200000) == 0)
      return 0;
    v3 = 212;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isBorderOffsetOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x200000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 21) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x200000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x200000) != 0)
        return ((unint64_t)*v2 >> 21) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *(_QWORD *)&v5 & 0x200000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (signed)lineNumberStart
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x400000) != 0)
  {
    v3 = 440;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((_BYTE *)self + 8) & 5) != 0 && (*((_DWORD *)&self->mOriginalProperties + 54) & 0x400000) != 0)
  {
    v3 = 216;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (BOOL)isLineNumberStartOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x400000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 22) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x400000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x400000) != 0)
        return ((unint64_t)*v2 >> 22) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *(_QWORD *)&v5 & 0x400000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (unsigned)lineNumberIncrement
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x800000) != 0)
  {
    v3 = 442;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x800000) == 0)
      return 0;
    v3 = 218;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isLineNumberIncrementOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x800000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 23) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x800000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x800000) != 0)
        return ((unint64_t)*v2 >> 23) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = *(_QWORD *)&v5 & 0x800000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (signed)lineNumberDistance
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x1000000) != 0)
  {
    v3 = 444;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((_BYTE *)self + 8) & 5) != 0 && (*((_DWORD *)&self->mOriginalProperties + 54) & 0x1000000) != 0)
  {
    v3 = 220;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (BOOL)isLineNumberDistanceOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x1000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 24) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x1000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x1000000) != 0)
        return ((unint64_t)*v2 >> 24) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = v5 & 0x1000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)lineNumberRestart
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x2000000) != 0)
  {
    v3 = 448;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x2000000) == 0)
      return 0;
    v3 = 224;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isLineNumberRestartOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x2000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 25) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x2000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x2000000) != 0)
        return ((unint64_t)*v2 >> 25) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = v5 & 0x2000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)pageNumberFormat
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x4000000) != 0)
  {
    v3 = 452;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x4000000) == 0)
      return 0;
    v3 = 228;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isPageNumberFormatOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x4000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 26) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x4000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x4000000) != 0)
        return ((unint64_t)*v2 >> 26) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = v5 & 0x4000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (unsigned)pageNumberStart
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x8000000) != 0)
  {
    v3 = 456;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x8000000) == 0)
      return 0;
    v3 = 232;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isPageNumberStartOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x8000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 27) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x8000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x8000000) != 0)
        return ((unint64_t)*v2 >> 27) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = v5 & 0x8000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (BOOL)pageNumberRestart
{
  uint64_t v2;

  if ((*((_BYTE *)self + 8) & 6) != 0
    && (v2 = *((unsigned int *)&self->mTrackedProperties + 54), (v2 & 0x20000000) != 0))
  {
    return ((v2 | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32)) >> 28) & 1;
  }
  else
  {
    LOBYTE(self) = (*((_BYTE *)self + 8) & 5) != 0
                && (*((_DWORD *)&self->mOriginalProperties + 54) & 0x20000000) != 0
                && (*((_DWORD *)&self->mOriginalProperties + 54) & 0x10000000) != 0;
  }
  return (char)self;
}

- (BOOL)isPageNumberRestartOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x20000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 29) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x20000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x20000000) != 0)
        return ((unint64_t)*v2 >> 29) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = v5 & 0x20000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int)chapterNumberSeparator
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x40000000) != 0)
  {
    v3 = 460;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 54) & 0x40000000) == 0)
      return 0;
    v3 = 236;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (void)setChapterNumberSeparator:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
    v4 = 460;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
    v4 = 236;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x40000000u;
}

- (BOOL)isChapterNumberSeparatorOverridden
{
  _DWORD *v2;
  uint64_t v3;
  _BOOL8 v4;
  int v5;

  v2 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = *((_DWORD *)&self->mTrackedProperties + 54) & 0x40000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return ((unint64_t)*v2 >> 30) & 1;
      goto LABEL_10;
    }
    v5 = *((_DWORD *)&self->mTrackedProperties + 54);
    if ((v5 & 0x40000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0 || (*v2 & 0x40000000) != 0)
        return ((unint64_t)*v2 >> 30) & 1;
LABEL_10:
      LOBYTE(v4) = 0;
      return v4;
    }
    v3 = v5 & 0x40000000;
  }
  LOBYTE(v4) = v3 != 0;
  return v4;
}

- (int64_t)columnWidthAt:(unsigned int)a3
{
  char v5;
  void *v6;
  int v7;
  int64_t v8;

  v5 = *((_BYTE *)self + 8);
  if ((v5 & 6) != 0)
  {
    if (-[NSMutableArray count](self->mTrackedProperties.columnWidths, "count") > (unint64_t)a3)
    {
      -[NSMutableArray objectAtIndex:](self->mTrackedProperties.columnWidths, "objectAtIndex:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "intValue");
      goto LABEL_8;
    }
    v5 = *((_BYTE *)self + 8);
  }
  if ((v5 & 5) == 0 || -[NSMutableArray count](self->mOriginalProperties.columnWidths, "count") <= (unint64_t)a3)
    return 0;
  -[NSMutableArray objectAtIndex:](self->mOriginalProperties.columnWidths, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");
LABEL_8:
  v8 = v7;

  return v8;
}

- (BOOL)isLastColumnWidthDefined
{
  _DWORD *v3;
  char v4;
  unint64_t columnCount;
  unint64_t v6;

  v3 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  v4 = *((_BYTE *)self + 8);
  if ((v4 & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x80000000) != 0)
  {
    columnCount = self->mTrackedProperties.columnCount;
    if (-[NSMutableArray count](self->mTrackedProperties.columnWidths, "count") >= columnCount)
      return 1;
    v4 = *((_BYTE *)self + 8);
  }
  if ((v4 & 5) == 0)
    return 0;
  if ((*v3 & 0x80000000) == 0)
    return 0;
  v6 = self->mOriginalProperties.columnCount;
  return -[NSMutableArray count](self->mOriginalProperties.columnWidths, "count") >= v6;
}

- (BOOL)isColumnWidthDefinedAt:(unsigned int)a3
{
  _DWORD *v5;
  char v6;

  v5 = (_DWORD *)((char *)&self->mOriginalProperties + 216);
  v6 = *((_BYTE *)self + 8);
  if ((v6 & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 54) & 0x80000000) != 0)
  {
    if (-[NSMutableArray count](self->mTrackedProperties.columnWidths, "count") > (unint64_t)a3)
      return 1;
    v6 = *((_BYTE *)self + 8);
  }
  return (v6 & 5) != 0
      && (*v5 & 0x80000000) != 0
      && -[NSMutableArray count](self->mOriginalProperties.columnWidths, "count") > (unint64_t)a3;
}

- (int64_t)columnSpaceAt:(unsigned int)a3
{
  char v5;
  void *v6;
  int64_t v7;

  v5 = *((_BYTE *)self + 8);
  if ((v5 & 6) != 0)
  {
    if (-[NSMutableArray count](self->mTrackedProperties.columnSpaces, "count") > (unint64_t)a3)
    {
      -[NSMutableArray objectAtIndex:](self->mTrackedProperties.columnSpaces, "objectAtIndex:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (int)objc_msgSend(v6, "intValue");
      goto LABEL_8;
    }
    v5 = *((_BYTE *)self + 8);
  }
  if ((v5 & 5) == 0 || -[NSMutableArray count](self->mOriginalProperties.columnSpaces, "count") <= (unint64_t)a3)
    return 0;
  -[NSMutableArray objectAtIndex:](self->mOriginalProperties.columnSpaces, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");
LABEL_8:

  return v7;
}

- (BOOL)columnsEqualWidth
{
  unint64_t v2;
  unint64_t v3;
  _BOOL8 v4;

  if ((*((_BYTE *)self + 8) & 6) != 0
    && (v2 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                    + 110) << 32),
        (v2 & 0x200000000) != 0))
  {
    return HIDWORD(v2) & 1;
  }
  else if ((*((_BYTE *)self + 8) & 5) != 0)
  {
    v3 = *((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                 + 110) << 32);
    if ((v3 & 0x200000000) != 0)
      LOBYTE(v4) = BYTE4(v3) & 1;
    else
      LOBYTE(v4) = 0;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (int64_t)columnSpace
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32)) & 0x400000000) != 0)
  {
    v3 = 488;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                   + 110) << 32)) & 0x400000000) == 0)
    {
      return 720;
    }
    v3 = 264;
  }
  return *(int64_t *)((char *)&self->super.isa + v3);
}

- (BOOL)isColumnSpaceOverridden
{
  unint64_t v2;
  _BOOL4 v3;
  unint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x400000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 2) & 1;
      goto LABEL_10;
    }
    v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x400000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x400000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 2) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x400000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)verticalJustification
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32)) & 0x800000000) != 0)
  {
    v3 = 496;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                   + 110) << 32)) & 0x800000000) == 0)
    {
      return 0;
    }
    v3 = 272;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isVerticalJustificationOverridden
{
  unint64_t v2;
  _BOOL4 v3;
  unint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x800000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 3) & 1;
      goto LABEL_10;
    }
    v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x800000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x800000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 3) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x800000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)bidi
{
  if ((*((_BYTE *)self + 8) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32)) & 0x40000000000) != 0)
  {
    return *((_DWORD *)&self->mTrackedProperties + 54) & 1;
  }
  if ((*((_BYTE *)self + 8) & 5) == 0)
    return 0;
  if (((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                 + 110) << 32)) & 0x40000000000) != 0)
    return *((_BYTE *)&self->mOriginalProperties + 216) & 1;
  return 0;
}

- (void)setBidi:(BOOL)a3
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  unint64_t v6;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v3 = 512;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 1) == 0)
      return;
    v3 = 288;
  }
  v4 = (unsigned int *)((char *)self + v3);
  v5 = *v4;
  v6 = v5 & 0xFFFFFFFFFFFFFFFELL | ((unint64_t)*((unsigned __int16 *)v4 + 2) << 32) | a3 | 0x40000000000;
  *v4 = v5 & 0xFFFFFFFE | a3;
  *((_WORD *)v4 + 2) = WORD2(v6);
}

- (BOOL)isBidiOverridden
{
  unint64_t v2;
  _BOOL4 v3;
  unint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x40000000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 10) & 1;
      goto LABEL_10;
    }
    v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x40000000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x40000000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 10) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x40000000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)formattingChanged
{
  unint64_t v2;
  unint64_t v3;
  _BOOL8 v4;

  if ((*((_BYTE *)self + 8) & 6) != 0
    && (v2 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                    + 110) << 32),
        (v2 & 0x8000000000) != 0))
  {
    return (v2 >> 38) & 1;
  }
  else if ((*((_BYTE *)self + 8) & 5) != 0)
  {
    v3 = *((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                 + 110) << 32);
    LOBYTE(v4) = (v3 & 0x8000000000) != 0 && (v3 & 0x4000000000) != 0;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isFormattingChangedOverridden
{
  unint64_t v2;
  _BOOL4 v3;
  unint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x8000000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 7) & 1;
      goto LABEL_10;
    }
    v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x8000000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x8000000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 7) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x8000000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32)) & 0x10000000000) != 0)
  {
    v3 = 500;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                   + 110) << 32)) & 0x10000000000) == 0)
    {
      return 0;
    }
    v3 = 276;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden
{
  unint64_t v2;
  unint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x10000000000;
    return v2 != 0;
  }
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x10000000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x10000000000) != 0)
      {
        return *((_BYTE *)&self->mOriginalProperties + 221) & 1;
      }
      return 0;
    }
    v2 = v4 & 0x10000000000;
    return v2 != 0;
  }
  if ((*((_BYTE *)self + 8) & 1) == 0)
    return 0;
  return *((_BYTE *)&self->mOriginalProperties + 221) & 1;
}

- (id)formattingChangeDate
{
  uint64_t v3;

  if ((*((_BYTE *)self + 8) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32)) & 0x20000000000) != 0)
  {
    v3 = 504;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                   + 110) << 32)) & 0x20000000000) == 0)
    {
      return 0;
    }
    v3 = 280;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isFormattingChangeDateOverridden
{
  unint64_t v2;
  _BOOL4 v3;
  unint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v2 = ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties + 110) << 32) & 0x20000000000;
  }
  else
  {
    if ((*((_BYTE *)self + 8) & 4) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0)
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 9) & 1;
      goto LABEL_10;
    }
    v4 = *((unsigned int *)&self->mTrackedProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mTrackedProperties
                                                                                + 110) << 32);
    if ((v4 & 0x20000000000) == 0)
    {
      if ((*((_BYTE *)self + 8) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 54) | ((unint64_t)*((unsigned __int16 *)&self->mOriginalProperties
                                                                                     + 110) << 32)) & 0x20000000000) != 0)
      {
        return (*((unsigned __int16 *)&self->mOriginalProperties + 110) >> 9) & 1;
      }
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x20000000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDSection;
  -[WDSection description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (WDDocument)document
{
  return (WDDocument *)objc_loadWeakRetained((id *)&self->mDocument);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);

  objc_storeStrong((id *)&self->mFirstPageFooter, 0);
  objc_storeStrong((id *)&self->mOddPageFooter, 0);
  objc_storeStrong((id *)&self->mEvenPageFooter, 0);
  objc_storeStrong((id *)&self->mFirstPageHeader, 0);
  objc_storeStrong((id *)&self->mOddPageHeader, 0);
  objc_storeStrong((id *)&self->mEvenPageHeader, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

@end
