@implementation _UIVisualEffectViewEntry.LightMask

- (void)addEffectToView:(id)a3
{
  id v4;
  _TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_D737DE5E5E0DC332F22C0E9AF3F2A85B9LightMask *v5;

  v4 = a3;
  v5 = self;
  sub_185645FEC(v4);

}

- (void)applyIdentityEffectToView:(id)a3
{
  sub_185646140(self, (uint64_t)a2, a3, 0);
}

- (void)applyRequestedEffectToView:(id)a3
{
  sub_185646140(self, (uint64_t)a2, a3, 1);
}

- (void)removeEffectFromView:(id)a3
{
  id v4;
  _TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_D737DE5E5E0DC332F22C0E9AF3F2A85B9LightMask *v5;

  v4 = a3;
  v5 = self;
  sub_185646314(v4);

}

- (_TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_D737DE5E5E0DC332F22C0E9AF3F2A85B9LightMask)init
{
  _TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_D737DE5E5E0DC332F22C0E9AF3F2A85B9LightMask *result;

  result = (_TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_D737DE5E5E0DC332F22C0E9AF3F2A85B9LightMask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_D737DE5E5E0DC332F22C0E9AF3F2A85B9LightMask_contentProxy));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_D737DE5E5E0DC332F22C0E9AF3F2A85B9LightMask_lightSourceDescriptor));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntryP33_D737DE5E5E0DC332F22C0E9AF3F2A85B9LightMask__transitionView));
}

@end
