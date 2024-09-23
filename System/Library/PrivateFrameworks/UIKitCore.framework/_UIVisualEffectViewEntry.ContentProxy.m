@implementation _UIVisualEffectViewEntry.ContentProxy

- (void)addEffectToView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntry12ContentProxy_contentView);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntry12ContentProxy_contentView) = (Class)a3;
  v3 = a3;

}

- (void)removeEffectFromView:(id)a3
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntry12ContentProxy_contentView);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntry12ContentProxy_contentView) = 0;

}

- (_TtCE5UIKitCSo24_UIVisualEffectViewEntry12ContentProxy)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntry12ContentProxy_contentView) = 0;
  v3.receiver = self;
  v3.super_class = (Class)_s12ContentProxyCMa();
  return -[_UIVisualEffectViewEntry.ContentProxy init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCE5UIKitCSo24_UIVisualEffectViewEntry12ContentProxy_contentView));
}

@end
