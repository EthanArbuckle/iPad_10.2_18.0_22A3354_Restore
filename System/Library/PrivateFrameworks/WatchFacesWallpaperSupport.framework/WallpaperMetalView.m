@implementation WallpaperMetalView

- (_TtC26WatchFacesWallpaperSupport18WallpaperMetalView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_24A28FE80();
}

- (void)dealloc
{
  void *v2;
  _TtC26WatchFacesWallpaperSupport18WallpaperMetalView *v3;
  objc_super v4;

  v2 = (void *)(*(_QWORD **)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_displayLink))[4];
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, sel_invalidate);
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for WallpaperMetalView(0);
    -[WallpaperMetalView dealloc](&v4, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  sub_24A2873D8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_drawingHandler));
  sub_24A28E30C((uint64_t)self + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_log, &qword_257920CA0);
  swift_release();
  sub_24A28E30C((uint64_t)self + OBJC_IVAR____TtC26WatchFacesWallpaperSupport18WallpaperMetalView_timedRenderingInfo, &qword_257920CB0);
}

+ (Class)layerClass
{
  sub_24A29033C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)displayLayer:(id)a3
{
  id v4;
  _TtC26WatchFacesWallpaperSupport18WallpaperMetalView *v5;

  v4 = a3;
  v5 = self;
  sub_24A28FFE0();

}

- (_TtC26WatchFacesWallpaperSupport18WallpaperMetalView)initWithFrame:(CGRect)a3
{
  _TtC26WatchFacesWallpaperSupport18WallpaperMetalView *result;

  result = (_TtC26WatchFacesWallpaperSupport18WallpaperMetalView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
