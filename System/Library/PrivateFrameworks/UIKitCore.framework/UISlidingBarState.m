@implementation UISlidingBarState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (BOOL)_leadingEntirelyOverlapsMain
{
  double v3;
  double v4;
  double v5;
  void *v6;
  BOOL v7;

  if (-[UISlidingBarState leadingOverlapsMain](self, "leadingOverlapsMain"))
  {
    -[UISlidingBarState _leadingOverlayWidth](self, "_leadingOverlayWidth");
    v4 = v3;
    -[UISlidingBarState leadingWidth](self, "leadingWidth");
    if (v4 == v5)
      return 1;
  }
  -[UISlidingBarState _configuration](self, "_configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "supplementaryEdge"))
  {
    v7 = -[UISlidingBarState _supplementaryEntirelyOverlapsMain](self, "_supplementaryEntirelyOverlapsMain");

    return v7;
  }

  return 0;
}

- (BOOL)_supplementaryEntirelyOverlapsMain
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;

  v3 = -[UISlidingBarState supplementaryOverlapsMain](self, "supplementaryOverlapsMain");
  if (v3)
  {
    -[UISlidingBarState _supplementaryOverlayWidth](self, "_supplementaryOverlayWidth");
    v5 = v4;
    -[UISlidingBarState supplementaryWidth](self, "supplementaryWidth");
    LOBYTE(v3) = v5 == v6;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[UISlidingBarState leadingWidth](self, "leadingWidth");
  objc_msgSend(v4, "setLeadingWidth:");
  -[UISlidingBarState leadingOffscreenWidth](self, "leadingOffscreenWidth");
  objc_msgSend(v4, "setLeadingOffscreenWidth:");
  -[UISlidingBarState trailingWidth](self, "trailingWidth");
  objc_msgSend(v4, "setTrailingWidth:");
  -[UISlidingBarState trailingOffscreenWidth](self, "trailingOffscreenWidth");
  objc_msgSend(v4, "setTrailingOffscreenWidth:");
  -[UISlidingBarState supplementaryWidth](self, "supplementaryWidth");
  objc_msgSend(v4, "setSupplementaryWidth:");
  -[UISlidingBarState supplementaryOffscreenWidth](self, "supplementaryOffscreenWidth");
  objc_msgSend(v4, "setSupplementaryOffscreenWidth:");
  -[UISlidingBarState _rubberBandInset](self, "_rubberBandInset");
  objc_msgSend(v4, "set_rubberBandInset:");
  -[UISlidingBarState mainWidth](self, "mainWidth");
  objc_msgSend(v4, "setMainWidth:");
  -[UISlidingBarState leadingDragOffset](self, "leadingDragOffset");
  objc_msgSend(v4, "setLeadingDragOffset:");
  -[UISlidingBarState trailingDragOffset](self, "trailingDragOffset");
  objc_msgSend(v4, "setTrailingDragOffset:");
  -[UISlidingBarState supplementaryDragOffset](self, "supplementaryDragOffset");
  objc_msgSend(v4, "setSupplementaryDragOffset:");
  -[UISlidingBarState _leadingOverlayWidth](self, "_leadingOverlayWidth");
  objc_msgSend(v4, "_setLeadingOverlayWidth:");
  -[UISlidingBarState _trailingOverlayWidth](self, "_trailingOverlayWidth");
  objc_msgSend(v4, "_setTrailingOverlayWidth:");
  -[UISlidingBarState _supplementaryOverlayWidth](self, "_supplementaryOverlayWidth");
  objc_msgSend(v4, "_setSupplementaryOverlayWidth:");
  objc_msgSend(v4, "_setTreatLeadingHiddenAsOverlaps:", -[UISlidingBarState _treatLeadingHiddenAsOverlaps](self, "_treatLeadingHiddenAsOverlaps"));
  objc_msgSend(v4, "_setTreatTrailingHiddenAsOverlaps:", -[UISlidingBarState _treatTrailingHiddenAsOverlaps](self, "_treatTrailingHiddenAsOverlaps"));
  objc_msgSend(v4, "_setTreatSupplementaryHiddenAsOverlaps:", -[UISlidingBarState _treatSupplementaryHiddenAsOverlaps](self, "_treatSupplementaryHiddenAsOverlaps"));
  -[UISlidingBarState configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfiguration:", v5);

  objc_msgSend(v4, "_setCollapsedState:", -[UISlidingBarState _collapsedState](self, "_collapsedState"));
  -[UISlidingBarState _keyboardAdjustment](self, "_keyboardAdjustment");
  objc_msgSend(v4, "set_keyboardAdjustment:");
  return v4;
}

- (BOOL)leadingOverlapsMain
{
  double v3;
  double v4;
  void *v5;
  BOOL v6;

  -[UISlidingBarState _leadingOverlayWidth](self, "_leadingOverlayWidth");
  if (v3 > 0.0)
    return 1;
  -[UISlidingBarState leadingWidth](self, "leadingWidth");
  if (v4 == 0.0 && -[UISlidingBarState _treatLeadingHiddenAsOverlaps](self, "_treatLeadingHiddenAsOverlaps"))
    return 1;
  -[UISlidingBarState _configuration](self, "_configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "supplementaryEdge"))
  {
    v6 = -[UISlidingBarState supplementaryOverlapsMain](self, "supplementaryOverlapsMain");

    return v6;
  }

  return 0;
}

- (BOOL)_treatSupplementaryHiddenAsOverlaps
{
  return self->__treatSupplementaryHiddenAsOverlaps;
}

- (id)_configuration
{
  return self->_configuration;
}

- (BOOL)supplementaryOverlapsMain
{
  double v3;
  double v5;

  -[UISlidingBarState _supplementaryOverlayWidth](self, "_supplementaryOverlayWidth");
  if (v3 > 0.0)
    return 1;
  -[UISlidingBarState supplementaryWidth](self, "supplementaryWidth");
  return v5 == 0.0
      && -[UISlidingBarState _treatSupplementaryHiddenAsOverlaps](self, "_treatSupplementaryHiddenAsOverlaps");
}

- (double)supplementaryWidth
{
  return self->_supplementaryWidth;
}

- (double)_supplementaryOverlayWidth
{
  return self->__supplementaryOverlayWidth;
}

- (double)leadingWidth
{
  return self->_leadingWidth;
}

- (BOOL)_treatLeadingHiddenAsOverlaps
{
  return self->__treatLeadingHiddenAsOverlaps;
}

- (double)_leadingOverlayWidth
{
  return self->__leadingOverlayWidth;
}

- (double)supplementaryOffscreenWidth
{
  return self->_supplementaryOffscreenWidth;
}

- (UISlidingBarConfiguration)configuration
{
  return (UISlidingBarConfiguration *)(id)-[UISlidingBarConfiguration copy](self->_configuration, "copy");
}

- (double)leadingOffscreenWidth
{
  return self->_leadingOffscreenWidth;
}

- (double)trailingOffscreenWidth
{
  return self->_trailingOffscreenWidth;
}

- (BOOL)trailingOverlapsMain
{
  double v3;
  double v4;
  void *v5;
  BOOL v6;

  -[UISlidingBarState _trailingOverlayWidth](self, "_trailingOverlayWidth");
  if (v3 > 0.0)
    return 1;
  -[UISlidingBarState trailingWidth](self, "trailingWidth");
  if (v4 == 0.0 && -[UISlidingBarState _treatTrailingHiddenAsOverlaps](self, "_treatTrailingHiddenAsOverlaps"))
    return 1;
  -[UISlidingBarState _configuration](self, "_configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "supplementaryEdge") == 1)
  {
    v6 = -[UISlidingBarState supplementaryOverlapsMain](self, "supplementaryOverlapsMain");

    if (v6)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (double)trailingWidth
{
  return self->_trailingWidth;
}

- (BOOL)_treatTrailingHiddenAsOverlaps
{
  return self->__treatTrailingHiddenAsOverlaps;
}

- (double)_trailingOverlayWidth
{
  return self->__trailingOverlayWidth;
}

- (double)trailingDragOffset
{
  return self->_trailingDragOffset;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void)_setCollapsedState:(int64_t)a3
{
  self->__collapsedState = a3;
}

- (double)mainWidth
{
  return self->_mainWidth;
}

- (BOOL)isSupplementaryVisible
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[UISlidingBarState _configuration](self, "_configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supplementaryEdge");

  if (v4)
  {
    -[UISlidingBarState trailingWidth](self, "trailingWidth");
    v6 = v5;
    -[UISlidingBarState trailingDragOffset](self, "trailingDragOffset");
  }
  else
  {
    -[UISlidingBarState leadingWidth](self, "leadingWidth");
    v6 = v8;
    -[UISlidingBarState leadingDragOffset](self, "leadingDragOffset");
  }
  v9 = v7;
  -[UISlidingBarState supplementaryDragOffset](self, "supplementaryDragOffset");
  v11 = v10;
  -[UISlidingBarState supplementaryWidth](self, "supplementaryWidth");
  if (v12 <= 0.0)
    return 0;
  -[UISlidingBarState supplementaryWidth](self, "supplementaryWidth");
  return v6 + v13 - (v9 + v11) > 0.0;
}

- (double)supplementaryDragOffset
{
  return self->_supplementaryDragOffset;
}

- (double)leadingDragOffset
{
  return self->_leadingDragOffset;
}

- (BOOL)isCollapsed
{
  return (unint64_t)(-[UISlidingBarState _collapsedState](self, "_collapsedState") - 1) < 2;
}

- (int64_t)_collapsedState
{
  return self->__collapsedState;
}

- (void)set_rubberBandInset:(double)a3
{
  self->__rubberBandInset = a3;
}

- (void)set_keyboardAdjustment:(double)a3
{
  self->__keyboardAdjustment = a3;
}

- (void)setTrailingWidth:(double)a3
{
  self->_trailingWidth = a3;
}

- (void)setTrailingOffscreenWidth:(double)a3
{
  self->_trailingOffscreenWidth = a3;
}

- (void)setTrailingDragOffset:(double)a3
{
  self->_trailingDragOffset = a3;
}

- (void)setSupplementaryWidth:(double)a3
{
  self->_supplementaryWidth = a3;
}

- (void)setSupplementaryOffscreenWidth:(double)a3
{
  self->_supplementaryOffscreenWidth = a3;
}

- (void)setSupplementaryDragOffset:(double)a3
{
  self->_supplementaryDragOffset = a3;
}

- (void)setMainWidth:(double)a3
{
  self->_mainWidth = a3;
}

- (void)setLeadingWidth:(double)a3
{
  self->_leadingWidth = a3;
}

- (void)setLeadingOffscreenWidth:(double)a3
{
  self->_leadingOffscreenWidth = a3;
}

- (void)setLeadingDragOffset:(double)a3
{
  self->_leadingDragOffset = a3;
}

- (void)_setTreatTrailingHiddenAsOverlaps:(BOOL)a3
{
  self->__treatTrailingHiddenAsOverlaps = a3;
}

- (void)_setTreatSupplementaryHiddenAsOverlaps:(BOOL)a3
{
  self->__treatSupplementaryHiddenAsOverlaps = a3;
}

- (void)_setTreatLeadingHiddenAsOverlaps:(BOOL)a3
{
  self->__treatLeadingHiddenAsOverlaps = a3;
}

- (void)_setTrailingOverlayWidth:(double)a3
{
  self->__trailingOverlayWidth = a3;
}

- (void)_setSupplementaryOverlayWidth:(double)a3
{
  self->__supplementaryOverlayWidth = a3;
}

- (void)_setLeadingOverlayWidth:(double)a3
{
  self->__leadingOverlayWidth = a3;
}

- (double)_rubberBandInset
{
  return self->__rubberBandInset;
}

- (double)_keyboardAdjustment
{
  return self->__keyboardAdjustment;
}

- (BOOL)isLeadingVisible
{
  double v3;
  double v4;
  double v5;

  -[UISlidingBarState leadingWidth](self, "leadingWidth");
  v4 = v3;
  -[UISlidingBarState leadingDragOffset](self, "leadingDragOffset");
  return v4 - v5 > 0.0;
}

- (BOOL)isTrailingVisible
{
  double v3;
  double v4;
  double v5;

  -[UISlidingBarState trailingWidth](self, "trailingWidth");
  v4 = v3;
  -[UISlidingBarState trailingDragOffset](self, "trailingDragOffset");
  return v4 - v5 > 0.0;
}

- (BOOL)_trailingEntirelyOverlapsMain
{
  double v3;
  double v4;
  double v5;
  void *v6;
  BOOL v7;

  if (-[UISlidingBarState trailingOverlapsMain](self, "trailingOverlapsMain"))
  {
    -[UISlidingBarState _trailingOverlayWidth](self, "_trailingOverlayWidth");
    v4 = v3;
    -[UISlidingBarState trailingWidth](self, "trailingWidth");
    if (v4 == v5)
      return 1;
  }
  -[UISlidingBarState _configuration](self, "_configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "supplementaryEdge") == 1)
  {
    v7 = -[UISlidingBarState _supplementaryEntirelyOverlapsMain](self, "_supplementaryEntirelyOverlapsMain");

    if (v7)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v6;
  id v7;
  void (**v8)(void *, const __CFString *, uint64_t, double);
  id v9;
  void (**v10)(void *, BOOL, const __CFString *, uint64_t);
  UISlidingBarConfiguration *configuration;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, int, void *, int);
  void *v16;
  id v17;
  _QWORD aBlock[4];
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)UISlidingBarState;
  -[UISlidingBarState description](&v20, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (os_variant_has_internal_diagnostics())
  {
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__UISlidingBarState_description__block_invoke;
    aBlock[3] = &unk_1E16C18E0;
    v7 = v4;
    v19 = v7;
    v8 = (void (**)(void *, const __CFString *, uint64_t, double))_Block_copy(aBlock);
    v13 = v6;
    v14 = 3221225472;
    v15 = __32__UISlidingBarState_description__block_invoke_2;
    v16 = &unk_1E16C1908;
    v9 = v7;
    v17 = v9;
    v10 = (void (**)(void *, BOOL, const __CFString *, uint64_t))_Block_copy(&v13);
    v8[2](v8, CFSTR("leadingWidth"), 1, self->_leadingWidth);
    v8[2](v8, CFSTR("leadingOffscreenWidth"), 1, self->_leadingOffscreenWidth);
    -[UISlidingBarState _leadingOverlayWidth](self, "_leadingOverlayWidth");
    ((void (*)(void (**)(void *, const __CFString *, uint64_t, double), const __CFString *, uint64_t))v8[2])(v8, CFSTR("leadingOverlayWidth"), 1);
    v8[2](v8, CFSTR("trailingWidth"), 1, self->_trailingWidth);
    v8[2](v8, CFSTR("trailingOffscreenWidth"), 1, self->_trailingOffscreenWidth);
    -[UISlidingBarState _trailingOverlayWidth](self, "_trailingOverlayWidth");
    ((void (*)(void (**)(void *, const __CFString *, uint64_t, double), const __CFString *, uint64_t))v8[2])(v8, CFSTR("trailingOverlayWidth"), 1);
    v8[2](v8, CFSTR("supplementaryWidth"), 1, self->_supplementaryWidth);
    v8[2](v8, CFSTR("supplementaryOffscreenWidth"), 1, self->_supplementaryOffscreenWidth);
    -[UISlidingBarState _supplementaryOverlayWidth](self, "_supplementaryOverlayWidth");
    ((void (*)(void (**)(void *, const __CFString *, uint64_t, double), const __CFString *, uint64_t))v8[2])(v8, CFSTR("supplementaryOverlayWidth"), 1);
    -[UISlidingBarState _rubberBandInset](self, "_rubberBandInset");
    ((void (*)(void (**)(void *, const __CFString *, uint64_t, double), const __CFString *, uint64_t))v8[2])(v8, CFSTR("rubberBandInset"), 1);
    v8[2](v8, CFSTR("mainWidth"), 1, self->_mainWidth);
    v8[2](v8, CFSTR("leadingDragOffset"), 1, self->_leadingDragOffset);
    v8[2](v8, CFSTR("trailingDragOffset"), 1, self->_trailingDragOffset);
    v8[2](v8, CFSTR("supplementaryDragOffset"), 1, self->_supplementaryDragOffset);
    v10[2](v10, -[UISlidingBarState leadingOverlapsMain](self, "leadingOverlapsMain"), CFSTR("leadingOverlapsMain"), 1);
    v10[2](v10, -[UISlidingBarState trailingOverlapsMain](self, "trailingOverlapsMain"), CFSTR("trailingOverlapsMain"), 1);
    v10[2](v10, -[UISlidingBarState supplementaryOverlapsMain](self, "supplementaryOverlapsMain"), CFSTR("supplementaryOverlapsMain"), 1);
    configuration = self->_configuration;
    _StringFromCollapsedState(-[UISlidingBarState _collapsedState](self, "_collapsedState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" configuration=%p collapsedState=%@"), configuration, v12, v13, v14, v15, v16);

  }
  return v4;
}

uint64_t __32__UISlidingBarState_description__block_invoke(uint64_t result, uint64_t a2, char a3, double a4)
{
  uint64_t v4;
  uint64_t v5;

  if (a4 != 0.0 || (a3 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "appendFormat:", CFSTR(" %@=%g"), a2, *(_QWORD *)&a4, v4, v5);
  return result;
}

void __32__UISlidingBarState_description__block_invoke_2(uint64_t a1, int a2, void *a3, int a4)
{
  id v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  id v11;
  const __CFString *v12;
  id v13;

  v7 = a3;
  if (!a4)
  {
    v8 = *(void **)(a1 + 32);
    v10 = CFSTR("NO");
    if (a2)
      v10 = CFSTR("YES");
    v11 = v7;
    v12 = v10;
    v9 = CFSTR(" %@=%@");
    goto LABEL_7;
  }
  if (a2)
  {
    v8 = *(void **)(a1 + 32);
    v11 = v7;
    v9 = CFSTR(" %@");
LABEL_7:
    v13 = v7;
    objc_msgSend(v8, "appendFormat:", v9, v11, v12);
    v7 = v13;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  int v48;
  int v49;
  BOOL v50;
  void *v52;
  void *v53;
  int64_t v54;
  double v55;
  double v56;
  double v57;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[UISlidingBarState leadingWidth](self, "leadingWidth");
    v7 = v6;
    objc_msgSend(v5, "leadingWidth");
    if (v7 != v8)
      goto LABEL_19;
    -[UISlidingBarState _leadingOverlayWidth](self, "_leadingOverlayWidth");
    v10 = v9;
    objc_msgSend(v5, "_leadingOverlayWidth");
    if (v10 != v11)
      goto LABEL_19;
    -[UISlidingBarState leadingOffscreenWidth](self, "leadingOffscreenWidth");
    v13 = v12;
    objc_msgSend(v5, "leadingOffscreenWidth");
    if (v13 != v14)
      goto LABEL_19;
    -[UISlidingBarState trailingWidth](self, "trailingWidth");
    v16 = v15;
    objc_msgSend(v5, "trailingWidth");
    if (v16 != v17)
      goto LABEL_19;
    -[UISlidingBarState _trailingOverlayWidth](self, "_trailingOverlayWidth");
    v19 = v18;
    objc_msgSend(v5, "_trailingOverlayWidth");
    if (v19 != v20)
      goto LABEL_19;
    -[UISlidingBarState trailingOffscreenWidth](self, "trailingOffscreenWidth");
    v22 = v21;
    objc_msgSend(v5, "trailingOffscreenWidth");
    if (v22 != v23)
      goto LABEL_19;
    -[UISlidingBarState supplementaryWidth](self, "supplementaryWidth");
    v25 = v24;
    objc_msgSend(v5, "supplementaryWidth");
    if (v25 != v26)
      goto LABEL_19;
    -[UISlidingBarState supplementaryOffscreenWidth](self, "supplementaryOffscreenWidth");
    v28 = v27;
    objc_msgSend(v5, "supplementaryOffscreenWidth");
    if (v28 != v29)
      goto LABEL_19;
    -[UISlidingBarState _supplementaryOverlayWidth](self, "_supplementaryOverlayWidth");
    v31 = v30;
    objc_msgSend(v5, "_supplementaryOverlayWidth");
    if (v31 != v32)
      goto LABEL_19;
    -[UISlidingBarState _rubberBandInset](self, "_rubberBandInset");
    v34 = v33;
    objc_msgSend(v5, "_rubberBandInset");
    if (v34 != v35)
      goto LABEL_19;
    -[UISlidingBarState mainWidth](self, "mainWidth");
    v37 = v36;
    objc_msgSend(v5, "mainWidth");
    if (v37 != v38)
      goto LABEL_19;
    -[UISlidingBarState leadingDragOffset](self, "leadingDragOffset");
    v40 = v39;
    objc_msgSend(v5, "leadingDragOffset");
    if (v40 != v41)
      goto LABEL_19;
    -[UISlidingBarState trailingDragOffset](self, "trailingDragOffset");
    v43 = v42;
    objc_msgSend(v5, "trailingDragOffset");
    if (v43 != v44)
      goto LABEL_19;
    -[UISlidingBarState supplementaryDragOffset](self, "supplementaryDragOffset");
    v46 = v45;
    objc_msgSend(v5, "supplementaryDragOffset");
    if (v46 == v47
      && (v48 = -[UISlidingBarState leadingOverlapsMain](self, "leadingOverlapsMain"),
          v48 == objc_msgSend(v5, "leadingOverlapsMain"))
      && (v49 = -[UISlidingBarState trailingOverlapsMain](self, "trailingOverlapsMain"),
          v49 == objc_msgSend(v5, "trailingOverlapsMain")))
    {
      -[UISlidingBarState _configuration](self, "_configuration");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_configuration");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v52, "isEqual:", v53)
        && (v54 = -[UISlidingBarState _collapsedState](self, "_collapsedState"),
            v54 == objc_msgSend(v5, "_collapsedState")))
      {
        -[UISlidingBarState _keyboardAdjustment](self, "_keyboardAdjustment");
        v56 = v55;
        objc_msgSend(v5, "_keyboardAdjustment");
        v50 = v56 == v57;
      }
      else
      {
        v50 = 0;
      }

    }
    else
    {
LABEL_19:
      v50 = 0;
    }

  }
  else
  {
    v50 = 0;
  }

  return v50;
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  -[UISlidingBarState leadingWidth](self, "leadingWidth");
  v4 = (unint64_t)v3;
  -[UISlidingBarState trailingWidth](self, "trailingWidth");
  v6 = (unint64_t)v5 ^ v4;
  -[UISlidingBarState supplementaryWidth](self, "supplementaryWidth");
  v8 = (unint64_t)v7;
  -[UISlidingBarState _configuration](self, "_configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)_shouldUseSlidingBars
{
  return 0;
}

- (BOOL)matchesRequest:(id)a3
{
  double v3;

  -[UISlidingBarState _absoluteDistanceFromRequest:](self, "_absoluteDistanceFromRequest:", a3);
  return v3 == 0.0;
}

- (double)_distanceFromRequest:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (!a3)
    return 1.79769313e308;
  v4 = a3;
  -[UISlidingBarState leadingWidth](self, "leadingWidth");
  v6 = v5;
  objc_msgSend(v4, "leadingWidth");
  v8 = v6 - v7;
  -[UISlidingBarState trailingWidth](self, "trailingWidth");
  v10 = v9;
  objc_msgSend(v4, "trailingWidth");
  v12 = v8 + v10 - v11;
  -[UISlidingBarState supplementaryWidth](self, "supplementaryWidth");
  v14 = v13;
  objc_msgSend(v4, "supplementaryWidth");
  v16 = v15;

  return v12 + v14 - v16;
}

- (double)_absoluteDistanceFromRequest:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (!a3)
    return 1.79769313e308;
  v4 = a3;
  -[UISlidingBarState leadingWidth](self, "leadingWidth");
  v6 = v5;
  objc_msgSend(v4, "leadingWidth");
  v8 = vabdd_f64(v6, v7);
  -[UISlidingBarState trailingWidth](self, "trailingWidth");
  v10 = v9;
  objc_msgSend(v4, "trailingWidth");
  v12 = v8 + vabdd_f64(v10, v11);
  -[UISlidingBarState supplementaryWidth](self, "supplementaryWidth");
  v14 = v13;
  objc_msgSend(v4, "supplementaryWidth");
  v16 = v15;

  return v12 + vabdd_f64(v14, v16);
}

- (id)stateRequest
{
  UISlidingBarStateRequest *v3;

  v3 = objc_alloc_init(UISlidingBarStateRequest);
  -[UISlidingBarState leadingWidth](self, "leadingWidth");
  -[UISlidingBarStateRequest setLeadingWidth:](v3, "setLeadingWidth:");
  -[UISlidingBarState leadingOffscreenWidth](self, "leadingOffscreenWidth");
  -[UISlidingBarStateRequest setLeadingOffscreenWidth:](v3, "setLeadingOffscreenWidth:");
  -[UISlidingBarState trailingWidth](self, "trailingWidth");
  -[UISlidingBarStateRequest setTrailingWidth:](v3, "setTrailingWidth:");
  -[UISlidingBarState trailingOffscreenWidth](self, "trailingOffscreenWidth");
  -[UISlidingBarStateRequest setTrailingOffscreenWidth:](v3, "setTrailingOffscreenWidth:");
  -[UISlidingBarState supplementaryWidth](self, "supplementaryWidth");
  -[UISlidingBarStateRequest setSupplementaryWidth:](v3, "setSupplementaryWidth:");
  -[UISlidingBarState supplementaryOffscreenWidth](self, "supplementaryOffscreenWidth");
  -[UISlidingBarStateRequest setSupplementaryOffscreenWidth:](v3, "setSupplementaryOffscreenWidth:");
  -[UISlidingBarState mainWidth](self, "mainWidth");
  -[UISlidingBarStateRequest setMainWidth:](v3, "setMainWidth:");
  return v3;
}

- (id)_interactiveStateRequest
{
  UISlidingBarStateRequest *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UISlidingBarStateRequest *v25;
  double v26;

  v3 = objc_alloc_init(UISlidingBarStateRequest);
  -[UISlidingBarState _rubberBandInset](self, "_rubberBandInset");
  -[UISlidingBarStateRequest setRubberBandInset:](v3, "setRubberBandInset:");
  -[UISlidingBarState supplementaryWidth](self, "supplementaryWidth");
  if (v4 > 0.0)
  {
    v5 = v4;
    -[UISlidingBarState _configuration](self, "_configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supplementaryEdge");

    if (v7)
    {
      -[UISlidingBarState trailingWidth](self, "trailingWidth");
      v9 = v8;
      -[UISlidingBarState trailingDragOffset](self, "trailingDragOffset");
      v11 = v10;
      -[UISlidingBarState supplementaryDragOffset](self, "supplementaryDragOffset");
      v13 = v11 + v12;
      if (v9 > 0.0)
      {
        -[UISlidingBarStateRequest setTrailingWidth:](v3, "setTrailingWidth:", v9 - v13);
LABEL_8:
        v25 = v3;
        v26 = v5;
LABEL_10:
        -[UISlidingBarStateRequest setSupplementaryWidth:](v25, "setSupplementaryWidth:", v26);
        return v3;
      }
    }
    else
    {
      -[UISlidingBarState leadingWidth](self, "leadingWidth");
      v21 = v20;
      -[UISlidingBarState leadingDragOffset](self, "leadingDragOffset");
      v23 = v22;
      -[UISlidingBarState supplementaryDragOffset](self, "supplementaryDragOffset");
      v13 = v23 + v24;
      if (v21 > 0.0)
      {
        -[UISlidingBarStateRequest setLeadingWidth:](v3, "setLeadingWidth:", v21 - v13);
        goto LABEL_8;
      }
    }
    v26 = v5 - v13;
    v25 = v3;
    goto LABEL_10;
  }
  -[UISlidingBarState leadingWidth](self, "leadingWidth");
  v15 = v14;
  -[UISlidingBarState leadingDragOffset](self, "leadingDragOffset");
  -[UISlidingBarStateRequest setLeadingWidth:](v3, "setLeadingWidth:", v15 - v16);
  -[UISlidingBarState trailingWidth](self, "trailingWidth");
  v18 = v17;
  -[UISlidingBarState trailingDragOffset](self, "trailingDragOffset");
  -[UISlidingBarStateRequest setTrailingWidth:](v3, "setTrailingWidth:", v18 - v19);
  return v3;
}

@end
