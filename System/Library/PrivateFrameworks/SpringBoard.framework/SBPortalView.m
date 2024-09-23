@implementation SBPortalView

- (void)setSourceView:(id)a3
{
  UIView **p_sourceView;
  id v5;
  void *v6;
  id v7;

  p_sourceView = &self->_sourceView;
  v5 = a3;
  objc_storeWeak((id *)p_sourceView, v5);
  objc_msgSend(v5, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBPortalView portalLayer](self, "portalLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourceLayer:", v7);

}

- (BOOL)hidesSourceView
{
  void *v2;
  char v3;

  -[SBPortalView portalLayer](self, "portalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hidesSourceLayer");

  return v3;
}

- (void)setHidesSourceView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBPortalView portalLayer](self, "portalLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesSourceLayer:", v3);

}

- (BOOL)matchesAlpha
{
  void *v2;
  char v3;

  -[SBPortalView portalLayer](self, "portalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "matchesOpacity");

  return v3;
}

- (void)setMatchesAlpha:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBPortalView portalLayer](self, "portalLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchesOpacity:", v3);

}

- (BOOL)matchesTransform
{
  void *v2;
  char v3;

  -[SBPortalView portalLayer](self, "portalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "matchesTransform");

  return v3;
}

- (void)setMatchesTransform:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBPortalView portalLayer](self, "portalLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchesTransform:", v3);

}

- (BOOL)matchesPosition
{
  void *v2;
  char v3;

  -[SBPortalView portalLayer](self, "portalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "matchesPosition");

  return v3;
}

- (void)setMatchesPosition:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBPortalView portalLayer](self, "portalLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchesPosition:", v3);

}

- (BOOL)allowsBackdropGroups
{
  void *v2;
  char v3;

  -[SBPortalView portalLayer](self, "portalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsBackdropGroups");

  return v3;
}

- (void)setAllowsBackdropGroups:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBPortalView portalLayer](self, "portalLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsBackdropGroups:", v3);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPortalView;
  -[SBPortalView description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "replaceCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, CFSTR("; "));
  if (-[SBPortalView hidesSourceView](self, "hidesSourceView"))
    objc_msgSend(v4, "appendString:", CFSTR("hidesSourceView = YES; "));
  if (-[SBPortalView matchesAlpha](self, "matchesAlpha"))
    objc_msgSend(v4, "appendString:", CFSTR("matchesAlpha = YES; "));
  if (-[SBPortalView matchesPosition](self, "matchesPosition"))
    objc_msgSend(v4, "appendString:", CFSTR("matchesPosition = YES; "));
  if (-[SBPortalView matchesTransform](self, "matchesTransform"))
    objc_msgSend(v4, "appendString:", CFSTR("matchesTransform = YES; "));
  if (-[SBPortalView allowsBackdropGroups](self, "allowsBackdropGroups"))
    objc_msgSend(v4, "appendString:", CFSTR("allowsBackdropGroups = YES; "));
  -[SBPortalView sourceView](self, "sourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("sourceView = <%@: %p>>"), objc_opt_class(), v5);

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBPortalView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPortalView;
  -[SBPortalView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBPortalView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    if (self->_passesTouchesThrough)
    {

      return 0;
    }
    v5 = self;
  }
  return v5;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (BOOL)passesTouchesThrough
{
  return self->_passesTouchesThrough;
}

- (void)setPassesTouchesThrough:(BOOL)a3
{
  self->_passesTouchesThrough = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceView);
}

@end
