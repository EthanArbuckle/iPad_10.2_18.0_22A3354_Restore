@implementation _UIVisualEffectViewEntry.LightEffectSubviews.BlurredEdgeMask

- (void)dealloc
{
  void *v3;
  _TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)_s15BlurredEdgeMaskCMa();
  -[UIView dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask_sourceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask____lazy_storage___blurredPortal));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask____lazy_storage___punchPortal));
}

- (void)_contentViewDidUpdate
{
  _TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask *v2;
  id v3;
  CALayer *v4;

  v2 = self;
  v3 = sub_1855E652C();
  objc_msgSend(v3, sel_removeAllObjects);

  v4 = -[UIView layer](v2, sel_layer);
  -[CALayer setNeedsDisplay](v4, sel_setNeedsDisplay);

}

- (void)displayLayer:(id)a3
{
  id v4;
  _TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask *v5;

  v4 = a3;
  v5 = self;
  sub_1855E775C();

}

- (_TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask)initWithCoder:(id)a3
{
  id v4;
  _TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask____lazy_storage___blurredPortal) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask____lazy_storage___punchPortal) = 0;
  v4 = a3;

  result = (_TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask *)sub_186507E04();
  __break(1u);
  return result;
}

- (_TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask)initWithFrame:(CGRect)a3
{
  _TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask *result;

  result = (_TtCOE5UIKitCSo24_UIVisualEffectViewEntry19LightEffectSubviews15BlurredEdgeMask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
