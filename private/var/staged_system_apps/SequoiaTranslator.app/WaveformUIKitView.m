@implementation WaveformUIKitView

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WaveformUIKitView();
  v2 = v3.receiver;
  -[WaveformUIKitView didMoveToWindow](&v3, "didMoveToWindow");
  sub_1001DDE14();

}

- (void)layoutSubviews
{
  _TtC17SequoiaTranslator17WaveformUIKitView *v2;

  v2 = self;
  sub_1001DD520();

}

- (void)_updateParticles
{
  _TtC17SequoiaTranslator17WaveformUIKitView *v2;

  v2 = self;
  sub_1001DDF7C();

}

- (_TtC17SequoiaTranslator17WaveformUIKitView)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator17WaveformUIKitView *)sub_1001DE264(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator17WaveformUIKitView)initWithCoder:(id)a3
{
  return (_TtC17SequoiaTranslator17WaveformUIKitView *)sub_1001DE378(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageContainerLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_package));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_packageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_particlesLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator17WaveformUIKitView_displayLink));
}

@end
