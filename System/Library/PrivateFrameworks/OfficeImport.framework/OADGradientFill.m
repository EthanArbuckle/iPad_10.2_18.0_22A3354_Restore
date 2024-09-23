@implementation OADGradientFill

+ (id)defaultProperties
{
  if (+[OADGradientFill defaultProperties]::once != -1)
    dispatch_once(&+[OADGradientFill defaultProperties]::once, &__block_literal_global_123);
  return (id)+[OADGradientFill defaultProperties]::defaultProperties;
}

- (OADGradientFill)initWithDefaults
{
  OADGradientFill *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  OADRelativeRect *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  OADRelativeRect *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)OADGradientFill;
  v2 = -[OADProperties initWithDefaults](&v17, sel_initWithDefaults);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[OADRgbColor black](OADRgbColor, "black");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = 0;
    +[OADGradientFillStop addStopWithColor:position:toArray:](OADGradientFillStop, "addStopWithColor:position:toArray:", v4, v3, v5);

    +[OADRgbColor white](OADRgbColor, "white");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = 1.0;
    +[OADGradientFillStop addStopWithColor:position:toArray:](OADGradientFillStop, "addStopWithColor:position:toArray:", v6, v3, v7);

    -[OADGradientFill setStops:](v2, "setStops:", v3);
    v8 = [OADRelativeRect alloc];
    LODWORD(v9) = 0;
    LODWORD(v10) = 0;
    LODWORD(v11) = 0;
    LODWORD(v12) = 0;
    v13 = -[OADRelativeRect initWithLeft:top:right:bottom:](v8, "initWithLeft:top:right:bottom:", v9, v10, v11, v12);
    -[OADGradientFill setTileRect:](v2, "setTileRect:", v13);
    -[OADGradientFill setFlipMode:](v2, "setFlipMode:", 0);
    -[OADGradientFill setRotateWithShape:](v2, "setRotateWithShape:", 1);
    +[OADLinearShade defaultProperties](OADLinearShade, "defaultProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    -[OADGradientFill setShade:](v2, "setShade:", v15);

  }
  return v2;
}

- (void)setTileRect:(id)a3
{
  NSArray *v4;
  void *v5;
  void *v6;
  NSArray *mStops;

  v4 = (NSArray *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADGradientFill setTileRect:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADFill.mm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 743, 0, "invalid nil value for '%{public}s'", "tileRect");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  mStops = self->mStops;
  self->mStops = v4;

}

- (void)setFlipMode:(int)a3
{
  LODWORD(self->mTileRect) = a3;
  BYTE4(self->mTileRect) = 1;
}

- (void)setRotateWithShape:(BOOL)a3
{
  BYTE5(self->mTileRect) = a3;
  BYTE6(self->mTileRect) = 1;
}

- (void)setShade:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADGradientFill setShade:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADFill.mm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 782, 0, "invalid nil value for '%{public}s'", "shade");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v7 = *(void **)&self->mFlipMode;
  *(_QWORD *)&self->mFlipMode = v4;

}

- (void)setParent:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)OADGradientFill;
  -[OADProperties setParent:](&v6, sel_setParent_, v4);
  if (*(_QWORD *)&self->mFlipMode)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "shade");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
        objc_msgSend(*(id *)&self->mFlipMode, "setParent:", v5);

    }
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  objc_object **v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADGradientFill;
  if (-[OADFill isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = (objc_object **)v4;
    if (TCObjectEqual(*(objc_object **)&self->super.mDefinedByStyle, v5[3])
      && TCObjectEqual((objc_object *)self->mStops, v5[4])
      && BYTE4(self->mTileRect) == *((unsigned __int8 *)v5 + 44)
      && (!BYTE4(self->mTileRect) || LODWORD(self->mTileRect) == *((_DWORD *)v5 + 10))
      && BYTE6(self->mTileRect) == *((unsigned __int8 *)v5 + 46)
      && (!BYTE6(self->mTileRect) || BYTE5(self->mTileRect) == *((unsigned __int8 *)v5 + 45)))
    {
      v6 = TCObjectEqual(*(objc_object **)&self->mFlipMode, v5[6]);
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

- (id)stops
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_areStopsOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

- (BOOL)areStopsOverridden
{
  return *(_QWORD *)&self->super.mDefinedByStyle
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (unint64_t)hash
{
  NSArray *mStops;
  uint64_t v4;
  void *v5;
  objc_super v7;

  mStops = self->mStops;
  if (mStops)
    v4 = -[NSArray hash](mStops, "hash");
  else
    v4 = 0;
  if (BYTE4(self->mTileRect))
    v4 ^= LODWORD(self->mTileRect);
  if (BYTE6(self->mTileRect))
    v4 ^= BYTE5(self->mTileRect);
  v5 = *(void **)&self->mFlipMode;
  if (v5)
    v4 ^= objc_msgSend(v5, "hash");
  v7.receiver = self;
  v7.super_class = (Class)OADGradientFill;
  return -[OADFill hash](&v7, sel_hash) ^ v4;
}

- (id)shade
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isShadeOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[6];

  return v3;
}

- (BOOL)isShadeOverridden
{
  return *(_QWORD *)&self->mFlipMode
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  NSArray *mStops;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(_QWORD *)&self->super.mDefinedByStyle)
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE30], "allocWithZone:", a3), "initWithArray:copyItems:", *(_QWORD *)&self->super.mDefinedByStyle, 1);
    objc_msgSend(v5, "setStops:", v6);

  }
  mStops = self->mStops;
  if (mStops)
  {
    v8 = (void *)-[NSArray copyWithZone:](mStops, "copyWithZone:", a3);
    objc_msgSend(v5, "setTileRect:", v8);

  }
  if (BYTE4(self->mTileRect))
    objc_msgSend(v5, "setFlipMode:", LODWORD(self->mTileRect));
  if (BYTE6(self->mTileRect))
    objc_msgSend(v5, "setRotateWithShape:", BYTE5(self->mTileRect));
  v9 = *(void **)&self->mFlipMode;
  if (v9)
  {
    v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
    objc_msgSend(v5, "setShade:", v10);

  }
  return v5;
}

- (void)setStops:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(a3, "copy");
  v5 = *(void **)&self->super.mDefinedByStyle;
  *(_QWORD *)&self->super.mDefinedByStyle = v4;

}

- (void)setStyleColor:(id)a3
{
  objc_msgSend(*(id *)&self->super.mDefinedByStyle, "makeObjectsPerformSelector:withObject:", sel_setStyleColor_, a3);
}

void __36__OADGradientFill_defaultProperties__block_invoke()
{
  OADGradientFill *v0;
  void *v1;

  v0 = -[OADGradientFill initWithDefaults]([OADGradientFill alloc], "initWithDefaults");
  v1 = (void *)+[OADGradientFill defaultProperties]::defaultProperties;
  +[OADGradientFill defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADGradientFill;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADGradientFill areStopsOverridden](self, "areStopsOverridden")
      || -[OADGradientFill isTileRectOverridden](self, "isTileRectOverridden")
      || -[OADGradientFill isFlipModeOverridden](self, "isFlipModeOverridden")
      || -[OADGradientFill isRotateWithShapeOverridden](self, "isRotateWithShapeOverridden")
      || -[OADGradientFill isShadeOverridden](self, "isShadeOverridden");
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
  void *v11;
  id v12;
  void *v13;
  objc_object *v14;
  void *v15;
  objc_object *v16;
  int v17;
  NSArray *mStops;
  id v19;
  int v20;
  id v21;
  int v22;
  int *p_mFlipMode;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  char isKindOfClass;
  uint64_t v30;
  id v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)OADGradientFill;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v32, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (-[OADGradientFill areStopsOverridden](self, "areStopsOverridden")
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_areStopsOverridden);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[OADGradientFill stops](self, "stops");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_areStopsOverridden);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "stops");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = TCObjectEqual(v7, v9);
    v11 = *(void **)&self->super.mDefinedByStyle;
    if (v10)
    {
      *(_QWORD *)&self->super.mDefinedByStyle = 0;

    }
    else if (!v11 && v6)
    {
      -[OADGradientFill setStops:](self, "setStops:", v7);
    }

  }
  if (-[OADGradientFill isTileRectOverridden](self, "isTileRectOverridden")
    || (-[OADProperties parent](self, "parent"),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_isTileRectOverridden);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[OADGradientFill tileRect](self, "tileRect");
      v14 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isTileRectOverridden);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "tileRect");
      v16 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v17 = TCObjectEqual(v14, v16);
    mStops = self->mStops;
    if (v17)
    {
      self->mStops = 0;

    }
    else if (!mStops && v13)
    {
      -[OADGradientFill setTileRect:](self, "setTileRect:", v14);
    }

  }
  if (BYTE4(self->mTileRect)
    || (-[OADProperties parent](self, "parent"),
        v19 = (id)objc_claimAutoreleasedReturnValue(),
        v19,
        v19 != v4))
  {
    v20 = -[OADGradientFill flipMode](self, "flipMode");
    if (v20 == objc_msgSend(v4, "flipMode"))
    {
      BYTE4(self->mTileRect) = 0;
    }
    else if (!BYTE4(self->mTileRect))
    {
      -[OADGradientFill setFlipMode:](self, "setFlipMode:", -[OADGradientFill flipMode](self, "flipMode"));
    }
  }
  if (BYTE6(self->mTileRect)
    || (-[OADProperties parent](self, "parent"),
        v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 != v4))
  {
    v22 = -[OADGradientFill rotateWithShape](self, "rotateWithShape");
    if (v22 == objc_msgSend(v4, "rotateWithShape"))
    {
      BYTE6(self->mTileRect) = 0;
    }
    else if (!BYTE6(self->mTileRect))
    {
      -[OADGradientFill setRotateWithShape:](self, "setRotateWithShape:", -[OADGradientFill rotateWithShape](self, "rotateWithShape"));
    }
  }
  p_mFlipMode = &self->mFlipMode;
  if (*(_QWORD *)&self->mFlipMode
    || (-[OADProperties parent](self, "parent"),
        v24 = (id)objc_claimAutoreleasedReturnValue(),
        v24,
        v24 != v4))
  {
    -[OADGradientFill shade](self, "shade");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc_init((Class)objc_opt_class());

    -[OADGradientFill shade](self, "shade");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setParent:", v27);

    objc_storeStrong((id *)p_mFlipMode, v26);
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isShadeOverridden);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "shade");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (*(void **)p_mFlipMode == v28)
    {
      v31 = v28;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "defaultProperties");
        v30 = objc_claimAutoreleasedReturnValue();

        v28 = (void *)v30;
      }
      objc_msgSend(*(id *)p_mFlipMode, "changeParentPreservingEffectiveValues:", v28);
      if ((isKindOfClass & 1) == 0 || (objc_msgSend(*(id *)p_mFlipMode, "isAnythingOverridden") & 1) != 0)
        goto LABEL_53;
      v31 = *(id *)p_mFlipMode;
    }
    *(_QWORD *)p_mFlipMode = 0;

LABEL_53:
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
  void *v12;
  void *v13;
  objc_object *v14;
  objc_object *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  NSArray *mStops;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  objc_object *v25;
  objc_object *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void *v30;
  objc_super v31;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[OADProperties isMerged](self, "isMerged");
    v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
    -[OADProperties setMerged:](self, "setMerged:", 0);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
    if (!-[OADGradientFill areStopsOverridden](self, "areStopsOverridden"))
      goto LABEL_10;
    -[OADProperties parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADGradientFill stops](self, "stops");
    v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stops");
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

LABEL_10:
      if (!-[OADGradientFill isTileRectOverridden](self, "isTileRectOverridden"))
        goto LABEL_18;
      -[OADProperties parent](self, "parent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADGradientFill tileRect](self, "tileRect");
      v14 = (objc_object *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "tileRect");
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
      }
      else if (!TCObjectEqual(v14, v15))
      {
LABEL_17:

LABEL_18:
        if (-[OADGradientFill isFlipModeOverridden](self, "isFlipModeOverridden"))
        {
          -[OADProperties parent](self, "parent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[OADGradientFill flipMode](self, "flipMode");
          if (v21 == objc_msgSend(v20, "flipMode"))
          {
            -[OADGradientFill setFlipMode:](self, "setFlipMode:", 0);
            BYTE4(self->mTileRect) = 0;
          }

        }
        if (-[OADGradientFill isRotateWithShapeOverridden](self, "isRotateWithShapeOverridden"))
        {
          -[OADProperties parent](self, "parent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[OADGradientFill rotateWithShape](self, "rotateWithShape");
          if (v23 == objc_msgSend(v22, "rotateWithShape"))
          {
            -[OADGradientFill setRotateWithShape:](self, "setRotateWithShape:", 1);
            BYTE6(self->mTileRect) = 0;
          }

        }
        if (!-[OADGradientFill isShadeOverridden](self, "isShadeOverridden"))
          goto LABEL_34;
        -[OADProperties parent](self, "parent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[OADGradientFill shade](self, "shade");
        v25 = (objc_object *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "shade");
        v26 = (objc_object *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[objc_object removeUnnecessaryOverrides](v25, "removeUnnecessaryOverrides");
          v27 = objc_opt_class();
          if (v27 != objc_opt_class())
            goto LABEL_33;
          v28 = -[objc_object isMergedWithParent](v25, "isMergedWithParent");
          -[objc_object setMergedWithParent:](v25, "setMergedWithParent:", 0);
          v29 = -[objc_object isAnythingOverridden](v25, "isAnythingOverridden");
          -[objc_object setMergedWithParent:](v25, "setMergedWithParent:", v28);
          if ((v29 & 1) != 0)
            goto LABEL_33;
        }
        else if (!TCObjectEqual(v25, v26))
        {
LABEL_33:

LABEL_34:
          -[OADProperties setMerged:](self, "setMerged:", v4);
          -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
          v31.receiver = self;
          v31.super_class = (Class)OADGradientFill;
          -[OADProperties removeUnnecessaryOverrides](&v31, sel_removeUnnecessaryOverrides);
          return;
        }
        v30 = *(void **)&self->mFlipMode;
        *(_QWORD *)&self->mFlipMode = 0;

        goto LABEL_33;
      }
      mStops = self->mStops;
      self->mStops = 0;

      goto LABEL_17;
    }
    v12 = *(void **)&self->super.mDefinedByStyle;
    *(_QWORD *)&self->super.mDefinedByStyle = 0;

    goto LABEL_9;
  }
}

- (void)sortStops
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("position"), 1);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)&self->super.mDefinedByStyle, "sortedArrayUsingDescriptors:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADGradientFill setStops:](self, "setStops:", v4);

}

- (id)tileRect
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isTileRectOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[4];

  return v3;
}

- (BOOL)isTileRectOverridden
{
  return self->mStops || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (int)flipMode
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isFlipModeOverridden);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[10];

  return v3;
}

- (BOOL)isFlipModeOverridden
{
  return BYTE4(self->mTileRect)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)rotateWithShape
{
  _BYTE *v2;
  char v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isRotateWithShapeOverridden);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[45];

  return v3;
}

- (BOOL)isRotateWithShapeOverridden
{
  return BYTE6(self->mTileRect)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)firstStop
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[OADGradientFill stops](self, "stops");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastStop
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[OADGradientFill stops](self, "stops");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)usesPlaceholderColor
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)&self->super.mDefinedByStyle;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "usesPlaceholderColor", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (id)stringForTileFlipMode:(int)a3
{
  if (a3 > 3)
    return CFSTR("unknown");
  else
    return off_24F39DAC0[a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFlipMode, 0);
  objc_storeStrong((id *)&self->mStops, 0);
  objc_storeStrong((id *)&self->super.mDefinedByStyle, 0);
}

@end
