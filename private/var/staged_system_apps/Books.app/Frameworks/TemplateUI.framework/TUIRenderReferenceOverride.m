@implementation TUIRenderReferenceOverride

+ (id)overrideWithQuery:(id)a3 alpha:(double)a4
{
  id v5;
  _TUIRenderReferenceOverrideAlpha *v6;

  v5 = a3;
  v6 = objc_alloc_init(_TUIRenderReferenceOverrideAlpha);
  -[_TUIRenderReferenceOverrideAlpha setQuery:](v6, "setQuery:", v5);

  -[_TUIRenderReferenceOverrideAlpha setAlpha:](v6, "setAlpha:", a4);
  return v6;
}

+ (id)overrideWithQuery:(id)a3 forceVisibleOnHover:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  _TUIRenderReferenceOverrideHoverVisibility *v6;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(_TUIRenderReferenceOverrideHoverVisibility);
  -[_TUIRenderReferenceOverrideHoverVisibility setQuery:](v6, "setQuery:", v5);

  -[_TUIRenderReferenceOverrideHoverVisibility setForceVisibleOnHover:](v6, "setForceVisibleOnHover:", v4);
  return v6;
}

@end
