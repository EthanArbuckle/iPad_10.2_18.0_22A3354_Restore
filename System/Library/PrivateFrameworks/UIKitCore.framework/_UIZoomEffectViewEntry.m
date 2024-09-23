@implementation _UIZoomEffectViewEntry

- (BOOL)shouldAnimateProperty:(id)a3
{
  return objc_msgSend(CFSTR("zoom"), "isEqualToString:", a3);
}

- (void)applyRequestedEffectToView:(id)a3
{
  double zoomAmount;
  void *v4;
  void *v5;
  id v6;

  zoomAmount = self->_zoomAmount;
  objc_msgSend(a3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "setZoom:", zoomAmount);
}

- (void)applyIdentityEffectToView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "setZoom:", 0.0);
}

- (void)removeEffectFromView:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "setZoom:", 0.0);
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (void)convertToIdentity
{
  self->_zoomAmount = 0.0;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIZoomEffectViewEntry;
  -[_UIVisualEffectViewEntry description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" zoomAmount=%f"), *(_QWORD *)&self->_zoomAmount);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)zoomAmount
{
  return self->_zoomAmount;
}

- (void)setZoomAmount:(double)a3
{
  self->_zoomAmount = a3;
}

@end
