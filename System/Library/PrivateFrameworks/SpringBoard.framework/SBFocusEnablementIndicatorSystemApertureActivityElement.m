@implementation SBFocusEnablementIndicatorSystemApertureActivityElement

- (SBFocusEnablementIndicatorSystemApertureActivityElement)initWithActivityDescription:(id)a3 enabled:(BOOL)a4
{
  SBFocusEnablementIndicatorSystemApertureActivityElement *v4;
  uint64_t v5;
  SBSystemActionElementPreviewingCoordinator *previewingCoordinator;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFocusEnablementIndicatorSystemApertureActivityElement;
  v4 = -[FCUIFocusEnablementIndicatorSystemApertureElement initWithActivityDescription:enabled:](&v8, sel_initWithActivityDescription_enabled_, a3, a4);
  if (v4)
  {
    v5 = -[SBSystemActionElementPreviewingCoordinator initWithElement:]([SBSystemActionElementPreviewingCoordinator alloc], v4);
    previewingCoordinator = v4->_previewingCoordinator;
    v4->_previewingCoordinator = (SBSystemActionElementPreviewingCoordinator *)v5;

  }
  return v4;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFocusEnablementIndicatorSystemApertureActivityElement;
  if (-[FCUIFocusEnablementIndicatorSystemApertureElement layoutMode](&v8, sel_layoutMode) != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFocusEnablementIndicatorSystemApertureActivityElement;
    -[FCUIFocusEnablementIndicatorSystemApertureElement setLayoutMode:reason:](&v7, sel_setLayoutMode_reason_, a3, a4);
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (BOOL)isMinimalPresentationPossible
{
  return 1;
}

- (void)setPreviewing:(BOOL)a3
{
  if (self->_previewing != a3)
  {
    self->_previewing = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setUrgent:(BOOL)a3
{
  if (self->_urgent != a3)
  {
    self->_urgent = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setExpanding:(BOOL)a3
{
  if (self->_expanding != a3)
  {
    self->_expanding = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setProminent:(BOOL)a3
{
  id v4;

  if (self->_prominent != a3)
  {
    self->_prominent = a3;
    -[FCUIFocusEnablementIndicatorSystemApertureElement layoutHost](self, "layoutHost");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

  }
}

- (void)pop
{
  -[SBSystemActionElementPreviewingCoordinator pop](self->_previewingCoordinator, a2);
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  return -[SBFocusEnablementIndicatorSystemApertureActivityElement isProminent](self, "isProminent");
}

- (SBSystemAperturePlatformElementHosting)platformElementHost
{
  return (SBSystemAperturePlatformElementHosting *)objc_loadWeakRetained((id *)&self->_platformElementHost);
}

- (void)setPlatformElementHost:(id)a3
{
  objc_storeWeak((id *)&self->_platformElementHost, a3);
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (BOOL)isUrgent
{
  return self->_urgent;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformElementHost);
  objc_storeStrong((id *)&self->_previewingCoordinator, 0);
}

@end
