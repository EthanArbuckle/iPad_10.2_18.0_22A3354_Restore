@implementation UISlidingBarConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int64_t v36;
  BOOL v37;
  int64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_configurationFlags.value != v5[2])
        goto LABEL_18;
      -[UISlidingBarConfiguration minimumMainWidthFraction](self, "minimumMainWidthFraction");
      v7 = v6;
      objc_msgSend(v5, "minimumMainWidthFraction");
      if (v7 != v8)
        goto LABEL_18;
      -[UISlidingBarConfiguration minimumMainWidthFractionForSecondColumn](self, "minimumMainWidthFractionForSecondColumn");
      v10 = v9;
      objc_msgSend(v5, "minimumMainWidthFractionForSecondColumn");
      if (v10 != v11
        || (-[UISlidingBarConfiguration maximumMainWidth](self, "maximumMainWidth"),
            v13 = v12,
            objc_msgSend(v5, "maximumMainWidth"),
            v13 != v14)
        || (v15 = -[UISlidingBarConfiguration supplementaryEdge](self, "supplementaryEdge"),
            v15 != objc_msgSend(v5, "supplementaryEdge"))
        || (-[UISlidingBarConfiguration rubberBandExtension](self, "rubberBandExtension"),
            v17 = v16,
            objc_msgSend(v5, "rubberBandExtension"),
            v17 != v18))
      {
LABEL_18:
        v37 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[UISlidingBarConfiguration leadingWidths](self, "leadingWidths");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leadingWidths");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v19, "isEqual:", v20))
      {
        v37 = 0;
LABEL_26:

        goto LABEL_19;
      }
      -[UISlidingBarConfiguration trailingWidths](self, "trailingWidths");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trailingWidths");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v21, "isEqual:", v22))
      {
        v37 = 0;
LABEL_25:

        goto LABEL_26;
      }
      -[UISlidingBarConfiguration supplementaryWidths](self, "supplementaryWidths");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "supplementaryWidths");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v23, "isEqual:", v24)
        || (-[UISlidingBarConfiguration _rawLeadingBorderWidth](self, "_rawLeadingBorderWidth"),
            v26 = v25,
            objc_msgSend(v5, "_rawLeadingBorderWidth"),
            v26 != v27)
        || (-[UISlidingBarConfiguration _rawTrailingBorderWidth](self, "_rawTrailingBorderWidth"),
            v29 = v28,
            objc_msgSend(v5, "_rawTrailingBorderWidth"),
            v29 != v30))
      {
        v37 = 0;
LABEL_24:

        goto LABEL_25;
      }
      -[UISlidingBarConfiguration borderColor](self, "borderColor");
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "borderColor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)v31;
      if ((void *)v31 == v43)
      {
        v36 = -[UISlidingBarConfiguration _leadingBackgroundStyle](self, "_leadingBackgroundStyle", v40);
      }
      else
      {
        -[UISlidingBarConfiguration borderColor](self, "borderColor");
        v32 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "borderColor");
        v33 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)v32;
        v34 = (void *)v32;
        v35 = (void *)v33;
        if (!objc_msgSend(v34, "isEqual:", v33))
        {
          v37 = 0;
LABEL_33:

LABEL_34:
          goto LABEL_24;
        }
        v36 = -[UISlidingBarConfiguration _leadingBackgroundStyle](self, "_leadingBackgroundStyle", v35);
      }
      if (v36 == objc_msgSend(v5, "_leadingBackgroundStyle"))
      {
        v39 = -[UISlidingBarConfiguration _trailingBackgroundStyle](self, "_trailingBackgroundStyle");
        v37 = v39 == objc_msgSend(v5, "_trailingBackgroundStyle");
      }
      else
      {
        v37 = 0;
      }
      v35 = v41;
      if (v44 == v43)
        goto LABEL_34;
      goto LABEL_33;
    }
  }
  v37 = 0;
LABEL_20:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[2] = self->_configurationFlags.value;
  -[UISlidingBarConfiguration minimumMainWidthFraction](self, "minimumMainWidthFraction");
  objc_msgSend(v4, "setMinimumMainWidthFraction:");
  -[UISlidingBarConfiguration minimumMainWidthFractionForSecondColumn](self, "minimumMainWidthFractionForSecondColumn");
  objc_msgSend(v4, "setMinimumMainWidthFractionForSecondColumn:");
  -[UISlidingBarConfiguration maximumMainWidth](self, "maximumMainWidth");
  objc_msgSend(v4, "setMaximumMainWidth:");
  objc_msgSend(v4, "setSupplementaryEdge:", -[UISlidingBarConfiguration supplementaryEdge](self, "supplementaryEdge"));
  -[UISlidingBarConfiguration rubberBandExtension](self, "rubberBandExtension");
  objc_msgSend(v4, "setRubberBandExtension:");
  -[UISlidingBarConfiguration leadingWidths](self, "leadingWidths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeadingWidths:", v5);

  -[UISlidingBarConfiguration trailingWidths](self, "trailingWidths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTrailingWidths:", v6);

  -[UISlidingBarConfiguration supplementaryWidths](self, "supplementaryWidths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupplementaryWidths:", v7);

  -[UISlidingBarConfiguration _rawLeadingBorderWidth](self, "_rawLeadingBorderWidth");
  objc_msgSend(v4, "_setRawLeadingBorderWidth:");
  -[UISlidingBarConfiguration _rawTrailingBorderWidth](self, "_rawTrailingBorderWidth");
  objc_msgSend(v4, "_setRawTrailingBorderWidth:");
  -[UISlidingBarConfiguration borderColor](self, "borderColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderColor:", v8);

  objc_msgSend(v4, "_setLeadingBackgroundStyle:", -[UISlidingBarConfiguration _leadingBackgroundStyle](self, "_leadingBackgroundStyle"));
  objc_msgSend(v4, "_setTrailingBackgroundStyle:", -[UISlidingBarConfiguration _trailingBackgroundStyle](self, "_trailingBackgroundStyle"));
  return v4;
}

- (int64_t)supplementaryEdge
{
  return self->_supplementaryEdge;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (NSArray)trailingWidths
{
  return self->_trailingWidths;
}

- (NSArray)supplementaryWidths
{
  return self->_supplementaryWidths;
}

- (double)rubberBandExtension
{
  return self->_rubberBandExtension;
}

- (double)minimumMainWidthFraction
{
  return self->_minimumMainWidthFraction;
}

- (double)minimumMainWidthFractionForSecondColumn
{
  return self->_minimumMainWidthFractionForSecondColumn;
}

- (double)maximumMainWidth
{
  return self->_maximumMainWidth;
}

- (NSArray)leadingWidths
{
  return self->_leadingWidths;
}

- (double)_rawTrailingBorderWidth
{
  return self->__rawTrailingBorderWidth;
}

- (double)_rawLeadingBorderWidth
{
  return self->__rawLeadingBorderWidth;
}

- (int64_t)_leadingBackgroundStyle
{
  return self->__leadingBackgroundStyle;
}

- (UISlidingBarConfiguration)init
{
  UISlidingBarConfiguration *v2;
  UISlidingBarConfiguration *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISlidingBarConfiguration;
  v2 = -[UISlidingBarConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UISlidingBarConfiguration setMinimumMainWidthFraction:](v2, "setMinimumMainWidthFraction:", 0.59);
    -[UISlidingBarConfiguration setMinimumMainWidthFractionForSecondColumn:](v3, "setMinimumMainWidthFractionForSecondColumn:", 0.44);
    -[UISlidingBarConfiguration setMaximumMainWidth:](v3, "setMaximumMainWidth:", 1.79769313e308);
    v3->_configurationFlags.value |= 7u;
    v4 = MEMORY[0x1E0C9AA60];
    -[UISlidingBarConfiguration setLeadingWidths:](v3, "setLeadingWidths:", MEMORY[0x1E0C9AA60]);
    -[UISlidingBarConfiguration setTrailingWidths:](v3, "setTrailingWidths:", v4);
    -[UISlidingBarConfiguration setSupplementaryWidths:](v3, "setSupplementaryWidths:", v4);
    -[UISlidingBarConfiguration setLeadingBorderWidthInPixels:](v3, "setLeadingBorderWidthInPixels:", 1.0);
    -[UISlidingBarConfiguration setTrailingBorderWidthInPixels:](v3, "setTrailingBorderWidthInPixels:", 1.0);
    -[UISlidingBarConfiguration setBorderColor:](v3, "setBorderColor:", 0);
    -[UISlidingBarConfiguration setAllowMixedSideBySideAndOverlay:](v3, "setAllowMixedSideBySideAndOverlay:", 0);
    -[UISlidingBarConfiguration _setLeadingBackgroundStyle:](v3, "_setLeadingBackgroundStyle:", 0);
    -[UISlidingBarConfiguration _setTrailingBackgroundStyle:](v3, "_setTrailingBackgroundStyle:", 0);
    -[UISlidingBarConfiguration setBorderAbuttingMainRendersAsShadow:](v3, "setBorderAbuttingMainRendersAsShadow:", 1);
  }
  return v3;
}

- (void)_setTrailingBackgroundStyle:(int64_t)a3
{
  self->__trailingBackgroundStyle = a3;
}

- (void)_setLeadingBackgroundStyle:(int64_t)a3
{
  self->__leadingBackgroundStyle = a3;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (void)setSupplementaryWidths:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setMinimumMainWidthFractionForSecondColumn:(double)a3
{
  self->_minimumMainWidthFractionForSecondColumn = fmin(fmax(a3, 0.0), 1.0);
}

- (void)setMinimumMainWidthFraction:(double)a3
{
  self->_minimumMainWidthFraction = fmin(fmax(a3, 0.0), 1.0);
}

- (void)setMaximumMainWidth:(double)a3
{
  self->_maximumMainWidth = fmin(fmax(a3, 0.0), 1.79769313e308);
}

- (void)setLeadingWidths:(id)a3
{
  NSArray *v4;
  NSArray *leadingWidths;

  filterAndCopyWidths(a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  leadingWidths = self->_leadingWidths;
  self->_leadingWidths = v4;

}

- (void)setTrailingWidths:(id)a3
{
  NSArray *v4;
  NSArray *trailingWidths;

  filterAndCopyWidths(a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trailingWidths = self->_trailingWidths;
  self->_trailingWidths = v4;

}

- (void)setTrailingBorderWidthInPixels:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  self->__rawTrailingBorderWidth = a3;
  self->_configurationFlags.value |= 0x80u;
}

- (void)setLeadingBorderWidthInPixels:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  self->__rawLeadingBorderWidth = a3;
  self->_configurationFlags.value |= 0x40u;
}

- (void)setAllowMixedSideBySideAndOverlay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFF7 | v3;
}

- (int64_t)_trailingBackgroundStyle
{
  return self->__trailingBackgroundStyle;
}

- (void)setSupplementaryEdge:(int64_t)a3
{
  self->_supplementaryEdge = a3;
}

- (void)setRubberBandExtension:(double)a3
{
  self->_rubberBandExtension = a3;
}

- (void)_setRawTrailingBorderWidth:(double)a3
{
  self->__rawTrailingBorderWidth = a3;
}

- (void)_setRawLeadingBorderWidth:(double)a3
{
  self->__rawLeadingBorderWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_supplementaryWidths, 0);
  objc_storeStrong((id *)&self->_trailingWidths, 0);
  objc_storeStrong((id *)&self->_leadingWidths, 0);
}

- (BOOL)forceOverlay
{
  return (LOBYTE(self->_configurationFlags.value) >> 5) & 1;
}

- (BOOL)allowTotalWidthGreaterThanParent
{
  return (LOBYTE(self->_configurationFlags.value) >> 4) & 1;
}

- (BOOL)_supplementaryAdoptsPrimaryBackgroundStyle
{
  return (BYTE1(self->_configurationFlags.value) >> 1) & 1;
}

- (void)_setSupplementaryAdoptsPrimaryBackgroundStyle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFDFF | v3;
}

- (void)setTrailingBorderWidthInPoints:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  self->__rawTrailingBorderWidth = a3;
  self->_configurationFlags.value &= ~0x80u;
}

- (void)setLeadingBorderWidthInPoints:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  self->__rawLeadingBorderWidth = a3;
  self->_configurationFlags.value &= ~0x40u;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[UISlidingBarConfiguration leadingWidths](self, "leadingWidths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UISlidingBarConfiguration trailingWidths](self, "trailingWidths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[UISlidingBarConfiguration supplementaryWidths](self, "supplementaryWidths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (void)setLeadingMayBeHidden:(BOOL)a3
{
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFFE | a3;
}

- (BOOL)leadingMayBeHidden
{
  return self->_configurationFlags.value & 1;
}

- (void)setTrailingMayBeHidden:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFFD | v3;
}

- (BOOL)trailingMayBeHidden
{
  return (LOBYTE(self->_configurationFlags.value) >> 1) & 1;
}

- (void)setSupplementaryMayBeHidden:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFFB | v3;
}

- (BOOL)supplementaryMayBeHidden
{
  return (LOBYTE(self->_configurationFlags.value) >> 2) & 1;
}

- (BOOL)allowMixedSideBySideAndOverlay
{
  return (LOBYTE(self->_configurationFlags.value) >> 3) & 1;
}

- (void)setAllowTotalWidthGreaterThanParent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFEF | v3;
}

- (void)setForceOverlay:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFDF | v3;
}

- (void)setShouldFadeStaticNavBarButton:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFEFF | v3;
}

- (BOOL)shouldFadeStaticNavBarButton
{
  return BYTE1(self->_configurationFlags.value) & 1;
}

- (void)setBorderAbuttingMainRendersAsShadow:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFBFF | v3;
}

- (BOOL)borderAbuttingMainRendersAsShadow
{
  return (BYTE1(self->_configurationFlags.value) >> 2) & 1;
}

- (double)leadingBorderWidthForScale:(double)a3
{
  if ((self->_configurationFlags.value & 0x40) == 0)
    a3 = 1.0;
  return self->__rawLeadingBorderWidth / a3;
}

- (double)trailingBorderWidthForScale:(double)a3
{
  if ((self->_configurationFlags.value & 0x80) == 0)
    a3 = 1.0;
  return self->__rawTrailingBorderWidth / a3;
}

- (void)_setLeadingBorderWidthIsInPixels:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFFBF | v3;
}

- (BOOL)_leadingBorderWidthIsInPixels
{
  return (LOBYTE(self->_configurationFlags.value) >> 6) & 1;
}

- (void)_setTrailingBorderWidthIsInPixels:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_configurationFlags.value = self->_configurationFlags.value & 0xFFFFFF7F | v3;
}

- (BOOL)_trailingBorderWidthIsInPixels
{
  return LOBYTE(self->_configurationFlags.value) >> 7;
}

- (id)description
{
  void *v3;
  void *v4;
  unsigned int value;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UISlidingBarConfiguration;
  -[UISlidingBarConfiguration description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!os_variant_has_internal_diagnostics())
    return v4;
  value = self->_configurationFlags.value;
  if ((value & 1) != 0)
  {
    objc_msgSend(v4, "appendString:", CFSTR(" leadingMayBeHidden"));
    value = self->_configurationFlags.value;
    if ((value & 2) == 0)
    {
LABEL_5:
      if ((value & 4) == 0)
        goto LABEL_6;
      goto LABEL_20;
    }
  }
  else if ((value & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "appendString:", CFSTR(" trailingMayBeHidden"));
  value = self->_configurationFlags.value;
  if ((value & 4) == 0)
  {
LABEL_6:
    if ((value & 8) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v4, "appendString:", CFSTR(" supplementaryMayBeHidden"));
  value = self->_configurationFlags.value;
  if ((value & 8) == 0)
  {
LABEL_7:
    if ((value & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v4, "appendString:", CFSTR(" allowMixedSideBySideAndOverlay"));
  value = self->_configurationFlags.value;
  if ((value & 0x10) == 0)
  {
LABEL_8:
    if ((value & 0x20) == 0)
      goto LABEL_9;
LABEL_23:
    objc_msgSend(v4, "appendString:", CFSTR(" forceOverlay"));
    if ((self->_configurationFlags.value & 0x400) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_22:
  objc_msgSend(v4, "appendString:", CFSTR(" allowTotalWidthGreaterThanParent"));
  value = self->_configurationFlags.value;
  if ((value & 0x20) != 0)
    goto LABEL_23;
LABEL_9:
  if ((value & 0x400) != 0)
LABEL_10:
    objc_msgSend(v4, "appendFormat:", CFSTR(" borderAbuttingMainRendersAsShadow"));
LABEL_11:
  if (-[UISlidingBarConfiguration _leadingBackgroundStyle](self, "_leadingBackgroundStyle") == 1
    || -[UISlidingBarConfiguration _trailingBackgroundStyle](self, "_trailingBackgroundStyle") == 1)
  {
    objc_msgSend(v4, "appendString:", CFSTR(" sidebar-style primary"));
    if ((self->_configurationFlags.value & 0x200) != 0)
      objc_msgSend(v4, "appendString:", CFSTR(" including supplementary"));
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __40__UISlidingBarConfiguration_description__block_invoke;
  v13 = &unk_1E16C18B8;
  v7 = v4;
  v14 = v7;
  -[UISlidingBarConfiguration leadingWidths](self, "leadingWidths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __40__UISlidingBarConfiguration_description__block_invoke((uint64_t)v11, v8, CFSTR("leading"));

  -[UISlidingBarConfiguration trailingWidths](self, "trailingWidths");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __40__UISlidingBarConfiguration_description__block_invoke((uint64_t)v11, v9, CFSTR("trailing"));

  -[UISlidingBarConfiguration supplementaryWidths](self, "supplementaryWidths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12((uint64_t)v11, v10, CFSTR("supplementary"));

  if (self->_rubberBandExtension != 0.0)
    objc_msgSend(v7, "appendFormat:", CFSTR(" %@=%g"), CFSTR("extension"), *(_QWORD *)&self->_rubberBandExtension);

  return v4;
}

void __40__UISlidingBarConfiguration_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v16 = v6;
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" %@Widths=["), v6);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      v11 = 1;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(a1 + 32);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "doubleValue");
          if ((v11 & 1) != 0)
            v15 = CFSTR("%g");
          else
            v15 = CFSTR(" %g");
          objc_msgSend(v13, "appendFormat:", v15, v14);
          v11 = 0;
          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v11 = 0;
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("]"));
    v6 = v16;
  }

}

@end
