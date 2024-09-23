@implementation _UIVisualEffectViewEntry.RimHighlight

- (void)addEffectToView:(id)a3
{
  id v4;
  _TtCE5UIKitCSo24_UIVisualEffectViewEntry12RimHighlight *v5;

  v4 = a3;
  v5 = self;
  sub_18575F730(v4);

}

- (void)applyIdentityEffectToView:(id)a3
{
  sub_18575F888(self, (uint64_t)a2, a3, 0);
}

- (void)applyRequestedEffectToView:(id)a3
{
  sub_18575F888(self, (uint64_t)a2, a3, 1);
}

- (void)removeEffectFromView:(id)a3
{
  id v4;
  _TtCE5UIKitCSo24_UIVisualEffectViewEntry12RimHighlight *v5;

  v4 = a3;
  v5 = self;
  sub_18575FA54(v4);

}

- (_TtCE5UIKitCSo24_UIVisualEffectViewEntry12RimHighlight)init
{
  _TtCE5UIKitCSo24_UIVisualEffectViewEntry12RimHighlight *result;

  result = (_TtCE5UIKitCSo24_UIVisualEffectViewEntry12RimHighlight *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;

  v3 = *(void **)((char *)&self->super._requirements
                + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntry12RimHighlight_config);

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntry12RimHighlight__transitionView));
}

@end
