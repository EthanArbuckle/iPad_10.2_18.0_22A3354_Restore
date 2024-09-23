@implementation _UIVisualEffectViewEntry.LatencyEmitter

- (void)addEffectToView:(id)a3
{
  id v4;
  _TtCE5UIKitCSo24_UIVisualEffectViewEntry14LatencyEmitter *v5;

  v4 = a3;
  v5 = self;
  sub_1856F7FC0(v4);

}

- (void)applyIdentityEffectToView:(id)a3
{
  sub_1856F8128(self, (uint64_t)a2, a3, 0);
}

- (void)applyRequestedEffectToView:(id)a3
{
  sub_1856F8128(self, (uint64_t)a2, a3, 1);
}

- (void)removeEffectFromView:(id)a3
{
  id v4;
  _TtCE5UIKitCSo24_UIVisualEffectViewEntry14LatencyEmitter *v5;

  v4 = a3;
  v5 = self;
  sub_1856F82DC(v4);

}

- (_TtCE5UIKitCSo24_UIVisualEffectViewEntry14LatencyEmitter)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntry14LatencyEmitter__transitionView) = 0;
  v3.receiver = self;
  v3.super_class = (Class)_s14LatencyEmitterCMa();
  return -[_UIVisualEffectViewEntry.LatencyEmitter init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntry14LatencyEmitter__transitionView));
}

@end
