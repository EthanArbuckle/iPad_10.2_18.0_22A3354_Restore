@implementation _UIVisualEffectViewEntry.LightViewEntry

- (void)addEffectToView:(id)a3
{
  id v4;
  _TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_148879D7C674D29C8868AA63A63123C414LightViewEntry *v5;

  v4 = a3;
  v5 = self;
  sub_18576E28C(v4);

}

- (void)removeEffectFromView:(id)a3
{
  id v4;
  _TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_148879D7C674D29C8868AA63A63123C414LightViewEntry *v5;

  v4 = a3;
  v5 = self;
  sub_185646314(v4);

}

- (void)applyIdentityEffectToView:(id)a3
{
  sub_18576E3E4(self, (uint64_t)a2, a3, 0);
}

- (void)applyRequestedEffectToView:(id)a3
{
  sub_18576E3E4(self, (uint64_t)a2, a3, 1);
}

- (_TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_148879D7C674D29C8868AA63A63123C414LightViewEntry)init
{
  _TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_148879D7C674D29C8868AA63A63123C414LightViewEntry *result;

  result = (_TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_148879D7C674D29C8868AA63A63123C414LightViewEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_148879D7C674D29C8868AA63A63123C414LightViewEntry_descriptor));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_148879D7C674D29C8868AA63A63123C414LightViewEntry____lazy_storage___transitionView));
}

@end
