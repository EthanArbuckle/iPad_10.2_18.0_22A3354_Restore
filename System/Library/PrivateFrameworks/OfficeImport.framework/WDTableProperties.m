@implementation WDTableProperties

- (WDTableProperties)initWithDocument:(id)a3
{
  id v4;
  WDTableProperties *v5;
  WDTableProperties *v6;
  WDTablePropertiesValues *v7;
  WDTablePropertiesValues *mOriginalProperties;
  WDTablePropertiesValues *v9;
  WDTablePropertiesValues *mTrackedProperties;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WDTableProperties;
  v5 = -[WDTableProperties init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    *((_BYTE *)v6 + 8) = *((_BYTE *)v6 + 8) & 0xF8 | 1;
    v7 = objc_alloc_init(WDTablePropertiesValues);
    mOriginalProperties = v6->mOriginalProperties;
    v6->mOriginalProperties = v7;

    v9 = objc_alloc_init(WDTablePropertiesValues);
    mTrackedProperties = v6->mTrackedProperties;
    v6->mTrackedProperties = v9;

  }
  return v6;
}

- (void)setResolveMode:(int)a3
{
  *((_BYTE *)self + 8) = (2 * (a3 == 1)) | (4 * (a3 == 2)) | (a3 == 0) | *((_BYTE *)self + 8) & 0xF8;
}

- (id)mutableTopBorder
{
  WDBorder *v3;
  void *v4;
  WDTablePropertiesValues *mTrackedProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    -[WDTablePropertiesValues topBorder](self->mTrackedProperties, "topBorder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      -[WDTablePropertiesValues topBorder](mTrackedProperties, "topBorder");
      v3 = (WDBorder *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    -[WDTablePropertiesValues setTopBorderOverridden:](mTrackedProperties, "setTopBorderOverridden:", 1);
    mOriginalProperties = self->mTrackedProperties;
LABEL_9:
    v3 = objc_alloc_init(WDBorder);
    -[WDTablePropertiesValues setTopBorder:](mOriginalProperties, "setTopBorder:", v3);
    return v3;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    -[WDTablePropertiesValues topBorder](self->mOriginalProperties, "topBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mOriginalProperties;
    if (v7)
      goto LABEL_7;
    -[WDTablePropertiesValues setTopBorderOverridden:](mTrackedProperties, "setTopBorderOverridden:", 1);
    mOriginalProperties = self->mOriginalProperties;
    goto LABEL_9;
  }
  v3 = 0;
  return v3;
}

- (id)mutableLeftBorder
{
  WDBorder *v3;
  void *v4;
  WDTablePropertiesValues *mTrackedProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    -[WDTablePropertiesValues leftBorder](self->mTrackedProperties, "leftBorder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      -[WDTablePropertiesValues leftBorder](mTrackedProperties, "leftBorder");
      v3 = (WDBorder *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    -[WDTablePropertiesValues setLeftBorderOverridden:](mTrackedProperties, "setLeftBorderOverridden:", 1);
    mOriginalProperties = self->mTrackedProperties;
LABEL_9:
    v3 = objc_alloc_init(WDBorder);
    -[WDTablePropertiesValues setLeftBorder:](mOriginalProperties, "setLeftBorder:", v3);
    return v3;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    -[WDTablePropertiesValues leftBorder](self->mOriginalProperties, "leftBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mOriginalProperties;
    if (v7)
      goto LABEL_7;
    -[WDTablePropertiesValues setLeftBorderOverridden:](mTrackedProperties, "setLeftBorderOverridden:", 1);
    mOriginalProperties = self->mOriginalProperties;
    goto LABEL_9;
  }
  v3 = 0;
  return v3;
}

- (id)mutableBottomBorder
{
  WDBorder *v3;
  void *v4;
  WDTablePropertiesValues *mTrackedProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    -[WDTablePropertiesValues bottomBorder](self->mTrackedProperties, "bottomBorder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      -[WDTablePropertiesValues bottomBorder](mTrackedProperties, "bottomBorder");
      v3 = (WDBorder *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    -[WDTablePropertiesValues setBottomBorderOverridden:](mTrackedProperties, "setBottomBorderOverridden:", 1);
    mOriginalProperties = self->mTrackedProperties;
LABEL_9:
    v3 = objc_alloc_init(WDBorder);
    -[WDTablePropertiesValues setBottomBorder:](mOriginalProperties, "setBottomBorder:", v3);
    return v3;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    -[WDTablePropertiesValues bottomBorder](self->mOriginalProperties, "bottomBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mOriginalProperties;
    if (v7)
      goto LABEL_7;
    -[WDTablePropertiesValues setBottomBorderOverridden:](mTrackedProperties, "setBottomBorderOverridden:", 1);
    mOriginalProperties = self->mOriginalProperties;
    goto LABEL_9;
  }
  v3 = 0;
  return v3;
}

- (id)mutableRightBorder
{
  WDBorder *v3;
  void *v4;
  WDTablePropertiesValues *mTrackedProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    -[WDTablePropertiesValues rightBorder](self->mTrackedProperties, "rightBorder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      -[WDTablePropertiesValues rightBorder](mTrackedProperties, "rightBorder");
      v3 = (WDBorder *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    -[WDTablePropertiesValues setRightBorderOverridden:](mTrackedProperties, "setRightBorderOverridden:", 1);
    mOriginalProperties = self->mTrackedProperties;
LABEL_9:
    v3 = objc_alloc_init(WDBorder);
    -[WDTablePropertiesValues setRightBorder:](mOriginalProperties, "setRightBorder:", v3);
    return v3;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    -[WDTablePropertiesValues rightBorder](self->mOriginalProperties, "rightBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mOriginalProperties;
    if (v7)
      goto LABEL_7;
    -[WDTablePropertiesValues setRightBorderOverridden:](mTrackedProperties, "setRightBorderOverridden:", 1);
    mOriginalProperties = self->mOriginalProperties;
    goto LABEL_9;
  }
  v3 = 0;
  return v3;
}

- (id)mutableInsideHorizontalBorder
{
  WDBorder *v3;
  void *v4;
  WDTablePropertiesValues *mTrackedProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    -[WDTablePropertiesValues insideHorizontalBorder](self->mTrackedProperties, "insideHorizontalBorder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      -[WDTablePropertiesValues insideHorizontalBorder](mTrackedProperties, "insideHorizontalBorder");
      v3 = (WDBorder *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    -[WDTablePropertiesValues setInsideHorizontalBorderOverridden:](mTrackedProperties, "setInsideHorizontalBorderOverridden:", 1);
    mOriginalProperties = self->mTrackedProperties;
LABEL_9:
    v3 = objc_alloc_init(WDBorder);
    -[WDTablePropertiesValues setInsideHorizontalBorder:](mOriginalProperties, "setInsideHorizontalBorder:", v3);
    return v3;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    -[WDTablePropertiesValues insideHorizontalBorder](self->mOriginalProperties, "insideHorizontalBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mOriginalProperties;
    if (v7)
      goto LABEL_7;
    -[WDTablePropertiesValues setInsideHorizontalBorderOverridden:](mTrackedProperties, "setInsideHorizontalBorderOverridden:", 1);
    mOriginalProperties = self->mOriginalProperties;
    goto LABEL_9;
  }
  v3 = 0;
  return v3;
}

- (id)mutableInsideVerticalBorder
{
  WDBorder *v3;
  void *v4;
  WDTablePropertiesValues *mTrackedProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    -[WDTablePropertiesValues insideVerticalBorder](self->mTrackedProperties, "insideVerticalBorder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      -[WDTablePropertiesValues insideVerticalBorder](mTrackedProperties, "insideVerticalBorder");
      v3 = (WDBorder *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    -[WDTablePropertiesValues setInsideVerticalBorderOverridden:](mTrackedProperties, "setInsideVerticalBorderOverridden:", 1);
    mOriginalProperties = self->mTrackedProperties;
LABEL_9:
    v3 = objc_alloc_init(WDBorder);
    -[WDTablePropertiesValues setInsideVerticalBorder:](mOriginalProperties, "setInsideVerticalBorder:", v3);
    return v3;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    -[WDTablePropertiesValues insideVerticalBorder](self->mOriginalProperties, "insideVerticalBorder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mOriginalProperties;
    if (v7)
      goto LABEL_7;
    -[WDTablePropertiesValues setInsideVerticalBorderOverridden:](mTrackedProperties, "setInsideVerticalBorderOverridden:", 1);
    mOriginalProperties = self->mOriginalProperties;
    goto LABEL_9;
  }
  v3 = 0;
  return v3;
}

- (void)setAlignment:(int)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setAlignment:", *(_QWORD *)&a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setAlignmentOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (void)clearShading
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues shadingOverridden](self->mTrackedProperties, "shadingOverridden"))
    {
LABEL_7:
      -[WDTablePropertiesValues setShadingOverridden:](*p_mTrackedProperties, "setShadingOverridden:", 0);
      -[WDTablePropertiesValues setShading:](*p_mTrackedProperties, "setShading:", 0);
      return;
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues shadingOverridden](mOriginalProperties, "shadingOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
}

- (WDDocument)document
{
  return (WDDocument *)objc_loadWeakRetained((id *)&self->mDocument);
}

- (BOOL)isBaseStyleOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues baseStyleOverridden](self->mTrackedProperties, "baseStyleOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "baseStyleOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0 && -[WDTablePropertiesValues baseStyleOverridden](self->mOriginalProperties, "baseStyleOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "baseStyleOverridden");
  }
  return 0;
}

- (BOOL)isTableFloating
{
  _BOOL4 v3;

  if (-[WDTableProperties isHorizontalAnchorOverridden](self, "isHorizontalAnchorOverridden")
    && -[WDTableProperties horizontalAnchor](self, "horizontalAnchor")
    || -[WDTableProperties isVerticalAnchorOverridden](self, "isVerticalAnchorOverridden")
    && -[WDTableProperties verticalAnchor](self, "verticalAnchor") != 2
    || -[WDTableProperties isHorizontalPositionOverridden](self, "isHorizontalPositionOverridden")
    && -[WDTableProperties horizontalPosition](self, "horizontalPosition"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[WDTableProperties isVerticalPositionOverridden](self, "isVerticalPositionOverridden");
    if (v3)
      LOBYTE(v3) = -[WDTableProperties verticalPosition](self, "verticalPosition") != 0;
  }
  return v3;
}

- (BOOL)isHorizontalAnchorOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues horizontalAnchorOverridden](self->mTrackedProperties, "horizontalAnchorOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "horizontalAnchorOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues horizontalAnchorOverridden](self->mOriginalProperties, "horizontalAnchorOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "horizontalAnchorOverridden");
  }
  return 0;
}

- (BOOL)isVerticalAnchorOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues verticalAnchorOverridden](self->mTrackedProperties, "verticalAnchorOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "verticalAnchorOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues verticalAnchorOverridden](self->mOriginalProperties, "verticalAnchorOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "verticalAnchorOverridden");
  }
  return 0;
}

- (BOOL)isHorizontalPositionOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues horizontalPositionOverridden](self->mTrackedProperties, "horizontalPositionOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "horizontalPositionOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues horizontalPositionOverridden](self->mOriginalProperties, "horizontalPositionOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "horizontalPositionOverridden");
  }
  return 0;
}

- (BOOL)isVerticalPositionOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues verticalPositionOverridden](self->mTrackedProperties, "verticalPositionOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "verticalPositionOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues verticalPositionOverridden](self->mOriginalProperties, "verticalPositionOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "verticalPositionOverridden");
  }
  return 0;
}

- (BOOL)isTopBorderOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues topBorderOverridden](self->mTrackedProperties, "topBorderOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "topBorderOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0 && -[WDTablePropertiesValues topBorderOverridden](self->mOriginalProperties, "topBorderOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "topBorderOverridden");
  }
  return 0;
}

- (id)topBorder
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues topBorderOverridden](self->mTrackedProperties, "topBorderOverridden"))
      goto LABEL_7;
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        !-[WDTablePropertiesValues topBorderOverridden](mOriginalProperties, "topBorderOverridden")))
  {
    v7 = 0;
    return v7;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  -[WDTablePropertiesValues topBorder](*p_mTrackedProperties, "topBorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (BOOL)isLeftBorderOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues leftBorderOverridden](self->mTrackedProperties, "leftBorderOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "leftBorderOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues leftBorderOverridden](self->mOriginalProperties, "leftBorderOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "leftBorderOverridden");
  }
  return 0;
}

- (id)leftBorder
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues leftBorderOverridden](self->mTrackedProperties, "leftBorderOverridden"))
      goto LABEL_7;
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        !-[WDTablePropertiesValues leftBorderOverridden](mOriginalProperties, "leftBorderOverridden")))
  {
    v7 = 0;
    return v7;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  -[WDTablePropertiesValues leftBorder](*p_mTrackedProperties, "leftBorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (BOOL)isBottomBorderOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues bottomBorderOverridden](self->mTrackedProperties, "bottomBorderOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "bottomBorderOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues bottomBorderOverridden](self->mOriginalProperties, "bottomBorderOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "bottomBorderOverridden");
  }
  return 0;
}

- (id)bottomBorder
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues bottomBorderOverridden](self->mTrackedProperties, "bottomBorderOverridden"))
      goto LABEL_7;
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        !-[WDTablePropertiesValues bottomBorderOverridden](mOriginalProperties, "bottomBorderOverridden")))
  {
    v7 = 0;
    return v7;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  -[WDTablePropertiesValues bottomBorder](*p_mTrackedProperties, "bottomBorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (BOOL)isRightBorderOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues rightBorderOverridden](self->mTrackedProperties, "rightBorderOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "rightBorderOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues rightBorderOverridden](self->mOriginalProperties, "rightBorderOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "rightBorderOverridden");
  }
  return 0;
}

- (id)rightBorder
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues rightBorderOverridden](self->mTrackedProperties, "rightBorderOverridden"))
      goto LABEL_7;
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        !-[WDTablePropertiesValues rightBorderOverridden](mOriginalProperties, "rightBorderOverridden")))
  {
    v7 = 0;
    return v7;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  -[WDTablePropertiesValues rightBorder](*p_mTrackedProperties, "rightBorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (BOOL)isInsideHorizontalBorderOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues insideHorizontalBorderOverridden](self->mTrackedProperties, "insideHorizontalBorderOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "insideHorizontalBorderOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues insideHorizontalBorderOverridden](self->mOriginalProperties, "insideHorizontalBorderOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "insideHorizontalBorderOverridden");
  }
  return 0;
}

- (id)insideHorizontalBorder
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues insideHorizontalBorderOverridden](self->mTrackedProperties, "insideHorizontalBorderOverridden"))
    {
      goto LABEL_7;
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        !-[WDTablePropertiesValues insideHorizontalBorderOverridden](mOriginalProperties, "insideHorizontalBorderOverridden")))
  {
    v7 = 0;
    return v7;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  -[WDTablePropertiesValues insideHorizontalBorder](*p_mTrackedProperties, "insideHorizontalBorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (BOOL)isInsideVerticalBorderOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues insideVerticalBorderOverridden](self->mTrackedProperties, "insideVerticalBorderOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "insideVerticalBorderOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues insideVerticalBorderOverridden](self->mOriginalProperties, "insideVerticalBorderOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "insideVerticalBorderOverridden");
  }
  return 0;
}

- (id)insideVerticalBorder
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues insideVerticalBorderOverridden](self->mTrackedProperties, "insideVerticalBorderOverridden"))
    {
      goto LABEL_7;
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        !-[WDTablePropertiesValues insideVerticalBorderOverridden](mOriginalProperties, "insideVerticalBorderOverridden")))
  {
    v7 = 0;
    return v7;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  -[WDTablePropertiesValues insideVerticalBorder](*p_mTrackedProperties, "insideVerticalBorder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (int64_t)horizontalPosition
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues horizontalPositionOverridden](self->mTrackedProperties, "horizontalPositionOverridden"))
    {
      return -[WDTablePropertiesValues horizontalPosition](*p_mTrackedProperties, "horizontalPosition");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues horizontalPositionOverridden](mOriginalProperties, "horizontalPositionOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues horizontalPosition](*p_mTrackedProperties, "horizontalPosition");
    }
  }
  return 0;
}

- (int64_t)leftDistanceFromText
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues leftDistanceFromTextOverridden](self->mTrackedProperties, "leftDistanceFromTextOverridden"))
    {
      return -[WDTablePropertiesValues leftDistanceFromText](*p_mTrackedProperties, "leftDistanceFromText");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues leftDistanceFromTextOverridden](mOriginalProperties, "leftDistanceFromTextOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues leftDistanceFromText](*p_mTrackedProperties, "leftDistanceFromText");
    }
  }
  return 0;
}

- (void)setWidth:(int64_t)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setWidth:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setWidthOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (void)setWidthType:(int)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setWidthType:", *(_QWORD *)&a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setWidthTypeOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (void)setIndent:(signed __int16)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setIndent:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setIndentOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (void)setIndentType:(int)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setIndentType:", *(_QWORD *)&a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setIndentTypeOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (void)setBaseStyle:(id)a3
{
  id v4;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues *mOriginalProperties;
  WDTablePropertiesValues *mTrackedProperties;
  id v8;

  v4 = a3;
  v8 = v4;
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    -[WDTablePropertiesValues setBaseStyle:](mTrackedProperties, "setBaseStyle:", v4);
    goto LABEL_5;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    -[WDTablePropertiesValues setBaseStyle:](mOriginalProperties, "setBaseStyle:", v4);
LABEL_5:
    -[WDTablePropertiesValues setBaseStyleOverridden:](*p_mTrackedProperties, "setBaseStyleOverridden:", 1);
  }

}

- (void)setJustification:(int)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setJustification:", *(_QWORD *)&a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setJustificationOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (id)baseStyle
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues baseStyleOverridden](self->mTrackedProperties, "baseStyleOverridden"))
      goto LABEL_7;
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        !-[WDTablePropertiesValues baseStyleOverridden](mOriginalProperties, "baseStyleOverridden")))
  {
    v7 = 0;
    return v7;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  -[WDTablePropertiesValues baseStyle](*p_mTrackedProperties, "baseStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void)setCellSpacing:(signed __int16)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setCellSpacing:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setCellSpacingOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (void)setVerticalAnchor:(int)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setVerticalAnchor:", *(_QWORD *)&a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setVerticalAnchorOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (void)setHorizontalAnchor:(int)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setHorizontalAnchor:", *(_QWORD *)&a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setHorizontalAnchorOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (void)setVerticalPosition:(int64_t)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setVerticalPosition:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setVerticalPositionOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (void)setLeftDistanceFromText:(int64_t)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setLeftDistanceFromText:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setLeftDistanceFromTextOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (void)setRightDistanceFromText:(int64_t)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setRightDistanceFromText:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setRightDistanceFromTextOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (int)horizontalAnchor
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues horizontalAnchorOverridden](self->mTrackedProperties, "horizontalAnchorOverridden"))
      return -[WDTablePropertiesValues horizontalAnchor](*p_mTrackedProperties, "horizontalAnchor");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues horizontalAnchorOverridden](mOriginalProperties, "horizontalAnchorOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues horizontalAnchor](*p_mTrackedProperties, "horizontalAnchor");
    }
  }
  return 2;
}

- (int64_t)verticalPosition
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues verticalPositionOverridden](self->mTrackedProperties, "verticalPositionOverridden"))
      return -[WDTablePropertiesValues verticalPosition](*p_mTrackedProperties, "verticalPosition");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues verticalPositionOverridden](mOriginalProperties, "verticalPositionOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues verticalPosition](*p_mTrackedProperties, "verticalPosition");
    }
  }
  return 0;
}

- (int)verticalAnchor
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues verticalAnchorOverridden](self->mTrackedProperties, "verticalAnchorOverridden"))
      return -[WDTablePropertiesValues verticalAnchor](*p_mTrackedProperties, "verticalAnchor");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues verticalAnchorOverridden](mOriginalProperties, "verticalAnchorOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues verticalAnchor](*p_mTrackedProperties, "verticalAnchor");
    }
  }
  return 1;
}

- (id)mutableShading
{
  WDShading *v3;
  void *v4;
  WDTablePropertiesValues *mTrackedProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    -[WDTablePropertiesValues shading](self->mTrackedProperties, "shading");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mTrackedProperties;
    if (v4)
    {
LABEL_7:
      -[WDTablePropertiesValues shading](mTrackedProperties, "shading");
      v3 = (WDShading *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    -[WDTablePropertiesValues setShadingOverridden:](mTrackedProperties, "setShadingOverridden:", 1);
    mOriginalProperties = self->mTrackedProperties;
LABEL_9:
    v3 = objc_alloc_init(WDShading);
    -[WDTablePropertiesValues setShading:](mOriginalProperties, "setShading:", v3);
    return v3;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    -[WDTablePropertiesValues shading](self->mOriginalProperties, "shading");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    mTrackedProperties = self->mOriginalProperties;
    if (v7)
      goto LABEL_7;
    -[WDTablePropertiesValues setShadingOverridden:](mTrackedProperties, "setShadingOverridden:", 1);
    mOriginalProperties = self->mOriginalProperties;
    goto LABEL_9;
  }
  v3 = 0;
  return v3;
}

- (void)setCellSpacingType:(int)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setCellSpacingType:", *(_QWORD *)&a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setCellSpacingTypeOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (void)setHorizontalPosition:(int64_t)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setHorizontalPosition:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setHorizontalPositionOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (void)setBottomDistanceFromText:(int64_t)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setBottomDistanceFromText:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setBottomDistanceFromTextOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (WDTableProperties)init
{

  return 0;
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

- (unsigned)look
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues lookOverridden](self->mTrackedProperties, "lookOverridden"))
      return -[WDTablePropertiesValues look](*p_mTrackedProperties, "look");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues lookOverridden](mOriginalProperties, "lookOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues look](*p_mTrackedProperties, "look");
    }
  }
  return 0;
}

- (void)setLook:(unsigned __int16)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setLook:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setLookOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (BOOL)isLookOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues lookOverridden](self->mTrackedProperties, "lookOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "lookOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0 && -[WDTablePropertiesValues lookOverridden](self->mOriginalProperties, "lookOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "lookOverridden");
  }
  return 0;
}

- (id)shading
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues shadingOverridden](self->mTrackedProperties, "shadingOverridden"))
      goto LABEL_7;
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        !-[WDTablePropertiesValues shadingOverridden](mOriginalProperties, "shadingOverridden")))
  {
    v7 = 0;
    return v7;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  -[WDTablePropertiesValues shading](*p_mTrackedProperties, "shading");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (BOOL)isShadingOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues shadingOverridden](self->mTrackedProperties, "shadingOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "shadingOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0 && -[WDTablePropertiesValues shadingOverridden](self->mOriginalProperties, "shadingOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "shadingOverridden");
  }
  return 0;
}

- (void)clearTopBorder
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues topBorderOverridden](self->mTrackedProperties, "topBorderOverridden"))
    {
LABEL_7:
      -[WDTablePropertiesValues setTopBorderOverridden:](*p_mTrackedProperties, "setTopBorderOverridden:", 0);
      -[WDTablePropertiesValues setTopBorder:](*p_mTrackedProperties, "setTopBorder:", 0);
      return;
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues topBorderOverridden](mOriginalProperties, "topBorderOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
}

- (void)clearLeftBorder
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues leftBorderOverridden](self->mTrackedProperties, "leftBorderOverridden"))
    {
LABEL_7:
      -[WDTablePropertiesValues setLeftBorderOverridden:](*p_mTrackedProperties, "setLeftBorderOverridden:", 0);
      -[WDTablePropertiesValues setLeftBorder:](*p_mTrackedProperties, "setLeftBorder:", 0);
      return;
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues leftBorderOverridden](mOriginalProperties, "leftBorderOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
}

- (void)clearBottomBorder
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues bottomBorderOverridden](self->mTrackedProperties, "bottomBorderOverridden"))
    {
LABEL_7:
      -[WDTablePropertiesValues setBottomBorderOverridden:](*p_mTrackedProperties, "setBottomBorderOverridden:", 0);
      -[WDTablePropertiesValues setBottomBorder:](*p_mTrackedProperties, "setBottomBorder:", 0);
      return;
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues bottomBorderOverridden](mOriginalProperties, "bottomBorderOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
}

- (void)clearRightBorder
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues rightBorderOverridden](self->mTrackedProperties, "rightBorderOverridden"))
    {
LABEL_7:
      -[WDTablePropertiesValues setRightBorderOverridden:](*p_mTrackedProperties, "setRightBorderOverridden:", 0);
      -[WDTablePropertiesValues setRightBorder:](*p_mTrackedProperties, "setRightBorder:", 0);
      return;
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues rightBorderOverridden](mOriginalProperties, "rightBorderOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
}

- (void)clearInsideHorizontalBorder
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues insideHorizontalBorderOverridden](self->mTrackedProperties, "insideHorizontalBorderOverridden"))
    {
LABEL_7:
      -[WDTablePropertiesValues setInsideHorizontalBorderOverridden:](*p_mTrackedProperties, "setInsideHorizontalBorderOverridden:", 0);
      -[WDTablePropertiesValues setInsideHorizontalBorder:](*p_mTrackedProperties, "setInsideHorizontalBorder:", 0);
      return;
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues insideHorizontalBorderOverridden](mOriginalProperties, "insideHorizontalBorderOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
}

- (void)clearInsideVerticalBorder
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues insideVerticalBorderOverridden](self->mTrackedProperties, "insideVerticalBorderOverridden"))
    {
LABEL_7:
      -[WDTablePropertiesValues setInsideVerticalBorderOverridden:](*p_mTrackedProperties, "setInsideVerticalBorderOverridden:", 0);
      -[WDTablePropertiesValues setInsideVerticalBorder:](*p_mTrackedProperties, "setInsideVerticalBorder:", 0);
      return;
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues insideVerticalBorderOverridden](mOriginalProperties, "insideVerticalBorderOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      goto LABEL_7;
    }
  }
}

- (int)justification
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues justificationOverridden](self->mTrackedProperties, "justificationOverridden"))
      return -[WDTablePropertiesValues justification](*p_mTrackedProperties, "justification");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues justificationOverridden](mOriginalProperties, "justificationOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues justification](*p_mTrackedProperties, "justification");
    }
  }
  return 0;
}

- (BOOL)isJustificationOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues justificationOverridden](self->mTrackedProperties, "justificationOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "justificationOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues justificationOverridden](self->mOriginalProperties, "justificationOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "justificationOverridden");
  }
  return 0;
}

- (int)alignment
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues alignmentOverridden](self->mTrackedProperties, "alignmentOverridden"))
      return -[WDTablePropertiesValues alignment](*p_mTrackedProperties, "alignment");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues alignmentOverridden](mOriginalProperties, "alignmentOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues alignment](*p_mTrackedProperties, "alignment");
    }
  }
  return 0;
}

- (BOOL)isAlignmentOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues alignmentOverridden](self->mTrackedProperties, "alignmentOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "alignmentOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0 && -[WDTablePropertiesValues alignmentOverridden](self->mOriginalProperties, "alignmentOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "alignmentOverridden");
  }
  return 0;
}

- (int64_t)width
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues widthOverridden](self->mTrackedProperties, "widthOverridden"))
      return -[WDTablePropertiesValues width](*p_mTrackedProperties, "width");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues widthOverridden](mOriginalProperties, "widthOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues width](*p_mTrackedProperties, "width");
    }
  }
  return 0;
}

- (BOOL)isWidthOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues widthOverridden](self->mTrackedProperties, "widthOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "widthOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0 && -[WDTablePropertiesValues widthOverridden](self->mOriginalProperties, "widthOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "widthOverridden");
  }
  return 0;
}

- (int)widthType
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues widthTypeOverridden](self->mTrackedProperties, "widthTypeOverridden"))
      return -[WDTablePropertiesValues widthType](*p_mTrackedProperties, "widthType");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues widthTypeOverridden](mOriginalProperties, "widthTypeOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues widthType](*p_mTrackedProperties, "widthType");
    }
  }
  return 1;
}

- (BOOL)isWidthTypeOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues widthTypeOverridden](self->mTrackedProperties, "widthTypeOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "widthTypeOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0 && -[WDTablePropertiesValues widthTypeOverridden](self->mOriginalProperties, "widthTypeOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "widthTypeOverridden");
  }
  return 0;
}

- (signed)indent
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues indentOverridden](self->mTrackedProperties, "indentOverridden"))
      return -[WDTablePropertiesValues indent](*p_mTrackedProperties, "indent");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues indentOverridden](mOriginalProperties, "indentOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues indent](*p_mTrackedProperties, "indent");
    }
  }
  return 0;
}

- (BOOL)isIndentOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues indentOverridden](self->mTrackedProperties, "indentOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "indentOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0 && -[WDTablePropertiesValues indentOverridden](self->mOriginalProperties, "indentOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "indentOverridden");
  }
  return 0;
}

- (int)indentType
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues indentTypeOverridden](self->mTrackedProperties, "indentTypeOverridden"))
      return -[WDTablePropertiesValues indentType](*p_mTrackedProperties, "indentType");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues indentTypeOverridden](mOriginalProperties, "indentTypeOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues indentType](*p_mTrackedProperties, "indentType");
    }
  }
  return 1;
}

- (BOOL)isIndentTypeOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues indentTypeOverridden](self->mTrackedProperties, "indentTypeOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "indentTypeOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues indentTypeOverridden](self->mOriginalProperties, "indentTypeOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "indentTypeOverridden");
  }
  return 0;
}

- (signed)cellSpacing
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues cellSpacingOverridden](self->mTrackedProperties, "cellSpacingOverridden"))
      return -[WDTablePropertiesValues cellSpacing](*p_mTrackedProperties, "cellSpacing");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues cellSpacingOverridden](mOriginalProperties, "cellSpacingOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues cellSpacing](*p_mTrackedProperties, "cellSpacing");
    }
  }
  return 0;
}

- (BOOL)isCellSpacingOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues cellSpacingOverridden](self->mTrackedProperties, "cellSpacingOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "cellSpacingOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues cellSpacingOverridden](self->mOriginalProperties, "cellSpacingOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "cellSpacingOverridden");
  }
  return 0;
}

- (int)cellSpacingType
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues cellSpacingTypeOverridden](self->mTrackedProperties, "cellSpacingTypeOverridden"))
      return -[WDTablePropertiesValues cellSpacingType](*p_mTrackedProperties, "cellSpacingType");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues cellSpacingTypeOverridden](mOriginalProperties, "cellSpacingTypeOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues cellSpacingType](*p_mTrackedProperties, "cellSpacingType");
    }
  }
  return 1;
}

- (BOOL)isCellSpacingTypeOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues cellSpacingTypeOverridden](self->mTrackedProperties, "cellSpacingTypeOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "cellSpacingTypeOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues cellSpacingTypeOverridden](self->mOriginalProperties, "cellSpacingTypeOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "cellSpacingTypeOverridden");
  }
  return 0;
}

- (BOOL)isLeftDistanceFromTextOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues leftDistanceFromTextOverridden](self->mTrackedProperties, "leftDistanceFromTextOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "leftDistanceFromTextOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues leftDistanceFromTextOverridden](self->mOriginalProperties, "leftDistanceFromTextOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "leftDistanceFromTextOverridden");
  }
  return 0;
}

- (int64_t)topDistanceFromText
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues topDistanceFromTextOverridden](self->mTrackedProperties, "topDistanceFromTextOverridden"))
    {
      return -[WDTablePropertiesValues topDistanceFromText](*p_mTrackedProperties, "topDistanceFromText");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues topDistanceFromTextOverridden](mOriginalProperties, "topDistanceFromTextOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues topDistanceFromText](*p_mTrackedProperties, "topDistanceFromText");
    }
  }
  return 0;
}

- (void)setTopDistanceFromText:(int64_t)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setTopDistanceFromText:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setTopDistanceFromTextOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (BOOL)isTopDistanceFromTextOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues topDistanceFromTextOverridden](self->mTrackedProperties, "topDistanceFromTextOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "topDistanceFromTextOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues topDistanceFromTextOverridden](self->mOriginalProperties, "topDistanceFromTextOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "topDistanceFromTextOverridden");
  }
  return 0;
}

- (int64_t)rightDistanceFromText
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues rightDistanceFromTextOverridden](self->mTrackedProperties, "rightDistanceFromTextOverridden"))
    {
      return -[WDTablePropertiesValues rightDistanceFromText](*p_mTrackedProperties, "rightDistanceFromText");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues rightDistanceFromTextOverridden](mOriginalProperties, "rightDistanceFromTextOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues rightDistanceFromText](*p_mTrackedProperties, "rightDistanceFromText");
    }
  }
  return 0;
}

- (BOOL)isRightDistanceFromTextOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues rightDistanceFromTextOverridden](self->mTrackedProperties, "rightDistanceFromTextOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "rightDistanceFromTextOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues rightDistanceFromTextOverridden](self->mOriginalProperties, "rightDistanceFromTextOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "rightDistanceFromTextOverridden");
  }
  return 0;
}

- (int64_t)bottomDistanceFromText
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues bottomDistanceFromTextOverridden](self->mTrackedProperties, "bottomDistanceFromTextOverridden"))
    {
      return -[WDTablePropertiesValues bottomDistanceFromText](*p_mTrackedProperties, "bottomDistanceFromText");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues bottomDistanceFromTextOverridden](mOriginalProperties, "bottomDistanceFromTextOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues bottomDistanceFromText](*p_mTrackedProperties, "bottomDistanceFromText");
    }
  }
  return 0;
}

- (BOOL)isBottomDistanceFromTextOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues bottomDistanceFromTextOverridden](self->mTrackedProperties, "bottomDistanceFromTextOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "bottomDistanceFromTextOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues bottomDistanceFromTextOverridden](self->mOriginalProperties, "bottomDistanceFromTextOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "bottomDistanceFromTextOverridden");
  }
  return 0;
}

- (int)deleted
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues deletedOverridden](self->mTrackedProperties, "deletedOverridden"))
      return -[WDTablePropertiesValues deleted](*p_mTrackedProperties, "deleted");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues deletedOverridden](mOriginalProperties, "deletedOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues deleted](*p_mTrackedProperties, "deleted");
    }
  }
  return 0;
}

- (void)setDeleted:(int)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setDeleted:", *(_QWORD *)&a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setDeletedOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (BOOL)isDeletedOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues deletedOverridden](self->mTrackedProperties, "deletedOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "deletedOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0 && -[WDTablePropertiesValues deletedOverridden](self->mOriginalProperties, "deletedOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "deletedOverridden");
  }
  return 0;
}

- (int)edited
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues editedOverridden](self->mTrackedProperties, "editedOverridden"))
      return -[WDTablePropertiesValues edited](*p_mTrackedProperties, "edited");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues editedOverridden](mOriginalProperties, "editedOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues edited](*p_mTrackedProperties, "edited");
    }
  }
  return 0;
}

- (void)setEdited:(int)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setEdited:", *(_QWORD *)&a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setEditedOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (BOOL)isEditedOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues editedOverridden](self->mTrackedProperties, "editedOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "editedOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0 && -[WDTablePropertiesValues editedOverridden](self->mOriginalProperties, "editedOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "editedOverridden");
  }
  return 0;
}

- (int)formattingChanged
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues formattingChangedOverridden](self->mTrackedProperties, "formattingChangedOverridden"))
      return -[WDTablePropertiesValues formattingChanged](*p_mTrackedProperties, "formattingChanged");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues formattingChangedOverridden](mOriginalProperties, "formattingChangedOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues formattingChanged](*p_mTrackedProperties, "formattingChanged");
    }
  }
  return 0;
}

- (void)setFormattingChanged:(int)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setFormattingChanged:", *(_QWORD *)&a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setFormattingChangedOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (BOOL)isFormattingChangedOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues formattingChangedOverridden](self->mTrackedProperties, "formattingChangedOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "formattingChangedOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues formattingChangedOverridden](self->mOriginalProperties, "formattingChangedOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "formattingChangedOverridden");
  }
  return 0;
}

- (BOOL)biDirectional
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues biDirectionalOverridden](self->mTrackedProperties, "biDirectionalOverridden"))
      return -[WDTablePropertiesValues biDirectional](*p_mTrackedProperties, "biDirectional");
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues biDirectionalOverridden](mOriginalProperties, "biDirectionalOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues biDirectional](*p_mTrackedProperties, "biDirectional");
    }
  }
  return 0;
}

- (void)setBiDirectional:(BOOL)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setBiDirectional:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setBiDirectionalOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (BOOL)isBiDirectionalOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues biDirectionalOverridden](self->mTrackedProperties, "biDirectionalOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "biDirectionalOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues biDirectionalOverridden](self->mOriginalProperties, "biDirectionalOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "biDirectionalOverridden");
  }
  return 0;
}

- (unsigned)indexToAuthorIDOfDeletion
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues indexToAuthorIDOfDeletionOverridden](self->mTrackedProperties, "indexToAuthorIDOfDeletionOverridden"))
    {
      return -[WDTablePropertiesValues indexToAuthorIDOfDeletion](*p_mTrackedProperties, "indexToAuthorIDOfDeletion");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues indexToAuthorIDOfDeletionOverridden](mOriginalProperties, "indexToAuthorIDOfDeletionOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues indexToAuthorIDOfDeletion](*p_mTrackedProperties, "indexToAuthorIDOfDeletion");
    }
  }
  return 0;
}

- (void)setIndexToAuthorIDOfDeletion:(unsigned __int16)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setIndexToAuthorIDOfDeletion:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setIndexToAuthorIDOfDeletionOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (BOOL)isIndexToAuthorIDOfDeletionOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues indexToAuthorIDOfDeletionOverridden](self->mTrackedProperties, "indexToAuthorIDOfDeletionOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "indexToAuthorIDOfDeletionOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues indexToAuthorIDOfDeletionOverridden](self->mOriginalProperties, "indexToAuthorIDOfDeletionOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "indexToAuthorIDOfDeletionOverridden");
  }
  return 0;
}

- (unsigned)indexToAuthorIDOfEdit
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues indexToAuthorIDOfEditOverridden](self->mTrackedProperties, "indexToAuthorIDOfEditOverridden"))
    {
      return -[WDTablePropertiesValues indexToAuthorIDOfEdit](*p_mTrackedProperties, "indexToAuthorIDOfEdit");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues indexToAuthorIDOfEditOverridden](mOriginalProperties, "indexToAuthorIDOfEditOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues indexToAuthorIDOfEdit](*p_mTrackedProperties, "indexToAuthorIDOfEdit");
    }
  }
  return 0;
}

- (void)setIndexToAuthorIDOfEdit:(unsigned __int16)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setIndexToAuthorIDOfEdit:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setIndexToAuthorIDOfEditOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (BOOL)isIndexToAuthorIDOfEditOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues indexToAuthorIDOfEditOverridden](self->mTrackedProperties, "indexToAuthorIDOfEditOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "indexToAuthorIDOfEditOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues indexToAuthorIDOfEditOverridden](self->mOriginalProperties, "indexToAuthorIDOfEditOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "indexToAuthorIDOfEditOverridden");
  }
  return 0;
}

- (unsigned)indexToAuthorIDOfFormattingChange
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues indexToAuthorIDOfFormattingChangeOverridden](self->mTrackedProperties, "indexToAuthorIDOfFormattingChangeOverridden"))
    {
      return -[WDTablePropertiesValues indexToAuthorIDOfFormattingChange](*p_mTrackedProperties, "indexToAuthorIDOfFormattingChange");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mOriginalProperties = &self->mOriginalProperties;
    if (-[WDTablePropertiesValues indexToAuthorIDOfFormattingChangeOverridden](mOriginalProperties, "indexToAuthorIDOfFormattingChangeOverridden"))
    {
      p_mTrackedProperties = p_mOriginalProperties;
      return -[WDTablePropertiesValues indexToAuthorIDOfFormattingChange](*p_mTrackedProperties, "indexToAuthorIDOfFormattingChange");
    }
  }
  return 0;
}

- (void)setIndexToAuthorIDOfFormattingChange:(unsigned __int16)a3
{
  uint64_t v4;

  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    v4 = 24;
LABEL_6:
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setIndexToAuthorIDOfFormattingChange:", a3);
    objc_msgSend(*(id *)((char *)&self->super.isa + v4), "setIndexToAuthorIDOfFormattingChangeOverridden:", 1);
    return;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_6;
  }
}

- (BOOL)isIndexToAuthorIDOfFormattingChangeOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues indexToAuthorIDOfFormattingChangeOverridden](self->mTrackedProperties, "indexToAuthorIDOfFormattingChangeOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "indexToAuthorIDOfFormattingChangeOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues indexToAuthorIDOfFormattingChangeOverridden](self->mOriginalProperties, "indexToAuthorIDOfFormattingChangeOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "indexToAuthorIDOfFormattingChangeOverridden");
  }
  return 0;
}

- (id)deletionDate
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues deletionDateOverridden](self->mTrackedProperties, "deletionDateOverridden"))
      goto LABEL_7;
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        !-[WDTablePropertiesValues deletionDateOverridden](mOriginalProperties, "deletionDateOverridden")))
  {
    v7 = 0;
    return v7;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  -[WDTablePropertiesValues deletionDate](*p_mTrackedProperties, "deletionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void)setDeletionDate:(id)a3
{
  id v4;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues *mOriginalProperties;
  WDTablePropertiesValues *mTrackedProperties;
  id v8;

  v4 = a3;
  v8 = v4;
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    -[WDTablePropertiesValues setDeletionDate:](mTrackedProperties, "setDeletionDate:", v4);
    goto LABEL_5;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    -[WDTablePropertiesValues setDeletionDate:](mOriginalProperties, "setDeletionDate:", v4);
LABEL_5:
    -[WDTablePropertiesValues setDeletionDateOverridden:](*p_mTrackedProperties, "setDeletionDateOverridden:", 1);
  }

}

- (BOOL)isDeletionDateOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues deletionDateOverridden](self->mTrackedProperties, "deletionDateOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "deletionDateOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues deletionDateOverridden](self->mOriginalProperties, "deletionDateOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "deletionDateOverridden");
  }
  return 0;
}

- (id)editDate
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues editDateOverridden](self->mTrackedProperties, "editDateOverridden"))
      goto LABEL_7;
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        !-[WDTablePropertiesValues editDateOverridden](mOriginalProperties, "editDateOverridden")))
  {
    v7 = 0;
    return v7;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  -[WDTablePropertiesValues editDate](*p_mTrackedProperties, "editDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void)setEditDate:(id)a3
{
  id v4;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues *mOriginalProperties;
  WDTablePropertiesValues *mTrackedProperties;
  id v8;

  v4 = a3;
  v8 = v4;
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    -[WDTablePropertiesValues setEditDate:](mTrackedProperties, "setEditDate:", v4);
    goto LABEL_5;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    -[WDTablePropertiesValues setEditDate:](mOriginalProperties, "setEditDate:", v4);
LABEL_5:
    -[WDTablePropertiesValues setEditDateOverridden:](*p_mTrackedProperties, "setEditDateOverridden:", 1);
  }

}

- (BOOL)isEditDateOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues editDateOverridden](self->mTrackedProperties, "editDateOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "editDateOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0 && -[WDTablePropertiesValues editDateOverridden](self->mOriginalProperties, "editDateOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "editDateOverridden");
  }
  return 0;
}

- (id)formattingChangeDate
{
  char v3;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues **p_mOriginalProperties;
  WDTablePropertiesValues *mOriginalProperties;
  void *v7;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 6) != 0)
  {
    p_mTrackedProperties = &self->mTrackedProperties;
    if (-[WDTablePropertiesValues formattingChangeDateOverridden](self->mTrackedProperties, "formattingChangeDateOverridden"))
    {
      goto LABEL_7;
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 5) == 0
    || (mOriginalProperties = self->mOriginalProperties,
        p_mOriginalProperties = &self->mOriginalProperties,
        !-[WDTablePropertiesValues formattingChangeDateOverridden](mOriginalProperties, "formattingChangeDateOverridden")))
  {
    v7 = 0;
    return v7;
  }
  p_mTrackedProperties = p_mOriginalProperties;
LABEL_7:
  -[WDTablePropertiesValues formattingChangeDate](*p_mTrackedProperties, "formattingChangeDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (void)setFormattingChangeDate:(id)a3
{
  id v4;
  WDTablePropertiesValues **p_mTrackedProperties;
  WDTablePropertiesValues *mOriginalProperties;
  WDTablePropertiesValues *mTrackedProperties;
  id v8;

  v4 = a3;
  v8 = v4;
  if ((*((_BYTE *)self + 8) & 2) != 0)
  {
    mTrackedProperties = self->mTrackedProperties;
    p_mTrackedProperties = &self->mTrackedProperties;
    -[WDTablePropertiesValues setFormattingChangeDate:](mTrackedProperties, "setFormattingChangeDate:", v4);
    goto LABEL_5;
  }
  if ((*((_BYTE *)self + 8) & 1) != 0)
  {
    mOriginalProperties = self->mOriginalProperties;
    p_mTrackedProperties = &self->mOriginalProperties;
    -[WDTablePropertiesValues setFormattingChangeDate:](mOriginalProperties, "setFormattingChangeDate:", v4);
LABEL_5:
    -[WDTablePropertiesValues setFormattingChangeDateOverridden:](*p_mTrackedProperties, "setFormattingChangeDateOverridden:", 1);
  }

}

- (BOOL)isFormattingChangeDateOverridden
{
  char v3;
  uint64_t v4;

  v3 = *((_BYTE *)self + 8);
  if ((v3 & 2) != 0)
    goto LABEL_4;
  if ((*((_BYTE *)self + 8) & 4) != 0)
  {
    if (-[WDTablePropertiesValues formattingChangeDateOverridden](self->mTrackedProperties, "formattingChangeDateOverridden"))
    {
LABEL_4:
      v4 = 24;
      return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "formattingChangeDateOverridden");
    }
    v3 = *((_BYTE *)self + 8);
  }
  if ((v3 & 1) != 0
    || (v3 & 4) != 0
    && -[WDTablePropertiesValues formattingChangeDateOverridden](self->mOriginalProperties, "formattingChangeDateOverridden"))
  {
    v4 = 16;
    return objc_msgSend(*(id *)((char *)&self->super.isa + v4), "formattingChangeDateOverridden");
  }
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WDTableProperties *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  int v8;
  unsigned int v9;
  id v10;

  v4 = +[WDTableProperties allocWithZone:](WDTableProperties, "allocWithZone:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  v6 = -[WDTableProperties initWithDocument:](v4, "initWithDocument:", WeakRetained);

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->mDocument);
    objc_storeWeak((id *)(v6 + 32), v7);

    v8 = *(_BYTE *)(v6 + 8) & 0xFE | *((_BYTE *)self + 8) & 1;
    *(_BYTE *)(v6 + 8) = v8;
    v9 = v8 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 8) >> 1) & 1));
    *(_BYTE *)(v6 + 8) = v9;
    *(_BYTE *)(v6 + 8) = v9 & 0xFB | *((_BYTE *)self + 8) & 4;
    objc_storeStrong((id *)(v6 + 16), self->mOriginalProperties);
    objc_storeStrong((id *)(v6 + 24), self->mTrackedProperties);
    v10 = (id)v6;
  }

  return (id)v6;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDTableProperties;
  -[WDTableProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mTrackedProperties, 0);
  objc_storeStrong((id *)&self->mOriginalProperties, 0);
}

- (void)moveOrignalToTracked
{
  WDTablePropertiesValues *v3;
  WDTablePropertiesValues *mTrackedProperties;
  WDTablePropertiesValues *v5;
  WDTablePropertiesValues *mOriginalProperties;

  v3 = (WDTablePropertiesValues *)-[WDTablePropertiesValues copy](self->mOriginalProperties, "copy");
  mTrackedProperties = self->mTrackedProperties;
  self->mTrackedProperties = v3;

  v5 = objc_alloc_init(WDTablePropertiesValues);
  mOriginalProperties = self->mOriginalProperties;
  self->mOriginalProperties = v5;

}

@end
