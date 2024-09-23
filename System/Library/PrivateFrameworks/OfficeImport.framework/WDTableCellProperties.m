@implementation WDTableCellProperties

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 19) = 0;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 41) = 0;
  *((_QWORD *)self + 42) = 0;
  *((_QWORD *)self + 40) = 0;
  return self;
}

- (WDTableCellProperties)initWithDocument:(id)a3
{
  id v4;
  WDTableCellProperties *v5;
  WDTableCellProperties *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WDTableCellProperties;
  v5 = -[WDTableCellProperties init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    *((_BYTE *)v5 + 12) = *((_BYTE *)v5 + 12) & 0xF8 | 1;
    objc_storeWeak((id *)&v5->mDocument, v4);
  }

  return v6;
}

- (void)setResolveMode:(int)a3
{
  *((_BYTE *)self + 12) = (2 * (a3 == 1)) | (4 * (a3 == 2)) | (a3 == 0) | *((_BYTE *)self + 12) & 0xF8;
}

- (void)setPosition:(signed __int16)a3
{
  self->mPosition = a3;
}

- (id)mutableTopBorder
{
  WDBorder *v2;
  WDBorder *topBorder;
  WDBorder **p_topBorder;
  uint64_t v5;
  WDBorder *v6;
  WDBorder *v7;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    p_topBorder = &self->mTrackedProperties.topBorder;
    topBorder = self->mTrackedProperties.topBorder;
    if (!topBorder)
    {
      v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 2u;
      v6 = objc_alloc_init(WDBorder);
      v7 = *p_topBorder;
      *p_topBorder = v6;

      topBorder = *p_topBorder;
    }
LABEL_9:
    v2 = topBorder;
    return v2;
  }
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    p_topBorder = &self->mOriginalProperties.topBorder;
    topBorder = self->mOriginalProperties.topBorder;
    if (!topBorder)
    {
      v5 = 176;
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

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    p_leftBorder = &self->mTrackedProperties.leftBorder;
    leftBorder = self->mTrackedProperties.leftBorder;
    if (!leftBorder)
    {
      v5 = 344;
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
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    p_leftBorder = &self->mOriginalProperties.leftBorder;
    leftBorder = self->mOriginalProperties.leftBorder;
    if (!leftBorder)
    {
      v5 = 176;
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

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    p_bottomBorder = &self->mTrackedProperties.bottomBorder;
    bottomBorder = self->mTrackedProperties.bottomBorder;
    if (!bottomBorder)
    {
      v5 = 344;
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
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    p_bottomBorder = &self->mOriginalProperties.bottomBorder;
    bottomBorder = self->mOriginalProperties.bottomBorder;
    if (!bottomBorder)
    {
      v5 = 176;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v2 = 0;
  return v2;
}

- (id)mutableRightBorder
{
  WDBorder *v2;
  WDBorder *rightBorder;
  WDBorder **p_rightBorder;
  uint64_t v5;
  WDBorder *v6;
  WDBorder *v7;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    p_rightBorder = &self->mTrackedProperties.rightBorder;
    rightBorder = self->mTrackedProperties.rightBorder;
    if (!rightBorder)
    {
      v5 = 344;
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
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    p_rightBorder = &self->mOriginalProperties.rightBorder;
    rightBorder = self->mOriginalProperties.rightBorder;
    if (!rightBorder)
    {
      v5 = 176;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v2 = 0;
  return v2;
}

- (void)setVerticalAlignment:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 292;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 124;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x40000u;
}

- (void)setTextDirection:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 296;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 128;
  }
  *((_BYTE *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x80000u;
}

- (void)setVerticallyMergedCell:(BOOL)a3
{
  uint64_t v3;
  char *v4;
  unint64_t v5;
  int v6;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
  }
  v4 = (char *)self + v3;
  v5 = *(_DWORD *)v4 & 0xFFCFFFFF | ((unint64_t)v4[4] << 32);
  v6 = 0x200000;
  if (a3)
    v6 = 3145728;
  *(_DWORD *)v4 = v6 | *(_DWORD *)v4 & 0xFFCFFFFF;
  v4[4] = BYTE4(v5);
}

- (void)setFirstInSetOfVerticallyMergedCells:(BOOL)a3
{
  uint64_t v3;
  char *v4;
  unint64_t v5;
  int v6;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
  }
  v4 = (char *)self + v3;
  v5 = *(_DWORD *)v4 & 0xFF3FFFFF | ((unint64_t)v4[4] << 32);
  v6 = 0x800000;
  if (a3)
    v6 = 12582912;
  *(_DWORD *)v4 = v6 | *(_DWORD *)v4 & 0xFF3FFFFF;
  v4[4] = BYTE4(v5);
}

- (void)setWidth:(signed __int16)a3
{
  self->mWidth = a3;
}

- (void)setWidthType:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 256;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 88;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x200u;
}

- (BOOL)isWidthTypeOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x200;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 9) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x200) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x200) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 9) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x200;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)widthType
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x200) != 0)
  {
    v3 = 256;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x200) == 0)
      return 1;
    v3 = 88;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (signed)width
{
  return self->mWidth;
}

- (BOOL)isTopBorderOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 2;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 1) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 2) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 2) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 1) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 2;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)topBorder
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 2) != 0)
  {
    v3 = 192;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 2) == 0)
      return 0;
    v3 = 24;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isLeftBorderOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 4;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 2) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 4) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 2) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 4;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)leftBorder
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 4) != 0)
  {
    v3 = 200;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 4) == 0)
      return 0;
    v3 = 32;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isBottomBorderOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 8;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 3) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 8) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 8) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 3) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 8;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)bottomBorder
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 8) != 0)
  {
    v3 = 208;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 8) == 0)
      return 0;
    v3 = 40;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isRightBorderOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x10;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 4) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x10) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x10) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 4) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x10;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)rightBorder
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x10) != 0)
  {
    v3 = 216;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x10) == 0)
      return 0;
    v3 = 48;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isVerticalAlignmentOverridden
{
  uint64_t v2;
  _BOOL8 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x40000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 18) & 1;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x40000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x40000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 18) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *(_QWORD *)&v4 & 0x40000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)verticalAlignment
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x40000) != 0)
  {
    v3 = 292;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x40000) == 0)
      return 0;
    v3 = 124;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isLeftMarginOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x4000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 14) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x4000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x4000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 14) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x4000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)isRightMarginOverridden
{
  uint64_t v2;
  _BOOL8 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x10000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 16) & 1;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x10000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x10000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 16) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *(_QWORD *)&v4 & 0x10000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)isShadingOverridden
{
  uint64_t v2;
  _BOOL4 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = 344;
    return *(_DWORD *)((_BYTE *)&self->super.isa + v2) & 1;
  }
  if ((*((_BYTE *)self + 12) & 4) != 0)
  {
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 1) != 0)
    {
      LOBYTE(v3) = 1;
      return v3;
    }
    if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 1) != 0)
      goto LABEL_10;
  }
  else if ((*((_BYTE *)self + 12) & 1) != 0)
  {
LABEL_10:
    v2 = 176;
    return *(_DWORD *)((_BYTE *)&self->super.isa + v2) & 1;
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (WDTableCellProperties)init
{
  WDTableCellProperties *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDTableCellProperties;
  result = -[WDTableCellProperties init](&v3, sel_init);
  if (result)
    *((_BYTE *)result + 12) = *((_BYTE *)result + 12) & 0xF8 | 1;
  return result;
}

- (id)mutableShading
{
  WDShading *v2;
  WDShading *shading;
  $A3888C8F068201177B005AF7A8D0D648 *p_mTrackedProperties;
  uint64_t v5;
  WDShading *v6;
  WDShading *v7;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    shading = self->mTrackedProperties.shading;
    if (!shading)
    {
      v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 1u;
      v6 = objc_alloc_init(WDShading);
      v7 = p_mTrackedProperties->shading;
      p_mTrackedProperties->shading = v6;

      shading = p_mTrackedProperties->shading;
    }
LABEL_9:
    v2 = shading;
    return v2;
  }
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    p_mTrackedProperties = &self->mOriginalProperties;
    shading = self->mOriginalProperties.shading;
    if (!shading)
    {
      v5 = 176;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v2 = 0;
  return v2;
}

- (id)shading
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 1) != 0)
  {
    v3 = 184;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 1) == 0)
      return 0;
    v3 = 16;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (id)mutableInsideHorizontalBorder
{
  WDBorder *v2;
  WDBorder *insideHorizontalBorder;
  WDBorder **p_insideHorizontalBorder;
  uint64_t v5;
  WDBorder *v6;
  WDBorder *v7;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    p_insideHorizontalBorder = &self->mTrackedProperties.insideHorizontalBorder;
    insideHorizontalBorder = self->mTrackedProperties.insideHorizontalBorder;
    if (!insideHorizontalBorder)
    {
      v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 0x80u;
      v6 = objc_alloc_init(WDBorder);
      v7 = *p_insideHorizontalBorder;
      *p_insideHorizontalBorder = v6;

      insideHorizontalBorder = *p_insideHorizontalBorder;
    }
LABEL_9:
    v2 = insideHorizontalBorder;
    return v2;
  }
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    p_insideHorizontalBorder = &self->mOriginalProperties.insideHorizontalBorder;
    insideHorizontalBorder = self->mOriginalProperties.insideHorizontalBorder;
    if (!insideHorizontalBorder)
    {
      v5 = 176;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v2 = 0;
  return v2;
}

- (id)mutableInsideVerticalBorder
{
  WDBorder *v2;
  WDBorder *insideVerticalBorder;
  WDBorder **p_insideVerticalBorder;
  uint64_t v5;
  WDBorder *v6;
  WDBorder *v7;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    p_insideVerticalBorder = &self->mTrackedProperties.insideVerticalBorder;
    insideVerticalBorder = self->mTrackedProperties.insideVerticalBorder;
    if (!insideVerticalBorder)
    {
      v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 0x100u;
      v6 = objc_alloc_init(WDBorder);
      v7 = *p_insideVerticalBorder;
      *p_insideVerticalBorder = v6;

      insideVerticalBorder = *p_insideVerticalBorder;
    }
LABEL_9:
    v2 = insideVerticalBorder;
    return v2;
  }
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    p_insideVerticalBorder = &self->mOriginalProperties.insideVerticalBorder;
    insideVerticalBorder = self->mOriginalProperties.insideVerticalBorder;
    if (!insideVerticalBorder)
    {
      v5 = 176;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v2 = 0;
  return v2;
}

- (void)setTopMargin:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 260;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 92;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x400u;
}

- (void)setTopMarginType:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 264;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 96;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x800u;
}

- (void)setBottomMargin:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 268;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 100;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x1000u;
}

- (void)setBottomMarginType:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 272;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 104;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x2000u;
}

- (void)setLeftMargin:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 276;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 108;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x4000u;
}

- (void)setLeftMarginType:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 280;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 112;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x8000u;
}

- (void)setRightMargin:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 284;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 116;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x10000u;
}

- (void)setRightMarginType:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 288;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 120;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x20000u;
}

- (signed)leftMargin
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x4000) != 0)
  {
    v3 = 276;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((_BYTE *)self + 12) & 5) != 0 && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x4000) != 0)
  {
    v3 = 108;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (signed)rightMargin
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x10000) != 0)
  {
    v3 = 284;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((_BYTE *)self + 12) & 5) != 0 && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x10000) != 0)
  {
    v3 = 116;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (void)addProperties:(id)a3
{
  char *v4;

  v4 = (char *)a3;
  -[WDTableCellProperties addPropertiesValues:to:](self, "addPropertiesValues:to:", v4 + 16, &self->mOriginalProperties);
  -[WDTableCellProperties addPropertiesValues:to:](self, "addPropertiesValues:to:", v4 + 184, &self->mTrackedProperties);

}

- (void)addPropertiesValues:(id *)a3 to:(id *)a4
{
  uint64_t v6;
  unint64_t v7;
  unsigned int *v8;
  void *v9;
  id var0;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;

  v6 = *((unsigned int *)a4 + 40);
  v7 = v6 | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  if ((v6 & 1) == 0 && (*((_DWORD *)a3 + 40) & 1) != 0)
  {
    *((_DWORD *)a4 + 40) = v6 | 1;
    v8 = (unsigned int *)((char *)a4 + 160);
    *((_BYTE *)a4 + 164) = BYTE4(v7);
    v9 = (void *)objc_msgSend(a3->var0, "copy");
    var0 = a4->var0;
    a4->var0 = v9;

    v7 = *v8 | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 2) == 0 && (*((_DWORD *)a3 + 40) & 2) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 2;
    *((_BYTE *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var1, a3->var1);
    v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 4) == 0 && (*((_DWORD *)a3 + 40) & 4) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 4;
    *((_BYTE *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var2, a3->var2);
    v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 8) == 0 && (*((_DWORD *)a3 + 40) & 8) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 8;
    *((_BYTE *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var3, a3->var3);
    v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x10) == 0 && (*((_DWORD *)a3 + 40) & 0x10) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x10;
    *((_BYTE *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var4, a3->var4);
    v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x20) == 0 && (*((_DWORD *)a3 + 40) & 0x20) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x20;
    *((_BYTE *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var5, a3->var5);
    v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x40) == 0 && (*((_DWORD *)a3 + 40) & 0x40) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x40;
    *((_BYTE *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var6, a3->var6);
    v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x80) == 0 && (*((_DWORD *)a3 + 40) & 0x80) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x80;
    *((_BYTE *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var7, a3->var7);
    v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x100) == 0 && (*((_DWORD *)a3 + 40) & 0x100) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x100;
    *((_BYTE *)a4 + 164) = BYTE4(v7);
    objc_storeStrong(&a4->var8, a3->var8);
    v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x200) == 0 && (*((_DWORD *)a3 + 40) & 0x200) != 0)
  {
    v11 = HIDWORD(v7);
    v7 |= 0x200uLL;
    *((_BYTE *)a4 + 164) = v11;
    *((_DWORD *)a4 + 40) = v7;
    a4->var9 = a3->var9;
  }
  if ((v7 & 0x400) == 0 && (*((_DWORD *)a3 + 40) & 0x400) != 0)
  {
    v12 = HIDWORD(v7);
    v7 |= 0x400uLL;
    *((_BYTE *)a4 + 164) = v12;
    *((_DWORD *)a4 + 40) = v7;
    a4->var10 = a3->var10;
  }
  if ((v7 & 0x800) == 0 && (*((_DWORD *)a3 + 40) & 0x800) != 0)
  {
    v13 = HIDWORD(v7);
    v7 |= 0x800uLL;
    *((_BYTE *)a4 + 164) = v13;
    *((_DWORD *)a4 + 40) = v7;
    a4->var11 = a3->var11;
  }
  if ((v7 & 0x1000) == 0 && (*((_DWORD *)a3 + 40) & 0x1000) != 0)
  {
    v14 = HIDWORD(v7);
    v7 |= 0x1000uLL;
    *((_BYTE *)a4 + 164) = v14;
    *((_DWORD *)a4 + 40) = v7;
    a4->var12 = a3->var12;
  }
  if ((v7 & 0x2000) == 0 && (*((_DWORD *)a3 + 40) & 0x2000) != 0)
  {
    v15 = HIDWORD(v7);
    v7 |= 0x2000uLL;
    *((_BYTE *)a4 + 164) = v15;
    *((_DWORD *)a4 + 40) = v7;
    a4->var13 = a3->var13;
  }
  if ((v7 & 0x4000) == 0 && (*((_DWORD *)a3 + 40) & 0x4000) != 0)
  {
    v16 = HIDWORD(v7);
    v7 |= 0x4000uLL;
    *((_BYTE *)a4 + 164) = v16;
    *((_DWORD *)a4 + 40) = v7;
    a4->var14 = a3->var14;
  }
  if ((v7 & 0x8000) == 0 && (*((_DWORD *)a3 + 40) & 0x8000) != 0)
  {
    v17 = HIDWORD(v7);
    v7 |= 0x8000uLL;
    *((_BYTE *)a4 + 164) = v17;
    *((_DWORD *)a4 + 40) = v7;
    a4->var15 = a3->var15;
  }
  if ((v7 & 0x10000) == 0 && (*((_DWORD *)a3 + 40) & 0x10000) != 0)
  {
    v18 = HIDWORD(v7);
    v7 |= 0x10000uLL;
    *((_BYTE *)a4 + 164) = v18;
    *((_DWORD *)a4 + 40) = v7;
    a4->var16 = a3->var16;
  }
  if ((v7 & 0x20000) == 0 && (*((_DWORD *)a3 + 40) & 0x20000) != 0)
  {
    v19 = HIDWORD(v7);
    v7 |= 0x20000uLL;
    *((_BYTE *)a4 + 164) = v19;
    *((_DWORD *)a4 + 40) = v7;
    a4->var17 = a3->var17;
  }
  if ((v7 & 0x40000) == 0 && (*((_DWORD *)a3 + 40) & 0x40000) != 0)
  {
    v20 = HIDWORD(v7);
    v7 |= 0x40000uLL;
    *((_BYTE *)a4 + 164) = v20;
    *((_DWORD *)a4 + 40) = v7;
    a4->var18 = a3->var18;
  }
  if ((v7 & 0x80000) == 0 && (*((_DWORD *)a3 + 40) & 0x80000) != 0)
  {
    v21 = HIDWORD(v7);
    v7 |= 0x80000uLL;
    *((_DWORD *)a4 + 40) = v7;
    *((_BYTE *)a4 + 164) = v21;
    a4->var19 = a3->var19;
  }
  if ((v7 & 0x200000) == 0 && (*((_DWORD *)a3 + 40) & 0x200000) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x200000;
    *((_BYTE *)a4 + 164) = BYTE4(v7);
    v22 = v7 & 0xFFFFFFFFFFCFFFFFLL | 0x200000;
    v7 = *((_DWORD *)a3 + 40) & 0x100000 | v22;
    *((_BYTE *)a4 + 164) = BYTE4(v22);
    *((_DWORD *)a4 + 40) = v7;
  }
  if ((v7 & 0x800000) == 0 && (*((_DWORD *)a3 + 40) & 0x800000) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x800000;
    v23 = HIDWORD(v7);
    *((_BYTE *)a4 + 164) = BYTE4(v7);
    v7 = *((_DWORD *)a3 + 40) & 0x400000 | v7 & 0xFFFF3FFFFFLL | 0x800000;
    *((_BYTE *)a4 + 164) = v23;
    *((_DWORD *)a4 + 40) = v7;
  }
  if ((v7 & 0x2000000) == 0 && (*((_DWORD *)a3 + 40) & 0x2000000) != 0)
  {
    *((_DWORD *)a4 + 40) = v7 | 0x2000000;
    v24 = HIDWORD(v7);
    *((_BYTE *)a4 + 164) = BYTE4(v7);
    v7 = *((_DWORD *)a3 + 40) & 0x1000000 | v7 & 0xFFFCFFFFFFLL | 0x2000000;
    *((_BYTE *)a4 + 164) = v24;
    *((_DWORD *)a4 + 40) = v7;
  }
  if ((v7 & 0x20000000) == 0 && (*((_DWORD *)a3 + 40) & 0x20000000) != 0)
  {
    v25 = HIDWORD(v7);
    v7 |= 0x20000000uLL;
    *((_BYTE *)a4 + 164) = v25;
    *((_DWORD *)a4 + 40) = v7;
    a4->var23 = a3->var23;
  }
  if ((v7 & 0x40000000) == 0 && (*((_DWORD *)a3 + 40) & 0x40000000) != 0)
  {
    v26 = HIDWORD(v7);
    v7 |= 0x40000000uLL;
    *((_BYTE *)a4 + 164) = v26;
    *((_DWORD *)a4 + 40) = v7;
    a4->var24 = a3->var24;
  }
  if ((v7 & 0x80000000) == 0 && (*((_DWORD *)a3 + 40) & 0x80000000) != 0)
  {
    v27 = HIDWORD(v7);
    v7 |= 0x80000000uLL;
    *((_BYTE *)a4 + 164) = v27;
    *((_DWORD *)a4 + 40) = v7;
    a4->var25 = a3->var25;
  }
  if ((v7 & 0x100000000) == 0
    && ((*((unsigned int *)a3 + 40) | ((unint64_t)*((unsigned __int8 *)a3 + 164) << 32)) & 0x100000000) != 0)
  {
    *((_DWORD *)a4 + 40) = v7;
    *((_BYTE *)a4 + 164) = (v7 | 0x100000000) >> 32;
    objc_storeStrong(&a4->var26, a3->var26);
    v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x200000000) == 0
    && ((*((unsigned int *)a3 + 40) | ((unint64_t)*((unsigned __int8 *)a3 + 164) << 32)) & 0x200000000) != 0)
  {
    *((_DWORD *)a4 + 40) = v7;
    *((_BYTE *)a4 + 164) = (v7 | 0x200000000) >> 32;
    objc_storeStrong(&a4->var27, a3->var27);
    v7 = *((unsigned int *)a4 + 40) | ((unint64_t)*((unsigned __int8 *)a4 + 164) << 32);
  }
  if ((v7 & 0x400000000) == 0
    && ((*((unsigned int *)a3 + 40) | ((unint64_t)*((unsigned __int8 *)a3 + 164) << 32)) & 0x400000000) != 0)
  {
    *((_DWORD *)a4 + 40) = v7;
    *((_BYTE *)a4 + 164) = (v7 | 0x400000000) >> 32;
    objc_storeStrong(&a4->var28, a3->var28);
  }
}

- (id)mutableDiagonalUpBorder
{
  WDBorder *v2;
  WDBorder *diagonalUpBorder;
  WDBorder **p_diagonalUpBorder;
  uint64_t v5;
  WDBorder *v6;
  WDBorder *v7;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    p_diagonalUpBorder = &self->mTrackedProperties.diagonalUpBorder;
    diagonalUpBorder = self->mTrackedProperties.diagonalUpBorder;
    if (!diagonalUpBorder)
    {
      v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 0x20u;
      v6 = objc_alloc_init(WDBorder);
      v7 = *p_diagonalUpBorder;
      *p_diagonalUpBorder = v6;

      diagonalUpBorder = *p_diagonalUpBorder;
    }
LABEL_9:
    v2 = diagonalUpBorder;
    return v2;
  }
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    p_diagonalUpBorder = &self->mOriginalProperties.diagonalUpBorder;
    diagonalUpBorder = self->mOriginalProperties.diagonalUpBorder;
    if (!diagonalUpBorder)
    {
      v5 = 176;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v2 = 0;
  return v2;
}

- (id)mutableDiagonalDownBorder
{
  WDBorder *v2;
  WDBorder *diagonalDownBorder;
  WDBorder **p_diagonalDownBorder;
  uint64_t v5;
  WDBorder *v6;
  WDBorder *v7;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    p_diagonalDownBorder = &self->mTrackedProperties.diagonalDownBorder;
    diagonalDownBorder = self->mTrackedProperties.diagonalDownBorder;
    if (!diagonalDownBorder)
    {
      v5 = 344;
LABEL_8:
      *(_DWORD *)((char *)&self->super.isa + v5) |= 0x40u;
      v6 = objc_alloc_init(WDBorder);
      v7 = *p_diagonalDownBorder;
      *p_diagonalDownBorder = v6;

      diagonalDownBorder = *p_diagonalDownBorder;
    }
LABEL_9:
    v2 = diagonalDownBorder;
    return v2;
  }
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    p_diagonalDownBorder = &self->mOriginalProperties.diagonalDownBorder;
    diagonalDownBorder = self->mOriginalProperties.diagonalDownBorder;
    if (!diagonalDownBorder)
    {
      v5 = 176;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v2 = 0;
  return v2;
}

- (signed)position
{
  return self->mPosition;
}

- (int)resolveMode
{
  unsigned int v2;
  int v3;

  v2 = *((unsigned __int8 *)self + 12);
  if ((v2 & 2) != 0)
    v3 = 1;
  else
    v3 = (v2 >> 1) & 2;
  if ((v2 & 1) != 0)
    return 0;
  else
    return v3;
}

- (void)originalToTracked
{
  -[WDTableCellProperties addPropertiesValues:to:](self, "addPropertiesValues:to:", &self->mOriginalProperties, &self->mTrackedProperties);
}

- (void)clearShading
{
  uint64_t v2;
  unint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((unsigned int *)&self->mTrackedProperties + 40);
    v3 = v2 | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties + 164) << 32);
    if ((v2 & 1) != 0)
    {
      v4 = (char *)&self->mTrackedProperties + 160;
      v5 = 184;
LABEL_8:
      v4[4] = BYTE4(v3);
      *(_DWORD *)v4 = v3 & 0xFFFFFFFE;
      v6 = *(Class *)((char *)&self->super.isa + v5);
      *(Class *)((char *)&self->super.isa + v5) = 0;

      return;
    }
  }
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    v4 = (char *)&self->mOriginalProperties + 160;
    v3 = *((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                 + 164) << 32);
    if ((*((_DWORD *)&self->mOriginalProperties + 40) & 1) != 0)
    {
      v5 = 16;
      goto LABEL_8;
    }
  }
}

- (id)diagonalUpBorder
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x20) != 0)
  {
    v3 = 224;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x20) == 0)
      return 0;
    v3 = 56;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isDiagonalUpBorderOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x20;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 5) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x20) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x20) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 5) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x20;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)diagonalDownBorder
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x40) != 0)
  {
    v3 = 232;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x40) == 0)
      return 0;
    v3 = 64;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isDiagonalDownBorderOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x40;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 6) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x40) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x40) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 6) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x40;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)insideHorizontalBorder
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x80) != 0)
  {
    v3 = 240;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x80) == 0)
      return 0;
    v3 = 72;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isInsideHorizontalBorderOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x80;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 7) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x80) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x80) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 7) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x80;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)insideVerticalBorder
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x100) != 0)
  {
    v3 = 248;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x100) == 0)
      return 0;
    v3 = 80;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (BOOL)isInsideVerticalBorderOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x100;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 8) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x100) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x100) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 8) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x100;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (signed)topMargin
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x400) != 0)
  {
    v3 = 260;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((_BYTE *)self + 12) & 5) != 0 && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x400) != 0)
  {
    v3 = 92;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (BOOL)isTopMarginOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x400;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 10) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x400) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x400) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 10) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x400;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)topMarginType
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x800) != 0)
  {
    v3 = 264;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x800) == 0)
      return 1;
    v3 = 96;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isTopMarginTypeOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x800;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 11) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x800) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x800) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 11) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x800;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (signed)bottomMargin
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x1000) != 0)
  {
    v3 = 268;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  if ((*((_BYTE *)self + 12) & 5) != 0 && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x1000) != 0)
  {
    v3 = 100;
    return *(_WORD *)((char *)&self->super.isa + v3);
  }
  return 0;
}

- (BOOL)isBottomMarginOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x1000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 12) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x1000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x1000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 12) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x1000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)bottomMarginType
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x2000) != 0)
  {
    v3 = 272;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x2000) == 0)
      return 1;
    v3 = 104;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isBottomMarginTypeOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x2000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 13) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x2000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x2000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 13) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x2000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)leftMarginType
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x8000) != 0)
  {
    v3 = 280;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x8000) == 0)
      return 1;
    v3 = 112;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isLeftMarginTypeOverridden
{
  uint64_t v2;
  _BOOL8 v3;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = (unsigned __int16)*((_DWORD *)&self->mTrackedProperties + 40) & 0x8000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 15) & 1;
      goto LABEL_10;
    }
    if ((*((_DWORD *)&self->mTrackedProperties + 40) & 0x8000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x8000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 15) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = (unsigned __int16)*((_DWORD *)&self->mTrackedProperties + 40) & 0x8000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)rightMarginType
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x20000) != 0)
  {
    v3 = 288;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x20000) == 0)
      return 1;
    v3 = 120;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (BOOL)isRightMarginTypeOverridden
{
  uint64_t v2;
  _BOOL8 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x20000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 17) & 1;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x20000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x20000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 17) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *(_QWORD *)&v4 & 0x20000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)textDirection
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x80000) != 0)
  {
    v3 = 296;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x80000) == 0)
      return 1;
    v3 = 128;
  }
  return *((char *)&self->super.isa + v3);
}

- (BOOL)isTextDirectionOverridden
{
  uint64_t v2;
  _BOOL8 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x80000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 19) & 1;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x80000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x80000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 19) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *(_QWORD *)&v4 & 0x80000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)verticallyMergedCell
{
  uint64_t v2;

  if ((*((_BYTE *)self + 12) & 6) != 0
    && (v2 = *((unsigned int *)&self->mTrackedProperties + 40), (v2 & 0x200000) != 0))
  {
    return ((v2 | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties + 164) << 32)) >> 20) & 1;
  }
  else
  {
    LOBYTE(self) = (*((_BYTE *)self + 12) & 5) != 0
                && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x200000) != 0
                && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x100000) != 0;
  }
  return (char)self;
}

- (BOOL)isVerticallyMergedCellOverridden
{
  uint64_t v2;
  _BOOL8 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x200000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 21) & 1;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x200000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x200000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 21) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *(_QWORD *)&v4 & 0x200000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)firstInSetOfVerticallyMergedCells
{
  uint64_t v2;

  if ((*((_BYTE *)self + 12) & 6) != 0
    && (v2 = *((unsigned int *)&self->mTrackedProperties + 40), (v2 & 0x800000) != 0))
  {
    return ((v2 | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties + 164) << 32)) >> 22) & 1;
  }
  else
  {
    LOBYTE(self) = (*((_BYTE *)self + 12) & 5) != 0
                && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x800000) != 0
                && (*((_DWORD *)&self->mOriginalProperties + 40) & 0x400000) != 0;
  }
  return (char)self;
}

- (BOOL)isFirstInSetOfVerticallyMergedCellsOverridden
{
  uint64_t v2;
  _BOOL8 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x800000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 23) & 1;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x800000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x800000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 23) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = *(_QWORD *)&v4 & 0x800000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (BOOL)noWrap
{
  uint64_t v2;

  if ((*((_BYTE *)self + 12) & 6) != 0
    && (v2 = *((unsigned int *)&self->mTrackedProperties + 40), (v2 & 0x2000000) != 0))
  {
    return ((v2 | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties + 164) << 32)) >> 24) & 1;
  }
  else if ((*((_BYTE *)self + 12) & 5) != 0)
  {
    if ((*((_DWORD *)&self->mOriginalProperties + 40) & 0x2000000) != 0)
      LOBYTE(self) = HIBYTE(*((_DWORD *)&self->mOriginalProperties + 40)) & 1;
    else
      LOBYTE(self) = 0;
  }
  else
  {
    LOBYTE(self) = 0;
  }
  return (char)self;
}

- (void)setNoWrap:(BOOL)a3
{
  uint64_t v3;
  char *v4;
  unint64_t v5;
  int v6;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
  }
  v4 = (char *)self + v3;
  v5 = *(_DWORD *)v4 & 0xFCFFFFFF | ((unint64_t)v4[4] << 32);
  v6 = 0x2000000;
  if (a3)
    v6 = 50331648;
  *(_DWORD *)v4 = v6 | *(_DWORD *)v4 & 0xFCFFFFFF;
  v4[4] = BYTE4(v5);
}

- (BOOL)isNoWrapOverridden
{
  uint64_t v2;
  _BOOL8 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x2000000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 25) & 1;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x2000000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x2000000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 25) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x2000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)deleted
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x4000000) != 0)
  {
    v3 = 300;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x4000000) == 0)
      return 0;
    v3 = 132;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (void)setDeleted:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 300;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 132;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x4000000u;
}

- (BOOL)isDeletedOverridden
{
  uint64_t v2;
  _BOOL8 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x4000000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 26) & 1;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x4000000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x4000000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 26) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x4000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)edited
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x8000000) != 0)
  {
    v3 = 304;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x8000000) == 0)
      return 0;
    v3 = 136;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (void)setEdited:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 304;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 136;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x8000000u;
}

- (BOOL)isEditedOverridden
{
  uint64_t v2;
  _BOOL8 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x8000000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 27) & 1;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x8000000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x8000000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 27) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x8000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (int)formattingChanged
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x10000000) != 0)
  {
    v3 = 308;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x10000000) == 0)
      return 0;
    v3 = 140;
  }
  return *(_DWORD *)((char *)&self->super.isa + v3);
}

- (void)setFormattingChanged:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 308;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 140;
  }
  *(_DWORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x10000000u;
}

- (BOOL)isFormattingChangedOverridden
{
  uint64_t v2;
  _BOOL8 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x10000000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 28) & 1;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x10000000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x10000000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 28) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x10000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (unsigned)indexToAuthorIDOfDeletion
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x20000000) != 0)
  {
    v3 = 312;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x20000000) == 0)
      return 0;
    v3 = 144;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 312;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 144;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x20000000u;
}

- (BOOL)isIndexToAuthorIDOfDeletionOverridden
{
  uint64_t v2;
  _BOOL8 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x20000000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 29) & 1;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x20000000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x20000000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 29) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x20000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (unsigned)indexToAuthorIDOfEdit
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x40000000) != 0)
  {
    v3 = 314;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x40000000) == 0)
      return 0;
    v3 = 146;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 314;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 146;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x40000000u;
}

- (BOOL)isIndexToAuthorIDOfEditOverridden
{
  uint64_t v2;
  _BOOL8 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x40000000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 30) & 1;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x40000000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x40000000) != 0)
        return ((unint64_t)*((unsigned int *)&self->mOriginalProperties + 40) >> 30) & 1;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x40000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0 && (*((_DWORD *)&self->mTrackedProperties + 40) & 0x80000000) != 0)
  {
    v3 = 316;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x80000000) == 0)
      return 0;
    v3 = 148;
  }
  return *(_WORD *)((char *)&self->super.isa + v3);
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v3 = 344;
    v4 = 316;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 1) == 0)
      return;
    v3 = 176;
    v4 = 148;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3;
  *(_DWORD *)((char *)&self->super.isa + v3) |= 0x80000000;
}

- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden
{
  uint64_t v2;
  _BOOL4 v3;
  int v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = *((_DWORD *)&self->mTrackedProperties + 40) & 0x80000000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return *((_DWORD *)&self->mOriginalProperties + 40) >> 31;
      goto LABEL_10;
    }
    v4 = *((_DWORD *)&self->mTrackedProperties + 40);
    if ((v4 & 0x80000000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0 || (*((_DWORD *)&self->mOriginalProperties + 40) & 0x80000000) != 0)
        return *((_DWORD *)&self->mOriginalProperties + 40) >> 31;
LABEL_10:
      LOBYTE(v3) = 0;
      return v3;
    }
    v2 = v4 & 0x80000000;
  }
  LOBYTE(v3) = v2 != 0;
  return v3;
}

- (id)deletionDate
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties
                                                                                + 164) << 32)) & 0x100000000) != 0)
  {
    v3 = 320;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                   + 164) << 32)) & 0x100000000) == 0)
    {
      return 0;
    }
    v3 = 152;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)setDeletionDate:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v8 = v5;
    v6 = 344;
    v7 = 320;
    goto LABEL_5;
  }
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    v8 = v5;
    v6 = 176;
    v7 = 152;
LABEL_5:
    objc_storeStrong((id *)((char *)&self->super.isa + v7), a3);
    *((_BYTE *)&self->super.isa + v6 + 4) |= 1u;
    v5 = v8;
  }

}

- (BOOL)isDeletionDateOverridden
{
  uint64_t v2;
  unint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = (unint64_t)(*((_BYTE *)&self->mTrackedProperties + 164) & 1) << 32;
    return v2 != 0;
  }
  if ((*((_BYTE *)self + 12) & 4) != 0)
  {
    v4 = *((unsigned int *)&self->mTrackedProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties
                                                                                + 164) << 32);
    if ((v4 & 0x100000000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                     + 164) << 32)) & 0x100000000) != 0)
      {
        return *((_BYTE *)&self->mOriginalProperties + 164) & 1;
      }
      return 0;
    }
    v2 = v4 & 0x100000000;
    return v2 != 0;
  }
  if ((*((_BYTE *)self + 12) & 1) == 0)
    return 0;
  return *((_BYTE *)&self->mOriginalProperties + 164) & 1;
}

- (id)editDate
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties
                                                                                + 164) << 32)) & 0x200000000) != 0)
  {
    v3 = 328;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                   + 164) << 32)) & 0x200000000) == 0)
    {
      return 0;
    }
    v3 = 160;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)setEditDate:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v8 = v5;
    v6 = 344;
    v7 = 328;
    goto LABEL_5;
  }
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    v8 = v5;
    v6 = 176;
    v7 = 160;
LABEL_5:
    objc_storeStrong((id *)((char *)&self->super.isa + v7), a3);
    *((_BYTE *)&self->super.isa + v6 + 4) |= 2u;
    v5 = v8;
  }

}

- (BOOL)isEditDateOverridden
{
  unint64_t v2;
  _BOOL4 v3;
  unint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties + 164) << 32) & 0x200000000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return (*((unsigned __int8 *)&self->mOriginalProperties + 164) >> 1) & 1;
      goto LABEL_10;
    }
    v4 = *((unsigned int *)&self->mTrackedProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties
                                                                                + 164) << 32);
    if ((v4 & 0x200000000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                     + 164) << 32)) & 0x200000000) != 0)
      {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 164) >> 1) & 1;
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

- (id)formattingChangeDate
{
  uint64_t v3;

  if ((*((_BYTE *)self + 12) & 6) != 0
    && ((*((unsigned int *)&self->mTrackedProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties
                                                                                + 164) << 32)) & 0x400000000) != 0)
  {
    v3 = 336;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 5) == 0
      || ((*((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                   + 164) << 32)) & 0x400000000) == 0)
    {
      return 0;
    }
    v3 = 168;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (void)setFormattingChangeDate:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v8 = v5;
    v6 = 344;
    v7 = 336;
    goto LABEL_5;
  }
  if ((*((_BYTE *)self + 12) & 1) != 0)
  {
    v8 = v5;
    v6 = 176;
    v7 = 168;
LABEL_5:
    objc_storeStrong((id *)((char *)&self->super.isa + v7), a3);
    *((_BYTE *)&self->super.isa + v6 + 4) |= 4u;
    v5 = v8;
  }

}

- (BOOL)isFormattingChangeDateOverridden
{
  unint64_t v2;
  _BOOL4 v3;
  unint64_t v4;

  if ((*((_BYTE *)self + 12) & 2) != 0)
  {
    v2 = ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties + 164) << 32) & 0x400000000;
  }
  else
  {
    if ((*((_BYTE *)self + 12) & 4) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0)
        return (*((unsigned __int8 *)&self->mOriginalProperties + 164) >> 2) & 1;
      goto LABEL_10;
    }
    v4 = *((unsigned int *)&self->mTrackedProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mTrackedProperties
                                                                                + 164) << 32);
    if ((v4 & 0x400000000) == 0)
    {
      if ((*((_BYTE *)self + 12) & 1) != 0
        || ((*((unsigned int *)&self->mOriginalProperties + 40) | ((unint64_t)*((unsigned __int8 *)&self->mOriginalProperties
                                                                                     + 164) << 32)) & 0x400000000) != 0)
      {
        return (*((unsigned __int8 *)&self->mOriginalProperties + 164) >> 2) & 1;
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

- (id)copyWithZone:(_NSZone *)a3
{
  WDTableCellProperties *v4;
  WDTableCellProperties *v5;
  int v6;
  unsigned int v7;
  WDTableCellProperties *v8;

  v4 = -[WDTableCellProperties init](+[WDTableCellProperties allocWithZone:](WDTableCellProperties, "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    v4->mWidth = self->mWidth;
    v4->mPosition = self->mPosition;
    v6 = *((_BYTE *)v4 + 12) & 0xFE | *((_BYTE *)self + 12) & 1;
    *((_BYTE *)v4 + 12) = v6;
    v7 = v6 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 12) >> 1) & 1));
    *((_BYTE *)v4 + 12) = v7;
    *((_BYTE *)v4 + 12) = v7 & 0xFB | *((_BYTE *)self + 12) & 4;
    WDTableCellPropertiesValues::operator=((uint64_t)&v4->mOriginalProperties, (uint64_t)&self->mOriginalProperties);
    WDTableCellPropertiesValues::operator=((uint64_t)&v5->mTrackedProperties, (uint64_t)&self->mTrackedProperties);
    v8 = v5;
  }

  return v5;
}

- (WDDocument)document
{
  return (WDDocument *)objc_loadWeakRetained((id *)&self->mDocument);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDTableCellProperties;
  -[WDTableCellProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
