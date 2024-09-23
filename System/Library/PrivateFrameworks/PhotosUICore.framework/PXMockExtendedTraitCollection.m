@implementation PXMockExtendedTraitCollection

- (PXMockExtendedTraitCollection)initWithViewController:(id)a3
{
  PXMockExtendedTraitCollection *v3;
  uint64_t v4;
  PXUpdater *updater;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXMockExtendedTraitCollection;
  v3 = -[PXExtendedTraitCollection initWithViewController:](&v7, sel_initWithViewController_, 0);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v3, sel__setNeedsUpdate);
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v4;

    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateLayoutSizeClass);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateLayoutReferenceSizeAndDisplayScale);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateSafeAreaInsets);
    -[PXExtendedTraitCollection setEnabled:](v3, "setEnabled:", 1);
  }
  return v3;
}

- (PXMockExtendedTraitCollection)initWithLayoutSizeClass:(int64_t)a3
{
  PXMockExtendedTraitCollection *v4;
  PXMockExtendedTraitCollection *v5;
  _QWORD v7[5];

  v4 = -[PXMockExtendedTraitCollection initWithViewController:](self, "initWithViewController:", 0);
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__PXMockExtendedTraitCollection_initWithLayoutSizeClass___block_invoke;
    v7[3] = &__block_descriptor_40_e48_v16__0___PXMockMutableExtendedTraitCollection__8l;
    v7[4] = a3;
    -[PXMockExtendedTraitCollection performChanges:](v4, "performChanges:", v7);
  }
  return v5;
}

- (PXMockExtendedTraitCollection)initWithFormFactor:(int64_t)a3 orientation:(int64_t)a4 visibleChromeElements:(unint64_t)a5
{
  PXMockExtendedTraitCollection *v8;
  PXMockExtendedTraitCollection *v9;
  _QWORD v11[7];

  v8 = -[PXMockExtendedTraitCollection initWithViewController:](self, "initWithViewController:", 0);
  v9 = v8;
  if (v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __86__PXMockExtendedTraitCollection_initWithFormFactor_orientation_visibleChromeElements___block_invoke;
    v11[3] = &__block_descriptor_56_e48_v16__0___PXMockMutableExtendedTraitCollection__8l;
    v11[4] = a3;
    v11[5] = a4;
    v11[6] = a5;
    -[PXMockExtendedTraitCollection performChanges:](v8, "performChanges:", v11);
  }
  return v9;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMockExtendedTraitCollection;
  -[PXMockExtendedTraitCollection performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMockExtendedTraitCollection;
  -[PXExtendedTraitCollection didPerformChanges](&v3, sel_didPerformChanges);
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
}

- (int64_t)layoutSizeSubclass
{
  return 2;
}

- (void)_setNeedsUpdate
{
  -[PXMockExtendedTraitCollection signalChange:](self, "signalChange:", 0);
}

- (void)setLayoutSizeClass:(int64_t)a3
{
  if (self->_layoutSizeClass != a3)
  {
    self->_layoutSizeClass = a3;
    -[PXMockExtendedTraitCollection signalChange:](self, "signalChange:", 2);
    -[PXMockExtendedTraitCollection _invalidateLayoutReferenceSizeAndDisplayScale](self, "_invalidateLayoutReferenceSizeAndDisplayScale");
    -[PXMockExtendedTraitCollection _invalidateSafeAreaInsets](self, "_invalidateSafeAreaInsets");
  }
}

- (void)setLayoutOrientation:(int64_t)a3
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    -[PXMockExtendedTraitCollection signalChange:](self, "signalChange:", 8);
    -[PXMockExtendedTraitCollection _invalidateLayoutSizeClass](self, "_invalidateLayoutSizeClass");
    -[PXMockExtendedTraitCollection _invalidateLayoutReferenceSizeAndDisplayScale](self, "_invalidateLayoutReferenceSizeAndDisplayScale");
    -[PXMockExtendedTraitCollection _invalidateSafeAreaInsets](self, "_invalidateSafeAreaInsets");
  }
}

- (void)setLayoutReferenceSize:(CGSize)a3
{
  if (a3.width != self->_layoutReferenceSize.width || a3.height != self->_layoutReferenceSize.height)
  {
    self->_layoutReferenceSize = a3;
    -[PXMockExtendedTraitCollection signalChange:](self, "signalChange:", 16);
  }
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  if (self->_userInterfaceIdiom != a3)
  {
    self->_userInterfaceIdiom = a3;
    -[PXMockExtendedTraitCollection signalChange:](self, "signalChange:", 64);
  }
}

- (void)setFormFactor:(int64_t)a3
{
  if (self->_formFactor != a3)
  {
    self->_formFactor = a3;
    -[PXMockExtendedTraitCollection _invalidateLayoutSizeClass](self, "_invalidateLayoutSizeClass");
    -[PXMockExtendedTraitCollection _invalidateLayoutReferenceSizeAndDisplayScale](self, "_invalidateLayoutReferenceSizeAndDisplayScale");
    -[PXMockExtendedTraitCollection _invalidateSafeAreaInsets](self, "_invalidateSafeAreaInsets");
  }
}

- (void)setVisibleChromeElements:(unint64_t)a3
{
  if (self->_visibleChromeElements != a3)
  {
    self->_visibleChromeElements = a3;
    -[PXMockExtendedTraitCollection _invalidateSafeAreaInsets](self, "_invalidateSafeAreaInsets");
  }
}

- (void)setDisplayScale:(double)a3
{
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    -[PXMockExtendedTraitCollection signalChange:](self, "signalChange:", 32);
  }
}

- (void)setContentSizeCategory:(int64_t)a3
{
  if (self->_contentSizeCategory != a3)
  {
    self->_contentSizeCategory = a3;
    -[PXMockExtendedTraitCollection signalChange:](self, "signalChange:", 2048);
  }
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_safeAreaInsets;
  uint64_t v9;
  int v10;
  uint64_t v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_safeAreaInsets = &self->_safeAreaInsets;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    if (PXEdgeInsetsEqualToEdgeInsetsForEdges())
      v9 = 256;
    else
      v9 = 8448;
    v10 = PXEdgeInsetsEqualToEdgeInsetsForEdges();
    p_safeAreaInsets->top = top;
    p_safeAreaInsets->left = left;
    if (v10)
      v11 = v9;
    else
      v11 = v9 | 0x4000;
    p_safeAreaInsets->bottom = bottom;
    p_safeAreaInsets->right = right;
    -[PXMockExtendedTraitCollection signalChange:](self, "signalChange:", v11);
  }
}

- (void)setWindowOrientation:(int64_t)a3
{
  if (self->_windowOrientation != a3)
  {
    self->_windowOrientation = a3;
    -[PXMockExtendedTraitCollection signalChange:](self, "signalChange:", 0x40000);
  }
}

- (void)_invalidateLayoutSizeClass
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateLayoutSizeClass);
}

- (void)_updateLayoutSizeClass
{
  unint64_t v3;

  if (-[PXMockExtendedTraitCollection layoutOrientation](self, "layoutOrientation"))
  {
    v3 = -[PXMockExtendedTraitCollection formFactor](self, "formFactor") - 1;
    if (v3 <= 0xC)
      -[PXMockExtendedTraitCollection setLayoutSizeClass:](self, "setLayoutSizeClass:", qword_1A7C09C10[v3]);
  }
}

- (void)_invalidateLayoutReferenceSizeAndDisplayScale
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateLayoutReferenceSizeAndDisplayScale);
}

- (void)_updateLayoutReferenceSizeAndDisplayScale
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  int64_t v11;
  double v12;
  void *v13;

  switch(-[PXMockExtendedTraitCollection formFactor](self, "formFactor"))
  {
    case 0:
      v8 = -[PXMockExtendedTraitCollection layoutSizeClass](self, "layoutSizeClass");
      if (v8 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockExtendedTraitCollection.m"), 336, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v6 = dbl_1A7C09C78[v8];
      v5 = dbl_1A7C09C90[v8];
      v4 = 2.0;
      break;
    case 1:
      v4 = 2.0;
      v5 = 320.0;
      v6 = 568.0;
      break;
    case 2:
      v4 = 2.0;
      v5 = 375.0;
      v6 = 667.0;
      break;
    case 3:
      v4 = 3.0;
      v5 = 414.0;
      *(double *)&v7 = 736.0;
      goto LABEL_16;
    case 4:
      v4 = 3.0;
      v5 = 375.0;
      v6 = 812.0;
      break;
    case 5:
      v4 = 2.0;
      goto LABEL_15;
    case 6:
      v4 = 3.0;
LABEL_15:
      v5 = 414.0;
      *(double *)&v7 = 896.0;
      goto LABEL_16;
    case 7:
      v4 = 2.0;
      v5 = 768.0;
      *(double *)&v7 = 1024.0;
LABEL_16:
      v6 = *(double *)&v7;
      break;
    case 8:
      v4 = 2.0;
      v5 = 834.0;
      v6 = 1112.0;
      break;
    case 9:
      v4 = 2.0;
      v5 = 834.0;
      v6 = 1194.0;
      break;
    case 10:
    case 11:
      v4 = 2.0;
      v5 = 1024.0;
      v6 = 1366.0;
      break;
    case 12:
      v4 = 2.0;
      v5 = 1680.0;
      v6 = 1050.0;
      break;
    case 13:
      v4 = 1.0;
      v5 = 1920.0;
      v6 = 1080.0;
      break;
    default:
      v4 = 0.0;
      v6 = 0.0;
      v5 = 0.0;
      break;
  }
  if (v5 >= v6)
    v9 = v5;
  else
    v9 = v6;
  if (v5 >= v6)
    v10 = v6;
  else
    v10 = v5;
  v11 = -[PXMockExtendedTraitCollection layoutOrientation](self, "layoutOrientation");
  if (v11 == 1)
  {
    v12 = v10;
    v10 = v9;
    goto LABEL_27;
  }
  if (v11 == 2)
  {
    v12 = v9;
LABEL_27:
    -[PXMockExtendedTraitCollection setLayoutReferenceSize:](self, "setLayoutReferenceSize:", v12, v10);
  }
  -[PXMockExtendedTraitCollection setDisplayScale:](self, "setDisplayScale:", v4);
}

- (void)_invalidateSafeAreaInsets
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateSafeAreaInsets);
}

- (void)_updateSafeAreaInsets
{
  int64_t v4;
  unint64_t v5;
  int64_t v6;
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
  unint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  UIEdgeInsets v25;

  v4 = -[PXMockExtendedTraitCollection formFactor](self, "formFactor");
  if (v4)
  {
    v5 = v4;
    v6 = -[PXMockExtendedTraitCollection layoutOrientation](self, "layoutOrientation");
    v7 = 0.0;
    v8 = NAN;
    v9 = 20.0;
    v10 = NAN;
    v11 = 44.0;
    if (v6 == 1)
      v10 = 44.0;
    else
      v11 = 0.0;
    if (((1 << v5) & 0x70) == 0)
    {
      v10 = NAN;
      v11 = 0.0;
    }
    if (((1 << v5) & 0xF8E) != 0)
    {
      v12 = 0.0;
    }
    else
    {
      v9 = v10;
      v12 = v11;
    }
    if (v5 <= 0xB)
      v13 = v9;
    else
      v13 = NAN;
    if (v5 <= 0xB)
      v14 = v12;
    else
      v14 = 0.0;
    v15 = NAN;
    if (v5 <= 0xB)
    {
      if (((1 << v5) & 0x58E) != 0)
      {
        v15 = 49.0;
      }
      else if (((1 << v5) & 0x70) != 0)
      {
        if (v6 == 1)
          v15 = 83.0;
        else
          v15 = NAN;
        v8 = 34.0;
        v9 = 0.0;
        if (v6 == 1)
          v7 = 34.0;
        else
          v7 = 0.0;
      }
      else if (((1 << v5) & 0xA00) != 0)
      {
        v15 = 65.0;
      }
    }
    v16 = *((double *)off_1E50B8020 + 1);
    v17 = *((double *)off_1E50B8020 + 3);
    v18 = -[PXMockExtendedTraitCollection visibleChromeElements](self, "visibleChromeElements", v8, v9, v12, v11);
    v19 = v18;
    if ((v18 & 1) != 0)
      v20 = v13;
    else
      v20 = v14;
    v21 = NAN;
    if ((v18 & 2) != 0)
      v22 = NAN;
    else
      v22 = v20;
    if ((v18 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25.top = v22;
      v25.left = v16;
      v25.bottom = NAN;
      v25.right = v17;
      NSStringFromUIEdgeInsets(v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockExtendedTraitCollection.m"), 495, CFSTR("unknown value for chrome elements %li form factor %li (%@)"), v19, v5, v24);

    }
    else if ((v18 & 8) != 0)
    {
      v21 = v15;
    }
    else
    {
      v21 = v7;
    }
    -[PXMockExtendedTraitCollection setSafeAreaInsets:](self, "setSafeAreaInsets:", v22, v16, v21, v17);
  }
}

- (int64_t)layoutSizeClass
{
  return self->_layoutSizeClass;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (CGSize)layoutReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutReferenceSize.width;
  height = self->_layoutReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (int64_t)formFactor
{
  return self->_formFactor;
}

- (unint64_t)visibleChromeElements
{
  return self->_visibleChromeElements;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (int64_t)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_safeAreaInsets.top;
  left = self->_safeAreaInsets.left;
  bottom = self->_safeAreaInsets.bottom;
  right = self->_safeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)windowOrientation
{
  return self->_windowOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
}

void __86__PXMockExtendedTraitCollection_initWithFormFactor_orientation_visibleChromeElements___block_invoke(_QWORD *a1, void *a2)
{
  unint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setUserInterfaceIdiom:", IdiomForFormFactor(v3));
  objc_msgSend(v4, "setFormFactor:", a1[4]);
  objc_msgSend(v4, "setLayoutOrientation:", a1[5]);
  objc_msgSend(v4, "setWindowOrientation:", a1[5]);
  objc_msgSend(v4, "setVisibleChromeElements:", a1[6]);

}

void __57__PXMockExtendedTraitCollection_initWithLayoutSizeClass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setLayoutSizeClass:", v2);
  objc_msgSend(v3, "setLayoutOrientation:", 1);

}

@end
