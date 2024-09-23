@implementation _UIVisualEffectImageView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_viewEffects, 0);
  objc_storeStrong((id *)&self->_primaryCaptureGroup, 0);
}

- (_UIVisualEffectViewSubviewMonitoring)subviewMonitor
{
  return 0;
}

- (BOOL)disableGroupFiltering
{
  return 0;
}

- (_UIVisualEffectViewParticipating)containedView
{
  return 0;
}

- (void)setContainedView:(id)a3
{
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIVisualEffectSubview.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containedView == nil"));

  }
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

- (void)applyRequestedViewEffects
{
  _UIVisualEffectSubviewApplyViewEffects(self, self->_viewEffects, 1);
}

- (void)applyIdentityViewEffects
{
  _UIVisualEffectSubviewApplyViewEffects(self, self->_viewEffects, 0);
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
  v7.super_class = (Class)_UIVisualEffectImageView;
  if (-[UIImageView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
    ShouldAnimateKeyInternal = 1;
  else
    ShouldAnimateKeyInternal = _UIVisualEffectSubviewShouldAnimateKeyInternal(self->_viewEffects, v4);

  return ShouldAnimateKeyInternal;
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
  v11.super_class = (Class)_UIVisualEffectImageView;
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

- (void)setPrimaryCaptureGroup:(id)a3
{
  objc_storeStrong((id *)&self->_primaryCaptureGroup, a3);
}

- (NSArray)viewEffects
{
  return self->_viewEffects;
}

- (NSArray)filters
{
  return self->_filters;
}

@end
