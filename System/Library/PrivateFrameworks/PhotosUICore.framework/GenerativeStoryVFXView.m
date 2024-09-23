@implementation GenerativeStoryVFXView

- (_TtC12PhotosUICore22GenerativeStoryVFXView)initWithCoder:(id)a3
{
  return (_TtC12PhotosUICore22GenerativeStoryVFXView *)sub_1A68C1D0C(a3);
}

- (_TtC12PhotosUICore22GenerativeStoryVFXView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
    v8 = sub_1A7AE3584();
  else
    v8 = 0;
  return (_TtC12PhotosUICore22GenerativeStoryVFXView *)sub_1A68C2224(v8, x, y, width, height);
}

- (_TtC12PhotosUICore22GenerativeStoryVFXView)initWithFrame:(CGRect)a3
{
  _TtC12PhotosUICore22GenerativeStoryVFXView *result;

  result = (_TtC12PhotosUICore22GenerativeStoryVFXView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore22GenerativeStoryVFXView_logger;
  v3 = sub_1A7ADFF24();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end
