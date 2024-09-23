@implementation UIHoverEffectLayer

- (UIHoverStyle)hoverStyle
{
  return (UIHoverStyle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                 + OBJC_IVAR___UIHoverEffectLayer__hoverStyle));
}

- (void)setHoverStyle:(id)a3
{
  char *v4;
  UIHoverEffectLayer *v5;

  v4 = (char *)a3;
  v5 = self;
  sub_18570B094(v4);

}

- (UIView)containerView
{
  return (UIView *)(id)MEMORY[0x186DCA138]((char *)self + OBJC_IVAR___UIHoverEffectLayer_containerView, a2);
}

- (void)setContainerView:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIHoverEffectLayer)init
{
  return (UIHoverEffectLayer *)sub_18570B660();
}

- (UIHoverEffectLayer)initWithCoder:(id)a3
{
  return (UIHoverEffectLayer *)UIHoverEffectLayer.init(coder:)(a3);
}

- (UIHoverEffectLayer)initWithLayer:(id)a3
{
  _QWORD v4[4];

  swift_unknownObjectRetain();
  sub_186507B1C();
  swift_unknownObjectRelease();
  return (UIHoverEffectLayer *)sub_18570BBC8(v4);
}

- (UIHoverEffectLayer)initWithContainerView:(id)a3 style:(id)a4
{
  id v6;
  id v7;
  UIHoverEffectLayer *v8;
  UIHoverEffectLayer *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[UIHoverEffectLayer init](self, sel_init);
  swift_unknownObjectWeakAssign();
  if (v7)
  {
    v9 = v8;
    -[UIHoverEffectLayer setHoverStyle:](v9, sel_setHoverStyle_, v7);

  }
  return v8;
}

- (void)layoutSublayers
{
  UIHoverEffectLayer *v2;

  v2 = self;
  UIHoverEffectLayer.layoutSublayers()();

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_185223490(*(void **)((char *)&self->super.super.isa + OBJC_IVAR___UIHoverEffectLayer_shape), *(_QWORD *)((char *)&self->super._attr.refcount + OBJC_IVAR___UIHoverEffectLayer_shape), *(uint64_t *)((char *)&self->super._attr.layer + OBJC_IVAR___UIHoverEffectLayer_shape), *(uint64_t *)((char *)&self->super._attr._objc_observation_info + OBJC_IVAR___UIHoverEffectLayer_shape), *(_QWORD *)&self->_hoverStyle[OBJC_IVAR___UIHoverEffectLayer_shape], *(_QWORD *)&self->backgroundSublayers[OBJC_IVAR___UIHoverEffectLayer_shape], *(_QWORD *)&self->overlaySublayers[OBJC_IVAR___UIHoverEffectLayer_shape], self->shape[OBJC_IVAR___UIHoverEffectLayer_shape]);
  swift_unknownObjectWeakDestroy();
}

+ (BOOL)supportsStyle:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = sub_18570CEB8((uint64_t)v3);

  return v4 & 1;
}

@end
