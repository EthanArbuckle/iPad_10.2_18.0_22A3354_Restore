@implementation NowPlayingContextMenuConfiguration

- (_TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration)init
{
  _QWORD *v3;
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_config) = 0;
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_previewProvider);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_actionProvider);
  v5 = (objc_class *)type metadata accessor for NowPlayingContextMenuConfiguration();
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[NowPlayingContextMenuConfiguration init](&v7, "init");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_config));
  sub_145A0(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_previewProvider), *(_QWORD *)&self->config[OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_previewProvider]);
  sub_145A0(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_actionProvider), *(_QWORD *)&self->config[OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_actionProvider]);
}

@end
