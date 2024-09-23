@implementation _UIMagicMorphDestination

- (UITargetedPreview)preview
{
  return (UITargetedPreview *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____UIMagicMorphDestination_preview));
}

- (_UIShadowProperties)shadowProperties
{
  return (_UIShadowProperties *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____UIMagicMorphDestination_shadowProperties));
}

- (void)setShadowProperties:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIMagicMorphDestination_shadowProperties);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIMagicMorphDestination_shadowProperties) = (Class)a3;
  v3 = a3;

}

- (BOOL)hidesSourceView
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____UIMagicMorphDestination_hidesSourceView);
}

- (void)setHidesSourceView:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____UIMagicMorphDestination_hidesSourceView) = a3;
}

- (UIEdgeInsets)insets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____UIMagicMorphDestination_insets);
  v3 = *(double *)&self->preview[OBJC_IVAR____UIMagicMorphDestination_insets];
  v4 = *(double *)&self->shadowProperties[OBJC_IVAR____UIMagicMorphDestination_insets];
  v5 = *(double *)&self->hidesSourceView[OBJC_IVAR____UIMagicMorphDestination_insets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)((char *)&self->super.isa + OBJC_IVAR____UIMagicMorphDestination_insets) = a3;
}

- (BOOL)allowsUserInteraction
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____UIMagicMorphDestination_allowsUserInteraction);
}

- (void)setAllowsUserInteraction:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____UIMagicMorphDestination_allowsUserInteraction) = a3;
}

- (BOOL)hidesChrome
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____UIMagicMorphDestination_hidesChrome);
}

- (void)setHidesChrome:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____UIMagicMorphDestination_hidesChrome) = a3;
}

- (BOOL)wantsMinificationFilter
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____UIMagicMorphDestination_wantsMinificationFilter);
}

- (void)setWantsMinificationFilter:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____UIMagicMorphDestination_wantsMinificationFilter) = a3;
}

- (_UIMagicMorphDestination)initWithPreview:(id)a3
{
  id v3;
  _UIMagicMorphDestination *v4;

  v3 = a3;
  v4 = (_UIMagicMorphDestination *)sub_185709558(v3);

  return v4;
}

- (_UIMagicMorphDestination)init
{
  _UIMagicMorphDestination *result;

  result = (_UIMagicMorphDestination *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
