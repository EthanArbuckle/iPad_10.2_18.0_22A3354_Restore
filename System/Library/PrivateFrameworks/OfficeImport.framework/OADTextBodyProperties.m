@implementation OADTextBodyProperties

- (OADTextBodyProperties)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTextBodyProperties;
  return -[OADProperties init](&v3, sel_init);
}

+ (id)defaultProperties
{
  if (+[OADTextBodyProperties defaultProperties]::once != -1)
    dispatch_once(&+[OADTextBodyProperties defaultProperties]::once, &__block_literal_global_64);
  return (id)+[OADTextBodyProperties defaultProperties]::defaultProperties;
}

- (OADTextBodyProperties)initWithDefaults
{
  OADTextBodyProperties *v2;
  OADTextBodyProperties *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  OADTextBodyAutoFit *v9;
  void *v10;
  double v11;
  OADTextBodyProperties *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)OADTextBodyProperties;
  v2 = -[OADProperties initWithDefaults](&v14, sel_initWithDefaults);
  v3 = v2;
  if (v2)
  {
    -[OADTextBodyProperties setRespectLastFirstLineSpacing:](v2, "setRespectLastFirstLineSpacing:", 1);
    LODWORD(v4) = 1080452710;
    -[OADTextBodyProperties setTopInset:](v3, "setTopInset:", v4);
    LODWORD(v5) = 1088841318;
    -[OADTextBodyProperties setLeftInset:](v3, "setLeftInset:", v5);
    LODWORD(v6) = 1080452710;
    -[OADTextBodyProperties setBottomInset:](v3, "setBottomInset:", v6);
    LODWORD(v7) = 1088841318;
    -[OADTextBodyProperties setRightInset:](v3, "setRightInset:", v7);
    -[OADTextBodyProperties setColumnCount:](v3, "setColumnCount:", 1);
    LODWORD(v8) = 3.0;
    -[OADTextBodyProperties setColumnSpacing:](v3, "setColumnSpacing:", v8);
    -[OADTextBodyProperties setIsLeftToRightColumns:](v3, "setIsLeftToRightColumns:", 1);
    v9 = -[OADTextBodyAutoFit initWithType:]([OADTextBodyAutoFit alloc], "initWithType:", 0);
    -[OADTextBodyProperties setAutoFit:](v3, "setAutoFit:", v9);
    -[OADTextBodyProperties setFlowType:](v3, "setFlowType:", 0);
    -[OADTextBodyProperties setWrapType:](v3, "setWrapType:", 1);
    -[OADTextBodyProperties setVerticalOverflowType:](v3, "setVerticalOverflowType:", 0);
    -[OADTextBodyProperties setHorizontalOverflowType:](v3, "setHorizontalOverflowType:", 0);
    +[OADTextWarp nullWarp](OADTextWarp, "nullWarp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTextBodyProperties setTextWarp:](v3, "setTextWarp:", v10);

    -[OADTextBodyProperties setIsAnchorCenter:](v3, "setIsAnchorCenter:", 0);
    -[OADTextBodyProperties setTextAnchorType:](v3, "setTextAnchorType:", 0);
    -[OADTextBodyProperties setIsUpright:](v3, "setIsUpright:", 0);
    LODWORD(v11) = 0;
    -[OADTextBodyProperties setRotation:](v3, "setRotation:", v11);
    v12 = v3;

  }
  return v3;
}

- (void)setRespectLastFirstLineSpacing:(BOOL)a3
{
  *((_BYTE *)self + 73) = *((_BYTE *)self + 73) & 0xFE | a3;
  *((_BYTE *)self + 75) |= 1u;
}

- (void)setTopInset:(float)a3
{
  self->mTopInset = a3;
  *((_BYTE *)self + 75) |= 2u;
}

- (void)setLeftInset:(float)a3
{
  self->mLeftInset = a3;
  *((_BYTE *)self + 75) |= 4u;
}

- (void)setBottomInset:(float)a3
{
  self->mBottomInset = a3;
  *((_BYTE *)self + 75) |= 0x10u;
}

- (void)setRightInset:(float)a3
{
  self->mRightInset = a3;
  *((_BYTE *)self + 75) |= 8u;
}

- (void)setColumnCount:(int)a3
{
  self->mColumnCount = a3;
  *((_BYTE *)self + 74) |= 0x20u;
}

- (void)setColumnSpacing:(float)a3
{
  self->mColumnSpacing = a3;
  *((_BYTE *)self + 74) |= 0x40u;
}

- (void)setIsLeftToRightColumns:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 73) = *((_BYTE *)self + 73) & 0xF7 | v3;
  *((_BYTE *)self + 74) |= 0x80u;
}

- (void)setAutoFit:(id)a3
{
  objc_storeStrong((id *)&self->mAutoFit, a3);
}

- (void)setFlowType:(unsigned __int8)a3
{
  self->mFlowType = a3;
  *((_BYTE *)self + 73) |= 0x80u;
}

- (void)setWrapType:(unsigned __int8)a3
{
  self->mWrapType = a3;
  *((_BYTE *)self + 74) |= 1u;
}

- (void)setVerticalOverflowType:(unsigned __int8)a3
{
  self->mVerticalOverflowType = a3;
  *((_BYTE *)self + 73) |= 0x10u;
}

- (void)setHorizontalOverflowType:(unsigned __int8)a3
{
  self->mHorizontalOverflowType = a3;
  *((_BYTE *)self + 73) |= 0x20u;
}

- (void)setTextWarp:(id)a3
{
  objc_storeStrong((id *)&self->mTextWarp, a3);
}

- (void)setIsAnchorCenter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 73) = *((_BYTE *)self + 73) & 0xFB | v3;
  *((_BYTE *)self + 74) |= 4u;
}

- (void)setTextAnchorType:(unsigned __int8)a3
{
  *((_BYTE *)self + 74) |= 2u;
  self->mTextAnchorType = a3;
}

- (void)setIsUpright:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 73) = *((_BYTE *)self + 73) & 0xFD | v3;
  *((_BYTE *)self + 74) |= 8u;
}

- (void)setRotation:(float)a3
{
  self->mRotation = a3;
  *((_BYTE *)self + 74) |= 0x10u;
}

- (void)removeUnnecessaryOverrides
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  int v7;
  void *v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  float v13;
  float v14;
  double v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  void *v20;
  float v21;
  float v22;
  double v23;
  void *v24;
  int v25;
  void *v26;
  float v27;
  float v28;
  double v29;
  void *v30;
  int v31;
  void *v32;
  objc_object *v33;
  objc_object *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  OADTextBodyAutoFit *mAutoFit;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  objc_object *v48;
  objc_object *v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  OADTextWarp *mTextWarp;
  void *v54;
  int v55;
  void *v56;
  int v57;
  void *v58;
  int v59;
  void *v60;
  float v61;
  float v62;
  double v63;
  objc_super v64;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return;
  v4 = -[OADProperties isMerged](self, "isMerged");
  v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
  -[OADProperties setMerged:](self, "setMerged:", 0);
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
  if (-[OADTextBodyProperties hasRespectLastFirstLineSpacing](self, "hasRespectLastFirstLineSpacing"))
  {
    -[OADProperties parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[OADTextBodyProperties respectLastFirstLineSpacing](self, "respectLastFirstLineSpacing");
    if (v7 == objc_msgSend(v6, "respectLastFirstLineSpacing"))
    {
      -[OADTextBodyProperties setRespectLastFirstLineSpacing:](self, "setRespectLastFirstLineSpacing:", 0);
      *((_BYTE *)self + 75) &= ~1u;
    }

  }
  if (-[OADTextBodyProperties hasTopInset](self, "hasTopInset"))
  {
    -[OADProperties parent](self, "parent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTextBodyProperties topInset](self, "topInset");
    v10 = v9;
    objc_msgSend(v8, "topInset");
    if (v10 == *(float *)&v11)
    {
      LODWORD(v11) = 0;
      -[OADTextBodyProperties setTopInset:](self, "setTopInset:", v11);
      *((_BYTE *)self + 75) &= ~2u;
    }

  }
  if (-[OADTextBodyProperties hasLeftInset](self, "hasLeftInset"))
  {
    -[OADProperties parent](self, "parent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTextBodyProperties leftInset](self, "leftInset");
    v14 = v13;
    objc_msgSend(v12, "leftInset");
    if (v14 == *(float *)&v15)
    {
      LODWORD(v15) = 0;
      -[OADTextBodyProperties setLeftInset:](self, "setLeftInset:", v15);
      *((_BYTE *)self + 75) &= ~4u;
    }

  }
  if (-[OADTextBodyProperties hasRightInset](self, "hasRightInset"))
  {
    -[OADProperties parent](self, "parent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTextBodyProperties rightInset](self, "rightInset");
    v18 = v17;
    objc_msgSend(v16, "rightInset");
    if (v18 == *(float *)&v19)
    {
      LODWORD(v19) = 0;
      -[OADTextBodyProperties setRightInset:](self, "setRightInset:", v19);
      *((_BYTE *)self + 75) &= ~8u;
    }

  }
  if (-[OADTextBodyProperties hasBottomInset](self, "hasBottomInset"))
  {
    -[OADProperties parent](self, "parent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTextBodyProperties bottomInset](self, "bottomInset");
    v22 = v21;
    objc_msgSend(v20, "bottomInset");
    if (v22 == *(float *)&v23)
    {
      LODWORD(v23) = 0;
      -[OADTextBodyProperties setBottomInset:](self, "setBottomInset:", v23);
      *((_BYTE *)self + 75) &= ~0x10u;
    }

  }
  if (-[OADTextBodyProperties hasColumnCount](self, "hasColumnCount"))
  {
    -[OADProperties parent](self, "parent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[OADTextBodyProperties columnCount](self, "columnCount");
    if (v25 == objc_msgSend(v24, "columnCount"))
    {
      -[OADTextBodyProperties setColumnCount:](self, "setColumnCount:", 0);
      *((_BYTE *)self + 74) &= ~0x20u;
    }

  }
  if (-[OADTextBodyProperties hasColumnSpacing](self, "hasColumnSpacing"))
  {
    -[OADProperties parent](self, "parent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTextBodyProperties columnSpacing](self, "columnSpacing");
    v28 = v27;
    objc_msgSend(v26, "columnSpacing");
    if (v28 == *(float *)&v29)
    {
      LODWORD(v29) = 0;
      -[OADTextBodyProperties setColumnSpacing:](self, "setColumnSpacing:", v29);
      *((_BYTE *)self + 74) &= ~0x40u;
    }

  }
  if (-[OADTextBodyProperties hasIsLeftToRightColumns](self, "hasIsLeftToRightColumns"))
  {
    -[OADProperties parent](self, "parent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[OADTextBodyProperties isLeftToRightColumns](self, "isLeftToRightColumns");
    if (v31 == objc_msgSend(v30, "isLeftToRightColumns"))
    {
      -[OADTextBodyProperties setIsLeftToRightColumns:](self, "setIsLeftToRightColumns:", 0);
      *((_BYTE *)self + 74) &= ~0x80u;
    }

  }
  if (-[OADTextBodyProperties hasAutoFit](self, "hasAutoFit"))
  {
    -[OADProperties parent](self, "parent");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTextBodyProperties autoFit](self, "autoFit");
    v33 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "autoFit");
    v34 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_object removeUnnecessaryOverrides](v33, "removeUnnecessaryOverrides");
      v35 = objc_opt_class();
      if (v35 != objc_opt_class())
        goto LABEL_41;
      v36 = -[objc_object isMergedWithParent](v33, "isMergedWithParent");
      -[objc_object setMergedWithParent:](v33, "setMergedWithParent:", 0);
      v37 = -[objc_object isAnythingOverridden](v33, "isAnythingOverridden");
      -[objc_object setMergedWithParent:](v33, "setMergedWithParent:", v36);
      if ((v37 & 1) != 0)
        goto LABEL_41;
    }
    else if (!TCObjectEqual(v33, v34))
    {
LABEL_41:

      goto LABEL_42;
    }
    mAutoFit = self->mAutoFit;
    self->mAutoFit = 0;

    goto LABEL_41;
  }
LABEL_42:
  if (-[OADTextBodyProperties hasFlowType](self, "hasFlowType"))
  {
    -[OADProperties parent](self, "parent");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[OADTextBodyProperties flowType](self, "flowType");
    if (v40 == objc_msgSend(v39, "flowType"))
    {
      -[OADTextBodyProperties setFlowType:](self, "setFlowType:", 0);
      *((_BYTE *)self + 73) &= ~0x80u;
    }

  }
  if (-[OADTextBodyProperties hasWrapType](self, "hasWrapType"))
  {
    -[OADProperties parent](self, "parent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[OADTextBodyProperties wrapType](self, "wrapType");
    if (v42 == objc_msgSend(v41, "wrapType"))
    {
      -[OADTextBodyProperties setWrapType:](self, "setWrapType:", 0);
      *((_BYTE *)self + 74) &= ~1u;
    }

  }
  if (-[OADTextBodyProperties hasVerticalOverflowType](self, "hasVerticalOverflowType"))
  {
    -[OADProperties parent](self, "parent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[OADTextBodyProperties verticalOverflowType](self, "verticalOverflowType");
    if (v44 == objc_msgSend(v43, "verticalOverflowType"))
    {
      -[OADTextBodyProperties setVerticalOverflowType:](self, "setVerticalOverflowType:", 0);
      *((_BYTE *)self + 73) &= ~0x10u;
    }

  }
  if (-[OADTextBodyProperties hasTextBodyId](self, "hasTextBodyId"))
  {
    -[OADProperties parent](self, "parent");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[OADTextBodyProperties textBodyId](self, "textBodyId");
    if (v46 == objc_msgSend(v45, "textBodyId"))
    {
      -[OADTextBodyProperties setTextBodyId:](self, "setTextBodyId:", 0);
      *((_BYTE *)self + 73) &= ~0x40u;
    }

  }
  if (!-[OADTextBodyProperties hasTextWarp](self, "hasTextWarp"))
    goto LABEL_66;
  -[OADProperties parent](self, "parent");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADTextBodyProperties textWarp](self, "textWarp");
  v48 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "textWarp");
  v49 = (objc_object *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[objc_object removeUnnecessaryOverrides](v48, "removeUnnecessaryOverrides");
    v50 = objc_opt_class();
    if (v50 != objc_opt_class())
      goto LABEL_65;
    v51 = -[objc_object isMergedWithParent](v48, "isMergedWithParent");
    -[objc_object setMergedWithParent:](v48, "setMergedWithParent:", 0);
    v52 = -[objc_object isAnythingOverridden](v48, "isAnythingOverridden");
    -[objc_object setMergedWithParent:](v48, "setMergedWithParent:", v51);
    if ((v52 & 1) != 0)
      goto LABEL_65;
    goto LABEL_64;
  }
  if (TCObjectEqual(v48, v49))
  {
LABEL_64:
    mTextWarp = self->mTextWarp;
    self->mTextWarp = 0;

  }
LABEL_65:

LABEL_66:
  if (-[OADTextBodyProperties hasIsAnchorCenter](self, "hasIsAnchorCenter"))
  {
    -[OADProperties parent](self, "parent");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[OADTextBodyProperties isAnchorCenter](self, "isAnchorCenter");
    if (v55 == objc_msgSend(v54, "isAnchorCenter"))
    {
      -[OADTextBodyProperties setIsAnchorCenter:](self, "setIsAnchorCenter:", 0);
      *((_BYTE *)self + 74) &= ~4u;
    }

  }
  if (-[OADTextBodyProperties hasTextAnchorType](self, "hasTextAnchorType"))
  {
    -[OADProperties parent](self, "parent");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[OADTextBodyProperties textAnchorType](self, "textAnchorType");
    if (v57 == objc_msgSend(v56, "textAnchorType"))
    {
      -[OADTextBodyProperties setTextAnchorType:](self, "setTextAnchorType:", 0);
      *((_BYTE *)self + 74) &= ~2u;
    }

  }
  if (-[OADTextBodyProperties hasIsUpright](self, "hasIsUpright"))
  {
    -[OADProperties parent](self, "parent");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[OADTextBodyProperties isUpright](self, "isUpright");
    if (v59 == objc_msgSend(v58, "isUpright"))
    {
      -[OADTextBodyProperties setIsUpright:](self, "setIsUpright:", 0);
      *((_BYTE *)self + 74) &= ~8u;
    }

  }
  if (-[OADTextBodyProperties hasRotation](self, "hasRotation"))
  {
    -[OADProperties parent](self, "parent");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADTextBodyProperties rotation](self, "rotation");
    v62 = v61;
    objc_msgSend(v60, "rotation");
    if (v62 == *(float *)&v63)
    {
      LODWORD(v63) = 0;
      -[OADTextBodyProperties setRotation:](self, "setRotation:", v63);
      *((_BYTE *)self + 74) &= ~0x10u;
    }

  }
  -[OADProperties setMerged:](self, "setMerged:", v4);
  -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
  v64.receiver = self;
  v64.super_class = (Class)OADTextBodyProperties;
  -[OADProperties removeUnnecessaryOverrides](&v64, sel_removeUnnecessaryOverrides);
}

- (BOOL)hasRespectLastFirstLineSpacing
{
  return (*((_BYTE *)self + 75) & 1) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasTopInset
{
  return (*((_BYTE *)self + 75) & 2) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)topInset
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasTopInset);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[10];

  return v3;
}

- (BOOL)hasLeftInset
{
  return (*((_BYTE *)self + 75) & 4) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)leftInset
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasLeftInset);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[11];

  return v3;
}

- (BOOL)hasRightInset
{
  return (*((_BYTE *)self + 75) & 8) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)rightInset
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasRightInset);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[13];

  return v3;
}

- (BOOL)hasBottomInset
{
  return (*((_BYTE *)self + 75) & 0x10) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)bottomInset
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasBottomInset);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[12];

  return v3;
}

- (BOOL)hasColumnCount
{
  return (*((_BYTE *)self + 74) & 0x20) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (int)columnCount
{
  unsigned __int16 *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasColumnCount);
  v2 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
  v3 = v2[32];

  return v3;
}

- (BOOL)hasColumnSpacing
{
  return (*((_BYTE *)self + 74) & 0x40) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)columnSpacing
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasColumnSpacing);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[15];

  return v3;
}

- (BOOL)hasIsLeftToRightColumns
{
  return *((char *)self + 74) < 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isLeftToRightColumns
{
  unsigned __int8 *v2;
  _BOOL4 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIsLeftToRightColumns);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  v3 = (v2[73] >> 3) & 1;

  return v3;
}

- (BOOL)hasAutoFit
{
  return self->mAutoFit || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)autoFit
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasAutoFit);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

- (BOOL)hasFlowType
{
  return *((char *)self + 73) < 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)flowType
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasFlowType);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[69];

  return v3;
}

- (BOOL)hasWrapType
{
  return (*((_BYTE *)self + 74) & 1) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)wrapType
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasWrapType);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[70];

  return v3;
}

- (BOOL)hasVerticalOverflowType
{
  return (*((_BYTE *)self + 73) & 0x10) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)verticalOverflowType
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasVerticalOverflowType);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[71];

  return v3;
}

- (BOOL)hasTextBodyId
{
  return (*((unsigned __int8 *)self + 73) >> 6) & 1;
}

- (BOOL)hasTextWarp
{
  return self->mTextWarp || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)hasIsAnchorCenter
{
  return (*((_BYTE *)self + 74) & 4) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isAnchorCenter
{
  unsigned __int8 *v2;
  _BOOL4 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIsAnchorCenter);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  v3 = (v2[73] >> 2) & 1;

  return v3;
}

- (BOOL)hasTextAnchorType
{
  return (*((_BYTE *)self + 74) & 2) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)textAnchorType
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasTextAnchorType);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[68];

  return v3;
}

- (BOOL)hasIsUpright
{
  return (*((_BYTE *)self + 74) & 8) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)isUpright
{
  unsigned __int8 *v2;
  _BOOL4 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasIsUpright);
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  v3 = (v2[73] >> 1) & 1;

  return v3;
}

- (BOOL)hasRotation
{
  return (*((_BYTE *)self + 74) & 0x10) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (float)rotation
{
  float *v2;
  float v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasRotation);
  v2 = (float *)objc_claimAutoreleasedReturnValue();
  v3 = v2[14];

  return v3;
}

+ (id)defaultEscherWordArtProperties
{
  if (+[OADTextBodyProperties defaultEscherWordArtProperties]::once != -1)
    dispatch_once(&+[OADTextBodyProperties defaultEscherWordArtProperties]::once, &__block_literal_global_154);
  return (id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties;
}

- (id)textWarp
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasTextWarp);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[4];

  return v3;
}

void __42__OADTextBodyProperties_defaultProperties__block_invoke()
{
  OADTextBodyProperties *v0;
  void *v1;

  v0 = -[OADTextBodyProperties initWithDefaults]([OADTextBodyProperties alloc], "initWithDefaults");
  v1 = (void *)+[OADTextBodyProperties defaultProperties]::defaultProperties;
  +[OADTextBodyProperties defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)respectLastFirstLineSpacing
{
  _BYTE *v2;
  BOOL v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasRespectLastFirstLineSpacing);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[73] & 1;

  return v3;
}

- (BOOL)hasHorizontalOverflowType
{
  return (*((_BYTE *)self + 73) & 0x20) != 0
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unsigned)horizontalOverflowType
{
  _BYTE *v2;
  unsigned __int8 v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasHorizontalOverflowType);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[72];

  return v3;
}

- (int)textBodyId
{
  return self->mTextBodyId;
}

- (void)setTextBodyId:(int)a3
{
  self->mTextBodyId = a3;
  *((_BYTE *)self + 73) |= 0x40u;
}

- (BOOL)isWarped
{
  void *v2;
  void *v3;
  char v4;

  -[OADTextBodyProperties textWarp](self, "textWarp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[OADTextWarp nullWarp](OADTextWarp, "nullWarp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3) ^ 1;

  return v4;
}

void __55__OADTextBodyProperties_defaultEscherWordArtProperties__block_invoke()
{
  OADTextBodyProperties *v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  OADPresetTextWarp *v7;
  double v8;
  OADTextBodyAutoFit *v9;

  v0 = objc_alloc_init(OADTextBodyProperties);
  v1 = (void *)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties;
  +[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties = (uint64_t)v0;

  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setParent:", 0);
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setRespectLastFirstLineSpacing:", 0);
  LODWORD(v2) = 0;
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setTopInset:", v2);
  LODWORD(v3) = 0;
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setLeftInset:", v3);
  LODWORD(v4) = 0;
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setBottomInset:", v4);
  LODWORD(v5) = 0;
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setRightInset:", v5);
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setColumnCount:", 1);
  LODWORD(v6) = 3.0;
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setColumnSpacing:", v6);
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setIsLeftToRightColumns:", 1);
  v9 = -[OADTextBodyAutoFit initWithType:]([OADTextBodyAutoFit alloc], "initWithType:", 1);
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setAutoFit:");
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setFlowType:", 0);
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setWrapType:", 0);
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setVerticalOverflowType:", 0);
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setHorizontalOverflowType:", 0);
  v7 = objc_alloc_init(OADPresetTextWarp);
  -[OADPresetTextWarp setPresetTextWarpType:](v7, "setPresetTextWarpType:", 29);
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setTextWarp:", v7);
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setIsAnchorCenter:", 0);
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setTextAnchorType:", 1);
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setIsUpright:", 0);
  LODWORD(v8) = 0;
  objc_msgSend((id)+[OADTextBodyProperties defaultEscherWordArtProperties]::defaultProperties, "setRotation:", v8);

}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_object *v7;
  void *v8;
  objc_object *v9;
  int v10;
  OADTextBodyAutoFit *mAutoFit;
  id v12;
  void *v13;
  objc_object *v14;
  void *v15;
  objc_object *v16;
  int v17;
  OADTextWarp *mTextWarp;
  id v19;
  float v20;
  float v21;
  float v22;
  id v23;
  float v24;
  float v25;
  float v26;
  id v27;
  float v28;
  float v29;
  float v30;
  id v31;
  float v32;
  float v33;
  float v34;
  id v35;
  float v36;
  float v37;
  float v38;
  id v39;
  float v40;
  float v41;
  float v42;
  id v43;
  int v44;
  id v45;
  int v46;
  id v47;
  int v48;
  id v49;
  int v50;
  int v51;
  int v52;
  id v53;
  int v54;
  id v55;
  int v56;
  id v57;
  int v58;
  id v59;
  int v60;
  id v61;
  int v62;
  id v63;
  int v64;
  id v65;
  int v66;
  int v67;
  int v68;
  objc_super v69;

  v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)OADTextBodyProperties;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v69, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (-[OADTextBodyProperties hasAutoFit](self, "hasAutoFit")
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasAutoFit);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[OADTextBodyProperties autoFit](self, "autoFit");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasAutoFit);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "autoFit");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = TCObjectEqual(v7, v9);
    mAutoFit = self->mAutoFit;
    if (v10)
    {
      self->mAutoFit = 0;

    }
    else if (!mAutoFit && v6)
    {
      -[OADTextBodyProperties setAutoFit:](self, "setAutoFit:", v7);
    }

  }
  if (-[OADTextBodyProperties hasTextWarp](self, "hasTextWarp")
    || (-[OADProperties parent](self, "parent"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_hasTextWarp);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[OADTextBodyProperties textWarp](self, "textWarp");
      v14 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_hasTextWarp);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "textWarp");
      v16 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v17 = TCObjectEqual(v14, v16);
    mTextWarp = self->mTextWarp;
    if (v17)
    {
      self->mTextWarp = 0;

    }
    else if (!mTextWarp && v13)
    {
      -[OADTextBodyProperties setTextWarp:](self, "setTextWarp:", v14);
    }

  }
  if ((*((_BYTE *)self + 75) & 2) != 0
    || (-[OADProperties parent](self, "parent"),
        v19 = (id)objc_claimAutoreleasedReturnValue(),
        v19,
        v19 != v4))
  {
    -[OADTextBodyProperties topInset](self, "topInset");
    v21 = v20;
    objc_msgSend(v4, "topInset");
    if (v21 == v22)
    {
      *((_BYTE *)self + 75) &= ~2u;
    }
    else if ((*((_BYTE *)self + 75) & 2) == 0)
    {
      -[OADTextBodyProperties topInset](self, "topInset");
      -[OADTextBodyProperties setTopInset:](self, "setTopInset:");
    }
  }
  if ((*((_BYTE *)self + 75) & 4) != 0
    || (-[OADProperties parent](self, "parent"),
        v23 = (id)objc_claimAutoreleasedReturnValue(),
        v23,
        v23 != v4))
  {
    -[OADTextBodyProperties leftInset](self, "leftInset");
    v25 = v24;
    objc_msgSend(v4, "leftInset");
    if (v25 == v26)
    {
      *((_BYTE *)self + 75) &= ~4u;
    }
    else if ((*((_BYTE *)self + 75) & 4) == 0)
    {
      -[OADTextBodyProperties leftInset](self, "leftInset");
      -[OADTextBodyProperties setLeftInset:](self, "setLeftInset:");
    }
  }
  if ((*((_BYTE *)self + 75) & 0x10) != 0
    || (-[OADProperties parent](self, "parent"),
        v27 = (id)objc_claimAutoreleasedReturnValue(),
        v27,
        v27 != v4))
  {
    -[OADTextBodyProperties bottomInset](self, "bottomInset");
    v29 = v28;
    objc_msgSend(v4, "bottomInset");
    if (v29 == v30)
    {
      *((_BYTE *)self + 75) &= ~0x10u;
    }
    else if ((*((_BYTE *)self + 75) & 0x10) == 0)
    {
      -[OADTextBodyProperties bottomInset](self, "bottomInset");
      -[OADTextBodyProperties setBottomInset:](self, "setBottomInset:");
    }
  }
  if ((*((_BYTE *)self + 75) & 8) != 0
    || (-[OADProperties parent](self, "parent"),
        v31 = (id)objc_claimAutoreleasedReturnValue(),
        v31,
        v31 != v4))
  {
    -[OADTextBodyProperties rightInset](self, "rightInset");
    v33 = v32;
    objc_msgSend(v4, "rightInset");
    if (v33 == v34)
    {
      *((_BYTE *)self + 75) &= ~8u;
    }
    else if ((*((_BYTE *)self + 75) & 8) == 0)
    {
      -[OADTextBodyProperties rightInset](self, "rightInset");
      -[OADTextBodyProperties setRightInset:](self, "setRightInset:");
    }
  }
  if ((*((_BYTE *)self + 74) & 0x10) != 0
    || (-[OADProperties parent](self, "parent"),
        v35 = (id)objc_claimAutoreleasedReturnValue(),
        v35,
        v35 != v4))
  {
    -[OADTextBodyProperties rotation](self, "rotation");
    v37 = v36;
    objc_msgSend(v4, "rotation");
    if (v37 == v38)
    {
      *((_BYTE *)self + 74) &= ~0x10u;
    }
    else if ((*((_BYTE *)self + 74) & 0x10) == 0)
    {
      -[OADTextBodyProperties rotation](self, "rotation");
      -[OADTextBodyProperties setRotation:](self, "setRotation:");
    }
  }
  if ((*((_BYTE *)self + 74) & 0x40) != 0
    || (-[OADProperties parent](self, "parent"),
        v39 = (id)objc_claimAutoreleasedReturnValue(),
        v39,
        v39 != v4))
  {
    -[OADTextBodyProperties columnSpacing](self, "columnSpacing");
    v41 = v40;
    objc_msgSend(v4, "columnSpacing");
    if (v41 == v42)
    {
      *((_BYTE *)self + 74) &= ~0x40u;
    }
    else if ((*((_BYTE *)self + 74) & 0x40) == 0)
    {
      -[OADTextBodyProperties columnSpacing](self, "columnSpacing");
      -[OADTextBodyProperties setColumnSpacing:](self, "setColumnSpacing:");
    }
  }
  if ((*((_BYTE *)self + 74) & 0x20) != 0
    || (-[OADProperties parent](self, "parent"),
        v43 = (id)objc_claimAutoreleasedReturnValue(),
        v43,
        v43 != v4))
  {
    v44 = -[OADTextBodyProperties columnCount](self, "columnCount");
    if (v44 == objc_msgSend(v4, "columnCount"))
    {
      *((_BYTE *)self + 74) &= ~0x20u;
    }
    else if ((*((_BYTE *)self + 74) & 0x20) == 0)
    {
      -[OADTextBodyProperties setColumnCount:](self, "setColumnCount:", -[OADTextBodyProperties columnCount](self, "columnCount"));
    }
  }
  if ((*((_BYTE *)self + 73) & 0x40) != 0
    || (-[OADProperties parent](self, "parent"),
        v45 = (id)objc_claimAutoreleasedReturnValue(),
        v45,
        v45 != v4))
  {
    v46 = -[OADTextBodyProperties textBodyId](self, "textBodyId");
    if (v46 == objc_msgSend(v4, "textBodyId"))
    {
      *((_BYTE *)self + 73) &= ~0x40u;
    }
    else if ((*((_BYTE *)self + 73) & 0x40) == 0)
    {
      -[OADTextBodyProperties setTextBodyId:](self, "setTextBodyId:", -[OADTextBodyProperties textBodyId](self, "textBodyId"));
    }
  }
  if ((*((_BYTE *)self + 74) & 2) != 0
    || (-[OADProperties parent](self, "parent"),
        v47 = (id)objc_claimAutoreleasedReturnValue(),
        v47,
        v47 != v4))
  {
    v48 = -[OADTextBodyProperties textAnchorType](self, "textAnchorType");
    if (v48 == objc_msgSend(v4, "textAnchorType"))
    {
      *((_BYTE *)self + 74) &= ~2u;
    }
    else if ((*((_BYTE *)self + 74) & 2) == 0)
    {
      -[OADTextBodyProperties setTextAnchorType:](self, "setTextAnchorType:", -[OADTextBodyProperties textAnchorType](self, "textAnchorType"));
    }
  }
  if (*((char *)self + 73) < 0
    || (-[OADProperties parent](self, "parent"),
        v49 = (id)objc_claimAutoreleasedReturnValue(),
        v49,
        v49 != v4))
  {
    v50 = -[OADTextBodyProperties flowType](self, "flowType");
    v51 = objc_msgSend(v4, "flowType");
    v52 = *((char *)self + 73);
    if (v50 == v51)
    {
      *((_BYTE *)self + 73) = v52 & 0x7F;
    }
    else if ((v52 & 0x80000000) == 0)
    {
      -[OADTextBodyProperties setFlowType:](self, "setFlowType:", -[OADTextBodyProperties flowType](self, "flowType"));
    }
  }
  if ((*((_BYTE *)self + 74) & 1) != 0
    || (-[OADProperties parent](self, "parent"),
        v53 = (id)objc_claimAutoreleasedReturnValue(),
        v53,
        v53 != v4))
  {
    v54 = -[OADTextBodyProperties wrapType](self, "wrapType");
    if (v54 == objc_msgSend(v4, "wrapType"))
    {
      *((_BYTE *)self + 74) &= ~1u;
    }
    else if ((*((_BYTE *)self + 74) & 1) == 0)
    {
      -[OADTextBodyProperties setWrapType:](self, "setWrapType:", -[OADTextBodyProperties wrapType](self, "wrapType"));
    }
  }
  if ((*((_BYTE *)self + 73) & 0x10) != 0
    || (-[OADProperties parent](self, "parent"),
        v55 = (id)objc_claimAutoreleasedReturnValue(),
        v55,
        v55 != v4))
  {
    v56 = -[OADTextBodyProperties verticalOverflowType](self, "verticalOverflowType");
    if (v56 == objc_msgSend(v4, "verticalOverflowType"))
    {
      *((_BYTE *)self + 73) &= ~0x10u;
    }
    else if ((*((_BYTE *)self + 73) & 0x10) == 0)
    {
      -[OADTextBodyProperties setVerticalOverflowType:](self, "setVerticalOverflowType:", -[OADTextBodyProperties verticalOverflowType](self, "verticalOverflowType"));
    }
  }
  if ((*((_BYTE *)self + 73) & 0x20) != 0
    || (-[OADProperties parent](self, "parent"),
        v57 = (id)objc_claimAutoreleasedReturnValue(),
        v57,
        v57 != v4))
  {
    v58 = -[OADTextBodyProperties horizontalOverflowType](self, "horizontalOverflowType");
    if (v58 == objc_msgSend(v4, "horizontalOverflowType"))
    {
      *((_BYTE *)self + 73) &= ~0x20u;
    }
    else if ((*((_BYTE *)self + 73) & 0x20) == 0)
    {
      -[OADTextBodyProperties setHorizontalOverflowType:](self, "setHorizontalOverflowType:", -[OADTextBodyProperties horizontalOverflowType](self, "horizontalOverflowType"));
    }
  }
  if ((*((_BYTE *)self + 75) & 1) != 0
    || (-[OADProperties parent](self, "parent"),
        v59 = (id)objc_claimAutoreleasedReturnValue(),
        v59,
        v59 != v4))
  {
    v60 = -[OADTextBodyProperties respectLastFirstLineSpacing](self, "respectLastFirstLineSpacing");
    if (v60 == objc_msgSend(v4, "respectLastFirstLineSpacing"))
    {
      *((_BYTE *)self + 75) &= ~1u;
    }
    else if ((*((_BYTE *)self + 75) & 1) == 0)
    {
      -[OADTextBodyProperties setRespectLastFirstLineSpacing:](self, "setRespectLastFirstLineSpacing:", -[OADTextBodyProperties respectLastFirstLineSpacing](self, "respectLastFirstLineSpacing"));
    }
  }
  if ((*((_BYTE *)self + 74) & 8) != 0
    || (-[OADProperties parent](self, "parent"),
        v61 = (id)objc_claimAutoreleasedReturnValue(),
        v61,
        v61 != v4))
  {
    v62 = -[OADTextBodyProperties isUpright](self, "isUpright");
    if (v62 == objc_msgSend(v4, "isUpright"))
    {
      *((_BYTE *)self + 74) &= ~8u;
    }
    else if ((*((_BYTE *)self + 74) & 8) == 0)
    {
      -[OADTextBodyProperties setIsUpright:](self, "setIsUpright:", -[OADTextBodyProperties isUpright](self, "isUpright"));
    }
  }
  if ((*((_BYTE *)self + 74) & 4) != 0
    || (-[OADProperties parent](self, "parent"),
        v63 = (id)objc_claimAutoreleasedReturnValue(),
        v63,
        v63 != v4))
  {
    v64 = -[OADTextBodyProperties isAnchorCenter](self, "isAnchorCenter");
    if (v64 == objc_msgSend(v4, "isAnchorCenter"))
    {
      *((_BYTE *)self + 74) &= ~4u;
    }
    else if ((*((_BYTE *)self + 74) & 4) == 0)
    {
      -[OADTextBodyProperties setIsAnchorCenter:](self, "setIsAnchorCenter:", -[OADTextBodyProperties isAnchorCenter](self, "isAnchorCenter"));
    }
  }
  if (*((char *)self + 74) < 0
    || (-[OADProperties parent](self, "parent"),
        v65 = (id)objc_claimAutoreleasedReturnValue(),
        v65,
        v65 != v4))
  {
    v66 = -[OADTextBodyProperties isLeftToRightColumns](self, "isLeftToRightColumns");
    v67 = objc_msgSend(v4, "isLeftToRightColumns");
    v68 = *((char *)self + 74);
    if (v66 == v67)
    {
      *((_BYTE *)self + 74) = v68 & 0x7F;
    }
    else if ((v68 & 0x80000000) == 0)
    {
      -[OADTextBodyProperties setIsLeftToRightColumns:](self, "setIsLeftToRightColumns:", -[OADTextBodyProperties isLeftToRightColumns](self, "isLeftToRightColumns"));
    }
  }

}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t mLeftInset;
  unint64_t mBottomInset;
  unint64_t mRightInset;
  unint64_t mRotation;
  unint64_t mColumnSpacing;
  uint64_t mColumnCount;
  uint64_t mTextBodyId;
  uint64_t v11;
  uint64_t v12;
  unint64_t mTopInset;
  unint64_t v15;
  objc_super v16;

  v15 = -[OADTextBodyAutoFit hash](self->mAutoFit, "hash");
  v3 = -[OADTextWarp hash](self->mTextWarp, "hash");
  mTopInset = (unint64_t)self->mTopInset;
  mLeftInset = (unint64_t)self->mLeftInset;
  mBottomInset = (unint64_t)self->mBottomInset;
  mRightInset = (unint64_t)self->mRightInset;
  mRotation = (unint64_t)self->mRotation;
  mColumnSpacing = (unint64_t)self->mColumnSpacing;
  mColumnCount = self->mColumnCount;
  mTextBodyId = self->mTextBodyId;
  v11 = (self->mFlowType ^ self->mTextAnchorType ^ self->mWrapType ^ self->mVerticalOverflowType ^ self->mHorizontalOverflowType);
  v12 = ((*((_BYTE *)self + 73) ^ (*((_BYTE *)self + 73) >> 1) ^ (*((_BYTE *)self + 73) >> 2)) ^ (*((_BYTE *)self + 73) >> 3)) & 1;
  v16.receiver = self;
  v16.super_class = (Class)OADTextBodyProperties;
  return v3 ^ v15 ^ mTopInset ^ mLeftInset ^ mBottomInset ^ mRightInset ^ mRotation ^ mColumnSpacing ^ mColumnCount ^ mTextBodyId ^ v11 ^ v12 ^ -[OADProperties hash](&v16, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  int v7;
  int v8;
  int v9;
  float v10;
  float v11;
  float v12;
  int v13;
  float v14;
  float v15;
  float v16;
  int v17;
  float v18;
  float v19;
  float v20;
  int v21;
  float v22;
  float v23;
  float v24;
  int v25;
  int v26;
  int v27;
  float v28;
  float v29;
  float v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  char v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  void *v48;
  void *v49;
  char v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  float v58;
  float v59;
  float v60;
  BOOL v61;
  objc_super v63;

  v4 = a3;
  if ((objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = v4;
    v6 = -[OADTextBodyProperties hash](self, "hash");
    if (v6 != objc_msgSend(v5, "hash"))
      goto LABEL_60;
    v7 = objc_msgSend(v5, "hasRespectLastFirstLineSpacing");
    if (v7 != -[OADTextBodyProperties hasRespectLastFirstLineSpacing](self, "hasRespectLastFirstLineSpacing"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasRespectLastFirstLineSpacing"))
    {
      v8 = objc_msgSend(v5, "respectLastFirstLineSpacing");
      if (v8 != -[OADTextBodyProperties respectLastFirstLineSpacing](self, "respectLastFirstLineSpacing"))
        goto LABEL_60;
    }
    v9 = objc_msgSend(v5, "hasTopInset");
    if (v9 != -[OADTextBodyProperties hasTopInset](self, "hasTopInset"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasTopInset"))
    {
      objc_msgSend(v5, "topInset");
      v11 = v10;
      -[OADTextBodyProperties topInset](self, "topInset");
      if (v11 != v12)
        goto LABEL_60;
    }
    v13 = objc_msgSend(v5, "hasLeftInset");
    if (v13 != -[OADTextBodyProperties hasLeftInset](self, "hasLeftInset"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasLeftInset"))
    {
      objc_msgSend(v5, "leftInset");
      v15 = v14;
      -[OADTextBodyProperties leftInset](self, "leftInset");
      if (v15 != v16)
        goto LABEL_60;
    }
    v17 = objc_msgSend(v5, "hasBottomInset");
    if (v17 != -[OADTextBodyProperties hasBottomInset](self, "hasBottomInset"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasBottomInset"))
    {
      objc_msgSend(v5, "leftInset");
      v19 = v18;
      -[OADTextBodyProperties leftInset](self, "leftInset");
      if (v19 != v20)
        goto LABEL_60;
    }
    v21 = objc_msgSend(v5, "hasRightInset");
    if (v21 != -[OADTextBodyProperties hasRightInset](self, "hasRightInset"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasRightInset"))
    {
      objc_msgSend(v5, "rightInset");
      v23 = v22;
      -[OADTextBodyProperties rightInset](self, "rightInset");
      if (v23 != v24)
        goto LABEL_60;
    }
    v25 = objc_msgSend(v5, "hasColumnCount");
    if (v25 != -[OADTextBodyProperties hasColumnCount](self, "hasColumnCount"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasColumnCount"))
    {
      v26 = objc_msgSend(v5, "columnCount");
      if (v26 != -[OADTextBodyProperties columnCount](self, "columnCount"))
        goto LABEL_60;
    }
    v27 = objc_msgSend(v5, "hasColumnSpacing");
    if (v27 != -[OADTextBodyProperties hasColumnSpacing](self, "hasColumnSpacing"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasColumnSpacing"))
    {
      objc_msgSend(v5, "columnSpacing");
      v29 = v28;
      -[OADTextBodyProperties columnSpacing](self, "columnSpacing");
      if (v29 != v30)
        goto LABEL_60;
    }
    v31 = objc_msgSend(v5, "hasIsLeftToRightColumns");
    if (v31 != -[OADTextBodyProperties hasIsLeftToRightColumns](self, "hasIsLeftToRightColumns"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasIsLeftToRightColumns"))
    {
      v32 = objc_msgSend(v5, "isLeftToRightColumns");
      if (v32 != -[OADTextBodyProperties isLeftToRightColumns](self, "isLeftToRightColumns"))
        goto LABEL_60;
    }
    v33 = objc_msgSend(v5, "hasAutoFit");
    if (v33 != -[OADTextBodyProperties hasAutoFit](self, "hasAutoFit"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasAutoFit"))
    {
      objc_msgSend(v5, "autoFit");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTextBodyProperties autoFit](self, "autoFit");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqual:", v35);

      if ((v36 & 1) == 0)
        goto LABEL_60;
    }
    v37 = objc_msgSend(v5, "hasFlowType");
    if (v37 != -[OADTextBodyProperties hasFlowType](self, "hasFlowType"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasFlowType"))
    {
      v38 = objc_msgSend(v5, "flowType");
      if (v38 != -[OADTextBodyProperties flowType](self, "flowType"))
        goto LABEL_60;
    }
    v39 = objc_msgSend(v5, "hasWrapType");
    if (v39 != -[OADTextBodyProperties hasWrapType](self, "hasWrapType"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasWrapType"))
    {
      v40 = objc_msgSend(v5, "wrapType");
      if (v40 != -[OADTextBodyProperties wrapType](self, "wrapType"))
        goto LABEL_60;
    }
    v41 = objc_msgSend(v5, "hasVerticalOverflowType");
    if (v41 != -[OADTextBodyProperties hasVerticalOverflowType](self, "hasVerticalOverflowType"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasVerticalOverflowType"))
    {
      v42 = objc_msgSend(v5, "verticalOverflowType");
      if (v42 != -[OADTextBodyProperties verticalOverflowType](self, "verticalOverflowType"))
        goto LABEL_60;
    }
    v43 = objc_msgSend(v5, "hasHorizontalOverflowType");
    if (v43 != -[OADTextBodyProperties hasHorizontalOverflowType](self, "hasHorizontalOverflowType"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasHorizontalOverflowType"))
    {
      v44 = objc_msgSend(v5, "horizontalOverflowType");
      if (v44 != -[OADTextBodyProperties horizontalOverflowType](self, "horizontalOverflowType"))
        goto LABEL_60;
    }
    v45 = objc_msgSend(v5, "hasTextBodyId");
    if (v45 != -[OADTextBodyProperties hasTextBodyId](self, "hasTextBodyId"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasTextBodyId"))
    {
      v46 = objc_msgSend(v5, "textBodyId");
      if (v46 != -[OADTextBodyProperties textBodyId](self, "textBodyId"))
        goto LABEL_60;
    }
    v47 = objc_msgSend(v5, "hasTextWarp");
    if (v47 != -[OADTextBodyProperties hasTextWarp](self, "hasTextWarp"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasTextWarp"))
    {
      objc_msgSend(v5, "textWarp");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADTextBodyProperties textWarp](self, "textWarp");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqual:", v49);

      if ((v50 & 1) == 0)
        goto LABEL_60;
    }
    v51 = objc_msgSend(v5, "hasIsAnchorCenter");
    if (v51 != -[OADTextBodyProperties hasIsAnchorCenter](self, "hasIsAnchorCenter"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasIsAnchorCenter"))
    {
      v52 = objc_msgSend(v5, "isAnchorCenter");
      if (v52 != -[OADTextBodyProperties isAnchorCenter](self, "isAnchorCenter"))
        goto LABEL_60;
    }
    v53 = objc_msgSend(v5, "hasTextAnchorType");
    if (v53 != -[OADTextBodyProperties hasTextAnchorType](self, "hasTextAnchorType"))
      goto LABEL_60;
    if (objc_msgSend(v5, "hasTextAnchorType"))
    {
      v54 = objc_msgSend(v5, "textAnchorType");
      if (v54 != -[OADTextBodyProperties textAnchorType](self, "textAnchorType"))
        goto LABEL_60;
    }
    if ((v55 = objc_msgSend(v5, "hasIsUpright"), v55 == -[OADTextBodyProperties hasIsUpright](self, "hasIsUpright"))
      && (!objc_msgSend(v5, "hasIsUpright")
       || (v56 = objc_msgSend(v5, "isUpright"), v56 == -[OADTextBodyProperties isUpright](self, "isUpright")))
      && (v57 = objc_msgSend(v5, "hasRotation"), v57 == -[OADTextBodyProperties hasRotation](self, "hasRotation"))
      && (!objc_msgSend(v5, "hasRotation")
       || (objc_msgSend(v5, "rotation"), v59 = v58, -[OADTextBodyProperties rotation](self, "rotation"), v59 == v60)))
    {
      v63.receiver = self;
      v63.super_class = (Class)OADTextBodyProperties;
      v61 = -[OADProperties isEqual:](&v63, sel_isEqual_, v5);
    }
    else
    {
LABEL_60:
      v61 = 0;
    }

  }
  else
  {
    v61 = 0;
  }

  return v61;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTextBodyProperties;
  -[OADProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextWarp, 0);
  objc_storeStrong((id *)&self->mAutoFit, 0);
}

@end
