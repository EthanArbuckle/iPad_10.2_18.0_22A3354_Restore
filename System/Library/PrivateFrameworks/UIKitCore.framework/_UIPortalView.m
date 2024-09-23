@implementation _UIPortalView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[_UIPortalView _isGeometryFrozen](self, "_isGeometryFrozen"))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIPortalView;
    -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!-[_UIPortalView _isGeometryFrozen](self, "_isGeometryFrozen"))
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPortalView;
    -[UIView setHidden:](&v5, sel_setHidden_, v3);
  }
}

- (BOOL)_isGeometryFrozen
{
  return self->__geometryFrozen;
}

- (_UIPortalView)initWithFrame:(CGRect)a3
{
  _UIPortalView *v3;
  _UIPortalView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPortalView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UIPortalView setAllowsHitTesting:](v3, "setAllowsHitTesting:", 0);
  return v4;
}

- (void)setAllowsHitTesting:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIPortalView portalLayer](self, "portalLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsHitTesting:", v3);

}

- (void)setSourceView:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_sourceView);
    -[UIView _removeMultiLayerDelegate:]((uint64_t)v5, (uint64_t)self);

    v6 = objc_storeWeak((id *)&self->_sourceView, obj);
    -[UIView _registerMultiLayerDelegate:]((char *)obj, (uint64_t)self);

    -[_UIPortalView _updateSourceLayer](self, "_updateSourceLayer");
  }

}

- (_UIPortalView)initWithSourceView:(id)a3
{
  id v4;
  _UIPortalView *v5;
  _UIPortalView *v6;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v5 = -[_UIPortalView initWithFrame:](self, "initWithFrame:", 0.0, 0.0);
  v6 = v5;
  if (v5)
    -[_UIPortalView setSourceView:](v5, "setSourceView:", v4);

  return v6;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_name, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    name = self->_name;
    self->_name = v4;

    if (os_variant_has_internal_diagnostics())
    {
      -[UIView layer](self, "layer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setName:", v7);

    }
  }

}

- (void)_updateSourceLayer
{
  _BOOL4 v3;
  id *v4;
  void *v5;
  void *v6;
  id *v7;

  v3 = -[_UIPortalView _prefersClientLayer](self, "_prefersClientLayer");
  -[_UIPortalView sourceView](self, "sourceView");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v3)
    -[UIView _backing_clientLayer](v4);
  else
    -[UIView _backing_outermostLayer](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPortalView portalLayer](self, "portalLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourceLayer:", v5);

}

- (BOOL)hidesSourceView
{
  void *v2;
  char v3;

  -[_UIPortalView portalLayer](self, "portalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hidesSourceLayer");

  return v3;
}

- (void)setHidesSourceView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIPortalView portalLayer](self, "portalLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesSourceLayer:", v3);

}

- (BOOL)matchesAlpha
{
  void *v2;
  char v3;

  -[_UIPortalView portalLayer](self, "portalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "matchesOpacity");

  return v3;
}

- (void)setMatchesAlpha:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIPortalView portalLayer](self, "portalLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchesOpacity:", v3);

}

- (BOOL)matchesTransform
{
  void *v2;
  char v3;

  -[_UIPortalView portalLayer](self, "portalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "matchesTransform");

  return v3;
}

- (void)setMatchesTransform:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIPortalView portalLayer](self, "portalLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchesTransform:", v3);

}

- (BOOL)matchesPosition
{
  void *v2;
  char v3;

  -[_UIPortalView portalLayer](self, "portalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "matchesPosition");

  return v3;
}

- (void)setMatchesPosition:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIPortalView portalLayer](self, "portalLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchesPosition:", v3);

}

- (BOOL)allowsBackdropGroups
{
  void *v2;
  char v3;

  -[_UIPortalView portalLayer](self, "portalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsBackdropGroups");

  return v3;
}

- (void)setAllowsBackdropGroups:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIPortalView portalLayer](self, "portalLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsBackdropGroups:", v3);

}

- (BOOL)allowsHitTesting
{
  void *v2;
  char v3;

  -[_UIPortalView portalLayer](self, "portalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsHitTesting");

  return v3;
}

- (void)_setPrefersClientLayer:(BOOL)a3
{
  if (self->__prefersClientLayer != a3)
  {
    self->__prefersClientLayer = a3;
    -[_UIPortalView _updateSourceLayer](self, "_updateSourceLayer");
  }
}

- (void)_setAllowedInContextTransform:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[_UIPortalView portalLayer](self, "portalLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_UIPortalView portalLayer](self, "portalLayer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowedInContextTransform:", v3);

  }
}

- (BOOL)_allowedInContextTransform
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[_UIPortalView portalLayer](self, "portalLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[_UIPortalView portalLayer](self, "portalLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowedInContextTransform");

  return v6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _UIPortalView *v8;
  void *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIPortalView;
  -[UIView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  v8 = (_UIPortalView *)objc_claimAutoreleasedReturnValue();
  -[_UIPortalView sourceView](self, "sourceView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIPortalView forwardsClientHitTestingToSourceView](self, "forwardsClientHitTestingToSourceView")
    && v9
    && v8 == self)
  {
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    objc_msgSend(v9, "hitTest:withEvent:", v7);
    v8 = (_UIPortalView *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  unsigned __int8 v8;
  void *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIPortalView;
  v8 = -[UIView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  -[_UIPortalView sourceView](self, "sourceView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIPortalView forwardsClientHitTestingToSourceView](self, "forwardsClientHitTestingToSourceView") && v9)
  {
    objc_msgSend(v9, "convertPoint:fromView:", self, x, y);
    v8 = objc_msgSend(v9, "pointInside:withEvent:", v7);
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIPortalView;
  -[UIView description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "replaceCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, CFSTR("; "));
  if (os_variant_has_internal_diagnostics())
  {
    -[_UIPortalView name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[_UIPortalView name](self, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("name = %@; "), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v9);

    }
    if (-[_UIPortalView hidesSourceView](self, "hidesSourceView"))
      objc_msgSend(v4, "appendString:", CFSTR("hidesSourceView = YES; "));
    if (-[_UIPortalView matchesAlpha](self, "matchesAlpha"))
      objc_msgSend(v4, "appendString:", CFSTR("matchesAlpha = YES; "));
    if (-[_UIPortalView matchesPosition](self, "matchesPosition"))
      objc_msgSend(v4, "appendString:", CFSTR("matchesPosition = YES; "));
    if (-[_UIPortalView matchesTransform](self, "matchesTransform"))
      objc_msgSend(v4, "appendString:", CFSTR("matchesTransform = YES; "));
    if (-[_UIPortalView allowsBackdropGroups](self, "allowsBackdropGroups"))
      objc_msgSend(v4, "appendString:", CFSTR("allowsBackdropGroups = YES; "));
    if (-[_UIPortalView allowsHitTesting](self, "allowsHitTesting"))
      objc_msgSend(v4, "appendString:", CFSTR("allowsHitTesting = YES; "));
    if (-[_UIPortalView _isGeometryFrozen](self, "_isGeometryFrozen"))
      objc_msgSend(v4, "appendString:", CFSTR("_geometryFrozen = YES; "));
    -[_UIPortalView sourceView](self, "sourceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    -[_UIPortalView sourceView](self, "sourceView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("sourceView = <%@: %p>>"), v11, v12);

  }
  return (NSString *)v4;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPortalView;
  if (-[UIView _shouldAnimatePropertyWithKey:](&v8, sel__shouldAnimatePropertyWithKey_, v4))
  {
    v5 = 1;
  }
  else
  {
    -[_UIPortalView _additionalAnimatableKeyPaths](self, "_additionalAnimatableKeyPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v4);

  }
  return v5;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[_UIPortalView _isGeometryFrozen](self, "_isGeometryFrozen"))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIPortalView;
    -[UIView setBounds:](&v8, sel_setBounds_, x, y, width, height);
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  if (!-[_UIPortalView _isGeometryFrozen](self, "_isGeometryFrozen"))
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIPortalView;
    -[UIView setCenter:](&v6, sel_setCenter_, x, y);
  }
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)forwardsClientHitTestingToSourceView
{
  return self->_forwardsClientHitTestingToSourceView;
}

- (void)setForwardsClientHitTestingToSourceView:(BOOL)a3
{
  self->_forwardsClientHitTestingToSourceView = a3;
}

- (void)_setGeometryFrozen:(BOOL)a3
{
  self->__geometryFrozen = a3;
}

- (NSSet)_additionalAnimatableKeyPaths
{
  return self->__additionalAnimatableKeyPaths;
}

- (void)_setAdditionalAnimatableKeypaths:(id)a3
{
  objc_storeStrong((id *)&self->__additionalAnimatableKeyPaths, a3);
}

- (BOOL)_prefersClientLayer
{
  return self->__prefersClientLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__additionalAnimatableKeyPaths, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_sourceView);
}

@end
