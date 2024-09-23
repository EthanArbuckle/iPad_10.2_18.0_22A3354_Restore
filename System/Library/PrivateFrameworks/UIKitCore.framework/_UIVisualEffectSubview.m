@implementation _UIVisualEffectSubview

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIVisualEffectSubview;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_containedView)
  {
    -[UIView bounds](self, "bounds");
    -[_UIVisualEffectViewParticipating setFrame:](self->_containedView, "setFrame:");
  }
}

- (_UIVisualEffectViewParticipating)containedView
{
  return self->_containedView;
}

- (void)applyRequestedViewEffects
{
  _UIVisualEffectSubviewApplyViewEffects(self, self->_viewEffects, 1);
}

- (void)setViewEffects:(id)a3
{
  NSArray *v4;
  NSArray *viewEffects;

  _UIVisualEffectSubviewSetViewEffects(self, self->_viewEffects, a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  viewEffects = self->_viewEffects;
  self->_viewEffects = v4;

}

- (void)setFilters:(id)a3
{
  NSArray *v4;
  NSArray *filters;

  _UIVisualEffectSubviewSetFilters(self, self->_filters, a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  filters = self->_filters;
  self->_filters = v4;

}

- (void)applyRequestedFilterEffects
{
  _UIVisualEffectSubviewApplyFilters(self, self->_filters, 1);
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setSubviewMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_subviewMonitor, a3);
}

- (void)setPrimaryCaptureGroup:(id)a3
{
  objc_storeStrong((id *)&self->_primaryCaptureGroup, a3);
}

- (void)setContainedView:(id)a3
{
  _UIVisualEffectViewParticipating *v5;
  _UIVisualEffectViewParticipating *containedView;
  _UIVisualEffectViewParticipating *v7;

  v5 = (_UIVisualEffectViewParticipating *)a3;
  containedView = self->_containedView;
  if (containedView != v5)
  {
    v7 = v5;
    -[_UIVisualEffectViewParticipating removeFromSuperview](containedView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_containedView, a3);
    -[UIView addSubview:](self, "addSubview:", self->_containedView);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)willMoveToWindow:(id)a3
{
  _UIVisualEffectViewSubviewMonitoring **p_subviewMonitor;
  id v5;
  id WeakRetained;

  p_subviewMonitor = &self->_subviewMonitor;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_subviewMonitor);
  objc_msgSend(WeakRetained, "_view:willMoveToWindow:", self, v5);

}

- (_UIVisualEffectSubview)initWithFrame:(CGRect)a3
{
  _UIVisualEffectSubview *v3;
  _UIVisualEffectSubview *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIVisualEffectSubview;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subviewMonitor);
  objc_storeStrong((id *)&self->_viewEffects, 0);
  objc_storeStrong((id *)&self->_containedView, 0);
  objc_storeStrong((id *)&self->_primaryCaptureGroup, 0);
  objc_storeStrong((id *)&self->_filters, 0);
}

- (void)applyIdentityViewEffects
{
  _UIVisualEffectSubviewApplyViewEffects(self, self->_viewEffects, 0);
}

- (void)applyIdentityFilterEffects
{
  _UIVisualEffectSubviewApplyFilters(self, self->_filters, 0);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char ShouldAnimateKeyInternal;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIVisualEffectSubview;
  if (-[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
    ShouldAnimateKeyInternal = 1;
  else
    ShouldAnimateKeyInternal = _UIVisualEffectSubviewShouldAnimateKeyInternal(self->_viewEffects, v4);

  return ShouldAnimateKeyInternal;
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v8;
  id WeakRetained;
  id v10;

  v10 = a3;
  v8 = a4;
  if (objc_msgSend(a5, "isDescendantOfView:", self)
    && (objc_msgSend(v8, "isDescendantOfView:", self) & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_subviewMonitor);
    objc_msgSend(WeakRetained, "_view:willGainDescendent:", self, v10);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_subviewMonitor);
    objc_msgSend(WeakRetained, "_view:willLoseDescendent:", self, v10);
  }

}

- (BOOL)disableGroupFiltering
{
  return 0;
}

- (id)_initialValueForLayer:(id)a3 keyPath:(id)a4 usePresentationValue:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  objc_super v11;

  v5 = a5;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIVisualEffectSubview;
  -[UIView _initialValueForLayer:keyPath:usePresentationValue:](&v11, sel__initialValueForLayer_keyPath_usePresentationValue_, a3, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("filters.")))
    {
      _UIVisualEffectSubviewFilterIdentityValueForKeypath(self->_filters, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (_UIVisualEffectViewBackdropCaptureGroup)primaryCaptureGroup
{
  return self->_primaryCaptureGroup;
}

- (NSArray)viewEffects
{
  return self->_viewEffects;
}

- (_UIVisualEffectViewSubviewMonitoring)subviewMonitor
{
  return (_UIVisualEffectViewSubviewMonitoring *)objc_loadWeakRetained((id *)&self->_subviewMonitor);
}

@end
