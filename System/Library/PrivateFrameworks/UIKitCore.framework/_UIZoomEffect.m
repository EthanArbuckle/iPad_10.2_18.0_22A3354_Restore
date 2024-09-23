@implementation _UIZoomEffect

+ (id)zoomEffectWithMagnitude:(double)a3
{
  _UIZoomEffect *v4;

  v4 = objc_alloc_init(_UIZoomEffect);
  v4->_zoomAmount = a3;
  return v4;
}

+ (id)_underlayZoomEffectWithMagnitude:(double)a3
{
  id result;

  result = (id)objc_msgSend(a1, "zoomEffectWithMagnitude:", a3);
  *((_BYTE *)result + 16) = 1;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return vcvtmd_u64_f64(self->_zoomAmount * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  _UIZoomEffect *v4;
  _UIZoomEffect *v5;
  BOOL v6;

  v4 = (_UIZoomEffect *)a3;
  v5 = v4;
  v6 = v4 == self
    || v4
    && -[_UIZoomEffect isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())
    && self->_zoomAmount == v5->_zoomAmount
    && self->_isUnderlay == v5->_isUnderlay;

  return v6;
}

- (id)_viewEntry
{
  _UIZoomEffectViewEntry *v3;
  _UIZoomEffectViewEntry *v4;

  v3 = objc_alloc_init(_UIZoomEffectViewEntry);
  v4 = v3;
  if (self->_isUnderlay)
    -[_UIVisualEffectViewEntry setRequirements:](v3, "setRequirements:", 2);
  -[_UIZoomEffectViewEntry setZoomAmount:](v4, "setZoomAmount:", self->_zoomAmount);
  return v4;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a3;
  -[_UIZoomEffect _viewEntry](self, "_viewEntry");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v7;
  if (self->_isUnderlay)
    objc_msgSend(v6, "addUnderlay:", v7);
  else
    objc_msgSend(v6, "addViewEffect:", v7);

}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIZoomEffect;
  -[_UIZoomEffect description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_isUnderlay)
    v5 = CFSTR(" underlay");
  else
    v5 = &stru_1E16EDF20;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" zoom=%f%@"), *(_QWORD *)&self->_zoomAmount, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
