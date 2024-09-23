@implementation OADImageFill

+ (id)defaultProperties
{
  if (+[OADImageFill defaultProperties]::once != -1)
    dispatch_once(&+[OADImageFill defaultProperties]::once, &__block_literal_global_224);
  return (id)+[OADImageFill defaultProperties]::defaultProperties;
}

- (OADImageFill)initWithDefaults
{
  OADImageFill *v2;
  OADImageFill *v3;
  OADRelativeRect *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  OADRelativeRect *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)OADImageFill;
  v2 = -[OADProperties initWithDefaults](&v13, sel_initWithDefaults);
  v3 = v2;
  if (v2)
  {
    -[OADImageFill setBlipRef:](v2, "setBlipRef:", 0);
    v4 = [OADRelativeRect alloc];
    LODWORD(v5) = 0;
    LODWORD(v6) = 0;
    LODWORD(v7) = 0;
    LODWORD(v8) = 0;
    v9 = -[OADRelativeRect initWithLeft:top:right:bottom:](v4, "initWithLeft:top:right:bottom:", v5, v6, v7, v8);
    -[OADImageFill setSourceRect:](v3, "setSourceRect:", v9);
    -[OADImageFill setDpi:](v3, "setDpi:", 72);
    -[OADImageFill setRotateWithShape:](v3, "setRotateWithShape:", 1);
    +[OADTileTechnique defaultProperties](OADTileTechnique, "defaultProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    -[OADImageFill setTechnique:](v3, "setTechnique:", v11);

  }
  return v3;
}

- (void)setBlipRef:(id)a3
{
  objc_storeStrong((id *)&self->super.mDefinedByStyle, a3);
  LOBYTE(self->mBlipRef) = 1;
}

- (void)setSourceRect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADImageFill setSourceRect:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADFill.mm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1384, 0, "invalid nil value for '%{public}s'", "sourceRect");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v7 = *(void **)&self->mIsBlipRefOverridden;
  *(_QWORD *)&self->mIsBlipRefOverridden = v4;

}

- (void)setDpi:(int)a3
{
  LODWORD(self->mSourceRect) = a3;
  BYTE4(self->mSourceRect) = 1;
}

- (void)setRotateWithShape:(BOOL)a3
{
  BYTE5(self->mSourceRect) = a3;
  BYTE6(self->mSourceRect) = 1;
}

- (void)setTechnique:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADImageFill setTechnique:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADFill.mm");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1423, 0, "invalid nil value for '%{public}s'", "technique");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v7 = *(void **)&self->mDpi;
  *(_QWORD *)&self->mDpi = v4;

}

- (void)setParent:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)OADImageFill;
  -[OADProperties setParent:](&v6, sel_setParent_, v4);
  if (*(_QWORD *)&self->mDpi)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "technique");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
        objc_msgSend(*(id *)&self->mDpi, "setParent:", v5);

    }
  }

}

- (BOOL)isSourceRectOverridden
{
  return *(_QWORD *)&self->mIsBlipRefOverridden
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)sourceRect
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isSourceRectOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[5];

  return v3;
}

- (BOOL)isBlipRefOverridden
{
  return LOBYTE(self->mBlipRef)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)blipRef
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isBlipRefOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[3];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  objc_object **v5;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADImageFill;
  if (-[OADFill isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = (objc_object **)v4;
    if (LOBYTE(self->mBlipRef) == *((unsigned __int8 *)v5 + 32)
      && (!LOBYTE(self->mBlipRef) || objc_msgSend(*(id *)&self->super.mDefinedByStyle, "isEqual:", v5[3]))
      && TCObjectEqual(*(objc_object **)&self->mIsBlipRefOverridden, v5[5])
      && BYTE4(self->mSourceRect) == *((unsigned __int8 *)v5 + 52)
      && (!BYTE4(self->mSourceRect) || LODWORD(self->mSourceRect) == *((_DWORD *)v5 + 12))
      && BYTE6(self->mSourceRect) == *((unsigned __int8 *)v5 + 54)
      && (!BYTE6(self->mSourceRect) || BYTE5(self->mSourceRect) == *((unsigned __int8 *)v5 + 53)))
    {
      v6 = TCObjectEqual(*(objc_object **)&self->mDpi, v5[7]);
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

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (LOBYTE(self->mBlipRef))
    v3 = objc_msgSend(*(id *)&self->super.mDefinedByStyle, "hash");
  else
    v3 = 0;
  v4 = *(void **)&self->mIsBlipRefOverridden;
  if (v4)
    v3 ^= objc_msgSend(v4, "hash");
  if (BYTE4(self->mSourceRect))
    v3 ^= SLODWORD(self->mSourceRect);
  if (BYTE6(self->mSourceRect))
    v3 ^= BYTE5(self->mSourceRect);
  v5 = *(void **)&self->mDpi;
  if (v5)
    v3 ^= objc_msgSend(v5, "hash");
  v7.receiver = self;
  v7.super_class = (Class)OADImageFill;
  return -[OADFill hash](&v7, sel_hash) ^ v3;
}

- (id)technique
{
  id *v2;
  id v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isTechniqueOverridden);
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2[7];

  return v3;
}

- (BOOL)isTechniqueOverridden
{
  return *(_QWORD *)&self->mDpi
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (LOBYTE(self->mBlipRef))
  {
    v6 = (void *)objc_msgSend(*(id *)&self->super.mDefinedByStyle, "copyWithZone:", a3);
    objc_msgSend(v5, "setBlipRef:", v6);

  }
  v7 = *(void **)&self->mIsBlipRefOverridden;
  if (v7)
  {
    v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
    objc_msgSend(v5, "setSourceRect:", v8);

  }
  if (BYTE4(self->mSourceRect))
    objc_msgSend(v5, "setDpi:", LODWORD(self->mSourceRect));
  if (BYTE6(self->mSourceRect))
    objc_msgSend(v5, "setRotateWithShape:", BYTE5(self->mSourceRect));
  v9 = *(void **)&self->mDpi;
  if (v9)
  {
    v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
    objc_msgSend(v5, "setTechnique:", v10);

  }
  return v5;
}

- (void)setStyleColor:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[OADImageFill blipRef](self, "blipRef");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectCount");
  if (v5)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v4, "effectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setStyleColor:", v8);

      ++v6;
    }
    while (v5 != v6);
  }

}

void __33__OADImageFill_defaultProperties__block_invoke()
{
  OADImageFill *v0;
  void *v1;

  v0 = -[OADImageFill initWithDefaults]([OADImageFill alloc], "initWithDefaults");
  v1 = (void *)+[OADImageFill defaultProperties]::defaultProperties;
  +[OADImageFill defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (BOOL)isAnythingOverridden
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OADImageFill;
  return -[OADProperties isAnythingOverridden](&v4, sel_isAnythingOverridden)
      || -[OADImageFill isBlipRefOverridden](self, "isBlipRefOverridden")
      || -[OADImageFill isSourceRectOverridden](self, "isSourceRectOverridden")
      || -[OADImageFill isDpiOverridden](self, "isDpiOverridden")
      || -[OADImageFill isRotateWithShapeOverridden](self, "isRotateWithShapeOverridden")
      || -[OADImageFill isTechniqueOverridden](self, "isTechniqueOverridden");
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_object *v7;
  void *v8;
  objc_object *v9;
  void *v10;
  id v11;
  void *v12;
  objc_object *v13;
  void *v14;
  objc_object *v15;
  int v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  int v21;
  int *p_mDpi;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  uint64_t v29;
  id v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)OADImageFill;
  -[OADProperties fixPropertiesForChangingParentPreservingEffectiveValues:](&v31, sel_fixPropertiesForChangingParentPreservingEffectiveValues_, v4);
  if (LOBYTE(self->mBlipRef)
    || (-[OADProperties parent](self, "parent"), v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_isBlipRefOverridden);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[OADImageFill blipRef](self, "blipRef");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isBlipRefOverridden);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "blipRef");
      v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    if (TCObjectEqual(v7, v9))
    {
      v10 = *(void **)&self->super.mDefinedByStyle;
      *(_QWORD *)&self->super.mDefinedByStyle = 0;

      LOBYTE(self->mBlipRef) = 0;
    }
    else if (!LOBYTE(self->mBlipRef) && v6)
    {
      -[OADImageFill setBlipRef:](self, "setBlipRef:", v7);
    }

  }
  if (-[OADImageFill isSourceRectOverridden](self, "isSourceRectOverridden")
    || (-[OADProperties parent](self, "parent"),
        v11 = (id)objc_claimAutoreleasedReturnValue(),
        v11,
        v11 != v4))
  {
    -[OADProperties possiblyInexistentOverrideForSelector:](self, "possiblyInexistentOverrideForSelector:", sel_isSourceRectOverridden);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[OADImageFill sourceRect](self, "sourceRect");
      v13 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isSourceRectOverridden);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "sourceRect");
      v15 = (objc_object *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    v16 = TCObjectEqual(v13, v15);
    v17 = *(void **)&self->mIsBlipRefOverridden;
    if (v16)
    {
      *(_QWORD *)&self->mIsBlipRefOverridden = 0;

    }
    else if (!v17 && v12)
    {
      -[OADImageFill setSourceRect:](self, "setSourceRect:", v13);
    }

  }
  if (BYTE4(self->mSourceRect)
    || (-[OADProperties parent](self, "parent"),
        v18 = (id)objc_claimAutoreleasedReturnValue(),
        v18,
        v18 != v4))
  {
    v19 = -[OADImageFill dpi](self, "dpi");
    if (v19 == objc_msgSend(v4, "dpi"))
    {
      BYTE4(self->mSourceRect) = 0;
    }
    else if (!BYTE4(self->mSourceRect))
    {
      -[OADImageFill setDpi:](self, "setDpi:", -[OADImageFill dpi](self, "dpi"));
    }
  }
  if (BYTE6(self->mSourceRect)
    || (-[OADProperties parent](self, "parent"),
        v20 = (id)objc_claimAutoreleasedReturnValue(),
        v20,
        v20 != v4))
  {
    v21 = -[OADImageFill rotateWithShape](self, "rotateWithShape");
    if (v21 == objc_msgSend(v4, "rotateWithShape"))
    {
      BYTE6(self->mSourceRect) = 0;
    }
    else if (!BYTE6(self->mSourceRect))
    {
      -[OADImageFill setRotateWithShape:](self, "setRotateWithShape:", -[OADImageFill rotateWithShape](self, "rotateWithShape"));
    }
  }
  p_mDpi = &self->mDpi;
  if (*(_QWORD *)&self->mDpi
    || (-[OADProperties parent](self, "parent"),
        v23 = (id)objc_claimAutoreleasedReturnValue(),
        v23,
        v23 != v4))
  {
    -[OADImageFill technique](self, "technique");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc_init((Class)objc_opt_class());

    -[OADImageFill technique](self, "technique");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setParent:", v26);

    objc_storeStrong((id *)p_mDpi, v25);
    objc_msgSend(v4, "possiblyInexistentOverrideForSelector:", sel_isTechniqueOverridden);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v4, "technique");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (*(void **)p_mDpi == v27)
    {
      v30 = v27;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "defaultProperties");
        v29 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v29;
      }
      objc_msgSend(*(id *)p_mDpi, "changeParentPreservingEffectiveValues:", v27);
      if ((isKindOfClass & 1) == 0 || (objc_msgSend(*(id *)p_mDpi, "isAnythingOverridden") & 1) != 0)
        goto LABEL_53;
      v30 = *(id *)p_mDpi;
    }
    *(_QWORD *)p_mDpi = 0;

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
  int v14;
  void *v15;
  int v16;
  void *v17;
  objc_object *v18;
  objc_object *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void *v23;
  objc_super v24;

  -[OADProperties parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[OADProperties isMerged](self, "isMerged");
    v5 = -[OADProperties isMergedWithParent](self, "isMergedWithParent");
    -[OADProperties setMerged:](self, "setMerged:", 0);
    -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", 0);
    if (!-[OADImageFill isSourceRectOverridden](self, "isSourceRectOverridden"))
      goto LABEL_10;
    -[OADProperties parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADImageFill sourceRect](self, "sourceRect");
    v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceRect");
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
      if (-[OADImageFill isDpiOverridden](self, "isDpiOverridden"))
      {
        -[OADProperties parent](self, "parent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[OADImageFill dpi](self, "dpi");
        if (v14 == objc_msgSend(v13, "dpi"))
        {
          -[OADImageFill setDpi:](self, "setDpi:", 72);
          BYTE4(self->mSourceRect) = 0;
        }

      }
      if (-[OADImageFill isRotateWithShapeOverridden](self, "isRotateWithShapeOverridden"))
      {
        -[OADProperties parent](self, "parent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[OADImageFill rotateWithShape](self, "rotateWithShape");
        if (v16 == objc_msgSend(v15, "rotateWithShape"))
        {
          -[OADImageFill setRotateWithShape:](self, "setRotateWithShape:", 1);
          BYTE6(self->mSourceRect) = 0;
        }

      }
      if (!-[OADImageFill isTechniqueOverridden](self, "isTechniqueOverridden"))
        goto LABEL_26;
      -[OADProperties parent](self, "parent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[OADImageFill technique](self, "technique");
      v18 = (objc_object *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "technique");
      v19 = (objc_object *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[objc_object removeUnnecessaryOverrides](v18, "removeUnnecessaryOverrides");
        v20 = objc_opt_class();
        if (v20 != objc_opt_class())
          goto LABEL_25;
        v21 = -[objc_object isMergedWithParent](v18, "isMergedWithParent");
        -[objc_object setMergedWithParent:](v18, "setMergedWithParent:", 0);
        v22 = -[objc_object isAnythingOverridden](v18, "isAnythingOverridden");
        -[objc_object setMergedWithParent:](v18, "setMergedWithParent:", v21);
        if ((v22 & 1) != 0)
          goto LABEL_25;
      }
      else if (!TCObjectEqual(v18, v19))
      {
LABEL_25:

LABEL_26:
        -[OADProperties setMerged:](self, "setMerged:", v4);
        -[OADProperties setMergedWithParent:](self, "setMergedWithParent:", v5);
        v24.receiver = self;
        v24.super_class = (Class)OADImageFill;
        -[OADProperties removeUnnecessaryOverrides](&v24, sel_removeUnnecessaryOverrides);
        return;
      }
      v23 = *(void **)&self->mDpi;
      *(_QWORD *)&self->mDpi = 0;

      goto LABEL_25;
    }
    v12 = *(void **)&self->mIsBlipRefOverridden;
    *(_QWORD *)&self->mIsBlipRefOverridden = 0;

    goto LABEL_9;
  }
}

- (id)color
{
  uint64_t v3;
  unsigned int v4;
  void *v5;
  void *v7;

  if (objc_msgSend(*(id *)&self->super.mDefinedByStyle, "effectCount"))
  {
    v3 = 0;
    v4 = 1;
    while (1)
    {
      objc_msgSend(*(id *)&self->super.mDefinedByStyle, "effectAtIndex:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;

      v3 = v4;
      if (objc_msgSend(*(id *)&self->super.mDefinedByStyle, "effectCount") <= (unint64_t)v4++)
        goto LABEL_5;
    }
    objc_msgSend(v5, "foregroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v7 = 0;
  }
  return v7;
}

- (int)dpi
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isDpiOverridden);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[12];

  return v3;
}

- (BOOL)isDpiOverridden
{
  return BYTE4(self->mSourceRect)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (BOOL)rotateWithShape
{
  _BYTE *v2;
  char v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_isRotateWithShapeOverridden);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v3 = v2[53];

  return v3;
}

- (BOOL)isRotateWithShapeOverridden
{
  return BYTE6(self->mSourceRect)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDpi, 0);
  objc_storeStrong((id *)&self->mIsBlipRefOverridden, 0);
  objc_storeStrong((id *)&self->super.mDefinedByStyle, 0);
}

@end
