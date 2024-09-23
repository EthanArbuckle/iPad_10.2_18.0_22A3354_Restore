@implementation PXGViewEnvironment

- (PXGViewEnvironment)initWithView:(id)a3 accessibilityEnabled:(BOOL)a4 isBeingFullPageSnapshotted:(BOOL)a5
{
  id v7;
  PXGViewEnvironment *v8;
  uint64_t v9;
  UIColor *backgroundColor;
  uint64_t v11;
  UIColor *tintColor;
  uint64_t v13;
  UITraitCollection *traitCollection;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL *p_emphasized;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 emphasized;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  PXGViewEnvironment *v39;
  id v40;
  id v41;
  objc_super v42;

  v7 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PXGViewEnvironment;
  v8 = -[PXGViewEnvironment init](&v42, sel_init);
  if (!v8)
    goto LABEL_28;
  objc_msgSend(v7, "backgroundColor");
  v9 = objc_claimAutoreleasedReturnValue();
  backgroundColor = v8->_backgroundColor;
  v8->_backgroundColor = (UIColor *)v9;

  objc_msgSend(v7, "tintColor");
  v11 = objc_claimAutoreleasedReturnValue();
  tintColor = v8->_tintColor;
  v8->_tintColor = (UIColor *)v11;

  objc_msgSend(v7, "traitCollection");
  v13 = objc_claimAutoreleasedReturnValue();
  traitCollection = v8->_traitCollection;
  v8->_traitCollection = (UITraitCollection *)v13;

  objc_msgSend(v7, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_userInterfaceStyle = PXUserInterfaceStyleFromUITraitCollection();

  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "focusedItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_emphasized = objc_msgSend(v7, "px_isAncestorOfFocusEnvironment:", v18);
    p_emphasized = &v8->_emphasized;

  }
  else
  {
    v8->_emphasized = 1;
    p_emphasized = &v8->_emphasized;
  }
  +[PXFocusSettings sharedInstance](PXFocusSettings, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hideFocusRing");
  if (!v17 || v21)
  {
    v8->_wantsFocusRing = 0;
  }
  else
  {
    objc_msgSend(v7, "traitCollection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "userInterfaceIdiom") == 1)
    {
      v8->_wantsFocusRing = 1;
    }
    else
    {
      objc_msgSend(v7, "traitCollection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "userInterfaceIdiom") == 5)
      {
        v8->_wantsFocusRing = 1;
      }
      else
      {
        objc_msgSend(v7, "traitCollection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v8->_wantsFocusRing = objc_msgSend(v24, "userInterfaceIdiom") == 6;

      }
    }

  }
  v8->_isBeingFullPageSnapshotted = a5;
  emphasized = v8->_emphasized;
  if (!v17 || v8->_emphasized)
  {
    v8->_checkmarkEmphasized = emphasized;
    if (emphasized)
      goto LABEL_18;
LABEL_20:
    objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  objc_msgSend(v17, "focusedItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_checkmarkEmphasized = v26 == 0;

  if (!v8->_checkmarkEmphasized)
    goto LABEL_20;
LABEL_18:
  objc_msgSend(v7, "tintColor");
  v27 = objc_claimAutoreleasedReturnValue();
LABEL_21:
  v28 = (void *)v27;
  objc_msgSend(v7, "traitCollection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "userInterfaceIdiom") == 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "colorWithAlphaComponent:", 0.4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "tintColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (*p_emphasized)
  {
    v32 = v31;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
    v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  v33 = v32;
  objc_msgSend(v7, "traitCollection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __83__PXGViewEnvironment_initWithView_accessibilityEnabled_isBeingFullPageSnapshotted___block_invoke;
  v38[3] = &unk_1E51457C8;
  v39 = v8;
  v40 = v28;
  v41 = v33;
  v35 = v33;
  v36 = v28;
  objc_msgSend(v34, "performAsCurrentTraitCollection:", v38);

LABEL_28:
  return v8;
}

CGColorRef __83__PXGViewEnvironment_initWithView_accessibilityEnabled_isBeingFullPageSnapshotted___block_invoke(uint64_t a1)
{
  CGColorRef result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = CGColorRetain((CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "CGColor"));
  result = CGColorRetain((CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "CGColor"));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PXGViewEnvironment *v4;
  PXGViewEnvironment *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXGViewEnvironment *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[PXGViewEnvironment hasEqualAppearanceTo:](self, "hasEqualAppearanceTo:", v5))
      {
        -[PXGViewEnvironment traitCollection](self, "traitCollection");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGViewEnvironment traitCollection](v5, "traitCollection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 == v7)
          v8 = 1;
        else
          v8 = objc_msgSend(v6, "isEqual:", v7);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)accessibilityEnabled
{
  return self->_accessibilityEnabled;
}

- (BOOL)wantsFocusRing
{
  return self->_wantsFocusRing;
}

- (BOOL)isBeingFullPageSnapshotted
{
  return self->_isBeingFullPageSnapshotted;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)emphasized
{
  return self->_emphasized;
}

- (BOOL)checkmarkEmphasized
{
  return self->_checkmarkEmphasized;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_checkmarkColor);
  CGColorRelease(self->_focusRingColor);
  v3.receiver = self;
  v3.super_class = (Class)PXGViewEnvironment;
  -[PXGViewEnvironment dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (PXGViewEnvironment)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewEnvironment.m"), 93, CFSTR("%s is not available as initializer"), "-[PXGViewEnvironment init]");

  abort();
}

- (BOOL)hasEqualAppearanceTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  int64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = a3;
  if (!v4)
    goto LABEL_14;
  -[PXGViewEnvironment traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if ((v5 != 0) == v7
    || -[PXGViewEnvironment hasDifferentColorAppearanceComparedTo:](self, "hasDifferentColorAppearanceComparedTo:", v4))
  {
    goto LABEL_14;
  }
  -[PXGViewEnvironment backgroundColor](self, "backgroundColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    v11 = objc_msgSend(v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
      goto LABEL_14;
  }
  v12 = -[PXGViewEnvironment userInterfaceStyle](self, "userInterfaceStyle");
  if (v12 == objc_msgSend(v4, "userInterfaceStyle"))
  {
    v13 = -[PXGViewEnvironment accessibilityEnabled](self, "accessibilityEnabled");
    if (v13 == objc_msgSend(v4, "accessibilityEnabled"))
    {
      v14 = -[PXGViewEnvironment emphasized](self, "emphasized");
      if (v14 == objc_msgSend(v4, "emphasized"))
      {
        v15 = -[PXGViewEnvironment wantsFocusRing](self, "wantsFocusRing");
        if (v15 == objc_msgSend(v4, "wantsFocusRing"))
        {
          v16 = -[PXGViewEnvironment isBeingFullPageSnapshotted](self, "isBeingFullPageSnapshotted");
          if (v16 == objc_msgSend(v4, "isBeingFullPageSnapshotted"))
          {
            v17 = -[PXGViewEnvironment checkmarkEmphasized](self, "checkmarkEmphasized");
            if (v17 == objc_msgSend(v4, "checkmarkEmphasized"))
            {
              -[PXGViewEnvironment tintColor](self, "tintColor");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[PXGViewEnvironment traitCollection](self, "traitCollection");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "resolvedColorWithTraitCollection:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v4, "tintColor");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "traitCollection");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "resolvedColorWithTraitCollection:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v18 = objc_msgSend(v22, "_isSimilarToColor:withinPercentage:", v25, 0.000000999999997);
              goto LABEL_15;
            }
          }
        }
      }
    }
  }
LABEL_14:
  v18 = 0;
LABEL_15:

  return v18;
}

- (BOOL)hasDifferentColorAppearanceComparedTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXGViewEnvironment traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v6);
  return (char)v4;
}

- (CGColor)checkmarkColor
{
  return self->_checkmarkColor;
}

- (CGColor)focusRingColor
{
  return self->_focusRingColor;
}

@end
