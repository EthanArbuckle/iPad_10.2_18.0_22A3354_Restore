@implementation MusicSBS_TextContentView

- (MusicSBS_TextContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100297358();
}

- (id)copy
{
  MusicSBS_TextContentView *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  char *v7[3];
  uint64_t v8;

  v2 = self;
  sub_1002966B8(v7);

  v3 = v8;
  v4 = sub_1000096A0(v7, v8);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  sub_10000970C(v7);
  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  MusicSBS_TextContentView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_100296B58(width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  MusicSBS_TextContentView *v2;

  v2 = self;
  sub_100296C58();

}

- (MusicSBS_TextContentView)initWithFrame:(CGRect)a3
{
  MusicSBS_TextContentView *result;

  result = (MusicSBS_TextContentView *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.SBS_TextContentView", 31, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[544];

  memcpy(v3, (char *)self + OBJC_IVAR___MusicSBS_TextContentView_specs, 0x219uLL);
  sub_10028DF64((uint64_t)v3);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
